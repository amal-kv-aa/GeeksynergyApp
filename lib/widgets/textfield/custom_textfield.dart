import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/signup/provider/signup_provider.dart';
import 'package:provider/provider.dart';

class ModelTextfield extends StatelessWidget {
  const ModelTextfield(
      {Key? key,
      required this.hint,
      required this.controller,
      this.validator,
      this.visibility,
      this.iconButton,
      })
      : super(key: key);
  final String hint;
  final bool? visibility;
  final IconButton? iconButton;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.h),
      child: Center(
        child: Consumer<UserProvider>(
          builder: (context, signupprovider, child){
            return
            TextFormField(
              obscureText:visibility?? false,
            controller: controller,
            style: const TextStyle(color: Color.fromARGB(255, 7, 1, 128)),
            decoration: InputDecoration(
              suffixIcon: iconButton,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: hint,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
              
                fillColor: Colors.white,
                filled: true),
            validator: validator,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.disabled,
          );
          }
        ),
      ),
    );
  }
}
