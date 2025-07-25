import 'package:ecommerceapp/config/routes/router.gr.dart';
import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:ecommerceapp/features/home/presentation/widgets/productDetailModal.dart';
import 'package:ecommerceapp/features/home/presentation/widgets/showSlideDialog.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.7,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onPress: () {
            showFullScreenSlideFromRightDialog(
              context,
              ProductDetailModal(product: products[index]),
            );
          },
          // onPress: () {
          //   context.pushRoute(ProductDetailRoute(id: products[index].id));
          // },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final ProductEntity product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                clipBehavior: Clip.hardEdge,
                // padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                // child: Image.network(
                //   'https://florify-backend.vercel.app/api/media?file_id=' +
                //       product.images[0],
                //   fit: BoxFit.cover,
                // ),
                child: Image.network(
                  'https://florify-backend.vercel.app/api/media?file_id=${product.images[0]}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}