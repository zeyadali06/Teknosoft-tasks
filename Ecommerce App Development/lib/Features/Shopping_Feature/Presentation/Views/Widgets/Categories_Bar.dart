import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({super.key, required this.categories, required this.onItemSelected});

  final List<String> categories;
  final void Function(String categorySelected) onItemSelected;

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.grey.withOpacity(.3);
    Color textColor = Colors.black.withOpacity(.5);
    Color selectedButtonColor = Colors.yellow;
    Color selectedTextColor = Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (BuildContext context, int index) {
            String category = widget.categories[index];
            bool isSelected = category == BlocProvider.of<ShoppingViewCubit>(context).selectedCategory;
            return Padding(
              padding: EdgeInsets.only(
                left: (index == 0) ? kPadding : kPadding / 2,
                right: (index == widget.categories.length - 1) ? kPadding : 0,
              ),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    BlocProvider.of<ShoppingViewCubit>(context).selectedCategory = category;
                  });
                  widget.onItemSelected(category);
                },
                elevation: 0,
                color: isSelected ? selectedButtonColor : buttonColor,
                hoverColor: Colors.transparent,
                highlightColor: Colors.grey,
                splashColor: Colors.grey,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kRadius),
                  borderSide: BorderSide(
                    width: 0,
                    color: isSelected ? selectedButtonColor : buttonColor,
                  ),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? selectedTextColor : textColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
