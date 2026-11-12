import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HitungGaya(),
    );
  }
}

class HitungGaya extends StatefulWidget {
  const HitungGaya({super.key});

  @override
  State<HitungGaya> createState() => _HitungGayaState();
}

class _HitungGayaState extends State<HitungGaya> {
  final massaCtrl = TextEditingController();
  final percepatanCtrl = TextEditingController();

  String hasil = '';

  void hitung() {
    final m = double.tryParse(massaCtrl.text);
    final a = double.tryParse(percepatanCtrl.text);

    if (m == null || a == null || m < 0 || a < 0) {
      setState(() {
        hasil = 'Masukkan angka yang benar!';
      });
      return;
    }

    final f = m * a;

    setState(() {
      hasil = 'F = $m × $a = $f N';
    });
  }

  @override
  void dispose() {
    massaCtrl.dispose();
    percepatanCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4F8),
      appBar: AppBar(
        title: const Text('Mencari Gaya (F)'),
        backgroundColor: const Color(0xFFFFB7D5),
        foregroundColor: const Color(0xFFFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Rumus: F = m × a',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB85D83),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: massaCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Massa (kg)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFFFFBFD),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF91B8),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: percepatanCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Percepatan (m/s²)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFFFFBFD),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF91B8),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitung,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB7D5),
                foregroundColor: const Color(0xFF8F4565),
              ),
              child: const Text('Carilah F'),
            ),
            const SizedBox(height: 20),
            Text(
              hasil,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB85D83),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
