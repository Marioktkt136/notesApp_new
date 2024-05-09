import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_notes_item.dart';

// ignore: must_be_immutable
class NotesListView extends StatelessWidget {
  NotesListView({super.key});
  static List<Color> data = const [
    Color(0xffEE8434),
    Color(0xff00C49A),
    Color(0xffAE8799),
    Color(0xffFFCC80),
    Color(0xff496DDB),
    Color(0xffC95D63),
    Color(0xffF8E16C),
    Color(0xffFFC2B4),
    Color(0xff717EC3),
    Color(0xffFB8F67),
  ];
  Color itemColor = data[0];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                for (var i = 0; i < data.length; i++) {
                  itemColor = data[index % data.length];
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomNotesItem(
                    note: notes[index],
                    itemColor: itemColor,
                  ),
                );
              }),
        );
      },
    );
  }
}
