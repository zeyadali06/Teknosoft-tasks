import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Manager/Shopping_View_Cubit.dart/shopping_view_cubit.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Product_Item.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Views/Widgets/Specified_Category_Products.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Image.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Views/Widgets/Section_Title.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Presentation/Views/Widgets/Categories_Bar.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/Core/Utils/Functions/SnackBar.dart';
import 'package:e_commerce_app/Core/Utils/Styles.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ShoppingViewBody extends StatefulWidget {
  const ShoppingViewBody({super.key});

  @override
  State<ShoppingViewBody> createState() => _ShoppingViewBodyState();
}

class _ShoppingViewBodyState extends State<ShoppingViewBody> {
  late List<ProductModel> products;
  late List<String> categories;
  late List<ProductModel> specificCategoryProducts;
  late List<ProductModel> allProducts;

  @override
  void initState() {
    allProducts = BlocProvider.of<ShoppingViewCubit>(context).repo.allProducts;
    products = BlocProvider.of<ShoppingViewCubit>(context).repo.avaliableProducts;
    categories = BlocProvider.of<ShoppingViewCubit>(context).repo.allCategories;
    specificCategoryProducts = BlocProvider.of<ShoppingViewCubit>(context).repo.specificCategoryProducts;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingViewCubit, ShoppingViewState>(
      listener: (context, state) {
        if (state is ShoppingViewFailed) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text('Shopping', style: Styles.black21w500(context)),
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
                const TitleRow(text: 'Categories'),
                CategoriesBar(
                  categories: categories,
                  onItemSelected: (categorySelected) async {
                    specificCategoryProducts = BlocProvider.of<ShoppingViewCubit>(context).getSpecificCategoryProducts(allProducts, categorySelected);
                  },
                ),
                SpecifiedCategoryProducts(specificCategoryProducts: specificCategoryProducts),
              ],
            ),
          ),
        );
      },
    );
  }
}
