import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class VisionSection extends StatelessWidget {
  final ScrollController? scrollController;

  const VisionSection({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700, // Fixed height for parallax effect
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Parallax Background
          if (scrollController != null)
            AnimatedBuilder(
              animation: scrollController!,
              builder: (context, child) {
                final double offset = scrollController!.hasClients ? scrollController!.offset : 0;
                return Positioned(
                  top: -offset * 0.5, // Parallax speed factor
                  left: 0,
                  right: 0,
                  height: 1000, // Taller image to allow scrolling
                  child: child!,
                );
              },
              child: Image.asset(
                'assets/images/finance_parallax_background.png',
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.9), // Light overlay for text contrast
                colorBlendMode: BlendMode.modulate,
              ),
            )
          else
            // Fallback for static view
            Image.asset(
              'assets/images/finance_parallax_background.png',
              fit: BoxFit.cover,
            ),

          // Gradient Overlay for readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryDark.withOpacity(0.7),
                  AppColors.primaryDark.withOpacity(0.4),
                ],
              ),
            ),
          ),

          // Content
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'VISIÓN',
                    style: AppTextStyles.heroTitle.copyWith(color: AppColors.accentGreen2),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.2, end: 0),
                  const SizedBox(height: 30),
                  Text(
                    'Consultoría financiera de referencia, brindando asesoramiento profesional y personalizado, sustentado en el análisis riguroso del perfil y los objetivos de cada cliente, con foco en la toma de decisiones estratégicas y en la construcción de relaciones sólidas y sostenibles de largo plazo.',
                    style: AppTextStyles.bodyText.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        const Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 4.0,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
