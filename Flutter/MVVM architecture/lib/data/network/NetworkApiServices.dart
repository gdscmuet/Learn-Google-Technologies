import 'dart:convert';
import 'dart:io';
import 'package:rentpayy/data/AppException.dart';
import 'package:http/http.dart' as http;
import 'BaseApiService.dart';

class NetworkApiServices extends BaseApiServices {
  dynamic Jsonresponse;
  @override
  Future getGetApiResponse(String? url) async {
    try {
      final response =
          await http.get(Uri.parse(url!)).timeout(const Duration(seconds: 10));
      Jsonresponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return Jsonresponse;
  }

  @override
  Future getPostApiResponse(String? url) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
      return responseJson;
        break;
      case 400:
        throw BadRequestException("Invalid Request");
      
      default:
        throw FetchDataException(
            "No Data Found \nStatus Code: ${response.statusCode}");
    }
  }
}
