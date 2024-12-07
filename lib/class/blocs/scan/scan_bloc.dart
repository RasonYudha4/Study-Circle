import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(ScanInitial()) {
    on<StartScanEvent>(_onScanStarted);
  }

  Future<void> _onScanStarted(
      StartScanEvent event, Emitter<ScanState> emit) async {
    emit(ScanLoading());

    try {
      String scannedBarcode = (await BarcodeScanner.scan()) as String;
      emit(ScanSuccess(scannedBarcode));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        emit(ScanError('The user did not grant the camera permission!'));
      } else {
        emit(ScanError('Unknown error: $e'));
      }
    } on FormatException {
      emit(ScanError(
          'null (User  returned using the "back"-button before scanning anything.)'));
    } catch (e) {
      emit(ScanError('Unknown error: $e'));
    }
  }
}
