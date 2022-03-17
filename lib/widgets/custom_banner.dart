import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String subTitle;
  final String buttonLabel;
  final Function? onPressed;

  const CustomBanner({
    Key? key,
    required this.image,
    required this.title,
    this.subTitle = '',
    this.buttonLabel = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 192,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: image, fit: BoxFit.cover),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(gradient: Palette.bannerGradient),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: Palette.primaryFontFamily
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: Palette.primaryFontFamily
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                buttonLabel != ''
                    ? SquarButton(
                        label: buttonLabel,
                        color: Palette.primaryBlue,
                        onPressed: () {},
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
