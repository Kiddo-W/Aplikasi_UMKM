import 'package:flutter/material.dart';
import 'keranjang_page.dart';

class MenuItem {
  final String name;
  final String price;
  final String stock;
  final String category;
  int quantity;

  MenuItem({
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    this.quantity = 0,
  });
}

final List<MenuItem> daftarMenu = [
  MenuItem(name: 'Nasi Putih', price: 'Rp. 3.000', stock: '', category: 'Nasi'),
  MenuItem(name: 'Ayam Goreng', price: 'Rp. 12.000/ 1 Potong', stock: 'Tersedia 15 Potong', category: 'Lauk'),
  MenuItem(name: 'Rendang', price: 'Rp. 15.000/ 1 Porsi', stock: 'Tersedia 10 Porsi', category: 'Lauk'),
  MenuItem(name: 'Telur Balado', price: 'Rp. 4.000/ 1 Porsi', stock: 'Tersedia 10 Porsi', category: 'Lauk'),
  MenuItem(name: 'Tempe Orek', price: 'Rp. 5.000/ 1 Porsi', stock: 'Tersedia 25 Porsi', category: 'Lauk'),
  MenuItem(name: 'Ikan Goreng', price: 'Rp. 10.000/ 1 Porsi', stock: 'Tersedia 6 Porsi', category: 'Lauk'),
  MenuItem(name: 'Perkedel', price: 'Rp. 4.000/ 1 Porsi', stock: 'Tersedia 10 Porsi', category: 'Lauk'),
  MenuItem(name: 'Sayur Sop', price: 'Rp. 6.000/ 1 Porsi', stock: 'Tersedia 10 Porsi', category: 'Sayuran'),
  MenuItem(name: 'Sayur Lodeh', price: 'Rp. 6.000/ 1 Porsi', stock: 'Tersedia 20 Porsi', category: 'Sayuran'),
  MenuItem(name: 'Tumis Kangkung', price: 'Rp. 4.000/ 1 Porsi', stock: 'Tersedia 12 Porsi', category: 'Sayuran'),
  MenuItem(name: 'Tumis Kacang Panjang', price: 'Rp. 4.000/ 1 Porsi', stock: 'Tersedia 67 Porsi', category: 'Sayuran'),
  MenuItem(name: 'Oseng Pare', price: 'Rp. 4.000/ 1 Porsi', stock: 'Tersedia 20 Porsi', category: 'Sayuran'),
  MenuItem(name: 'Capcay', price: 'Rp. 4.000/ 1 Porsi', stock: 'Tersedia 15 Porsi', category: 'Sayuran'),
  MenuItem(name: 'Es Teh', price: 'Rp. 3.000/ 1 Gelas', stock: 'Tersedia 20 Gelas', category: 'Minuman'),
  MenuItem(name: 'Es Jeruk', price: 'Rp. 3.000/ 1 Gelas', stock: 'Tersedia 20 Gelas', category: 'Minuman'),
  MenuItem(name: 'Kopi Hitam', price: 'Rp. 4.000/ 1 Gelas', stock: 'Tersedia 20 Gelas', category: 'Minuman'),
  MenuItem(name: 'Es Milo', price: 'Rp. 6.000/ 1 Gelas', stock: 'Tersedia 5 Gelas', category: 'Minuman'),
  MenuItem(name: 'Coca Cola', price: 'Rp. 5.000/ 1 Botol', stock: 'Tersedia 20 Botol', category: 'Minuman'),
  MenuItem(name: 'Sprite', price: 'Rp. 5.000/ 1 Botol', stock: 'Tersedia 18 Botol', category: 'Minuman'),
];

const List<Map<String, dynamic>> daftarKategori = [
  {'label': 'Nasi', 'icon': Icons.rice_bowl},
  {'label': 'Lauk', 'icon': Icons.ramen_dining},
  {'label': 'Sayuran', 'icon': Icons.eco},
  {'label': 'Minuman', 'icon': Icons.local_bar},
];

class MenuMakananPage extends StatefulWidget {
  const MenuMakananPage({super.key});

