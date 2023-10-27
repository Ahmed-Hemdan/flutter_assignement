import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_assignement/Components/Components.dart';
import 'package:flutter_assignement/NewDocument/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewDocument extends StatelessWidget {
  const NewDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewDocCubit(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Document No.",
                      style: mainTextStyle(),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Barcode",
                      style: mainTextStyle(),
                    ),
                    Text(
                      "Quntity",
                      style: mainTextStyle(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: TextFormField(
                        controller: NewDocCubit.get(context).barcodeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Barcode",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: NewDocCubit.get(context).quantityController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Quntity",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: mainButton(context),
                  onPressed: () {
                    NewDocCubit.get(context).insertItemData(
                      Random().toString(),
                      NewDocCubit.get(context).barcodeController.text,
                      Random().nextDouble(),
                      int.parse(
                        NewDocCubit.get(context).quantityController.text,
                      ),
                    );
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: litsItem(),
                    ),
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: mainButton(context),
                  onPressed: () {},
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
