class SchemaModelNetworkingResponse {}

class SchemaModelNetworkingResponseSuccess
    extends SchemaModelNetworkingResponse {
  SchemaModel schemaModel;
  SchemaModelNetworkingResponseSuccess(this.schemaModel);
}

class SchemaModelNetworkingResponseFailure
    extends SchemaModelNetworkingResponse {
  String message;
  SchemaModelNetworkingResponseFailure(this.message);
}


class SchemaModel {
  LoanType loanType;
  AddressType addressType;
  ImageType imageType;
  RepaymentType repaymentType;
  LoanTermsType loanTermsType;
  LoanApplicantType loanApplicantType;

  SchemaModel(
      {this.loanType,
        this.addressType,
        this.imageType,
        this.repaymentType,
        this.loanTermsType,
        this.loanApplicantType});

  SchemaModel.fromJson(Map<String, dynamic> json) {
    loanType = json['loan_type'] != null
        ? new LoanType.fromJson(json['loan_type'])
        : null;
    addressType = json['address_type'] != null
        ? new AddressType.fromJson(json['address_type'])
        : null;
    imageType = json['image_type'] != null
        ? new ImageType.fromJson(json['image_type'])
        : null;
    repaymentType = json['repayment_type'] != null
        ? new RepaymentType.fromJson(json['repayment_type'])
        : null;
    loanTermsType = json['loan_terms_type'] != null
        ? new LoanTermsType.fromJson(json['loan_terms_type'])
        : null;
    loanApplicantType = json['loan_applicant_type'] != null
        ? new LoanApplicantType.fromJson(json['loan_applicant_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loanType != null) {
      data['loan_type'] = this.loanType.toJson();
    }
    if (this.addressType != null) {
      data['address_type'] = this.addressType.toJson();
    }
    if (this.imageType != null) {
      data['image_type'] = this.imageType.toJson();
    }
    if (this.repaymentType != null) {
      data['repayment_type'] = this.repaymentType.toJson();
    }
    if (this.loanTermsType != null) {
      data['loan_terms_type'] = this.loanTermsType.toJson();
    }
    if (this.loanApplicantType != null) {
      data['loan_applicant_type'] = this.loanApplicantType.toJson();
    }
    return data;
  }
}

class LoanType {
  String type;
  Title title;
  Title image;
  Title borrowerLocation;
  Title applicantDetails;
  Title loanTerms;
  Title repaymentSchedule;

  LoanType(
      {this.type,
        this.title,
        this.image,
        this.borrowerLocation,
        this.applicantDetails,
        this.loanTerms,
        this.repaymentSchedule});

  LoanType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    image = json['image'] != null ? new Title.fromJson(json['image']) : null;
    borrowerLocation = json['Borrower Location'] != null
        ? new Title.fromJson(json['Borrower Location'])
        : null;
    applicantDetails = json['Applicant Details'] != null
        ? new Title.fromJson(json['Applicant Details'])
        : null;
    loanTerms = json['Loan Terms'] != null
        ? new Title.fromJson(json['Loan Terms'])
        : null;
    repaymentSchedule = json['Repayment Schedule'] != null
        ? new Title.fromJson(json['Repayment Schedule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
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
      data['Repayment Schedule'] = this.repaymentSchedule.toJson();
    }
    return data;
  }
}

class Title {
  String type;
  String num;

  Title({this.type, this.num});

  Title.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['num'] = this.num;
    return data;
  }
}

class AddressType {
  String type;
  Title lat;
  Title lng;
  Title address;

  AddressType({this.type, this.lat, this.lng, this.address});

  AddressType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    lat = json['lat'] != null ? new Title.fromJson(json['lat']) : null;
    lng = json['lng'] != null ? new Title.fromJson(json['lng']) : null;
    address =
    json['address'] != null ? new Title.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.lat != null) {
      data['lat'] = this.lat.toJson();
    }
    if (this.lng != null) {
      data['lng'] = this.lng.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class ImageType {
  String type;
  Title url;
  Title label;

  ImageType({this.type, this.url, this.label});

  ImageType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'] != null ? new Title.fromJson(json['url']) : null;
    label = json['label'] != null ? new Title.fromJson(json['label']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.url != null) {
      data['url'] = this.url.toJson();
    }
    if (this.label != null) {
      data['label'] = this.label.toJson();
    }
    return data;
  }
}

class RepaymentType {
  String type;
  Title date;
  Title amount;

  RepaymentType({this.type, this.date, this.amount});

  RepaymentType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['Date'] != null ? new Title.fromJson(json['Date']) : null;
    amount = json['Amount'] != null ? new Title.fromJson(json['Amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.date != null) {
      data['Date'] = this.date.toJson();
    }
    if (this.amount != null) {
      data['Amount'] = this.amount.toJson();
    }
    return data;
  }
}

class LoanTermsType {
  String type;
  Title duration;
  Title interestRate;
  Title loanAmount;
  Title loanProduct;

  LoanTermsType(
      {this.type,
        this.duration,
        this.interestRate,
        this.loanAmount,
        this.loanProduct});

  LoanTermsType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    duration =
    json['Duration'] != null ? new Title.fromJson(json['Duration']) : null;
    interestRate = json['Interest Rate'] != null
        ? new Title.fromJson(json['Interest Rate'])
        : null;
    loanAmount = json['Loan Amount'] != null
        ? new Title.fromJson(json['Loan Amount'])
        : null;
    loanProduct = json['Loan Product'] != null
        ? new Title.fromJson(json['Loan Product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.duration != null) {
      data['Duration'] = this.duration.toJson();
    }
    if (this.interestRate != null) {
      data['Interest Rate'] = this.interestRate.toJson();
    }
    if (this.loanAmount != null) {
      data['Loan Amount'] = this.loanAmount.toJson();
    }
    if (this.loanProduct != null) {
      data['Loan Product'] = this.loanProduct.toJson();
    }
    return data;
  }
}

class LoanApplicantType {
  String type;
  Title name;
  Title dateOfBirth;
  Title phoneNumber;
  Title maritalStatus;
  Title noOfDependents;

  LoanApplicantType(
      {this.type,
        this.name,
        this.dateOfBirth,
        this.phoneNumber,
        this.maritalStatus,
        this.noOfDependents});

  LoanApplicantType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['Name'] != null ? new Title.fromJson(json['Name']) : null;
    dateOfBirth = json['Date of Birth'] != null
        ? new Title.fromJson(json['Date of Birth'])
        : null;
    phoneNumber = json['Phone Number'] != null
        ? new Title.fromJson(json['Phone Number'])
        : null;
    maritalStatus = json['Marital Status'] != null
        ? new Title.fromJson(json['Marital Status'])
        : null;
    noOfDependents = json['No of Dependents'] != null
        ? new Title.fromJson(json['No of Dependents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.name != null) {
      data['Name'] = this.name.toJson();
    }
    if (this.dateOfBirth != null) {
      data['Date of Birth'] = this.dateOfBirth.toJson();
    }
    if (this.phoneNumber != null) {
      data['Phone Number'] = this.phoneNumber.toJson();
    }
    if (this.maritalStatus != null) {
      data['Marital Status'] = this.maritalStatus.toJson();
    }
    if (this.noOfDependents != null) {
      data['No of Dependents'] = this.noOfDependents.toJson();
    }
    return data;
  }
}