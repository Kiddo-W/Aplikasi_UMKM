import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformasiWartegPage extends StatelessWidget {
  const InformasiWartegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF138A56),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light, // Ikon jam/baterai berwarna putih
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Informasi Warteg',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Column(
            children: [
              // Banner Gambar Warteg
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  'https://picsum.photos/300/201',
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 120,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ),

              // Item 1: Nama & Subtitle
              _buildListItem(
                iconWidget: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade300,
                ),
                title: 'Warteg Reisya Putri',
                subtitle: 'Makan Enak, Harga bersahabat',
              ),

              const Divider(height: 1, color: Color(0xFFE0E0E0)),

              // Item 2: Alamat
              _buildListItem(
                icon: Icons.location_on,
                title: 'Alamat',
                subtitle:
                    'Jl Raya, Karanglo, Tanjungtirto, Kec. Singosari, Kota Batu, Jawa Timur',
              ),

              const Divider(height: 1, color: Color(0xFFE0E0E0)),

              // Item 3: Nomor Telepon
              _buildListItem(
                icon: Icons.phone,
                title: 'Nomor Telepon',
                subtitle: '086767676767',
              ),

              const Divider(height: 1, color: Color(0xFFE0E0E0)),

              // Item 4: Jam Buka
              _buildListItem(
                icon: Icons.access_time_filled,
                title: 'Jam Buka',
                subtitle: '10:00 - 20:00 WIB',
              ),

              const Divider(height: 1, color: Color(0xFFE0E0E0)),

              // Item 5: Tentang Kami
              _buildListItem(
                icon: Icons.info,
                title: 'Tentang Kami',
                subtitle:
                    'Warteg Bahari hadir untuk menyediakan makanan rumahan yang enak, bersih, dan terjangkau untuk semua.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    IconData? icon,
    Widget? iconWidget,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: iconWidget ??
                  Icon(
                    icon,
                    color: const Color(0xFF138A56),
                    size: 36,
                  ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}