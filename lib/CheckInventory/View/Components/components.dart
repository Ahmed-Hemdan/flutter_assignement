import 'package:flutter/material.dart';
import 'package:flutter_assignement/Components/Components.dart';

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
