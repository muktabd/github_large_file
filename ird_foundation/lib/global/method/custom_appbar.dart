// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../constants/color_resources.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool automaticallyImplyLeading;
//   final bool? centerTitle;
//   final String? titleText;
//   final Widget? leading;
//   final List<Widget>? actionWidget;
//
//   const CustomAppBar({
//     super.key,
//     this.automaticallyImplyLeading = true,
//     this.centerTitle,
//     this.titleText,
//     this.leading,
//     this.actionWidget,
//   });
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: ColorRes.lightBlueAccent,
//       automaticallyImplyLeading: automaticallyImplyLeading,
//       centerTitle: centerTitle ?? false,
//       elevation: 0,
//       leading: leading != null ?
//       IconButton(
//         splashRadius: 0.1,
//         onPressed: () {
//           Get.back();
//         },
//         icon: const Icon(
//           Icons.arrow_back_ios,
//           color: ColorRes.white,
//         )) : leading,
//       title: Text(titleText ?? ""),
//       actions: actionWidget,
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.elevation = 2.0,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 2.5,
            // stops: [
            //   0.0,
            //   0.27,
            //   1.0,
            // ],
            colors: [
              Color(0xFF1AA483),
              Color(0xFF0E8468),
              Color(0xFF2BB997),
            ],
          ),
        ),
        child: AppBar(
          centerTitle: true,
          leading: leading,
          elevation: 0.0,
          title: title,
          backgroundColor: Colors.transparent,
          actions: actions,
        ),
      ),
    );
  }
}