import 'package:flutter/material.dart';

class FootNote extends StatelessWidget {
  const FootNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 63),
      child: Text(
        "Desenvolvido por Leonardo Cabral dos Santos - 2022",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
