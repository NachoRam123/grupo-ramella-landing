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


class _ProfileCard extends StatefulWidget {
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
  State<_ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<_ProfileCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 250,
            height: 250,
            transform: Matrix4.identity()..scale(_isHovering ? 1.05 : 1.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: _isHovering ? AppColors.secondaryGreen : AppColors.primaryDark,
                width: 4
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovering ? AppColors.secondaryGreen.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                  blurRadius: _isHovering ? 25 : 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ).animate().fadeIn(delay: widget.delay.ms).scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), duration: 600.ms, curve: Curves.easeOutBack),
          const SizedBox(height: 20),
          Text(
            widget.name,
            style: AppTextStyles.bodyText.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: _isHovering ? AppColors.secondaryGreen : AppColors.primaryDark,
            ),
          ).animate().fadeIn(delay: (widget.delay + 300).ms).slideY(begin: 0.5, end: 0),
          const SizedBox(height: 10),
          ...widget.titles.map((title) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              title,
              style: AppTextStyles.bodyText.copyWith(
                color: Colors.grey[700],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          )).toList().animate(interval: 100.ms).fadeIn(delay: (widget.delay + 500).ms),
        ],
      ),
    );
  }
}
