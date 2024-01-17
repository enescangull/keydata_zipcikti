import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keydata_zipcikti/data/scripts.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

final _script = scripts[0].bash;
String _resultScript = "";
String _username = "";
String _servername = "";

class OrtakAlan extends StatefulWidget {
  const OrtakAlan({super.key});

  @override
  State<OrtakAlan> createState() => _OrtakAlanState();
}

class _OrtakAlanState extends State<OrtakAlan> {
  late TextEditingController _usernameController;
  late TextEditingController _servernameController;

  @override
  void initState() {
    super.initState();
    _servernameController = TextEditingController();
    _usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            TextField(
              decoration: const InputDecoration(
                labelText: "Kullanıcı Adı",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(300),
                  ),
                ),
              ),
              controller: _usernameController,
              onChanged: (String username) {
                setState(() {
                  _username = username;
                });
              },
            ),
            const SizedBox(height: 15),
            TextField(
                decoration: const InputDecoration(
                  labelText: "Sunucu Adı",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(300),
                    ),
                  ),
                ),
                controller: _servernameController,
                onChanged: (String servername) {
                  setState(() {
                    _servername = servername;
                  });
                }),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    if (_servername == "" || _username == "") {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Lütfen alanları boş bırakmayınız.")));
                    } else {
                      setState(() {
                        _resultScript = _script.replaceAll("tsuser", _username);
                        _resultScript = _resultScript.replaceAll(
                            "tibbi-sekreterlik", _servername);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Metin Değiştirildi"),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('Bir TIK')),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: UIColorHelper.colorKey)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 300,
              width: 350,
              child: SingleChildScrollView(
                child: Text(_resultScript),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    Clipboard.setData(ClipboardData(text: _resultScript));

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "Kopyalandı!",
                    )));
                  },
                  child: const Text('Kopyala')),
            ),
          ],
        ),
      ),
    );
  }
}
