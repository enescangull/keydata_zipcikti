import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keydata_zipcikti/data/scripts.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

final _ikinciEkran = scripts[2].bash;

class DualScreen extends StatefulWidget {
  const DualScreen({super.key});

  @override
  State<DualScreen> createState() => _DualScreenState();
}

class _DualScreenState extends State<DualScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: UIColorHelper.colorKey)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 300,
              width: 350,
              child: Text(_ikinciEkran),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _ikinciEkran));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Kopyalandı!")));
                  },
                  child: const Text('Kopyala')),
            ),
          ],
        ),
      ),
    );
  }
}
