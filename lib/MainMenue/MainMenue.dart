import 'package:flutter/material.dart';
import 'package:flutter_assignement/CheckInventory/CheckInventory.dart';
import 'package:flutter_assignement/Components/Components.dart';
import 'package:flutter_assignement/NewDocument/NewDocument.dart';

class MainMenue extends StatelessWidget {
  const MainMenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewDocument(),
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
    );
  }
}
