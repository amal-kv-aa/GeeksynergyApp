import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/home/provider/home_provider.dart';
import 'package:geeksynergy/screens/home/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> HomeProvider())
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,index) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            textTheme:   const TextTheme(headlineMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))
          ),
          home: const Home(),
        );
      },designSize: const Size(375, 812),
    );
  }
}
