// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:crud_bloc/login/bloc/login_bloc.dart';
import 'package:crud_bloc/login/bloc/login_event.dart';
import 'package:crud_bloc/login/bloc/login_state.dart';
import 'package:crud_bloc/login/model/login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc"),
      ),
      // ignore: prefer_const_constructors
      body: BlocBuilder<LoginBLoc, LoginState>(
        builder: (BuildContext context, state) {
          if (state is LoginInitialState) {
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'Enter your text',
                          hintText: 'Type something here...',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: pwd,
                        decoration: InputDecoration(
                          labelText: 'Enter your text',
                          hintText: 'Type something here...',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          var blogLogin = BlocProvider.of<LoginBLoc>(context);
                          var req = LoginReqModel(
                              username: email.text, password: pwd.text);
                          blogLogin.add(LoginReqEvent(loginReqModel: req));
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ));
          } else if (state is LoginLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoginLoadedState) {
            return Column(
              children: [
                Center(
                    child: Text(
                  state.loginRespModel?.data?.userEmail ?? "null",
                  style: TextStyle(color: Colors.black),
                )),
              
             
              ],
            );
          } else if (state is LoginErrorState) {
            return Center(
              child: Text(
                state.errorMsg.toString(),
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
