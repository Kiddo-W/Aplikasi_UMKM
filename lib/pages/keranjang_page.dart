import 'package:flutter/material.dart';
import 'menu_makanan.dart';

class KeranjangPage extends StatefulWidget {
  final List<MenuItem> items;

  const KeranjangPage({super.key, required this.items});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  void _tambah(MenuItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void _kurang(MenuItem item) {
    setState(() {
      if (item.quantity > 0) item.quantity--;
    });
  }

  int _hargaSatuan(MenuItem item) {
    final angka = RegExp(r'[\d.]+').firstMatch(item.price)?.group(0) ?? '0';
    return int.parse(angka.replaceAll('.', ''));
  }

  int get _totalHarga {
    return widget.items
        .where((item) => item.quantity > 0)
        .fold(0, (sum, item) => sum + (_hargaSatuan(item) * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    final itemAktif = widget.items.where((item) => item.quantity > 0).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: const Color(0xFF064D2C),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Keranjang',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: itemAktif.isEmpty
                  ? const Center(
                      child: Text(
                        'Keranjang masih kosong',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: itemAktif.length,
                      itemBuilder: (context, index) {
                        return _buildCard(itemAktif[index]);
                      },
                    ),
            ),
            if (itemAktif.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Total', style: TextStyle(color: Colors.grey)),
                        Text(
                          'Rp. $_totalHarga',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A8855),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: const Text('Checkout', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(MenuItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(item.price, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () => _kurang(item),
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: const Icon(Icons.add_circle, color: Color(0xFF1A8855)),
            onPressed: () => _tambah(item),
          ),
        ],
      ),
    );
  }
}