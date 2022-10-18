import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/login/provider/login_provider.dart';
import 'package:geeksynergy/screens/signup/provider/signup_provider.dart';
import 'package:geeksynergy/screens/signup/view/signup.dart';
import 'package:geeksynergy/widgets/textfield/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
              height: 200.h,
              width: 300.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/amal png.png'),
                      fit: BoxFit.cover)),
            ),
            Form(
                key: context.watch<LoginProvider>().formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModelTextfield(
                      hint: 'email',
                      controller: context.read<LoginProvider>().namecontroller,
                      validator: (value) =>
                          context.read<UserProvider>().username(value!),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ModelTextfield(
                      hint: 'password',
                      visibility: context.watch<LoginProvider>().visibility,
                      iconButton: IconButton(
                          onPressed: () {
                            context.read<LoginProvider>().visibleupdate();
                          },
                          icon: Icon(
                            context.watch<LoginProvider>().visibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          )),
                      controller:
                          context.read<LoginProvider>().passwodcontroller,
                      validator: (value) =>
                          context.read<UserProvider>().passwordValidate(value!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LoginProvider>().validate(context);
                        },
                        style: ElevatedButton.styleFrom(),
                        child: Text(
                          'Login',
                          style: GoogleFonts.rubik(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              child: const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 207, 207, 207),
              ),
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w200)),
                  TextSpan(
                      text: "  Sign-up",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.h),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Signup()));
                        }),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
