import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/modules/login/views/login_view.dart';
import 'package:kiosk_app/app/modules/start_order/view/start_order.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';


class LanguageView extends StatelessWidget {
  const LanguageView({super.key});
 //navigate to language
  static void open() => Get.offNamed(Routes.LANGUAGE);

  
  final List<Map<String, String>> languages = const [
    {"label": "English", "code": "en"},
    {"label": "ខ្មែរ", "code": "km"},
    {"label": "中文", "code": "zh"},
   
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      // Globe icon
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: SvgPicture.asset(
                          'assets/icons/Language.svg',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.error, size: 50),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Language list
                      ...languages.map(
                        (lang) => Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 20,
                            right: 20,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                //
                              },
                              child: GestureDetector(
                                onTap: () {
                                 LoginView.open();
                                },
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    border: Border.all(
                                      color: const Color(0xFFecf0f1),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        lang['label']!,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Powered by Monakom",
                    style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                    child: Image.asset(
                      "assets/images/MONOKOM_LOGO1.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.business, size: 30),
                        );
                      },
                    ),
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