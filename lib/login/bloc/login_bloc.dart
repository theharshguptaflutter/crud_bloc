import 'package:crud_bloc/login/bloc/login_event.dart';
import 'package:crud_bloc/login/bloc/login_state.dart';
import 'package:crud_bloc/login/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_resp_model.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  LoginBLoc() : super(LoginInitialState()) {
    on<LoginReqEvent>((event, emit) async {
      emit(LoginLoadingState());

      try {
         LoginRespModel loginRespModel = await LoginRepo().login(
          event.loginReqModel?.username ?? "",
          event.loginReqModel?.password ?? "");
    emit(LoginLoadedState(loginRespModel: loginRespModel));
      } catch (e) {
        emit(LoginErrorState(errorMsg: e.toString()));
      }
   
    });


 
 //counter section

  emit(CounterInitialState(count: 0));
   on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(incCount: event.incCount! + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(decCount: event.decCount! - 1));
    });
   
  }


}
