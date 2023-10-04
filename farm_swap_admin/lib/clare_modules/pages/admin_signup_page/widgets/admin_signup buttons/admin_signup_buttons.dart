import 'package:flutter/material.dart';

class FarmSwapPrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPress;

  const FarmSwapPrimaryButton({
    super.key,
    required this.buttonTitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(157, 57),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.99, -0.15),
            end: Alignment(-0.99, 0.15),
            colors: [Color(0xFF14BE77), Color(0xFF53E78B)],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            buttonTitle, // Replace 'Button Text' with the text you want to display
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
