import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            width: 355,
            height: 795,
            color: Colors.white,
            child: Column(
              children: [

                // Header
                Container(
                  height: 68,
                  color: Colors.green,
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 70),
                      Text(
                        "Pilih Waktu PO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Pilih Tanggal",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Container(
                            width: 160,
                            height: 70,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Hari ini\n11/08/2026"),
                          ),

                          SizedBox(width: 10),

                          Container(
                            width: 160,
                            height: 70,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Besok\n12/08/2026"),
                          ),
                        ],
                      ),

                      SizedBox(height: 45),

                      Text("Pilih jam pengambilan anda"),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          jam("11.00 - 11.30"),
                          SizedBox(width: 35),
                          jam("11.30 - 12.00"),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          jam("12.00 - 12.30"),
                          SizedBox(width: 35),
                          jam("12.30 - 13.00"),
                        ],
                      ),

                      SizedBox(height: 15),

                      Row(
                        children: [
                          jam("13.00 - 13.30"),
                          SizedBox(width: 35),
                          jam("13.00 - 14.00"),
                        ],
                      ),

                      SizedBox(height: 65),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        color: Colors.pink.shade50,
                        child: Text(
                          "📅  po hari ini sudah di pesan\n      0 / 50",
                        ),
                      ),

                      SizedBox(height: 25),

                      Container(
                        width: double.infinity,
                        height: 45,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "Lanjut Pesan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget jam(String waktu) {
  return Container(
    width: 145,
    height: 85,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(waktu),
        SizedBox(height: 10),
        Text("tersisa : 0"),
      ],
    ),
  );
}