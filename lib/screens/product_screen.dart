import 'package:alura_geek/data/mock_data.dart';
import 'package:alura_geek/entities/entities.dart';
import 'package:alura_geek/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            floating: true,
            title: CustomAppBar(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0,
              ),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 12,
                    md: 6,
                    lg: 6,
                    child: Image(
                      image: product.image,
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 12,
                    md: 6,
                    lg: 6,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'R\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.description,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    child: ProductList(
                      products: productsList,
                      category: "Produtos similares",
                      showFullList: false,
                    ),
                  ),
                  ResponsiveGridCol(
                    child: const ContactUs(),
                  ),
                  ResponsiveGridCol(
                    child: const FootNote(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
