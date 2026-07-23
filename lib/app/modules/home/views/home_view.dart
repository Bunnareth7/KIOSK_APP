import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  static void open() => Get.toNamed(Routes.HOME);

  final List<_Category> _categories = const [
    _Category('Best Sellers', 'assets/icons/IconKio-6.svg'),
    _Category('Promotion', 'assets/icons/IconKio-5.svg'),
    _Category('Member Benefits', 'assets/icons/IconKio-5.svg'),
    _Category('Tea Set', 'assets/icons/IconKio-5.svg'),
    _Category('Chewy Tea', 'assets/icons/IconKio-5.svg'),
    _Category('Milk Tea', 'assets/icons/IconKio-5.svg'),
    _Category('Signature Tea & Juice', 'assets/icons/IconKio-5.svg'),
    _Category('Flavored Tea & Juice', 'assets/icons/IconKio-5.svg'),
    _Category('Merchandise', 'assets/icons/IconKio-5.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: _buildSidebar(),
                      ),
                      Expanded(child: _buildProductGrid()),
                    ],
                  ),
                ),
              ],
            ),

            // Floating cart bar
            // Positioned(left: 16, right: 16, bottom: 12, child: _buildCartBar()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
          const Spacer(),
          SvgPicture.asset('assets/icons/Profile.svg', width: 20, height: 20),
          const SizedBox(width: 6),
          const Text('Member'),
          const SizedBox(width: 20),
          SvgPicture.asset(
            'assets/icons/ActionIcon.svg',
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 6),
          const Text('Coupon'),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return SizedBox(
      width: 90,
      child: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedCategory.value == index;
            return InkWell(
              onTap: () => controller.selectedCategory.value = index,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: isSelected
                          ? const Color(0xFFF9A825)
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Column(
                  children: [
                    _categoryIcon(_categories[index].iconAsset),
                    const SizedBox(height: 4),
                    Text(
                      _categories[index].label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelected
                            ? const Color(0xFFF89830)
                            : Colors.grey,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  // Handles both .svg and .png,

  Widget _categoryIcon(String assetPath) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        height: 22,
        width: 22,
        placeholderBuilder: (context) =>
            Container(height: 22, width: 22, color: Colors.grey[200]),
      );
    }

    return Image.asset(
      assetPath,
      height: 22,
      width: 22,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Container(height: 22, width: 22, color: Colors.grey[200]),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 8, bottom: (20)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/IconKio-6.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'BEST SELLERS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
           
            //const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: sampleProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) =>
                    _productCard(sampleProducts[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(ProductModel product) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1, 
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
                alignment:
                    Alignment.bottomCenter, // cups sit on the same baseline
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[100],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
        height: 32,
        child: Text(
          product.name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12),
        ),
      ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              if (product.hasDiscount) ...[
                const SizedBox(width: 4),
                Text(
                  '\$${product.originalPrice!.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _Category {
  final String label;
  final String iconAsset;
  const _Category(this.label, this.iconAsset);
}
