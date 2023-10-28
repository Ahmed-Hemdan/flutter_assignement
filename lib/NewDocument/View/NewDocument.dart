import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_assignement/Components/Components.dart';
import 'package:flutter_assignement/NewDocument/View/Components/components.dart';
import 'package:flutter_assignement/NewDocument/cubit/cubit.dart';
import 'package:flutter_assignement/NewDocument/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewDocument extends StatelessWidget {
  const NewDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("open screen");
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Barcode", style: mainTextStyle()),
                    Text("Quantity", style: mainTextStyle()),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        controller: NewDocCubit.get(context).barcodeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Barcode",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: NewDocCubit.get(context).quantityController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Quantity",
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
                  onPressed: () async {
                    NewDocCubit.get(context).insertItemData(
                      "فرخ",
                      NewDocCubit.get(context).barcodeController.text,
                      Random().nextDouble(),
                      int.parse(
                          NewDocCubit.get(context).quantityController.text),
                    );
                    print(
                        NewDocCubit.get(context).myDatabase.itemsTable.length);
                    print(NewDocCubit.get(context).response);
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Name",
                      style: mainTextStyle(),
                    ),
                    Text(
                      "Price",
                      style: mainTextStyle(),
                    ),
                    Text(
                      "Quantity",
                      style: mainTextStyle(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                  child: BlocConsumer<NewDocCubit , NewDocStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: litsItem(
                              data: NewDocCubit.get(context).response,
                              index: index),
                        ),
                        itemCount: NewDocCubit.get(context).response.length,
                      );
                    },
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
