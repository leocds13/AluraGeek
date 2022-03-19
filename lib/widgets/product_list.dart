import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/config/responsive.dart';
import 'package:alura_geek/entities/entities.dart';
import 'package:alura_geek/screens/screens.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final String category;
  final bool showFullList;

  const ProductList({
    Key? key,
    required this.products,
    this.category = 'Todos os produtos',
    this.showFullList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = showFullList
        ? this.products
        : Responsive.isDescktop(context: context)
            ? this.products.getRange(0, 6).toList()
            : this.products.getRange(0, 4).toList();

    return Container(
      color: Colors.white70,
      padding: EdgeInsets.symmetric(
        horizontal: Palette.screenPaddingHorizontal(context),
        vertical: Palette.screenPaddingVertical(context),
      ),
      child: Column(
        children: [
          _Topo(category: category),
          ResponsiveGridRow(
            children: products.map((e) {
              return ResponsiveGridCol(
                lg: 2,
                md: 3,
                xs: 6,
                child: _ProdCard(
                  product: e,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductScreen(
                          product: e,
                        );
                      },
                    ));
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _Topo extends StatelessWidget {
  final String category;

  const _Topo({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: TextStyle(
            fontFamily: Palette.primaryFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: !Responsive.isDescktop(context: context) ? 22 : 32,
          ),
        ),
        category == 'Todos os produtos'
            ? SquareButton(
                label: "Adicionar produto",
                color: Palette.primaryBlue,
                onPressed: () {},
              )
            : TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      "Ver tudo",
                      style: TextStyle(
                          fontFamily: Palette.primaryFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward_outlined)
                  ],
                )),
      ],
    );
  }
}

class _ProdCard extends StatelessWidget {
  final Product product;
  final void Function() onPressed;

  const _ProdCard({
    Key? key,
    required this.product,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.white70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: SizedBox(
              height: 174,
              width: double.infinity,
              child: Image(
                image: product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text("Ver produto"),
          ),
        ],
      ),
    );
  }
}
