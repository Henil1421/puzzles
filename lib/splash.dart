import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:puzzles/main.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:  Lottie.asset('splashfoto/98432-loading.json'),),
    );
  }

  void initState()
  {
    super.initState();
    next();
  }
  next()
  async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return homepage();
    },));
  }

}
