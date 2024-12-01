import 'package:e_commerce_app/Features/Address_Feature/Presentation/Manager/Address_View_Cubit/address_view_cubit.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Presentation/Views/Widgets/Custom_Text_Form_Field.dart';
import 'package:e_commerce_app/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app/Features/Address_Feature/Data/Models/Address_Model_Data.dart';
import 'package:e_commerce_app/Core/Common_Widgets/Custom_Phone_Text_Form_Field.dart';
import 'package:e_commerce_app/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app/Core/Common_Widgets/Custom_Button.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key});

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> keyForm = GlobalKey();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    countryController.dispose();
    streetController.dispose();
    buildNumberController.dispose();
    cityController.dispose();
    districtController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 20,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(kPadding),
        child: Form(
          key: keyForm,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(hintText: "Country", label: "Country", controller: countryController),
              const SizedBox(height: 10),
              CustomTextFormField(hintText: "Street", label: "Street", controller: streetController),
              const SizedBox(height: 10),
              CustomTextFormField(hintText: "Build Number", label: "Build Number", controller: buildNumberController),
              const SizedBox(height: 10),
              CustomTextFormField(hintText: "City", label: "City", controller: cityController),
              const SizedBox(height: 10),
              CustomTextFormField(hintText: "District", label: "District", controller: districtController),
              const SizedBox(height: 10),
              CustomPhoneTextField(controller: phoneController),
              const SizedBox(height: 10),
              CustomButton(onPressed: onPressed, buttonText: "Add Address")
            ],
          ),
        ),
      ),
    );
  }

  Future<void>? onPressed() async {
    if (keyForm.currentState!.validate()) {
      Address address = Address(
        uid: AuthRepoImplementation.allUserData!.uid,
        phone: phoneController.text,
        country: countryController.text,
        street: streetController.text,
        buildNumber: buildNumberController.text,
        city: cityController.text,
        district: districtController.text,
      );
      await waitUntilFinished(context, () async => await BlocProvider.of<AddressViewCubit>(context).addAddress(address));
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
