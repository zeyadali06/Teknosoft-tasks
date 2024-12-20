import 'package:e_commerce_app/Core/Common_Widgets/Product_Image.dart';
import 'package:e_commerce_app/Features/Shopping_Feature/Data/Models/Product_Model.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class ImagesBar extends StatelessWidget {
  const ImagesBar({super.key, required this.product, required this.onImageSelected, required this.selecetdIndex});

  final ProductModel product;
  final int selecetdIndex;
  final void Function(int imageIndex) onImageSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding),
      child: SizedBox(
        height: 75,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product.images.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            try {
              return Padding(
                padding: EdgeInsets.only(left: kPadding, right: (index == 4) ? kPadding : 0),
                child: GestureDetector(
                  onTap: () {
                    onImageSelected(index);
                  },
                  child: CircleAvatar(
                    radius: 36,
                    backgroundColor: index == selecetdIndex ? kPrimaryColor : Colors.white,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xfff6f6f6),
                        radius: 34,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: ProductImage(
                            url: product.images[index],
                            boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } catch (_) {
              return const Icon(Icons.sim_card_alert_outlined);
            }
          },
        ),
      ),
    );
  }
}
