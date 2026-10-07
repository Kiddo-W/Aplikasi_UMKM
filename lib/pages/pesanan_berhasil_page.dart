import 'package:flutter/material.dart';
import 'status_pesanan.dart';

class PesananBerhasilPage extends StatelessWidget {
  const PesananBerhasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tombol Kembali (Back Arrow)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),

                      // Ikon Nota / Pesanan Berhasil
                      Center(
                        child: CustomPaint(
                          size: const Size(140, 140),
                          painter: SuccessReceiptPainter(),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Judul & Subtitle
                      const Text(
                        'Pesanan Berhasil Dibuat!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Terima kasih, pesanan Anda telah kami terima.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Card Informasi Pesanan (Warna Krem)
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9EFE0), // Warna Krem
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Nomor Pesanan',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF555555),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '#PO-00027',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Detail Informasi Rincian
                            _buildDetailRow('Tanggal', '11/08/2026'),
                            const SizedBox(height: 12),
                            _buildDetailRow('Jam Pengambilan', '12:00 - 12:00'),
                            const SizedBox(height: 12),
                            _buildDetailRow('Tipe Pemesanan', 'Makan di Tempat'),
                            const SizedBox(height: 12),
                            _buildDetailRow('Total Pembayaran', 'Rp35.000'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Catatan Pengambilan
                      const Text(
                        'Simpan nomor pesanan ini saat pengambilan.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Tombol Lihat Status Pesanan
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF138A56),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const StatusPesananPage()));
                          },
                          child: const Text(
                            'Lihat Status Pesanan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Tombol 
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFF138A56),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.popUntil(context, ((route) => route.isFirst));
                          },
                          child: const Text(
                            'Kembali ke Beranda',
                            style: TextStyle(
                              color: Color(0xFF138A56),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF555555),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}

// Custom Painter untuk Menggambar Ikon Struk Nota & Centang
class SuccessReceiptPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = const Color(0xFF138A56)
      ..style = PaintingStyle.fill;

    final paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // 1. Gambar Kertas Nota dengan Gerigi di Bawah
    final pathReceipt = Path();
    double width = size.width * 0.65;
    double height = size.height * 0.72;
    double left = (size.width - width) / 2 - 10;
    double top = 10;

    double cornerRadius = 16;

    pathReceipt.moveTo(left, top + cornerRadius);
    pathReceipt.quadraticBezierTo(left, top, left + cornerRadius, top);
    pathReceipt.lineTo(left + width - cornerRadius, top);
    pathReceipt.quadraticBezierTo(
        left + width, top, left + width, top + cornerRadius);
    pathReceipt.lineTo(left + width, top + height);

    // Gerigi di bagian bawah nota
    double zigZagWidth = width / 5;
    for (int i = 0; i < 5; i++) {
      pathReceipt.lineTo(
          left + width - (i * zigZagWidth) - (zigZagWidth / 2), top + height - 8);
      pathReceipt.lineTo(left + width - ((i + 1) * zigZagWidth), top + height);
    }

    pathReceipt.lineTo(left, top + cornerRadius);
    pathReceipt.close();
    canvas.drawPath(pathReceipt, paintGreen);

    // 2. Garis-garis Putih di Nota
    double lineX = left + 14;
    double lineCorner = 6;

    // Garis 1 (Panjang)
    RRect line1 = RRect.fromLTRBR(
      lineX,
      top + 18,
      left + width - 18,
      top + 28,
      Radius.circular(lineCorner),
    );
    canvas.drawRRect(line1, paintWhite);

    // Garis 2 (Medium)
    RRect line2 = RRect.fromLTRBR(
      lineX,
      top + 34,
      left + width - 38,
      top + 44,
      Radius.circular(lineCorner),
    );
    canvas.drawRRect(line2, paintWhite);

    // Garis 3 (Pendek)
    RRect line3 = RRect.fromLTRBR(
      lineX,
      top + 50,
      left + width - 48,
      top + 60,
      Radius.circular(lineCorner),
    );
    canvas.drawRRect(line3, paintWhite);

    // 3. Lingkaran Centang Hijau di Kanan Bawah
    double circleRadius = size.width * 0.22;
    Offset circleCenter = Offset(left + width - 10, top + height - 12);

    // Border putih di sekeliling lingkaran centang agar memotong nota
    canvas.drawCircle(circleCenter, circleRadius + 4, paintWhite);
    canvas.drawCircle(circleCenter, circleRadius, paintGreen);

    // 4. Tanda Centang Putih di Dalam Lingkaran
    final checkPath = Path();
    checkPath.moveTo(circleCenter.dx - 12, circleCenter.dy);
    checkPath.lineTo(circleCenter.dx - 3, circleCenter.dy + 9);
    checkPath.lineTo(circleCenter.dx + 12, circleCenter.dy - 7);

    final checkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(checkPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}