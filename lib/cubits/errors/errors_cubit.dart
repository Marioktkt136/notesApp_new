import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/errors/errors_states.dart';
import 'package:notes_app/models/error_model.dart';
import 'package:notes_app/sqlDb.dart';

class ErrorCubit extends Cubit<ErrorsLogsState>{
  ErrorCubit(): super(ErrorLogsInitial());
  List<ErrorModel>? errors;
  ErrorModel? errorModel;
  SqlDb  sqlDb = SqlDb();
  List<Map> response= [];
  void getErrorLogs()async{
    emit(ErrorLogsLoading());
     response = await sqlDb.readData(
      ''' 
      SELECT * FROM notes
      ''');

  print('SELECT============');
    emit(ErrorLogsSuccess());
  }

  void deleteAllLogs() async{
    emit(ErrorLogsLoading());
    int response = await sqlDb.deleteData('DELETE FROM notes');
    emit(ErrorLogsSuccess());
    print('DELETE ALL============ $response'); 
  }
}