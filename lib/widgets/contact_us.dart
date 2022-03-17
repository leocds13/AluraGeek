import 'dart:ui';

import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/widgets/squar_button.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF2FD),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 10),
                const _LinkButton(
                  text: "Quem somos nós",
                ),
                const _LinkButton(
                  text: "Política de Privacidade",
                ),
                const _LinkButton(
                  text: "Programa fidelidade",
                ),
                const _LinkButton(
                  text: "Nossas lojas",
                ),
                const _LinkButton(
                  text: "Quero ser franqueado",
                ),
                const _LinkButton(
                  text: "Anuncie aqui",
                ),
              ],
            ),
          ),
          Container(
            child: _ContactForm(),
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
        SquarButton(
          label: "Enviar mensagem",
          color: Palette.primaryBlue,
          onPressed: () {},
        )
      ],
    );
  }
}
