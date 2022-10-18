import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/home/provider/home_provider.dart';
import 'package:geeksynergy/screens/login/provider/login_provider.dart';
import 'package:geeksynergy/screens/signup/model/signup_model.dart';
import 'package:geeksynergy/screens/signup/provider/signup_provider.dart';
import 'package:geeksynergy/screens/splash/view/provider/splash_provider.dart';
import 'package:geeksynergy/screens/splash/view/splash.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
if(!Hive.isAdapterRegistered(UserModelAdapter().typeId))
  {
   Hive.registerAdapter(UserModelAdapter());
   
  }
    await Hive.openBox('user_db');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> HomeProvider()),
    ChangeNotifierProvider(create: (_)=> UserProvider()),
    ChangeNotifierProvider(create: (_)=>LoginProvider()),
    ChangeNotifierProvider(create: (_)=>SplashProvider())
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor:  const Color.fromARGB(255, 7, 1, 128),
            elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 7, 1, 128))),
            textTheme:   const TextTheme(headlineMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black))
          ),
          home: const Splash(),
        );
      },designSize: const Size(375, 812),
    );
  }
}
