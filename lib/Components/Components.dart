import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



TextStyle mainTextStyle({Color? color}) => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );

ButtonStyle mainButton(context) => ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      side: const BorderSide(
        width: 3,
        color: Color.fromARGB(255, 5, 54, 128),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minimumSize: Size(MediaQuery.sizeOf(context).width * 0.5, 50),
    );

