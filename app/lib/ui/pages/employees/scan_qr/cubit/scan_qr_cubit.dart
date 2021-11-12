import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

part 'scan_qr_state.dart';

class ScanQrCubit extends Cubit<ScanQrState> {
  ScanQrCubit() : super(ScanQrInitial()) {
    initialize();
  }
  final connection = HubConnectionBuilder()
      .withUrl(
          'https://10.0.2.2:5001/qr',
          HttpConnectionOptions(
            client: IOClient(
                HttpClient()..badCertificateCallback = (x, y, z) => true),
            logging: (level, message) => print(message),
          ))
      .build();
  initialize() async {
    await connection.start();
  }

  match(String? text, int mode) async {
    await connection.invoke('Match', args: [text, mode]);
  }

  closeConnection() async {
    await connection.stop();
  }
}
