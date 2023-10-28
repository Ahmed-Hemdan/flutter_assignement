import 'package:flutter/material.dart';
import 'package:flutter_assignement/CheckInventory/View/Screen/CheckInventory.dart';
import 'package:flutter_assignement/MainMenue/View/Components/components.dart';
import 'package:flutter_assignement/NewDocument/View/Screen/NewDocument.dart';

class MainMenue extends StatelessWidget {
  const MainMenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  NewDocument(),
                    ),
                  );
                },
                child: mainMenueWidget(
                  context,
                  "New Stocktaking Document",
                  const Color.fromARGB(255, 31, 121, 194),
                  const Color.fromARGB(255, 5, 54, 132),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckInventory(),
                    ),
                  );
                },
                child: mainMenueWidget(
                  context,
                  "Check Inventory",
                  const Color.fromARGB(255, 189, 65, 34),
                  const Color.fromARGB(255, 141, 51, 2),
                ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
