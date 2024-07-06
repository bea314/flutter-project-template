import 'package:flutter/material.dart';

import '../../../../../../core/styles.dart';

class LoginInfoFooter extends StatelessWidget {
  const LoginInfoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: SystemColors.grey80,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          SizedBox(width: 10),
          Icon(
            Icons.info_outline,
            color: SystemColors.whiteColor,
          ),
          SizedBox(width: 10),
          Text(
            "No compartir información personal",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              color: SystemColors.whiteColor,
              fontFamily: SystemFonts.paragraphFont,
            ),
          )
        ],
      ),
    );
  }
}