import 'package:flutter/material.dart';

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