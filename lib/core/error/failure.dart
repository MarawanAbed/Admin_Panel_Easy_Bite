import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int code;

  const Failure({required this.message, required this.code});

  @override
  List<Object> get props => [
        message,
      ];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message, required int code}) : super(message: message, code: code);
}

