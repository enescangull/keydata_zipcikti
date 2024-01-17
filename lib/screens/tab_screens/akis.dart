import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keydata_zipcikti/data/scripts.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

final _akis = scripts[5].bash;

class AkisScreen extends StatefulWidget {
  const AkisScreen({super.key});

  @override
  State<AkisScreen> createState() => _AkisScreenState();
}

class _AkisScreenState extends State<AkisScreen> {
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
              height: 300,
              width: 350,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(_akis)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _akis));
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
