import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/errors/errors_cubit.dart';
import 'package:notes_app/widgets/custom_errors_item.dart';

class CustomErrorsListView extends StatelessWidget {
  const CustomErrorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              itemCount: BlocProvider.of<ErrorCubit>(context).errors?.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: CustomErrorsItem(),
                );
              }),
        );
      }
  }