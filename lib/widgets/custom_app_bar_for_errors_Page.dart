import 'package:flutter/material.dart';
import 'package:notes_app/cubits/errors/errors_cubit.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBarForErrorPage extends StatelessWidget {
  const CustomAppBarForErrorPage(
      {super.key, required this.title, required this.icon, this.onPressed});
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          IconButton(onPressed:(){
            ErrorCubit().deleteAllLogs();
          }, icon: Icon(Icons.delete)),
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