  @override
  State<MenuMakananPage> createState() => _MenuMakananPageState();
}

class _MenuMakananPageState extends State<MenuMakananPage> {
  String? _kategoriDipilih;
  final TextEditingController _searchController = TextEditingController();
  String _kataKunci = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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

  void _pilihKategori(String kategori) {
    setState(() {
      _kategoriDipilih = kategori;
    });
  }

  List<MenuItem> _itemByKategori(String kategori) {
    return daftarMenu
        .where((item) =>
            item.category == kategori &&
            item.name.toLowerCase().contains(_kataKunci.toLowerCase()))
        .toList();
  }

  void _bukaKeranjang() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => KeranjangPage(items: daftarMenu)),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final kategoriTampil = _kategoriDipilih != null
        ? [_kategoriDipilih!]
        : const ['Nasi', 'Lauk', 'Sayuran', 'Minuman'];

    final totalItem = daftarMenu.fold<int>(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: const Color(0xFF064D2C),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    'Menu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (Navigator.canPop(context))
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    child: AnimatedScale(
                      scale: totalItem > 0 ? 1 : 0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      child: GestureDetector(
                        onTap: _bukaKeranjang,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Icon(Icons.shopping_cart, color: Colors.white, size: 22),
                              Positioned(
                                right: -8,
                                top: -8,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (child, animation) {
                                    return ScaleTransition(scale: animation, child: child);
                                  },
                                  child: Container(
                                    key: ValueKey(totalItem),
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: Colors.redAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                                    child: Text(
                                      '$totalItem',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _kataKunci = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari Menu Makanan',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: daftarKategori.map((kategori) {
                        final terpilih = _kategoriDipilih == kategori['label'];
                        return _KategoriIcon(
                          icon: kategori['icon'],
                          label: kategori['label'],
                          terpilih: terpilih,
                          onTap: () => _pilihKategori(kategori['label']),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    if (_kategoriDipilih != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () => setState(() => _kategoriDipilih = null),
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_back, size: 18, color: Color(0xFF315C46)),
                              SizedBox(width: 4),
                              Text(
                                'Kembali ke semua menu',
                                style: TextStyle(color: Color(0xFF315C46)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    for (final kategori in kategoriTampil)
                      _buildKategoriSection(
                        kategori,
                        tampilkanSemua: _kategoriDipilih != null,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKategoriSection(String kategori, {required bool tampilkanSemua}) {
    final items = _itemByKategori(kategori);
    if (items.isEmpty) return const SizedBox.shrink();

    final itemTampil = tampilkanSemua ? items : items.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kategori,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
        ),
        const SizedBox(height: 8),
        ...itemTampil.map((item) => _buildMenuCard(item)),
        if (!tampilkanSemua && items.length > 2)
          GestureDetector(
            onTap: () => _pilihKategori(kategori),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Lihat Lebih Banyak',
                style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),
              ),
            ),
          ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildMenuCard(MenuItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/seed/${item.name}/100/100',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 60,
                height: 60,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(item.price, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                if (item.stock.isNotEmpty)
                  Text(item.stock, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _QuantityStepper(
            quantity: item.quantity,
            onAdd: () => _tambah(item),
            onRemove: () => _kurang(item),
          ),
        ],
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const _QuantityStepper({
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (quantity == 0) {
      return GestureDetector(
        onTap: onAdd,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF1A8855),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 18),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A8855).withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.remove, size: 18, color: Color(0xFF1A8855)),
          ),
          SizedBox(
            width: 24,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A8855)),
            ),
          ),
          GestureDetector(
            onTap: onAdd,
            child: const Icon(Icons.add, size: 18, color: Color(0xFF1A8855)),
          ),
        ],
      ),
    );
  }
}

class _KategoriIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool terpilih;
  final VoidCallback onTap;

  const _KategoriIcon({
    required this.icon,
    required this.label,
    required this.terpilih,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final warna = terpilih ? const Color(0xFF1A8855) : Colors.black87;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: Icon(icon, color: terpilih ? const Color(0xFF1A8855) : Colors.grey.shade700),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: warna)),
        ],
      ),
    );
  }
}