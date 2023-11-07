import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/Colors/farmswap_colors.dart';
import 'package:flutter/material.dart';
import '../../../../constants/Colors/colors.dart';

// ignore: must_be_immutable
class WalletTextField extends StatelessWidget {
  WalletTextField({
    Key? key,
    required this.controller,
    required this.enabled,
    this.label,
    this.prefixIcon,
  }) : super(key: key);

  TextEditingController controller;
  Widget? label;
  final bool enabled;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: greenLightActive,
        ),
      ),
      child: SizedBox(
        width: 150, // Set the desired width
        child: SizedBox(
          height: 40, // Set the desired height
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabled: enabled,
              label: label,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: farmSwapSmoothGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: farmSwapSmoothGreen),
              ),
            ),
            cursorColor: FarmSwapGreen.normalGreen,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
