import 'package:ecommerceapp/core/resources/app_colors.dart';
import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:ecommerceapp/features/home/presentation/widgets/productDetailModal.dart';
import 'package:ecommerceapp/features/home/presentation/widgets/showSlideDialog.dart';
import 'package:flutter/material.dart';

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
          childAspectRatio: 0.59,
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
    this.aspectRetio = 3.0,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final ProductEntity product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.c_89)),
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                clipBehavior: Clip.hardEdge,
                // padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(color: AppColors.c_5c, fontSize: 12),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
