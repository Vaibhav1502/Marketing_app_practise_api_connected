class partner_model {
  bool? success;
  List<Data>? data;

  partner_model({this.success, this.data});

  partner_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? partnerName;
  String? file;
  String? bank;
  String? branch;
  String? loanType;
  String? rlms;
  String? accountNo;
  int? loanAmount;
  String? disclosmentDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.partnerName,
      this.file,
      this.bank,
      this.branch,
      this.loanType,
      this.rlms,
      this.accountNo,
      this.loanAmount,
      this.disclosmentDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    partnerName = json['partnerName'];
    file = json['file'];
    bank = json['bank'];
    branch = json['branch'];
    loanType = json['loanType'];
    rlms = json['rlms'];
    accountNo = json['accountNo'];
    loanAmount = json['loanAmount'];
    disclosmentDate = json['disclosmentDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['partnerName'] = this.partnerName;
    data['file'] = this.file;
    data['bank'] = this.bank;
    data['branch'] = this.branch;
    data['loanType'] = this.loanType;
    data['rlms'] = this.rlms;
    data['accountNo'] = this.accountNo;
    data['loanAmount'] = this.loanAmount;
    data['disclosmentDate'] = this.disclosmentDate;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}