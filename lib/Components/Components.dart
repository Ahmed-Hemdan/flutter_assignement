import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget mainMenueWidget(context, String text, Color color, Color border) =>
    Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: MediaQuery.sizeOf(context).width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
              border: Border.all(
                color: border,
                width: 5,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.3,
              minWidth: 50,
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );

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

Widget litsItem() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CircleAvatar(
          radius: 22,
        ),
        Text(
          "data",
          style: mainTextStyle(),
        ),
        Text(
          "data",
          style: mainTextStyle(),
        ),
      ],
    );

Widget checkInventoryWidget(String text) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: mainTextStyle(),
          ),
          Text(
            "chicken",
            style: mainTextStyle(color: Colors.green),
          ),
        ],
      ),
    );
