import 'package:flutter/material.dart';

class StatusPesananPage extends StatelessWidget {
  const StatusPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data status timeline
    final List<Map<String, dynamic>> statusList = [
      {
        'title': 'Pesanan Dibuat',
        'time': '08:32',
        'isCompleted': true,
        'isCurrent': false,
      },
      {
        'title': 'Pesanan Dikonfirmasi',
        'time': '09:32',
        'isCompleted': true,
        'isCurrent': false,
      },
      {
        'title': 'Sedang disiapkan',
        'time': '09:32',
        'isCompleted': true,
        'isCurrent': true, // Titik aktif dengan dot putih di tengah
      },
      {
        'title': 'Siap Diambil',
        'time': '-',
        'isCompleted': false,
        'isCurrent': false,
      },
      {
        'title': 'Selesai',
        'time': '-',
        'isCompleted': false,
        'isCurrent': false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Status Pesanan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            children: [
              // Card Informasi Nomor Pesanan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEFEFEF)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nomor Pesanan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666666),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '#PO-00027',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '12/08/2026',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Timeline Status Pesanan
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: statusList.length,
                  itemBuilder: (context, index) {
                    final item = statusList[index];
                    final isFirst = index == 0;
                    final isLast = index == statusList.length - 1;
                    final isCompleted = item['isCompleted'] as bool;
                    final isCurrent = item['isCurrent'] as bool;

                    // Menentukan warna garis penghubung
                    final bool isLineActive = isCompleted &&
                        !isCurrent &&
                        index < statusList.length - 1 &&
                        statusList[index + 1]['isCompleted'] == true;

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Kolom Indikator Lingkaran dan Garis
                          SizedBox(
                            width: 40,
                            child: Column(
                              children: [
                                // Garis Atas
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: isFirst
                                        ? Colors.transparent
                                        : (isCompleted
                                            ? const Color(0xFF138A56)
                                            : const Color(0xFFE0E0E0)),
                                  ),
                                ),

                                // Bulatan/Circle Status
                                _buildStatusCircle(
                                  isCompleted: isCompleted,
                                  isCurrent: isCurrent,
                                ),

                                // Garis Bawah
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: isLast
                                        ? Colors.transparent
                                        : (isLineActive || isCurrent
                                            ? const Color(0xFF138A56)
                                            : const Color(0xFFE0E0E0)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 20),

                          // Kolom Teks Judul & Jam
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item['title'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: isCompleted
                                          ? const Color(0xFF111111)
                                          : const Color(0xFF333333),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    item['time'],
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Tombol Kembali ke Beranda
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF138A56),
                      width: 1.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Aksi Kembali 
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Kembali',
                    style: TextStyle(
                      color: Color(0xFF138A56),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Lingkaran Timeline
  Widget _buildStatusCircle({
    required bool isCompleted,
    required bool isCurrent,
  }) {
    if (isCurrent) {
      // Bulatan aktif hijau dengan dot putih di tengah
      return Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0xFF138A56),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else if (isCompleted) {
      // Bulatan penuh hijau (selesai)
      return Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0xFF138A56),
          shape: BoxShape.circle,
        ),
      );
    } else {
      // Bulatan abu-abu transparan/outline (belum selesai)
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFD0D0D0),
            width: 1.5,
          ),
        ),
      );
    }
  }
}