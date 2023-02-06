import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String code;
  Failure({
    required this.code,
    required this.message,
  });

  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({required String code, required String message}) : super(code: code, message: message);
}

class InnerFailure extends Failure {
  InnerFailure({required String code, required String message}) : super(code: code, message: message);
}
