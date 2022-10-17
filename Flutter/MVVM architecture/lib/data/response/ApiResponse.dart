import 'Status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

ApiResponse(this.status,this.data,this.message);
ApiResponse.Loading():status=Status.Loading;
ApiResponse.Completed():status=Status.Completed;
ApiResponse.Error():status=Status.Error;

@override
String toString(){
  return "Status: $status\n Message: $message \n Data: $data";
}
}