//import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//
//class PassaquiAppBar extends StatelessWidget implements PreferredSizeWidget {
//  final bool showBackButton;
//  final bool showLogo;
//
//  const PassaquiAppBar(
//      {this.showBackButton = false, this.showLogo = true, Key? key})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return AppBar(
//      key: key,
//      elevation: 0,
//      backgroundColor: Theme.of(context).primaryColor,
//      leading: showBackButton
//          ? IconButton(
//              icon: const Icon(Icons.arrow_back),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            )
//          : null,
//      title: showLogo
//          ? SvgPicture.asset(
//              "assets/images/logo_passaqui_hor_1.svg",
//              fit: BoxFit.contain,
//              height: 100,
//              width: 20,
//            )
//          : null,
//    );
//  }
//
//  @override
//  Size get preferredSize => const Size.fromHeight(56.0);
//}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class PassaquiAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool showBackButton;
//   final bool showLogo;
//
//   const PassaquiAppBar({
//     this.showBackButton = false,
//     this.showLogo = true,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       key: key,
//       elevation: 0,
//       backgroundColor: Theme.of(context).primaryColor,
//       automaticallyImplyLeading: showBackButton,
//       title: showLogo
//           ? Padding(
//               padding: const EdgeInsets.only(left: 1.0),
//               child: Image.asset(
//                 "assets/images/logo_passaqui_hor_1.png",
//                 fit: BoxFit.contain,
//                 height: 100,
//                 width: 90,
//               ),
//             )
//           : null,
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(56.0);
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class PassaquiAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool showBackButton;
//   final bool showLogo;
//   final String? title;
//
//   const PassaquiAppBar({
//     this.showBackButton = false,
//     this.showLogo = true,
//     this.title,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       key: key,
//       elevation: 0,
//       backgroundColor: Theme.of(context).primaryColor,
//       automaticallyImplyLeading: showBackButton,
//       title: Row(
//         children: [
//           if (showLogo)
//             Padding(
//               padding: const EdgeInsets.only(left: 1.0),
//               child: Image.asset(
//                 "assets/images/logo_passaqui_hor_1.png",
//                 fit: BoxFit.contain,
//                 height: 100,
//                 width: 90,
//               ),
//             ),
//           if (title != null) // If title is provided, show it
//             Expanded(
//               child: Text(
//                 title!,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(56.0);
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PassaquiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool showLogo;
  final String? title;
  final VoidCallback? onBackButtonPressed; // Add this line

  const PassaquiAppBar({
    this.showBackButton = false,
    this.showLogo = true,
    this.title,
    this.onBackButtonPressed, // Add this line
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: false, // Set this to false to use custom leading
      leading: showBackButton
          ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBackButtonPressed ?? () { // Add this line
          Navigator.of(context).pop(); // Default action if callback is not provided
        },
      )
          : null,
      title: Row(
        children: [
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Image.asset(
                "assets/images/logo_passaqui_hor_1.png",
                fit: BoxFit.contain,
                height: 100,
                width: 90,
              ),
            ),
          if (title != null) // If title is provided, show it
            Expanded(
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
