import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apple_sign_in/apple_sign_in_button.dart' as btn;
import 'apple_signin_available.dart';
import 'auth_services.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final appleSignInAvailable =
        Provider.of<AppleSignInAvailable>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (appleSignInAvailable.isAvailable)
              btn.AppleSignInButton(
                style: btn.ButtonStyle.black,
                type: btn.ButtonType.signIn,
                onPressed: () => _onLoading(context),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithApple(BuildContext context) async {
    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      final usr = await authService
          .signInWithApple(scopes: [Scope.email, Scope.fullName]);
      print('Apple uid: ${usr.uid}');
      regAppleUser(usr, context);
    } catch (e) {
      print(e);
    }
  }

  void regAppleUser(User usr, BuildContext context) {
    if (usr != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.pop(context); //pop dialog
      _signInWithApple(context);
    });
  }
}
