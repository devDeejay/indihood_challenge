import 'package:dhananjay_indihood_submission/model/data_record_model.dart';
import 'package:dhananjay_indihood_submission/services/networking_repo.dart';
import 'package:dhananjay_indihood_submission/utils/di.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenViewModel extends ChangeNotifier {
  bool isLoading = true;
  DataRecordModel dataRecordModel;
  String errorMessage = "";

  HomeScreenViewModel() {
    _getDataForDataRecord();
  }

  void _getDataForDataRecord() async {
    DataRecordModelNetworkingResponse dataRecordModelNetworkingResponse =
        await locator.get<NetworkingRepo>().getDataForDataRecord();

    if (dataRecordModelNetworkingResponse
        is DataRecordModelNetworkingResponseSuccess) {
      this.dataRecordModel = dataRecordModelNetworkingResponse.dataRecordModel;
    } else if (dataRecordModelNetworkingResponse
        is DataRecordModelNetworkingResponseFailure) {
      this.errorMessage = dataRecordModelNetworkingResponse.message;
    } else {
      this.errorMessage = "Unknown error";
    }

    this.isLoading = false;
    notifyListeners();
  }
}
