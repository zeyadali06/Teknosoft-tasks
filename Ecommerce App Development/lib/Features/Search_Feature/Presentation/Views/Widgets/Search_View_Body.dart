// ignore_for_file: file_names

import 'package:e_commerce_app_development/Features/Search_Feature/Presentation/Manager/Search_View_Cubit.dart/search_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Shopping_Feature/Presentation/Views/Widgets/Shopping_View_Product_Item.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/No_Thing_Found.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchViewCubit, SearchViewState>(
      builder: (context, state) {
        if (state is SearchViewLoading) {
          return const Center(child: CircularProgressIndicator(color: kPrimaryColor));
        } else if (state is SearchViewFailed) {
          return NoThingFound(text: state.errMessage);
        } else {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kPadding, left: kPadding, right: kPadding),
                  child: TextField(
                    onChanged: (data) {
                      BlocProvider.of<SearchViewCubit>(context).search(data);
                    },
                    onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    style: const TextStyle(fontSize: 18),
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Search for anything',
                      hintStyle: TextStyle(color: kPrimaryColor),
                      fillColor: kPrimaryColor,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                const Divider(thickness: 2, color: kPrimaryColor, height: 1),
                if (state is SearchViewEmpty)
                  const NoThingFound(text: 'No Data Found...')
                else
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: BlocProvider.of<SearchViewCubit>(context).filteredProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: kPadding, right: index % 2 != 0 ? kPadding : 0, top: 10),
                          child: ShoppingViewProductItem(
                            product: BlocProvider.of<SearchViewCubit>(context).filteredProducts[index],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
