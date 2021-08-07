import 'package:dhananjay_indihood_submission/model/data_record_model.dart';
import 'package:dhananjay_indihood_submission/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';

import 'content_card.dart';
import 'home_screen_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          leadingWidth: 40,
          title: buildTextWidget(getAppBarText(viewModel),
              color: Colors.white, fontSize: 16, textAlign: TextAlign.start),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: viewModel.isLoading
              ? SingleChildScrollView(
                  child: Container(
                    color: Color(0xFFF0F5F5),
                    child: Column(
                      children: [
                        buildVerticalSpace(4),
                        buildSingleCardLoadingShimmer(context,
                            sidePadding: 8, height: 200),
                        buildSingleCardLoadingShimmer(context,
                            sidePadding: 8, height: 140),
                        buildSingleCardLoadingShimmer(context,
                            sidePadding: 8, height: 140),
                        buildSingleCardLoadingShimmer(context,
                            sidePadding: 8, height: 140),
                      ],
                    ),
                  ),
                )
              : viewModel.dataRecordModel != null
                  ? buildDataRecordBody(context, viewModel)
                  : Container(
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTextWidget("Something went wrong 😞",
                              fontSize: 20),
                          buildTextWidget(viewModel.errorMessage,
                              fontSize: 14, color: Colors.grey)
                        ],
                      )),
                    ),
        ),
      );
    });
  }

  String getAppBarText(HomeScreenViewModel viewModel) {
    if (viewModel.dataRecordModel != null) {
      return viewModel.dataRecordModel.loan1.title.toString();
    } else {
      return "Sample app by DJ";
    }
  }

  Container buildDataRecordBody(
      BuildContext context, HomeScreenViewModel viewModel) {
    var dataRecord = viewModel.dataRecordModel.loan1;
    return Container(
      color: Color(0xFFF0F5F5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopHeader(context, dataRecord),
            buildVerticalSpace(4),
            buildApplicantDetails(dataRecord.applicantDetails),
            buildLoanTerms(dataRecord.loanTerms),
            buildRepaymentSchedule(dataRecord.repaymentSchedule),
            buildVerticalSpace(4)
          ],
        ),
      ),
    );
  }

  Widget buildTopHeader(BuildContext context, Loan1 dataRecord) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          dataRecord.image.url,
          height: 180,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
          width: double.maxFinite,
          height: 180,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  showSnackbarMessage(context, "Opening Maps");
                  MapsLauncher.launchCoordinates(
                      dataRecord.borrowerLocation.lat,
                      dataRecord.borrowerLocation.lng);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextWidget(dataRecord.image.label,
                        color: Colors.white,
                        leftMargin: 8,
                        fontSize: 14,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600),
                    buildTextWidget(dataRecord.borrowerLocation.address,
                        color: Colors.white,
                        leftMargin: 8,
                        fontSize: 12,
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildApplicantDetails(ApplicantDetails applicantDetails) {
    return ContentCard(
        title: "Applicant Details",
        collapsedDataLength: 2,
        collapsedButtonTextToShow: "SEE MORE",
        listOfWidgets: [
          buildInfoTemplate(title: "Name", data: applicantDetails.name),
          Row(
            children: [
              Expanded(
                child: buildInfoTemplate(
                    title: "Data of Birth", data: applicantDetails.dateOfBirth),
              ),
              Expanded(
                child: buildInfoTemplate(
                    title: "Phone Number",
                    data: applicantDetails.phoneNumber[0]),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: buildInfoTemplate(
                    title: "Marital Status",
                    data: applicantDetails.maritalStatus),
              ),
              Expanded(
                child: buildInfoTemplate(
                    title: "No. of Dependants",
                    data: applicantDetails.noOfDependents.toString()),
              ),
            ],
          ),
        ]);
  }

  Widget buildLoanTerms(LoanTerms loanTerms) {
    return ContentCard(title: "Loan Terms", listOfWidgets: [
      Row(
        children: [
          Expanded(
            child:
                buildInfoTemplate(title: "Duration", data: loanTerms.duration),
          ),
          Expanded(
            child: buildInfoTemplate(
                title: "Interest Rate", data: loanTerms.interestRate),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: buildInfoTemplate(
                title: "Loan Amount",
                data: "Rs " + loanTerms.loanAmount.toString()),
          ),
          Expanded(
            child: buildInfoTemplate(
                title: "Loan Product", data: loanTerms.loanProduct),
          ),
        ],
      )
    ]);
  }

  Widget buildRepaymentSchedule(List<RepaymentSchedule> repaymentSchedule) {
    List<Widget> listOfChildWidgets = [];

    for (var plan in repaymentSchedule) {
      listOfChildWidgets.add(Row(
        children: [
          Expanded(
            child: buildInfoTemplate(title: "Date", data: plan.date),
          ),
          Expanded(
            child: buildInfoTemplate(
                title: "Amount", data: plan.amount.toString()),
          ),
        ],
      ));
    }

    return ContentCard(
      title: "Repayment Schedule",
      listOfWidgets: listOfChildWidgets,
      collapsedButtonTextToShow: "SEE FULL SCHEDULE",
      collapsedDataLength: 3,
    );
  }
}
