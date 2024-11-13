  import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

void buildErroMessage(BuildContext context,  String message) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TColors.error,
        content: Text(message),
      ),
    );
  }
