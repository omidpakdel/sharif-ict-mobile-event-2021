import 'dart:developer';
import 'dart:io';

import 'package:app/ui/helpers/colors.dart';
import 'package:app/ui/pages/employees/scan_qr/cubit/scan_qr_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrView extends StatelessWidget {
  const ScanQrView({
    Key? key,
    this.mode,
  }) : super(key: key);

  final mode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanQrCubit(),
      child: ScanQrWidget(mode: mode),
    );
  }
}

class ScanQrWidget extends StatefulWidget {
  const ScanQrWidget({Key? key, this.mode}) : super(key: key);
  final mode;

  @override
  State<StatefulWidget> createState() => _ScanQrWidgetState();
}

class _ScanQrWidgetState extends State<ScanQrWidget> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ScanQrCubit, ScanQrState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Expanded(flex: 4, child: _buildQrView(context)),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      if (result == null)
                        const Text(
                          'گوشی هوشمند را در مقابل بارکد قرار دهید.',
                          style: TextStyle(
                            fontFamily: 'IRANYekan',
                            fontSize: 12,
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: MaterialButton(
                                color: ExtryColors.accent,
                                onPressed: () async {
                                  await controller?.toggleFlash();
                                  setState(() {});
                                },
                                child: FutureBuilder(
                                  future: controller?.getFlashStatus(),
                                  builder: (context, snapshot) {
                                    return const Text(
                                      'فلاش دوربین',
                                      style: TextStyle(
                                        fontFamily: 'IRANYekan',
                                        color: ExtryColors.white,
                                        fontSize: 11,
                                      ),
                                    );
                                  },
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: MaterialButton(
                                color: ExtryColors.accent,
                                onPressed: () async {
                                  await controller?.flipCamera();
                                  setState(() {});
                                },
                                child: FutureBuilder(
                                  future: controller?.getCameraInfo(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data != null) {
                                      return const Text(
                                        'جابجایی دوربین',
                                        style: TextStyle(
                                          fontFamily: 'IRANYekan',
                                          color: ExtryColors.white,
                                          fontSize: 11,
                                        ),
                                      );
                                    } else {
                                      return const Text(
                                        'درحال بارگذاری دوربین',
                                        style: TextStyle(
                                          fontFamily: 'IRANYekan',
                                          color: ExtryColors.white,
                                          fontSize: 11,
                                        ),
                                      );
                                    }
                                  },
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        // There is a bug here.
        result = scanData;
        context.read<ScanQrCubit>().match(result!.code, widget.mode);
        controller.stopCamera();
        context.read<ScanQrCubit>().closeConnection();
        if (widget.mode == 1) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/employees-home-exit', (route) => route.isFirst);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/employees-home', (route) => route.isFirst);
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('دسترسی دوربین داده نشده است.')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
