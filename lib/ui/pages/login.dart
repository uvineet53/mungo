import 'package:flutter/material.dart';
import 'package:mungo/ui/widgets/login.dart';
import 'package:mungo/ui/widgets/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool isSignUp;
  @override
  void initState() {
    isSignUp = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: kToolbarHeight),
              Text(
                "Mungo",
                style: Theme.of(context).textTheme.display2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Frank"),
              ),
              SizedBox(
                height: 10,
              ),
              HStack([
                "Stop ".text.white.xl2.make(),
                "Hassle ".text.indigo600.xl2.make(),
                "| Start".text.white.xl2.make(),
                " Debate".text.indigo600.xl2.make(),
              ]),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    isSignUp ? SignupForm() : LoginForm(),
                    const SizedBox(height: 15.0),
                    isSignUp ? loginText() : registerText(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget registerText() {
    return HStack([
      "Don't have an Account? ".text.white.lg.make(),
      GestureDetector(
        onTap: () {
          setState(() {
            isSignUp = true;
          });
        },
        child: "Register".text.xl.indigo600.make(),
      ),
    ]);
  }

  Widget loginText() {
    return HStack([
      "Already have an Account? ".text.white.lg.make(),
      GestureDetector(
        onTap: () {
          setState(() {
            isSignUp = false;
          });
        },
        child: "Login".text.xl.indigo600.make(),
      ),
    ]);
  }
}
