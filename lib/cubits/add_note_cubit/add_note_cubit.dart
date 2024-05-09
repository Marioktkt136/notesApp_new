import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/sqlDb.dart';

part 'add_note_state.dart';
class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

    SqlDb  sqlDb = SqlDb();
String formattedDate = DateTime.now().toIso8601String();    
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
     try{
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      throw  Exception('This is my first custom exception');
      emit(AddNoteSuccess());
     }
     catch(e){      
       int response = await sqlDb.insertData
       ('''
        INSERT INTO notes (userName, fnName, errMessage, createdAt) 
        VALUES ("MARIO", "fetchAllNotes", "Exception", "$formattedDate")
        ''');
       print("insert at addNote function and this is response = $response");
      //  emit(AddNoteFailure(e.toString()));
     }
    }
}
