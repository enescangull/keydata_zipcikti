import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keydata_zipcikti/data/scripts.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

final _domainFix = scripts[4].bash;

class DomainFix extends StatefulWidget {
  const DomainFix({super.key});

  @override
  State<DomainFix> createState() => _DomainFixState();
}

class _DomainFixState extends State<DomainFix> {
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
              child: Text(_domainFix),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _domainFix));
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
