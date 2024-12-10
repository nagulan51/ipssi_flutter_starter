import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Sign In',
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: null,
            child: Text('Sign in'),
          ),
        ],
      )),
    );
  }
}
