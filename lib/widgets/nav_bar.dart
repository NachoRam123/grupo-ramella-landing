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
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 90, // Adjusted to intermediate size
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.attach_money, size: 50, color: AppColors.primaryDark),
              ),
              const SizedBox(width: 10),
            ],
          ),
          // Navigation Links
          if (MediaQuery.of(context).size.width > 900) // Increased breakpoint for safety
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
              icon: const Icon(Icons.menu, color: AppColors.primaryDark, size: 30),
              onPressed: () {
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

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.navLink.copyWith(
                color: _isHovering ? AppColors.secondaryGreen : AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              height: 2,
              width: _isHovering ? 40 : 0, // Expands from center implicitly or left depending on alignment
              color: AppColors.secondaryGreen,
            ),
          ],
        ),
      ),
    );
  }
}
