// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.url, this.boxFit});

  final String url;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: kPrimaryColor)),
      errorWidget: (context, url, error) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.sim_card_alert_outlined),
        );
      },
    );
  }
}
