import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Warteg',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF315C46),
                  ),
                ),
                const Text(
                  'REISYA PUTRI',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF064D2C),
                  ),
                ),
                const Text(
                  'Makanan Enak, Harga Bersahabat',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF315C46),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Color(0xFF315C46),
                    ),
                    SizedBox(width: 2),
                    Flexible(
                      child: Text(
                        'Jl. raya, Karanglo, Tanjungtirto, Kec. Singosari, Kota Batu, Jawa Timur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF315C46),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 130,
                    color: Color(0xFF524B39),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PO Hari Ini',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Ditutup 10.00 WIB',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Divider(
                                  color: Color(0xFFA3A3A3),
                                  thickness: 1,
                                  height: 10,
                                ),
                                Text(
                                  'Ambil sesuai \n waktu yang dipilih',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )),
                        Expanded(flex: 4,
                        child: Image.network(
                          'https://picsum.photos/600/250',
                          fit: BoxFit.cover,
                          height: double.infinity,
                          errorBuilder: (_, __, ___) => Container(
                            color: Color(0xFF524B39),),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}