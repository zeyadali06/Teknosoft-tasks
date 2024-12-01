// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Common_Widgets/No_Thing_Found.dart';
import 'package:e_commerce_app_development/Features/Address_Feature/Presentation/Manager/Address_View_Cubit/address_view_cubit.dart';
import 'package:e_commerce_app_development/Features/Address_Feature/Presentation/Views/Widgets/Address_Container.dart';
import 'package:e_commerce_app_development/Features/Address_Feature/Presentation/Views/Widgets/Address_View_Body.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  void initState() {
    BlocProvider.of<AddressViewCubit>(context).getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: BlocBuilder<AddressViewCubit, AddressViewState>(
            builder: (context, state) {
              if (BlocProvider.of<AddressViewCubit>(context).allAddresses.isNotEmpty) {
                return ListView(
                  children: [
                    const SizedBox(height: 20),
                    Text('Currently Used Address', style: Styles.black18w500(context), textAlign: TextAlign.center),
                    AddressContainer(address: BlocProvider.of<AddressViewCubit>(context).allAddresses[0], isDefault: true),
                    if (BlocProvider.of<AddressViewCubit>(context).allAddresses.length > 1) const SizedBox(height: 20),
                    if (BlocProvider.of<AddressViewCubit>(context).allAddresses.length > 1) Text('Other Addresses', style: Styles.black18w500(context), textAlign: TextAlign.center),
                    if (BlocProvider.of<AddressViewCubit>(context).allAddresses.length > 1)
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: BlocProvider.of<AddressViewCubit>(context).allAddresses.length - 1,
                          itemBuilder: (BuildContext context, int index) {
                            return AddressContainer(
                              address: BlocProvider.of<AddressViewCubit>(context).allAddresses[index + 1],
                              isDefault: false,
                            );
                          },
                        ),
                      ),
                  ],
                );
              } else {
                return const NoThingFound();
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Your Addresses", style: Styles.black21w500(context)),
        centerTitle: true,
      ),
      body: const AddressViewBody(),
    );
  }
}
