class DataRecordModelNetworkingResponse {}

class DataRecordModelNetworkingResponseSuccess
    extends DataRecordModelNetworkingResponse {
  DataRecordModel dataRecordModel;
  DataRecordModelNetworkingResponseSuccess(this.dataRecordModel);
}

class DataRecordModelNetworkingResponseFailure
    extends DataRecordModelNetworkingResponse {
  String message;
  DataRecordModelNetworkingResponseFailure(this.message);
}

class DataRecordModel {
  Loan1 loan1;

  DataRecordModel({this.loan1});

  DataRecordModel.fromJson(Map<String, dynamic> json) {
    loan1 = json['loan1'] != null ? new Loan1.fromJson(json['loan1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loan1 != null) {
      data['loan1'] = this.loan1.toJson();
    }
    return data;
  }
}

class Loan1 {
  String type;
  String title;
  LoadImage image;
  BorrowerLocation borrowerLocation;
  ApplicantDetails applicantDetails;
  LoanTerms loanTerms;
  List<RepaymentSchedule> repaymentSchedule;

  Loan1(
      {this.type,
      this.title,
      this.image,
      this.borrowerLocation,
      this.applicantDetails,
      this.loanTerms,
      this.repaymentSchedule});

  Loan1.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    image = json['image'] != null ? new LoadImage.fromJson(json['image']) : null;
    borrowerLocation = json['Borrower Location'] != null
        ? new BorrowerLocation.fromJson(json['Borrower Location'])
        : null;
    applicantDetails = json['Applicant Details'] != null
        ? new ApplicantDetails.fromJson(json['Applicant Details'])
        : null;
    loanTerms = json['Loan Terms'] != null
        ? new LoanTerms.fromJson(json['Loan Terms'])
        : null;
    if (json['Repayment Schedule'] != null) {
      repaymentSchedule = new List<RepaymentSchedule>();
      json['Repayment Schedule'].forEach((v) {
        repaymentSchedule.add(new RepaymentSchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.borrowerLocation != null) {
      data['Borrower Location'] = this.borrowerLocation.toJson();
    }
    if (this.applicantDetails != null) {
      data['Applicant Details'] = this.applicantDetails.toJson();
    }
    if (this.loanTerms != null) {
      data['Loan Terms'] = this.loanTerms.toJson();
    }
    if (this.repaymentSchedule != null) {
      data['Repayment Schedule'] =
          this.repaymentSchedule.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoadImage {
  String url;
  String label;

  LoadImage({this.url, this.label});

  LoadImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    return data;
  }
}

class BorrowerLocation {
  double lat;
  double lng;
  String address;

  BorrowerLocation({this.lat, this.lng, this.address});

  BorrowerLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    return data;
  }
}

class ApplicantDetails {
  String name;
  String dateOfBirth;
  List<String> phoneNumber;
  String maritalStatus;
  int noOfDependents;

  ApplicantDetails(
      {this.name,
      this.dateOfBirth,
      this.phoneNumber,
      this.maritalStatus,
      this.noOfDependents});

  ApplicantDetails.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    dateOfBirth = json['Date of Birth'];
    phoneNumber = json['Phone Number'].cast<String>();
    maritalStatus = json['Marital Status'];
    noOfDependents = json['No of Dependents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Date of Birth'] = this.dateOfBirth;
    data['Phone Number'] = this.phoneNumber;
    data['Marital Status'] = this.maritalStatus;
    data['No of Dependents'] = this.noOfDependents;
    return data;
  }
}

class LoanTerms {
  String duration;
  String interestRate;
  int loanAmount;
  String loanProduct;

  LoanTerms(
      {this.duration, this.interestRate, this.loanAmount, this.loanProduct});

  LoanTerms.fromJson(Map<String, dynamic> json) {
    duration = json['Duration'];
    interestRate = json['Interest Rate'];
    loanAmount = json['Loan Amount'];
    loanProduct = json['Loan Product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Duration'] = this.duration;
    data['Interest Rate'] = this.interestRate;
    data['Loan Amount'] = this.loanAmount;
    data['Loan Product'] = this.loanProduct;
    return data;
  }
}

class RepaymentSchedule {
  String date;
  int amount;

  RepaymentSchedule({this.date, this.amount});

  RepaymentSchedule.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Amount'] = this.amount;
    return data;
  }
}
