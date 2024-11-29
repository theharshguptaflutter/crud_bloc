class LoginRespModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? userAddress;
  int? userPhoneNumber;
  String? userImageUrl;
  int? userRatingFlag;
  int? userAccountDeleteFlag;
  String? token;

  LoginRespModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userAddress,
      this.userPhoneNumber,
      this.userImageUrl,
      this.userRatingFlag,
      this.userAccountDeleteFlag,
      this.token});

  LoginRespModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userAddress = json['user_address'];
    userPhoneNumber = json['user_phone_number'];
    userImageUrl = json['user_image_url'];
    userRatingFlag = json['user_rating_flag'];
    userAccountDeleteFlag = json['user_account_delete_flag'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_address'] = this.userAddress;
    data['user_phone_number'] = this.userPhoneNumber;
    data['user_image_url'] = this.userImageUrl;
    data['user_rating_flag'] = this.userRatingFlag;
    data['user_account_delete_flag'] = this.userAccountDeleteFlag;
    data['token'] = this.token;
    return data;
  }
}
