import 'package:flutter/material.dart';
import 'package:flutter_assignement/Sqflite/SqfliteDatabase.dart';
import 'package:flutter_assignement/NewDocument/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDocCubit extends Cubit<CubitStates> {
  NewDocCubit() : super(CubitInitial());
static NewDocCubit get(context) => BlocProvider.of(context);
TextEditingController barcodeController = TextEditingController();
TextEditingController quantityController = TextEditingController();

  void insertItemData(
    String name,
    String barcode,
    double price,
    int quantity,
  ) async {
    DatabaseHelper myDatabase = DatabaseHelper();
    await myDatabase.insertData(
        '''
  INSERT INTO items_table (
    ${myDatabase.columnId},
    ${myDatabase.columnName},
    ${myDatabase.columnBarcode},
    ${myDatabase.columnPrice}, 
    ${myDatabase.columnQuantity})
  VALUES (
    '${myDatabase.columnId}',
    '$name', 
    '$barcode', 
    '$price', 
    '$quantity')
  ''').then((value) {
    print(myDatabase.itemsTable);
    emit(CubitInsertItemSuccess());
  });

  }
}
