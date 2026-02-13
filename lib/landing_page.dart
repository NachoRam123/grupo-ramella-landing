import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:grupo_ramella_landing/sections/vision_section.dart';
import 'package:grupo_ramella_landing/sections/services_section.dart';
import 'package:grupo_ramella_landing/sections/about_section.dart';
import 'package:grupo_ramella_landing/sections/contact_section.dart';
import 'package:grupo_ramella_landing/widgets/nav_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

  // Track active section
  String _activeSection = 'vision';

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _onSectionVisibilityChanged(String sectionId, double visibleFraction) {
    if (visibleFraction > 0.5) {
      if (_activeSection != sectionId) {
        setState(() => _activeSection = sectionId);
      }
    }
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
                  _SectionHighlighter(
                    id: 'vision',
                    isActive: _activeSection == 'vision',
                    onVisibilityChanged: _onSectionVisibilityChanged,
                    child: VisionSection(key: _visionKey),
                  ),
                  _SectionHighlighter(
                    id: 'services',
                    isActive: _activeSection == 'services',
                    onVisibilityChanged: _onSectionVisibilityChanged,
                    child: ServicesSection(key: _servicesKey),
                  ),
                  _SectionHighlighter(
                    id: 'about',
                    isActive: _activeSection == 'about',
                    onVisibilityChanged: _onSectionVisibilityChanged,
                    child: AboutSection(key: _aboutKey),
                  ),
                  _SectionHighlighter(
                    id: 'contact',
                    isActive: _activeSection == 'contact',
                    onVisibilityChanged: _onSectionVisibilityChanged,
                    child: ContactSection(key: _contactKey),
                  ),
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

class _SectionHighlighter extends StatelessWidget {
  final String id;
  final bool isActive;
  final Widget child;
  final Function(String, double) onVisibilityChanged;

  const _SectionHighlighter({
    required this.id,
    required this.isActive,
    required this.child,
    required this.onVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(id),
      onVisibilityChanged: (info) => onVisibilityChanged(id, info.visibleFraction),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        margin: isActive 
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 10) 
            : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: isActive 
              ? [BoxShadow(color: AppColors.secondaryGreen.withOpacity(0.2), blurRadius: 30, spreadRadius: 5)] 
              : [],
          border: isActive 
              ? Border.all(color: AppColors.secondaryGreen, width: 3) 
              : Border.all(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(isActive ? 20 : 0),
        ),
        // Clip content to border radius when active
        clipBehavior: isActive ? Clip.antiAlias : Clip.none,
        child: child,
      ),
    );
  }
}
