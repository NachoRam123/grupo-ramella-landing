import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:grupo_ramella_landing/sections/vision_section.dart';
import 'package:grupo_ramella_landing/sections/services_section.dart';
import 'package:grupo_ramella_landing/sections/about_section.dart';
import 'package:grupo_ramella_landing/sections/contact_section.dart';
import 'package:grupo_ramella_landing/widgets/nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _visionKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          NavBar(
            onVisionTap: () => _scrollToSection(_visionKey),
            onServicesTap: () => _scrollToSection(_servicesKey),
            onAboutTap: () => _scrollToSection(_aboutKey),
            onContactTap: () => _scrollToSection(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  VisionSection(key: _visionKey),
                  ServicesSection(key: _servicesKey),
                  AboutSection(key: _aboutKey),
                  ContactSection(key: _contactKey),
                  const SizedBox(height: 50), // Footer padding
                  Container(
                    width: double.infinity,
                    color: AppColors.primaryDark,
                    padding: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text(
                        '© 2026 Grupo Ramella. Todos los derechos reservados.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
