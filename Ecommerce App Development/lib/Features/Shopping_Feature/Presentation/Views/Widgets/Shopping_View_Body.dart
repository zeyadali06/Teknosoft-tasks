// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Brands_Bar.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Product_Item.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Section_Title.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Image.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Specified_Brand_Products.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ShoppingViewBody extends StatefulWidget {
  const ShoppingViewBody({super.key});

  @override
  State<ShoppingViewBody> createState() => _ShoppingViewBodyState();
}

class _ShoppingViewBodyState extends State<ShoppingViewBody> {
  late List<ProductModel> products;
  late List<String> brands;
  late List<ProductModel> specificBrandProducts;
  bool isLoading = false;

  @override
  void initState() {
    products = BlocProvider.of<ShoppingViewCubit>(context).avaliableProducts;
    brands = BlocProvider.of<ShoppingViewCubit>(context).allBrands;
    specificBrandProducts = BlocProvider.of<ShoppingViewCubit>(context).specificBrandProducts;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingViewCubit, ShoppingViewState>(
      listener: (context, state) {
        if (state is ShoppingViewSpecificLoading || state is ShoppingViewProductGettedLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text('Shopping', style: Styles.black21w500),
                  const SizedBox(height: 30),
                  const ShoppingViewImage(),
                  const TitleRow(text: 'Available'),
                  SizedBox(
                    height: 175,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: kPadding, right: (index == 4) ? kPadding : 0),
                          child: ShoppingViewProductItem(
                            product: products[index],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  const TitleRow(text: 'Brands'),
                  BrandsBar(
                    brands: brands,
                    onItemSelected: (brandSelected) async {
                      specificBrandProducts = await BlocProvider.of<ShoppingViewCubit>(context).getSpecificBrandProducts(brandSelected);
                    },
                  ),
                  SpecifiedBrandProducts(specificBrandProducts: specificBrandProducts),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
