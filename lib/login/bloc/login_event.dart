import 'package:crud_bloc/login/model/login_req_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class LoginReqEvent extends LoginEvent{
  // String? username;
  // String? password;


  LoginReqModel? loginReqModel;

  LoginReqEvent({required this.loginReqModel});
  
  @override
  List<Object?> get props => [LoginReqModel];

}


//Counter Section

class CounterIncrementEvent extends LoginEvent{
  int? incCount;
  CounterIncrementEvent({required this.incCount});
  @override
  List<Object?> get props => [incCount];
}

class CounterDecrementEvent extends LoginEvent{
  int? decCount;
  CounterDecrementEvent({required this.decCount});
  @override
  List<Object?> get props => [decCount];
}