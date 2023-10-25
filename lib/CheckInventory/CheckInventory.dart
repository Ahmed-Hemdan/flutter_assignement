import 'package:flutter/material.dart';
import 'package:flutter_assignement/Components/Components.dart';

class CheckInventory extends StatelessWidget {
  const CheckInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Barcode",
                  style: mainTextStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Barcode",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              checkInventoryWidget("Name"),
              checkInventoryWidget("Price"),
              checkInventoryWidget("Quantity"),
            ],
          ),
        ),
      ),
    );
  }
}
