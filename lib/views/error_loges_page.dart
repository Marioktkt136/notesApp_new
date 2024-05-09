import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/errors/errors_cubit.dart';
import 'package:notes_app/cubits/errors/errors_states.dart';
import 'package:notes_app/widgets/custom_app_bar_for_errors_Page.dart';
import 'package:notes_app/widgets/custom_list_view_for_errors_page.dart';

class ErrorLogsPage extends StatelessWidget {
  const ErrorLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomAppBarForErrorPage(
            title: 'Error Logs',
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
           BlocBuilder<ErrorCubit, ErrorsLogsState>(builder: (context, state){
                    if(state is ErrorLogsLoading){
                      return const Center(
                        child: CircularProgressIndicator()); 
                    }
                    else if(state is ErrorLogsSuccess){
                      return const Expanded(
                    child: CustomErrorsListView(),
                     );
                    }
                    else{
                      return const Text('There is no Errors');
                    }
                  },),
        ]),
      ),
    );
  }
}
