import 'package:ecommerceapp/features/home/domain/entities/home_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailModal extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailModal({super.key, required this.product});

  @override
  State<ProductDetailModal> createState() => _ProductDetailModalState();
}

class _ProductDetailModalState extends State<ProductDetailModal>
    with SingleTickerProviderStateMixin {
  int selectedImageIndex = 0;
  late final PageController _pageController;
  late final AnimationController _scaleAnimationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: selectedImageIndex,
      viewportFraction: 1.0, // Adjusted for visible side images and gaps
    );
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
          parent: _scaleAnimationController, curve: Curves.easeInOutCubic),
    );
    _scaleAnimationController.forward(); // Start animation on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(selectedImageIndex);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.product.images;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the modal
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: images.isEmpty
                            ? const Center(child: Text('No images available'))
                            : PageView.builder(
                                controller: _pageController,
                                itemCount: images.length,
                                physics: const BouncingScrollPhysics(),
                                onPageChanged: (index) {
                                  setState(() {
                                    selectedImageIndex = index;
                                    _scaleAnimationController.reset();
                                    _scaleAnimationController.forward();
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: AnimatedBuilder(
                                      animation: Listenable.merge(
                                          [_pageController, _scaleAnimation]),
                                      builder: (context, child) {
                                        double scale = 1.0;
                                        if (_pageController
                                            .position.hasContentDimensions) {
                                          final double page =
                                              _pageController.page ??
                                                  index.toDouble();
                                          final double delta =
                                              (page - index).abs();
                                          // Scale based on page position during scroll
                                          scale = index == selectedImageIndex &&
                                                  delta < 0.5
                                              ? _scaleAnimation.value
                                              : 1.0 -
                                                  (delta * 0.2).clamp(0.0, 0.2);
                                        } else if (index ==
                                            selectedImageIndex) {
                                          scale = _scaleAnimation.value;
                                        }
                                        return Transform.scale(
                                          scale: scale.clamp(0.8, 1.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.network(
                                              'https://florify-backend.vercel.app/api/media?file_id=${images[index]}',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Center(
                                                    child: Text(
                                                        'Image failed to load'));
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            final img = images[index];
                            final isSelected = selectedImageIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedImageIndex = index;
                                  _scaleAnimationController.reset();
                                  _scaleAnimationController.forward();
                                });
                                _pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCubic,
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: const EdgeInsets.only(right: 12),
                                padding: isSelected
                                    ? const EdgeInsets.all(4)
                                    : EdgeInsets.zero,
                                transform: Matrix4.identity()
                                  ..scale(isSelected ? 1.1 : 1.0),
                                transformAlignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: isSelected
                                      ? Border.all(
                                          color: Colors.purple, width: 2)
                                      : null,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color:
                                                Colors.purple.withOpacity(0.3),
                                            blurRadius: 8,
                                            spreadRadius: 2,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://florify-backend.vercel.app/api/media?file_id=$img',
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Center(child: Text('Error')),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: selectedImageIndex == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: selectedImageIndex == index
                                  ? Colors.purple
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bukletlar',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.product.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const Icon(Icons.star_half,
                              color: Colors.orange, size: 20),
                          const SizedBox(width: 8),
                          Text('4.9 (44 baho)',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            "\$${widget.product.price}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7A1AF7),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            "\$30.0",
                            style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                        "Lorem Ipsum has been the industry's standard dummy text ever since.",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: const [
                          Icon(Icons.phone_outlined,
                              size: 20, color: Colors.black87),
                          SizedBox(width: 8),
                          Text('+998991422303'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Icon(Icons.phone_outlined,
                              size: 20, color: Colors.black87),
                          SizedBox(width: 8),
                          Text('+998991422303'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
