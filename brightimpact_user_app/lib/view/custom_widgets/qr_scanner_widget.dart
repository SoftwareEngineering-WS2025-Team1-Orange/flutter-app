import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerWidget extends StatefulWidget {
  final bool Function(String data) onQRCodeDetected;

  const QRCodeScannerWidget({super.key, required this.onQRCodeDetected});

  @override
  State<QRCodeScannerWidget> createState() => _QRCodeScannerWidgetState();
}

class _QRCodeScannerWidgetState extends State<QRCodeScannerWidget> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  QRViewController? _qrController;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool _isValidQRCode = true;
  Timer? _validTimer;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    // Initialize available cameras
    _cameras = await availableCameras();
    final backCamera = _cameras?.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);

    if (backCamera != null) {
      // Start camera
      _cameraController = CameraController(backCamera,
        ResolutionPreset.medium,
        enableAudio: false);
      await _cameraController!.initialize();
      setState(() {});
    } else {
      debugPrint("Keine Frontkamera gefunden!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: _cameraController != null &&
                _cameraController!.value.isInitialized
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    // QR scanner
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: _isValidQRCode ? theme.primaryColor : Colors.red,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: MediaQuery.of(context).size.width *
                            0.8, // Quadratisch
                      ),
                    ),
                  ],
                ))
            : CircularProgressIndicator(color: theme.primaryColor), // Progress indicator during camera initialisation
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;

    _qrController!.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        setState(() {
          _isValidQRCode = widget.onQRCodeDetected(scanData.code!);
        });

        // Start timer to reset isValid state from false back to true after a couple of seconds
        if (!_isValidQRCode) {
          _validTimer?.cancel();

          _validTimer = Timer(Duration(milliseconds: 500), () {
            setState(() {
              _isValidQRCode = true;
            });
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _qrController?.dispose();
    _validTimer?.cancel();
    super.dispose();
  }
}
