import 'package:e_commerce_app_development/Features/Profile_Settings_Feature/Presentation/Manager/Profile_Image_Cubit/profile_image_cubit.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:e_commerce_app_development/Core/Utils/Functions/Loading_Indicator.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileImageCubit, ProfileImageState>(
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.network(
                    BlocProvider.of<ProfileImageCubit>(context).url,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Image.asset("assets/images/profile-user.png"),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: kPrimaryColor,
                    child: IconButton(
                      onPressed: () async {
                        await waitUntilFinished(context, () async => await BlocProvider.of<ProfileImageCubit>(context).pickImage());
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.edit),
                      color: Colors.black,
                      iconSize: 20,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: kPrimaryColor,
                    child: IconButton(
                      onPressed: () async {
                        await waitUntilFinished(context, () async => await BlocProvider.of<ProfileImageCubit>(context).deleteImage());
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.clear),
                      color: Colors.black,
                      iconSize: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(AuthRepoImplementation.allUserData!.username, style: Styles.black18w500(context)),
            const SizedBox(height: 6),
            Text(AuthRepoImplementation.allUserData!.email, style: Styles.black18w500(context)),
          ],
        );
      },
    );
  }
}
