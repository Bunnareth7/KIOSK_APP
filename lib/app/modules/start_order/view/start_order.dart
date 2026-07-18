import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

class StartOrderView extends StatefulWidget {
  const StartOrderView({super.key});

  @override
  State<StartOrderView> createState() => _StartOrderViewState();
}

class _StartOrderViewState extends State<StartOrderView> {
  final List<String> imageList = [
    'assets/images/start_screen.jpg',
    'assets/images/promo2.png',
    'assets/images/promo3.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(children: []),
            // ),

            // Image Slider
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.62,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: double.infinity,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: imageList.map((imagePath) {
                      return Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  // Dot Indicators
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _currentIndex == entry.key ? 20.0 : 14.0,
                          //thickness
                          height: 2.5,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: _currentIndex == entry.key
                                ? const Color(0xFFF89830) // active bar
                                : Colors.white.withOpacity(0.7), // inactive bar
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(height: 10),
            // Bottom section
            Expanded(child: _buildBottomSection()),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBottomSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          // Member / Coupon row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _memberCouponItem('assets/icons/Profile.svg', 'Member'),
              const SizedBox(width: 40),
              _memberCouponItem('assets/icons/ActionIcon.svg', 'Coupon'),
            ],
          ),
          const SizedBox(height: 30),

          // Dine In / Take Away buttons
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  label: 'Dine In',
                  imagePath: 'assets/images/overflow_koi.svg',
                  onTap: () {
                    //
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _actionButton(
                  label: 'Take Away',
                  imagePath: 'assets/images/overflow_driver.svg',
                  onTap: () {
                    //
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _flagCircle('assets/images/cambodia.svg'),
              const SizedBox(width: 15),
              _flagCircle('assets/images/united-kingdom.svg'),
              const SizedBox(width: 15),
              _flagCircle('assets/images/china.svg'),
            ],
          ),
          const SizedBox(height: 35),

          // Footer payment icons
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _memberCouponItem(String svgAsset, String label) {
    return Row(
      children: [
        SvgPicture.asset(
          svgAsset,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _flagCircle(String assetPath) {
    return ClipOval(
      child: Container(
        width: 32,
        height: 32,
        color: Colors.grey[200],
        child: SvgPicture.asset(
          assetPath,
          fit: BoxFit.cover,
          placeholderBuilder: (context) =>
              const Icon(Icons.flag_outlined, size: 16, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // monakom logo
        SizedBox(
          width: 80,
          height: 30,
          child: Image.asset(
            'assets/images/MONOKOM_LOGO1.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(height: 28, width: 90, color: Colors.grey[200]),
          ),
        ),

        // Payment method icons
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 6,
              runSpacing: 4,
              children: [
                'assets/icons/Payment.svg',
                'assets/icons/khqr.svg',
                'assets/icons/visa-logo.svg',
                'assets/icons/Mastercard.svg',
                'assets/icons/wallet.svg',
                'assets/icons/UnionPay.svg',
                'assets/icons/alipay.png',
                'assets/icons/wepay.png',
                'assets/icons/jbc.png',
              ].map((path) => _paymentIcon(path)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  // Handles both .svg and .png
 Widget _paymentIcon(String assetPath) {
  final isSvg = assetPath.toLowerCase().endsWith('.svg');

  return SizedBox(
    height: 18,
    width: 25, 
    child: isSvg
        ? SvgPicture.asset(
            assetPath,
            fit: BoxFit.contain,
            placeholderBuilder: (context) =>
                Container
                (
                 decoration: BoxDecoration(
                   border: Border.all(width: 1, color: Colors.black26),
                    color: Colors.grey[200]
                 )
                  
                  ),
          )
        : Image.asset(
            assetPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey[200]),
          ),
  );
}

  Widget _actionButton({
    required String label,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return ClipRect(
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(left: 16, right: 70),
              decoration: BoxDecoration(
                color: const Color(0xFFF9A825),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // image overflows above the button
          Positioned(
            right: 10,
            top: -20,
            bottom: -10,
            child: SvgPicture.asset(
              imagePath,
              height: 80,
              fit: BoxFit.contain,
              placeholderBuilder: (context) => Container(
                height: 100,
                width: 90,
                alignment: Alignment.center,
                color: Colors.grey[200],
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
