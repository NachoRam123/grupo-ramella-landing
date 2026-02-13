import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _launchEmail() async {
    final String userEmail = _emailController.text;
    final String userMessage = _messageController.text;

    if (userMessage.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor escribe un mensaje')),
      );
      return;
    }

    // Construct the email body
    final String body = "Mensaje de: $userEmail\n\n$userMessage";

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ignacio@gruporamella.com',
      queryParameters: {
        'subject': 'Consulta Web - $userEmail',
        'body': body,
      },
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
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: AppColors.secondaryGreen)
              .animate().fadeIn(delay: 200.ms).scaleX(),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.email_outlined, size: 60, color: AppColors.primaryDark)
                    .animate().fadeIn(delay: 300.ms).scale(),
                const SizedBox(height: 30),
                
                // Email Input
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Tu Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1, end: 0),
                const SizedBox(height: 20),

                // Message Input
                TextField(
                  controller: _messageController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Tu Mensaje',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.message),
                  ),
                ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1, end: 0),
                const SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: _launchEmail,
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar Mensaje'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    textStyle: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms).shimmer(delay: 1000.ms, duration: 1500.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
