import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/config/responsive.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Palette.screenPaddingHorizontal(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                ),
                onTap: () {
                  if (!disableLogoGesture) {
                    Navigator.pop(context);
                  }
                },
              ),
              if (!Responsive.isMobile(context: context))
                const SizedBox(width: 16),
              if (!Responsive.isMobile(context: context)) const _SearchField(),
            ],
          ),
          SquareButton(
            label: "Login",
            color: Palette.primaryBlue,
            secondary: true,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ));
            },
          ),
          if (Responsive.isMobile(context: context))
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MobileSearchBar(),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 30,
                color: Palette.black,
              ),
            ),
        ],
      ),
    );
  }

  static Widget sliverAppBar({
    bool disableLogoGesture = false,
  }) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      floating: true,
      toolbarHeight: 72,
      title: CustomAppBar(
        disableLogoGesture: disableLogoGesture,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(40),
      ),
      child: Container(
        width: Responsive.isDescktop(context: context) ? 353 : 272,
        height: 40,
        color: const Color(0xFFF5F5F5),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: SearchField(
                hintText: "O que deseja encontrar?",
                onSearched: () {},
                items: const [
                  "Teste1",
                  "Teste2",
                  "Teste3",
                  "Teste4",
                  "Teste5",
                ],
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                  color: Colors.black,
                  hoverColor: Palette.primaryBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
