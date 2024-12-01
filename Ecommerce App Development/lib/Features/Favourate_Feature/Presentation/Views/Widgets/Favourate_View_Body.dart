import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentation/Manager/Favourate_View_Cubit/favourate_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Favourate_Feature/Presentation/Views/Widgets/Favourate_View_product_Item.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/No_Thing_Found.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FavourateViewBody extends StatelessWidget {
  const FavourateViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavourateViewCubit, FavourateViewState>(
      builder: (context, state) {
        if (state is FavourateViewLoading) {
          return const Center(child: CircularProgressIndicator(color: kPrimaryColor));
        } else if (state is FavourateViewEmpty) {
          return const NoThingFound(text: 'No favouraties added');
        } else if (state is FavourateViewFailed) {
          return NoThingFound(text: state.errMessage);
        } else {
          return SafeArea(
            child: Expanded(
              child: ListView.separated(
                itemCount: BlocProvider.of<FavourateViewCubit>(context).favourateProdcts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 15),
                    child: FavourateViewProductItem(product: BlocProvider.of<FavourateViewCubit>(context).favourateProdcts[index]),
                  );
                },
                separatorBuilder: (BuildContext contextm, int index) {
                  return Divider(color: Colors.grey.withOpacity(.2), height: 1);
                },
              ),
            ),
          );
        }
      },
    );
  }
}
