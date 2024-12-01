# Ecommerce App 🛒

Shop smarter and faster with this feature-rich E-Commerce app. Designed for a seamless shopping experience, users can browse products, apply filters, and use search functionalities to find exactly what they need. The app includes secure user authentication, allowing customers to register, log in, and manage their accounts effortlessly. With an intuitive interface and smooth navigation, users can explore various categories, view product details, and complete purchases in just a few clicks.

## Table of Contents 📑

- ### [Main Packages Used =>](#main-packages-used)
- ### [Architecture =>](#architecture)
- ### [Folder Structure =>](#folder-structure)
- ### [Screen Shots =>](#screen-shots)
- ### [Video Link =>](#video-link)
- ### [Apk Link =>](#apk-link)

## Main Packages Used 🛠

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) -> as state management
- [lottie](https://pub.dev/packages/lottie) -> to add animations
- [cached_network_image](https://pub.dev/packages/cached_network_image) -> to show the image and store it
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) -> to check the internet connection
- [firebase_core](https://pub.dev/packages/firebase_core) -> the main package of firebase
- [firebase_auth](https://pub.dev/packages/firebase_auth) -> to use firebase authentication
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) -> to use cloud firestore
- [firebase_storage](https://pub.dev/packages/firebase_storage) -> to upload and download files
- [google_sign_in](https://pub.dev/packages/google_sign_in) -> to handle localization
- [shared_preferences](https://pub.dev/packages/shared_preferences) -> to handle caching data
- [dio](https://pub.dev/packages/dio) -> to integrate with APIs
- [image_picker](https://pub.dev/packages/image_picker) -> to pick image from mobile storage
- [dartz](https://pub.dev/packages/dartz) -> to seperate the return status of any function (Success or Failure)
- [path](https://pub.dev/packages/path) -> to manage directories' paths

## Architecture ⚙

This app follows **Clean Architecture**, ensuring a separation of concerns and making the codebase more modular and testable.

## Folder Structure 📂

Here is the folder structure we have been using in this project:

```
lib
├── Core
├── Features
├── constants.dart
├── firebase_options.dart
├── main.dart
└── Navigation_Bar.dart
```

### Core

This folder contains all services and tools related to the application

```
Core
├── Common_Widgets
├── Error
└── Utils
```

### Features

This folder containes everything related to the screen of the application and the business logic of the application specificly state management.

```
Features
├── Address_Feature
├── Authentication_Feature
├── Cart_Feature
├── Favourate_Feature
├── Product_Details_Feature
├── Profile_Settings_Feature
├── Search_Feature
├── Shopping_Feature
└── Splash_Feature
```

## Screen Shots 📸

<img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093463.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093473.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093475.png" width="300">

<img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093735.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093746.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093752.png" width="300">

<img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093755.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093775.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093778.png" width="300">

<img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093781.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733093862.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733094053.png" width="300">

<img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733095252.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733095331.png" width="300"> <img src="https://github.com/zeyadali06/Teknosoft-tasks/blob/main/Ecommerce%20App/ScreenShots/Screenshot_1733095294.png" width="300">


# [Video Link](https://www.linkedin.com/posts/zeyadali06_flutter-firebase-teknosoft-activity-7204570243657043968-61iO?utm_source=share&utm_medium=member_desktop)

# [Apk Link](https://drive.google.com/file/d/126hNXNuG3WxYgK_0Sy3OlSwqi92_I8dD/view?usp=sharing)
