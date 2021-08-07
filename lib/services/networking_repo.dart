import 'dart:convert';
import 'dart:developer';
import 'package:dhananjay_indihood_submission/model/data_record_model.dart';
import 'package:dhananjay_indihood_submission/utils/const.dart';
import 'package:http/http.dart' as http;

const String BASE_API_URL = "ui-test-dot-indihood-dev-in.appspot.com";

class NetworkingRepo {
  Future<Map> callAPI(
    String requestType,
    String endpoint, {
    Map<String, String> headers,
    Map<String, dynamic> queryObject,
  }) async {
    if (headers == null) {
      headers = {};
    }

    if (queryObject == null) {
      queryObject = {};
    }

    var networkResponse;

    switch (requestType) {
      case POST_NETWORK_REQUEST:
        Uri request = Uri.https(BASE_API_URL, endpoint);
        networkResponse = await http.post(request,
            headers: headers, body: jsonEncode(queryObject));
        break;

      case PATCH_NETWORK_REQUEST:
        Uri request = Uri.https(BASE_API_URL, endpoint);
        networkResponse = await http.patch(request,
            headers: headers, body: jsonEncode(queryObject));
        break;

      case GET_NETWORK_REQUEST:
        Uri request = Uri.https(BASE_API_URL, endpoint, queryObject);
        networkResponse = await http.get(request, headers: headers);
        break;
    }

    if (networkResponse.body == null || networkResponse.body.isEmpty) {
      return {};
    }

    log(networkResponse.body);
    Map jsonResponse = await json.decode(utf8.decode(networkResponse.bodyBytes));
    return jsonResponse;
  }

  Future<DataRecordModelNetworkingResponse> getDataForDataRecord() async {
    try {
      Map response = await callAPI(GET_NETWORK_REQUEST, '/records');
      return DataRecordModelNetworkingResponseSuccess(
          DataRecordModel.fromJson(response));
    } catch (exception) {
      return DataRecordModelNetworkingResponseFailure(exception.toString());
    }
  }
}
