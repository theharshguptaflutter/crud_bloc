// ignore_for_file: must_be_immutable

import 'package:crud_bloc/login/model/login_resp_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}


class LoginInitialState extends LoginState {
  LoginRespModel? loginRespModel;
  LoginInitialState({this.loginRespModel});

  @override
  List<Object?> get props => [LoginRespModel];
}
class LoginLoadedState extends LoginState {
  LoginRespModel? loginRespModel;
  LoginLoadedState({required this.loginRespModel});

  @override
  List<Object?> get props => [LoginRespModel];
}

class LoginErrorState extends LoginState {
  String? errorMsg;
  LoginErrorState({ required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}



//Counter Section
class CounterInitialState extends LoginState {
  int? count;
  CounterInitialState({required this.count});

  
  @override
  List<Object?> get props => [];
}

class CounterIncrementState extends LoginState {
  int? incCount;
  CounterIncrementState({required this.incCount});


  @override
  List<Object?> get props => [incCount];
}
class CounterDecrementState extends LoginState {
  int? decCount;
  CounterDecrementState({required this.decCount});


  @override
  List<Object?> get props => [decCount];
}
