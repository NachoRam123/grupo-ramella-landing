import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'SERVICIOS',
            style: AppTextStyles.sectionTitle,
          ).animate().fadeIn(duration: 500.ms).moveY(begin: 20, end: 0),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: AppColors.secondaryGreen)
              .animate().fadeIn(delay: 200.ms).scaleX(begin: 0, alignment: Alignment.centerLeft),
          const SizedBox(height: 60),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: const [
              _ServiceCard(
                title: 'Servicios Profesionales / Inversiones Financieras',
                items: [
                  'Asesoramiento estratégico en inversiones',
                  'Diseño de carteras según perfil y objetivos',
                  'Gestión discrecional y no discrecional',
                  'Instrumentos de renta fija y renta variable',
                ],
                icon: Icons.trending_up,
                delay: 0,
              ),
              _ServiceCard(
                title: 'Financiamiento para PyMEs y Personas Humanas',
                items: [
                  'Análisis integral de necesidades de financiamiento',
                  'Estructuración y optimización de crédito',
                  'Evaluación de costos financieros',
                  'Acompañamiento en procesos de endeudamiento',
                ],
                icon: Icons.attach_money,
                delay: 100,
              ),
              _ServiceCard(
                title: 'Evaluación de Proyectos de Inversión',
                items: [
                  'Análisis de viabilidad económica y financiera',
                  'Proyecciones de flujos de fondos',
                  'Evaluación de riesgos y escenarios',
                  'Soporte para decisiones estratégicas de inversión',
                ],
                icon: Icons.assessment,
                delay: 200,
              ),
              _ServiceCard(
                title: 'Consultoría Financiera Integral',
                items: [
                  'Diagnóstico económico-financiero',
                  'Ordenamiento y planificación financiera',
                  'Análisis económico y sectorial',
                  'Soluciones a medida para empresas y particulares',
                ],
                icon: Icons.pie_chart,
                delay: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _ServiceCard extends StatefulWidget {
  final String title;
  final List<String> items;
  final IconData icon;
  final int delay;

  const _ServiceCard({
    required this.title,
    required this.items,
    required this.icon,
    this.delay = 0,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 350,
        transform: Matrix4.identity()..scale(_isHovering ? 1.05 : 1.0),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: _isHovering 
                  ? AppColors.primaryDark.withOpacity(0.2) 
                  : Colors.black.withOpacity(0.05),
              blurRadius: _isHovering ? 20 : 10,
              offset: _isHovering ? const Offset(0, 10) : const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: _isHovering ? AppColors.secondaryGreen : AppColors.accentGreen2.withOpacity(0.3),
            width: _isHovering ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.accentGreen1.withOpacity(0.2),
              radius: 30,
              child: Icon(widget.icon, color: AppColors.primaryDark, size: 30),
            ).animate().scale(delay: (widget.delay + 200).ms, duration: 400.ms),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: AppTextStyles.bodyText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            ...widget.items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, size: 16, color: AppColors.secondaryGreen),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTextStyles.bodyText.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ).animate().fadeIn(delay: widget.delay.ms).scaleX(begin: 0, alignment: Alignment.centerLeft, duration: 500.ms),
    );
  }
}
