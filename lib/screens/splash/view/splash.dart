import 'package:flutter/material.dart';
import 'package:geeksynergy/screens/splash/view/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().
    gotoHome(context);
    return    Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Center(
       child: Image(image: AssetImage("assets/amal png white.png")),
      ),
    );
  }
}
