import 'package:flutter/material.dart';
import 'package:grupo_ramella_landing/constants.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onVisionTap;
  final VoidCallback onServicesTap;
  final VoidCallback onAboutTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onVisionTap,
    required this.onServicesTap,
    required this.onAboutTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10), // Reduced vertical padding to accommodate larger logo
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 80, // Increased from 50
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.attach_money, size: 50, color: AppColors.primaryDark),
              ),
              const SizedBox(width: 10),
              // Text(
              //   'RAMELLA',
              //   style: AppTextStyles.navLink.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              // ),
            ],
          ),
          // Navigation Links
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                _NavBarItem(title: 'Visión', onTap: onVisionTap),
                const SizedBox(width: 30),
                _NavBarItem(title: 'Servicios', onTap: onServicesTap),
                const SizedBox(width: 30),
                _NavBarItem(title: 'Quiénes Somos', onTap: onAboutTap),
                const SizedBox(width: 30),
                _NavBarItem(title: 'Contacto', onTap: onContactTap),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.primaryDark),
              onPressed: () {
                // Simple mobile menu for now
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(title: const Text('Visión'), onTap: () { Navigator.pop(context); onVisionTap(); }),
                        ListTile(title: const Text('Servicios'), onTap: () { Navigator.pop(context); onServicesTap(); }),
                        ListTile(title: const Text('Quiénes Somos'), onTap: () { Navigator.pop(context); onAboutTap(); }),
                        ListTile(title: const Text('Contacto'), onTap: () { Navigator.pop(context); onContactTap(); }),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: AppTextStyles.navLink,
        ),
      ),
    );
  }
}
