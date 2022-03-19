import 'package:alura_geek/config/palette.dart';
import 'package:alura_geek/config/responsive.dart';
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
          CustomAppBar.sliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                Responsive.isMobile(context: context)
                    ? 0
                    : Palette.screenPaddingHorizontal(context),
                Responsive.isMobile(context: context)
                    ? 0
                    : Palette.screenPaddingVertical(context),
                Responsive.isMobile(context: context)
                    ? 0
                    : Palette.screenPaddingHorizontal(context),
                0
              ),
              child: ResponsiveGridRow(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ResponsiveGridCol(
                    xs: 12,
                    md: 6,
                    lg: 6,
                    child: Image(
                      image: product.image,
                      fit: BoxFit.cover,
                      height: Responsive.isMobile(context: context)
                          ? 232
                          : Responsive.isTablet(context: context)
                              ? null
                              : 403,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ProductList(
              products: productsList,
              category: "Produtos similares",
              showFullList: false,
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
