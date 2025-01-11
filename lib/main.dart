// ignore_for_file: prefer_const_constructors

import 'package:crud_bloc/firebase_options.dart';
import 'package:crud_bloc/login/bloc/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'counter_view/count_view.dart';
import 'login/login_page.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

//Remove this method to stop OneSignal Debugging 
OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

OneSignal.initialize("fb6a6871-ef3c-44a9-9584-dd2e97827626");


    OneSignal.login("2");
     OneSignal.User.addTags(
      {
        "mobile_number": "8420419828",
      },
    );
 OneSignal.User.pushSubscription.addObserver((state) {
      print(OneSignal.User.pushSubscription.optedIn);
      print(OneSignal.User.pushSubscription.id);
      print(OneSignal.User.pushSubscription.token);
      print(state.current.jsonRepresentation());
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      print("Has permission " + state.toString());
    });

OneSignal.Notifications.requestPermission(true);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(create:(context)=>LoginBLoc()),
     // BlocProvider(create:(context)=>LoginBLoc())
    ],
      child: MaterialApp(
        title: 'Bloc Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CountView(),
      ),
    );
  }
}
