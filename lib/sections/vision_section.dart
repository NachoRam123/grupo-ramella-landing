import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';

class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryDark, // Fallback color
      child: Stack(
        children: [
          // Background Image with Overlay
          Positioned.fill(
            child: Image.asset(
              'assets/images/finance_bg.png',
              fit: BoxFit.cover,
              color: AppColors.primaryDark.withOpacity(0.85),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'VISIÓN',
                    style: AppTextStyles.heroTitle.copyWith(color: AppColors.accentGreen2),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Consultoría financiera de referencia, brindando asesoramiento profesional y personalizado, sustentado en el análisis riguroso del perfil y los objetivos de cada cliente, con foco en la toma de decisiones estratégicas y en la construcción de relaciones sólidas y sostenibles de largo plazo.',
                    style: AppTextStyles.bodyText.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
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
