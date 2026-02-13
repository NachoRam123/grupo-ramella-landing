import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';

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
          ),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: AppColors.secondaryGreen),
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
              ),
              _ProfileCard(
                imagePath: 'assets/images/ignacio.png',
                name: 'Ignacio Ramella',
                titles: [
                  'Licenciado en Economía',
                  'Consultor Económico-Financiero',
                  'Analista de Datos',
                ],
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

  const _ProfileCard({
    required this.imagePath,
    required this.name,
    required this.titles,
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
        ),
        const SizedBox(height: 20),
        Text(
          name,
          style: AppTextStyles.bodyText.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.primaryDark,
          ),
        ),
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
        )),
      ],
    );
  }
}
