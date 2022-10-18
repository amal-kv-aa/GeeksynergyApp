import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/signup/provider/signup_provider.dart';
import 'package:geeksynergy/widgets/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: Theme.of(context).backgroundColor,),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Consumer<UserProvider>(
          builder: (context, provider, child) {
            return Form(
              key: context.watch<UserProvider>().formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ModelTextfield(
                      hint: 'name', controller: provider.namecontroller,
                       validator: (value)=>provider.username(value!),
                    ),
                  
                    ModelTextfield(
                      hint: 'phonenumber',
                      controller: provider.phonenumbercontroller,
                       validator: (value) =>
                       provider.phoneValidate(value!),
                    ),
                    ModelTextfield(
                      hint: 'email',
                      controller: provider.emailcontroller,
                      validator: (value) => provider.emailValidate(value!),
                    ),
                    ModelTextfield(
                      hint: 'password',
                      controller: provider.passwordcontroller,
                      visibility: context.watch<UserProvider>().visibility,
                      iconButton: IconButton(
                          onPressed: () {
                            context.read<UserProvider>().visibleupdate();
                          },
                          icon: Icon(
                            context.watch<UserProvider>().visibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          )),
                      validator: (value) => provider.passwordValidate(value),
                    ),
                    ModelTextfield(
                        hint: 'confirm password',
                        visibility:  context.watch<UserProvider>().visibility,
                        controller: provider.confirmcontroller,
                        validator: (value) => provider.confirmValidate(value)),
                        TextFormField(
          style: const TextStyle(fontSize: 15),
          controller: provider.professioncontroller,
          validator: (value)=>provider.professionValidate(value),
          decoration: InputDecoration(
            hintText: "select your profession",
              fillColor: const Color(0xfff3f3f4),
              filled: true,
              border: InputBorder.none,
              suffixIcon: DropdownButton<String>(
                items:context.read<UserProvider>().getUserDropDown(["bussines","it","self","teaching","freelance"]),
                onChanged: (value) {
                  if (value == null) return;
                 provider.updateProfession(value);
                },     
              ))),
                    ElevatedButton(
                        onPressed: () {
                          context.read<UserProvider>().validate(context);
                        },
                        child: const Text('sign-up')),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.w, vertical: 10.h),
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
                              text: "Already have an account?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200)),
                          TextSpan(
                              text: "  Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.h),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pop(context))
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}