part of 'notes_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesInitial extends NotesCubitState {}

final class NotesSuccess extends NotesCubitState {}

final class NotesLoading extends NotesCubitState {}

final class NotesFailure extends NotesCubitState {
  final String errMessage;

  NotesFailure(this.errMessage);
}
