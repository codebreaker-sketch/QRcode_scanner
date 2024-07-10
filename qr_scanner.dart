
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/result_screen.dart';
import 'package:qr_scanner/qr_scanner_overlay.dart';

const bgColor = Color(0xfffafafa);

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool isScanCompleted = false;

  void closeScreen() {
    setState(() {
      isScanCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding:const EdgeInsets.all(16.0),
        child: Column(
          children: [
           const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR code in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    onDetect: (barcodeCapture) {
                      if (!isScanCompleted) {
                        final barcodes = barcodeCapture.barcodes;
                        for (final barcode in barcodes) {
                          final String code = barcode.rawValue ?? '---';
                          print('Barcode found: $code');
                          setState(() {
                            isScanCompleted = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                  closeScreen: closeScreen,
                                  code: code,
                                ),
                              ),
                            );
                          });
                        }
                      }
                    },
                  ),
                  const QRScannerOverlay(overlaycolor: bgColor),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Developed by Abdul Wasay",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


