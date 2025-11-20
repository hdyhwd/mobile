import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GPS extends StatelessWidget {
  const GPS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lokasi Saya',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? _kecamatan;
  String? _kota;
  bool _isLoading = false;
  String? _errorMessage;

  // Variabel untuk Google Maps
  Position? _currentPosition; // Menyimpan data Lat/Lng
  GoogleMapController? _mapController; // Kontroler untuk peta
  final Set<Marker> _markers = {}; // Set untuk menyimpan penanda (marker)

  // Posisi kamera awal (diatur ke pusat Kota Malang)
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(-7.9839, 112.6218), // <-- Koordinat Kota Malang
    zoom: 12.0,
  );

  /// Fungsi untuk mengambil lokasi pengguna saat ini dan melakukan reverse geocoding.
  Future<void> _getLocation() async {
    // 1. Set status loading dan reset data
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _kecamatan = null;
      _kota = null;
      _currentPosition = null; // Reset posisi
      _markers.clear(); // Hapus marker lama
    });

    try {
      // 2. Cek apakah layanan lokasi (GPS) aktif
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Layanan lokasi tidak aktif. Mohon aktifkan GPS.');
      }

      // 3. Periksa izin akses lokasi
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak oleh pengguna.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Izin lokasi ditolak permanen. Anda harus mengubahnya di pengaturan aplikasi.',
        );
      }

      // 4. Ambil posisi perangkat saat ini
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 15), // Tambahkan waktu timeout
      );

      // 5. Lakukan reverse geocoding untuk mengubah koordinat menjadi alamat
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark? place;
      if (placemarks.isNotEmpty) {
        place = placemarks[0];
      }

      // 6. Update semua state setelah semua data siap
      setState(() {
        _currentPosition = position; // Simpan posisi
        _kecamatan = place?.subLocality; // Kecamatan
        _kota = place?.subAdministrativeArea; // Kota/Kabupaten

        // Hapus marker lama (jika ada)
        _markers.clear();

        // Buat marker baru dengan semua info
        _markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: InfoWindow(
              title: 'Lokasi Saya',
              snippet:
                  '${_kecamatan ?? ''}, ${_kota ?? ''}', // Tampilkan alamat di marker
            ),
          ),
        );
      });
    } catch (e) {
      // 8. Tangani error dan tampilkan pesan
      setState(() {
        _errorMessage = e.toString().replaceAll("Exception: ", "");
      });
    } finally {
      // 9. Hentikan status loading
      setState(() {
        _isLoading = false;
      });
    }
  }

  // --- FUNGSI BARU UNTUK TOMBOL RE-CENTER ---
  /// Fungsi untuk menggerakkan kamera kembali ke lokasi pengguna
  void _recenterMap() {
    if (_currentPosition != null && _mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          15.0, // Zoom yang sama
        ),
      );
    }
  }
  // --- END FUNGSI BARU ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A237E), // Warna Indigo tua
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32.0,
                    horizontal: 16.0,
                  ),
                  // Ganti child untuk menampilkan peta atau loading
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : (_errorMessage != null)
                      ? Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        )
                      : (_currentPosition != null) // Jika sudah ada posisi
                      ? Column(
                          children: [
                            // --- WIDGET PETA DENGAN STACK ---
                            Container(
                              height: 250, // Tentukan tinggi peta
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              // 1. Gunakan Stack untuk menumpuk
                              child: Stack(
                                children: [
                                  GoogleMap(
                                    key: ValueKey(_currentPosition?.latitude),
                                    initialCameraPosition:
                                        _currentPosition == null
                                        ? _kInitialPosition
                                        : CameraPosition(
                                            target: LatLng(
                                              _currentPosition!.latitude,
                                              _currentPosition!.longitude,
                                            ),
                                            zoom: 15.0,
                                          ),
                                    mapType: MapType.normal,
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                          _mapController = controller;
                                        },
                                    markers: _markers,
                                    zoomControlsEnabled: false,
                                  ),

                                  // 2. Tambahkan Tombol di kanan bawah
                                  Positioned(
                                    bottom: 16.0,
                                    right: 16.0,
                                    child: FloatingActionButton(
                                      mini: true, // Buat jadi kecil
                                      onPressed: _recenterMap,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.my_location,
                                        color: Colors.indigo[900],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // --- END WIDGET PETA ---
                            const SizedBox(height: 20),

                            // --- Tampilkan data lokasi ---
                            Text(
                              'Kelurahan/Kecamatan: ${_kecamatan ?? "..."}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Kota: ${_kota ?? "..."}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          // Teks default
                          'Tekan tombol untuk menampilkan lokasi.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _isLoading ? null : _getLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A237E),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 5.0,
                ),
                child: const Text(
                  'TAMPILKAN LOKASI SAAT INI',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
