// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatefulWidget {
  const DescriptionText({super.key, required this.description});

  final String description;

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  late int? maxLinesForDesc;

  @override
  void initState() {
    maxLinesForDesc = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (maxLinesForDesc == null)
          Text(
            widget.description,
            style: Styles.grey12w500(context).copyWith(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          )
        else
          Text(
            widget.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.grey12w500(context).copyWith(fontSize: getResponsiveFontSize(context: context, fontSize: 14)),
          ),
        if (maxLinesForDesc == null)
          const Column()
        else
          GestureDetector(
            onTap: () {
              maxLinesForDesc = null;
              setState(() {});
            },
            child: Text("Read more...", style: Styles.black14w500(context)),
          ),
      ],
    );
  }
}
