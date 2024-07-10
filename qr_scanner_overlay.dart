
import 'package:flutter/material.dart';

class QRScannerOverlay extends StatelessWidget {
  final Color overlaycolor;

  const QRScannerOverlay({required this.overlaycolor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScannerOverlayPainter(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Rounded edges
          border: Border.all(
            color: Colors.blue, // Border color
            width: 4,
          ),
        ),
      ),
    );
  }
}

class ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 30.0;

    // Top-left corner
    canvas.drawLine(const Offset(0, 0),const Offset(cornerLength, 0), paint);
    canvas.drawLine(const Offset(0, 0),const Offset(0, cornerLength), paint);

    // Top-right corner
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - cornerLength, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, cornerLength), paint);

    // Bottom-left corner
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - cornerLength), paint);
    canvas.drawLine(Offset(0, size.height), Offset(cornerLength, size.height), paint);

    // Bottom-right corner
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width - cornerLength, size.height), paint);
    canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - cornerLength), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

