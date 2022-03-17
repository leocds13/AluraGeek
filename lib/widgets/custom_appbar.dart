import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/screens/screens.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool disableLogoGesture;

  const CustomAppBar({
    Key? key,
    this.disableLogoGesture = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Image.asset(
              "assets/images/logo.png",
              width: 150,
            ),
            onTap: () {
              if(!disableLogoGesture) {
                Navigator.pop(context);
              }
            },
          ),
          SquarButton(
            label: "Login",
            color: Palette.primaryBlue,
            secundary: true,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ));
            },
          ),
          const Icon(
            Icons.search_rounded,
            size: 30,
            color: Palette.black,
          ),
        ],
      ),
    );
  }
}
