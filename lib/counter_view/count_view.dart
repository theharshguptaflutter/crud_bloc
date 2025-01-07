// ignore_for_file: prefer_const_constructors

import 'package:crud_bloc/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/bloc/login_bloc.dart';
import '../login/bloc/login_event.dart';

class CountView extends StatelessWidget {
  CountView({super.key});

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBLoc, LoginState>(
      listener: (context, state) {
        if (state is CounterIncrementState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Incremented')));
        }
        if (state is CounterDecrementState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Decrement')));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBLoc, LoginState>(builder: (context, state) {
                if (state is CounterInitialState) {
                  return Text(
                    state.count.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  );
                } else if (state is CounterIncrementState) {
                  return Text(
                    state.incCount.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  );
                } else if (state is CounterDecrementState) {
                  return Text(
                    state.decCount.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  );
                } else {
                  return Container();
                }
              }),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          var blogLogin = BlocProvider.of<LoginBLoc>(context);
                          blogLogin
                              .add(CounterIncrementEvent(incCount: counter++));
                        },
                        child: Text('Increment'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          var blogLogin = BlocProvider.of<LoginBLoc>(context);
                          blogLogin
                              .add(CounterDecrementEvent(decCount: counter--));
                        },
                        child: Text('Decrement'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
