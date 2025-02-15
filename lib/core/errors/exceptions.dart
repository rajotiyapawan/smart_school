
import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
    const ServerException({required this.message, required this.statusCode});

    final String message;
    final String statusCode;

  @override
  List<Object?> get props => [message,statusCode];
}