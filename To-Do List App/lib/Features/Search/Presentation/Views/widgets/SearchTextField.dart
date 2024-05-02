// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Features/Search/Presentation/Manager/SearchViewCubit/search_view_cubit.dart';
import 'package:todo_list_app/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: TextField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: (str) {
          onChanged(str);
          BlocProvider.of<SearchViewCubit>(context).getRelatedTasks(str);
        },
        cursorOpacityAnimates: true,
        cursorColor: kPrimaryColor,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(),
          errorBorder: const UnderlineInputBorder(),
          hintText: "Enter any thing",
          hintStyle: TextStyle(fontFamily: 'Lato', color: kPrimaryColor.withOpacity(.5), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
