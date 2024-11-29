import 'package:crud_bloc/login/model/login_req_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class LoginReqEvent extends LoginEvent{
  // String? username;
  // String? password;

  LoginReqModel? loginReqModel;

  LoginReqEvent({this.loginReqModel});
  
  @override
  List<Object?> get props => [LoginReqModel];

}