import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;
  DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            onSaved: (value) {
              description = value;
            },
            hintText: 'Description',
            maxLines: 5,
          ),
          const SizedBox(
            height: 60,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: State is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // List months = [
                    //   'Jan',
                    //   'Feb',
                    //   'Mar',
                    //   'Apr',
                    //   'May',
                    //   'Jun',
                    //   'Jul',
                    //   'Aug',
                    //   'Sep',
                    //   'Oct',
                    //   'Nov',
                    //   'Dec'
                    // ];
                    var currentDate = DateTime.now();
                    // var currentMonth = months[currentDate.month - 1];
                    var formattedCurrentDate =
                        DateFormat('MMM dd, yyyy \n hh:mm a')
                            .format(currentDate);
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: description!,
                      // date: DateTime.now().toString(),
                      date: formattedCurrentDate,

                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
