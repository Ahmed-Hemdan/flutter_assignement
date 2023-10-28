

import 'package:flutter/material.dart';
import 'package:flutter_assignement/Components/Components.dart';

Widget litsItem({required List<Map> data , required int index}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
          Text(data[index]["item_name"]),
        Text(
         "${data[index]["item_price"]} ",
          style: mainTextStyle(),
        ),
        Text(
          "${data[index]["item_quantity"]}",
          style: mainTextStyle(),
        ),
      ],
    );