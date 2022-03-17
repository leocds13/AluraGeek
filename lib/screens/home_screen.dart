import 'package:alura_geek/data/mock_data.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<List> productsContainers = [
    ["Star War", productsList],
    ["Consoles", productsList],
    ["Diversos", productsList],
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            title: CustomAppBar(disableLogoGesture: true),
          ),
          const SliverToBoxAdapter(
            child: CustomBanner(
              title: "Dezembro Promocional",
              subTitle: "Produtos selecionados com 33% de desconto",
              buttonLabel: "Ver Consoles",
              image: AssetImage('assets/images/banner.jpg'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (cntx, index) {
                return ProductList(
                  products: productsContainers[index][1],
                  category: productsContainers[index][0],
                );
              },
              childCount: productsContainers.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: ContactUs(),
          ),
          const SliverToBoxAdapter(
            child: FootNote(),
          ),
        ],
      ),
    );
  }
}
