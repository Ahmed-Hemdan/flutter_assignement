
import 'package:flutter_assignement/Sqflite/SqfliteDatabase.dart';
import 'package:flutter_assignement/NewDocument/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDocCubit extends Cubit<NewDocStates> {
  NewDocCubit() : super(CubitInitial());
static NewDocCubit get(context) => BlocProvider.of<NewDocCubit>(context);

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
    'sddsgdfssweffsfs',
    '$name', 
    '$barcode', 
    '$price', 
    '$quantity')
  ''').then((value) async {
    
    emit(CubitInsertItemSuccess());
  });

  }
}

