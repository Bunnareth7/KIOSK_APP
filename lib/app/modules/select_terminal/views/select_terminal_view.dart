import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

class SelectionTerminalView extends StatelessWidget {
  const SelectionTerminalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      // Image
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset(
                          'assets/images/MenuWeb.svg',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.error, size: 50),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Title
                      const Text(
                        "Store and Terminal",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      
                      // Subtitle
                      const Text(
                        "Selecting your Store and Terminal",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Store Dropdown
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFecf0f1)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: null,
                                    hint: const Text(
                                      'Store',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    isExpanded: true,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Store 1',
                                        child: Text('Store 1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Store 2',
                                        child: Text('Store 2'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Store 3',
                                        child: Text('Store 3'),
                                      ),
                                    ],
                                    onChanged: null,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Terminal Dropdown
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFecf0f1)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: null,
                                    hint: const Text(
                                      'Terminal',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    isExpanded: true,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Terminal 1',
                                        child: Text('Terminal 1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Terminal 2',
                                        child: Text('Terminal 2'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Terminal 3',
                                        child: Text('Terminal 3'),
                                      ),
                                    ],
                                    onChanged: null,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                      
                      // Finish Button
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.mainprimarykoi,
                          ),
                          child: const Center(
                            child: Text(
                              "Finish",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 370),
              
              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Powered by Monakom",
                    style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                  ),
                  const SizedBox(width: 4),
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