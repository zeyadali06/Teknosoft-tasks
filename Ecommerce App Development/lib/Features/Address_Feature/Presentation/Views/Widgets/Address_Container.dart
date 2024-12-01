// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Features/Address_Feature/Data/Models/Address_Model_Data.dart';
import 'package:e_commerce_app_development/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Address_Feature/Presentation/Manager/Address_View_Cubit/address_view_cubit.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key, required this.address, required this.isDefault});

  final Address address;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(address.country, style: Styles.black18w500(context)),
          Text(address.street, style: Styles.black18w500(context)),
          Text(address.buildNumber, style: Styles.black18w500(context)),
          Text(address.city, style: Styles.black18w500(context)),
          Text(address.phone, style: Styles.black18w500(context)),
          Text(address.district, style: Styles.black18w500(context)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () async {
                    await waitUntilFinished(context, () async => await BlocProvider.of<AddressViewCubit>(context).removeAddress(address));
                  },
                  buttonText: "Remove",
                ),
              ),
              if (!isDefault) const SizedBox(width: 10),
              if (!isDefault)
                Expanded(
                  child: CustomButton(
                    onPressed: () async {
                      await waitUntilFinished(context, () async => await BlocProvider.of<AddressViewCubit>(context).makeDefault(address));
                    },
                    buttonText: "Make Default",
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
