import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/errors/errors_cubit.dart';
import 'package:notes_app/views/error_loges_page.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
    final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Row(
        children: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ErrorLogsPage();
                      },
                    ),
                  );
                  BlocProvider.of<ErrorCubit>(context).getErrorLogs();
                },
                value: 1,
                child: const Text(
                  'Error Logs',
                ),
              ),
            ];
          }),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const Spacer(),
          CustomSearchIcon(
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
