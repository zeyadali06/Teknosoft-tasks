// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsBar extends StatefulWidget {
  const BrandsBar({super.key, required this.brands, required this.onItemSelected});

  final List<String> brands;
  final void Function(String brandSelected) onItemSelected;

  @override
  State<BrandsBar> createState() => _BrandsBarState();
}

class _BrandsBarState extends State<BrandsBar> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.grey.withOpacity(.3);
    Color textColor = Colors.black.withOpacity(.5);
    Color selectedButtonColor = Colors.yellow;
    Color selectedTextColor = Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.brands.length,
          itemBuilder: (BuildContext context, int index) {
            String brand = widget.brands[index];
            bool isSelected = brand == BlocProvider.of<ShoppingViewCubit>(context).selectedBrand;
            return Padding(
              padding: EdgeInsets.only(
                left: (index == 0) ? kPadding : kPadding / 2,
                right: (index == widget.brands.length - 1) ? kPadding : 0,
              ),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    BlocProvider.of<ShoppingViewCubit>(context).selectedBrand = brand;
                  });
                  widget.onItemSelected(brand);
                },
                elevation: 0,
                color: isSelected ? selectedButtonColor : buttonColor,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kRadius),
                  borderSide: BorderSide(
                    width: 0,
                    color: isSelected ? selectedButtonColor : buttonColor,
                  ),
                ),
                child: Text(
                  brand,
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
