import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/error_model.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/sqlDb.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesInitial());
  SqlDb  sqlDb = SqlDb();
  String formattedDate = DateTime.now().toIso8601String();    

  List<NoteModel>? notes;
  List<ErrorModel>? errors;
  fetchAllNotes() async {
    emit(NotesLoading());
      try{
        var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      throw  Exception('This is my first custom exception');
      emit(NotesSuccess());
      }
      catch(e){
       int response = await sqlDb.insertData('''
        INSERT INTO notes (userName, fnName, errMessage, createdAt) 
        VALUES ("MARIO", "fetchAllNotes", "Exception", "$formattedDate")
        ''');
       print("insert at fetchAllNotes function and this is response = $response");
      }
  }
}
