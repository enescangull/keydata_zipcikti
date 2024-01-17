import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

String _sectorCode = "MAHAL KODUNU GİRİN";

class QRGenerator extends StatefulWidget {
  const QRGenerator({super.key});

  @override
  State<QRGenerator> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  final TextEditingController _qrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: QrImageView(
                  data: _sectorCode,
                  size: 280,
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(100, 100),
                  ),
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Mahal Kodu",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(300))),
                ),
                controller: _qrController,
                onChanged: (sectorcode) {
                  _sectorCode = sectorcode;
                },
              ),
              SizedBox(
                width: double.maxFinite,
                child: OutlinedButton(
                  onPressed: () {
                    if (_sectorCode == "") {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      _sectorCode = "MAHAL KODUNU GİRİN";
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Lütfen mahal kodunu boş bırakmayınız.")));
                    } else {
                      setState(() {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("QR Oluşturuldu"),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('QR Oluştur'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
