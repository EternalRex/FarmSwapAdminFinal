import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionTextField extends StatefulWidget {
  const TransactionTextField({super.key});

  @override
  State<TransactionTextField> createState() => _TransactionTextFieldState();
}

class _TransactionTextFieldState extends State<TransactionTextField> {
  bool? viewPassword = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 267,
      height: 44,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/clare_assets/images/search.png'),
              ),
            ),
          ),
          labelText: 'Search',
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0.50,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
