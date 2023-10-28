
import 'package:flutter/material.dart';
import 'package:flutter_assignement/Sqflite/SqfliteDatabase.dart';
import 'package:flutter_assignement/NewDocument/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDocCubit extends Cubit<NewDocStates> {
  NewDocCubit() : super(CubitInitial());
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
static NewDocCubit get(context) => BlocProvider.of<NewDocCubit>(context);
 DatabaseHelper myDatabase = DatabaseHelper();
List<Map> response =[];
  insertItemData(
    String name,
    String barcode,
    double price,
    int quantity,
  ) async {
    await myDatabase.insertData(
        '''
  INSERT INTO items_table (
    ${myDatabase.columnId},
    ${myDatabase.columnName},
    ${myDatabase.columnBarcode},
    ${myDatabase.columnPrice}, 
    ${myDatabase.columnQuantity})
  VALUES (
    'sddsgddfsdfdgsfsweffsfs',
    '$name', 
    '$barcode', 
    '$price', 
    '$quantity')
  ''').then((value) async {
    barcodeController.clear();
    quantityController.clear();
    response = await myDatabase.readtData("SELECT * FROM items_table");
  });
  emit(CubitInsertItemSuccess());

  }
}

