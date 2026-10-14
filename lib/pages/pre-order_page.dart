import 'package:aplikasi_umkm/pages/checkout_page.dart';
import 'package:flutter/material.dart';

class PilihWaktuPoPage extends StatefulWidget {
  const PilihWaktuPoPage({super.key});

  @override
  State<PilihWaktuPoPage> createState() => _PilihWaktuPoPageState();
}

class _PilihWaktuPoPageState extends State<PilihWaktuPoPage> {
  String selectedDate = 'Hari ini';
  String selectedTime = '11.00 - 11.30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF315C46),
        title: const Text(
          'Pilih Waktu PO',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Tanggal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Pilihan Tanggal dengan Ikon Kalender
              Row(
                children: [
                  Expanded(
                    child: _dateCard(
                      label: 'Hari ini',
                      date: '11/08/2026',
                      isSelected: selectedDate == 'Hari ini',
                      onTap: () => setState(() => selectedDate = 'Hari ini'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _dateCard(
                      label: 'Besok',
                      date: '12/08/2026',
                      isSelected: selectedDate == 'Besok',
                      onTap: () => setState(() => selectedDate = 'Besok'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              const Text(
                'Pilih jam pengambilan anda',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              // Grid Jam dengan Ikon Jam
              Row(
                children: [
                  Expanded(child: _jamWidget('11.00 - 11.30', sisa: 10)),
                  const SizedBox(width: 12),
                  Expanded(child: _jamWidget('11.30 - 12.00', sisa: 5)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _jamWidget('12.00 - 12.30', sisa: 8)),
                  const SizedBox(width: 12),
                  Expanded(child: _jamWidget('12.30 - 13.00', sisa: 0)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _jamWidget('13.00 - 13.30', sisa: 12)),
                  const SizedBox(width: 12),
                  Expanded(child: _jamWidget('13.30 - 14.00', sisa: 15)),
                ],
              ),

              const SizedBox(height: 32),

              // Banner Status Kuota
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.calendar_month_outlined, color: Colors.pink, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'PO hari ini sudah dipesan:  0 / 50',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Tombol Lanjut Pesan
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315C46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutPage()));
                  },
                  child: const Text(
                    'Lanjut Pesan',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET KARTU TANGGAL DENGAN IKON
  Widget _dateCard({
    required String label,
    required String date,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final activeColor = const Color(0xFF315C46);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          border: Border.all(
            color: isSelected ? activeColor : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Ikon Kalender
            Icon(
              Icons.calendar_month,
              size: 22,
              color: isSelected ? activeColor : Colors.grey,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET KARTU JAM DENGAN IKON
  Widget _jamWidget(String waktu, {int sisa = 0}) {
    final bool isSelected = selectedTime == waktu;
    final activeColor = const Color(0xFF315C46);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = waktu;
        });
      },
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          border: Border.all(
            color: isSelected ? activeColor : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ikon Jam
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: isSelected ? activeColor : Colors.grey.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  waktu,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'tersisa : $sisa',
              style: TextStyle(
                fontSize: 12,
                color: sisa > 0 ? Colors.grey.shade600 : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}