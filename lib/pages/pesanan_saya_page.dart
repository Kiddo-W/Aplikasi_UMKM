import 'package:flutter/material.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  final TextEditingController _searchController = TextEditingController();
  String _kataKunci = '';

  // Data Dummy Pesanan Aktif
  final List<Map<String, dynamic>> _pesananAktif = [
    {
      'po': '#PO-00027',
      'status': 'Sedang disiapkan',
      'statusColor': const Color(0xFFF9A825),
      'tanggal': '11/08/2026',
      'jam': '12:00 - 12:30',
      'tipe': 'Makan ditempat',
      'harga': 'Rp37.000',
    },
  ];

  // Data Dummy Riwayat Pesanan
  final List<Map<String, dynamic>> _riwayatPesanan = [
    {
      'po': '#PO-00027',
      'status': 'Selesai',
      'statusColor': const Color(0xFF008850),
      'tanggal': '10/08/2026',
      'jam': '12:00 - 12:30',
      'tipe': 'Makan ditempat',
      'harga': 'Rp37.000',
    },
    {
      'po': '#PO-00025',
      'status': 'Selesai',
      'statusColor': const Color(0xFF008850),
      'tanggal': '09/08/2026',
      'jam': '12:00 - 12:30',
      'tipe': 'Makan ditempat',
      'harga': 'Rp37.000',
    },
    {
      'po': '#PO-00020',
      'status': 'Selesai',
      'statusColor': const Color(0xFF008850),
      'tanggal': '08/08/2026',
      'jam': '12:00 - 12:30',
      'tipe': 'Bungkus',
      'harga': 'Rp37.000',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // LOGIKA PENCARIAN/FILTER (PO, TIPE, TANGGAL, & HARGA)
    final queryClean = _kataKunci.toLowerCase().replaceAll(RegExp(r'[^0-9a-z]'), '');
    final queryRaw = _kataKunci.toLowerCase();

    final filteredAktif = _pesananAktif.where((item) {
      final po = item['po'].toString().toLowerCase().replaceAll(RegExp(r'[^0-9a-z]'), '');
      final tipe = item['tipe'].toString().toLowerCase();
      final tanggal = item['tanggal'].toString().toLowerCase();
      final harga = item['harga'].toString().toLowerCase().replaceAll(RegExp(r'[^0-9a-z]'), '');

      return po.contains(queryClean) ||
          tipe.contains(queryRaw) ||
          tanggal.contains(queryRaw) ||
          harga.contains(queryClean);
    }).toList();

    final filteredRiwayat = _riwayatPesanan.where((item) {
      final po = item['po'].toString().toLowerCase().replaceAll(RegExp(r'[^0-9a-z]'), '');
      final tipe = item['tipe'].toString().toLowerCase();
      final tanggal = item['tanggal'].toString().toLowerCase();
      final harga = item['harga'].toString().toLowerCase().replaceAll(RegExp(r'[^0-9a-z]'), '');

      return po.contains(queryClean) ||
          tipe.contains(queryRaw) ||
          tanggal.contains(queryRaw) ||
          harga.contains(queryClean);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF138A56),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Pesanan Saya',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _kataKunci = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari Pesanan..',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // SECTION 1: PESANAN AKTIF
              if (filteredAktif.isNotEmpty) ...[
                const Text(
                  'Pesanan Aktif',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                ...filteredAktif.map((item) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF138A56),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['po'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: item['statusColor'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['status'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              item['tanggal'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              item['jam'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['tipe'],
                              style: const TextStyle(fontSize: 13),
                            ),
                            Text(
                              item['harga'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF138A56)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: const Text(
                              'Lihat Status',
                              style: TextStyle(
                                color: Color(0xFF138A56),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 16),
              ],

              // SECTION 2: RIWAYAT PESANAN
              if (filteredRiwayat.isNotEmpty) ...[
                const Text(
                  'Riwayat Pesanan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                ...filteredRiwayat.map((item) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['po'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: item['statusColor'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['status'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              item['tanggal'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              item['jam'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['tipe'],
                              style: const TextStyle(fontSize: 13),
                            ),
                            Text(
                              item['harga'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],

              // PESAN JIKA TIDAK ADA HASIL
              if (filteredAktif.isEmpty && filteredRiwayat.isEmpty) ...[
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'Pesanan tidak ditemukan',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}