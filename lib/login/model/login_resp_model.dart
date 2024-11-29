class LoginRespModel {
  int? status;
  String? message;
  Data? data;

  LoginRespModel({this.status, this.message, this.data});

  LoginRespModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userAddress;
  int? userPhoneNumber;
  String? userImageUrl;
  int? userAccountDeleteFlag;
  int? userRatingFlag;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPassword,
      this.userAddress,
      this.userPhoneNumber,
      this.userImageUrl,
      this.userAccountDeleteFlag,
      this.userRatingFlag,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userAddress = json['user_address'];
    userPhoneNumber = json['user_phone_number'];
    userImageUrl = json['user_image_url'];
    userAccountDeleteFlag = json['user_account_delete_flag'];
    userRatingFlag = json['user_rating_flag'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_password'] = this.userPassword;
    data['user_address'] = this.userAddress;
    data['user_phone_number'] = this.userPhoneNumber;
    data['user_image_url'] = this.userImageUrl;
    data['user_account_delete_flag'] = this.userAccountDeleteFlag;
    data['user_rating_flag'] = this.userRatingFlag;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
