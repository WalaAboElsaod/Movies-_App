import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;

  final String messageCode;
  final bool success;
   const ErrorMessageModel({required this.statusCode, required this.messageCode,required this.success});

   factory ErrorMessageModel.fromJson(Map <String,dynamic>Json){

   return  ErrorMessageModel(
     statusCode:Json[ "status_code"],
     messageCode:Json ["message_code"],
  success:Json ["success"]);
  }

  @override
  List<Object?> get props => [statusCode,messageCode,success];
}
