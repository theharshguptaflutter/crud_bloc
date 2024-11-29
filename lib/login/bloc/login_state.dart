import 'package:crud_bloc/login/model/login_resp_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  LoginRespModel? loginRespModel;
  LoginLoadedState({this.loginRespModel});

  @override
  List<Object?> get props => [LoginRespModel];
}

class LoginErrorState extends LoginState {
  String? errorMsg;
  LoginErrorState({this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
