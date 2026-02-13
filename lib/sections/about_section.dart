import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'QUIÉNES SOMOS',
            style: AppTextStyles.sectionTitle,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: AppColors.secondaryGreen)
              .animate().fadeIn(delay: 200.ms).scaleX(begin: 0, alignment: Alignment.center),
          const SizedBox(height: 60),
          Wrap(
            spacing: 50,
            runSpacing: 50,
            alignment: WrapAlignment.center,
            children: const [
              _ProfileCard(
                imagePath: 'assets/images/leandro.jpg',
                name: 'Leandro Ramella',
                titles: [
                  'Licenciado en Economía',
                  'Analista Económico',
                  'Idóneo Mercado de Capitales',
                ],
                delay: 0,
              ),
              _ProfileCard(
                imagePath: 'assets/images/ignacio.png',
                name: 'Ignacio Ramella',
                titles: [
                  'Licenciado en Economía',
                  'Consultor Económico-Financiero',
                  'Analista de Datos',
                ],
                delay: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final List<String> titles;
  final int delay;

  const _ProfileCard({
    required this.imagePath,
    required this.name,
    required this.titles,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: AppColors.primaryDark, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ).animate().fadeIn(delay: delay.ms).scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), duration: 600.ms, curve: Curves.easeOutBack),
        const SizedBox(height: 20),
        Text(
          name,
          style: AppTextStyles.bodyText.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.primaryDark,
          ),
        ).animate().fadeIn(delay: (delay + 300).ms).slideY(begin: 0.5, end: 0),
        const SizedBox(height: 10),
        ...titles.map((title) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            title,
            style: AppTextStyles.bodyText.copyWith(
              color: Colors.grey[700],
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        )).toList().animate(interval: 100.ms).fadeIn(delay: (delay + 500).ms),
      ],
    );
  }
}
