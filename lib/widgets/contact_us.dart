import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/config/responsive.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF2FD),
      padding: EdgeInsets.symmetric(
        horizontal: Palette.screenPaddingHorizontal(context),
        vertical: Responsive.isMobile(context: context) ? 12 : 20,
      ),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            md: 6,
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 6,
                  child: SizedBox(
                    height: Responsive.isMobile(context: context) ? 44 : 52,
                    child: Image.asset(
                      "assets/images/logo.png",
                      alignment: Responsive.isMobile(context: context)
                          ? Alignment.center
                          : Alignment.centerLeft,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 6,
                  child: Column(
                    crossAxisAlignment: Responsive.isMobile(context: context)
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: const [
                      _LinkButton(
                        text: "Quem somos nós",
                      ),
                      _LinkButton(
                        text: "Política de privacidade",
                      ),
                      _LinkButton(
                        text: "Programa fidelidade",
                      ),
                      _LinkButton(
                        text: "Nossas lojas",
                      ),
                      _LinkButton(
                        text: "Quero ser franqueado",
                      ),
                      _LinkButton(
                        text: "Anuncie aqui",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ResponsiveGridCol(
            md: 6,
            child: const _ContactForm(),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final String text;

  const _LinkButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(text),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF464646),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Fale conosco",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(height: 8),
        Column(
          children: const [
            CustomTextField(
              keyboardType: TextInputType.text,
              labelText: "Nome",
            ),
            SizedBox(height: 16),
            CustomTextField(
              keyboardType: TextInputType.multiline,
              labelText: "Escreva sua mensagem",
              minLines: 2,
            ),
          ],
        ),
        const SizedBox(height: 10),
        SquareButton(
          label: "Enviar mensagem",
          color: Palette.primaryBlue,
          onPressed: () {},
        )
      ],
    );
  }
}
