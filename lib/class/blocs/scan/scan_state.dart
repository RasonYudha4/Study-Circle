part of 'scan_bloc.dart';

sealed class ScanState {}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanSuccess extends ScanState {
  final String barcode;

  ScanSuccess(this.barcode);
}

class ScanError extends ScanState {
  final String message;

  ScanError(this.message);
}
