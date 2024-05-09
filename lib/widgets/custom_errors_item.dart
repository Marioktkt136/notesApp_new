import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/errors/errors_cubit.dart';
import 'package:notes_app/models/error_model.dart';

class CustomErrorsItem extends StatelessWidget {
  const CustomErrorsItem(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
            return Container() ;
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
               BlocProvider.of<ErrorCubit>(context).errorModel?.userName ?? 'ss',
                style:  const TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
               BlocProvider.of<ErrorCubit>(context).errorModel?.fnName ?? 'ss',

                  style: const TextStyle(
                  color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.white70,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
              ),
              child: Text(
                textAlign: TextAlign.end,
               BlocProvider.of<ErrorCubit>(context).errorModel?.errMessage ?? 'ss',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
