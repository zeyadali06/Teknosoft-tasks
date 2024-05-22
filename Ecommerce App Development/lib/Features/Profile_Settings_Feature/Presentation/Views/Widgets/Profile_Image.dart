// ignore_for_file: file_names

import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/Features/Authentication_Feature/Data/Repos/Auth_Repo_Implement.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/profile-user.png"),
              backgroundColor: Colors.white,
            ),
            // Positioned(
            //   bottom: 3,
            //   right: 5,
            //   child: Container(
            //     width: 40,
            //     height: 40,
            //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.deepPurple[100]),
            //     child: IconButton(
            //       onPressed: () {},
            //       icon: const Icon(Icons.edit),
            //       color: Colors.indigo[600],
            //       iconSize: 20,
            //     ),
            //   ),
            // )
          ],
        ),
        const SizedBox(height: 15),
        Text(AuthRepoImplementation.allUserData!.username, style: Styles.black18w500),
        const SizedBox(height: 6),
        Text(AuthRepoImplementation.allUserData!.email, style: Styles.black18w500),
      ],
    );
  }
}
