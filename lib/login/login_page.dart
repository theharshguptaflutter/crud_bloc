// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Bloc") ,),
      // ignore: prefer_const_constructors
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyForm(),
        ),
      
      );
  }
}


class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _textController,
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
              if (_formKey.currentState!.validate()) {
                // If the form is valid, show the input in a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You entered: ${_textController.text}')),
                );
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}