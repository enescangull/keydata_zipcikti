import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keydata_zipcikti/data/scripts.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

final _panelFix = scripts[3].bash;
String _resultScript = "";
String _username = "";

class PanelFix extends StatefulWidget {
  const PanelFix({super.key});

  @override
  State<PanelFix> createState() => _PanelFixState();
}

class _PanelFixState extends State<PanelFix> {
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(300))),
              ),
              controller: _usernameController,
              onChanged: (String username) {
                setState(() {
                  _username = username;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    if (_username == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Lütfen alanları boş bırakmayınız.")));
                    } else {
                      setState(() {
                        _resultScript =
                            _panelFix.replaceAll("kullanici.adi", _username);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Metin Değiştirildi"),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('Oluştur')),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: UIColorHelper.colorKey)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 300,
              width: 350,
              child: Text(_resultScript),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _resultScript));
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
