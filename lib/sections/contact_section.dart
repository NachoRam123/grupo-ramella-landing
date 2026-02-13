import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ignacio@gruporamella.com',
      query: 'subject=Consulta desde Web&body=Hola, quisiera recibir más información.',
    );

    if (!await launchUrl(emailLaunchUri)) {
      debugPrint('Could not launch email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: AppColors.secondaryGreen.withOpacity(0.1),
      child: Column(
        children: [
          Text(
            'CONTACTO',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: AppColors.secondaryGreen),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(Icons.email_outlined, size: 60, color: AppColors.primaryDark),
                const SizedBox(height: 20),
                Text(
                  'Para escribir un mensaje, este debe llegar a la siguiente casilla:',
                  style: AppTextStyles.bodyText,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SelectableText(
                  'ignacio@gruporamella.com',
                  style: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _launchEmail,
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar Mensaje'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
