import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/config/responsive.dart';
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
    return SizedBox(
      height: Responsive.isMobile(context: context) ? 192 : 352,
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
            padding: EdgeInsets.symmetric(
              horizontal: Palette.screenPaddingHorizontal(context),
              vertical: Responsive.isMobile(context: context) ? 16 : 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: Responsive.isMobile(context: context) ? 26 : 52,
                    fontFamily: Palette.primaryFontFamily,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: Responsive.isMobile(context: context)
                        ? FontWeight.w600
                        : FontWeight.w700,
                    fontSize: Responsive.isMobile(context: context) ? 16 : 22,
                    fontFamily: Palette.primaryFontFamily,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                buttonLabel != ''
                    ? SquareButton(
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
