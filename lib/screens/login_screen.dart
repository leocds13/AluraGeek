import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            floating: true,
            title: CustomAppBar(),
          ),
          SliverToBoxAdapter(child: _LoginForm()),
          SliverToBoxAdapter(
            child: ContactUs(),
          ),
          SliverToBoxAdapter(
            child: FootNote(),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.offsetWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Iniciar sessão",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              keyboardType: TextInputType.emailAddress,
              labelText: "Escreva seu email",
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              keyboardType: TextInputType.emailAddress,
              labelText: "Escreva seu email",
            ),
            const SizedBox(height: 20),
            SquarButton(
              label: "Entrar",
              color: Palette.primaryBlue,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}