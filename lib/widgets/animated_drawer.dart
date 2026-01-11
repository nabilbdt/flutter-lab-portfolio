import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedDrawer extends StatelessWidget {
  final AnimationController animationController;
  final Function(int) onItemSelected;

  // Agency Branding Constants
  static const Color darkBg = Color(0xFF030712);
  static const Color surface = Color(0xFF111827);
  static const Color accent = Color(0xFF00F5FF);
  static const Color textMain = Color(0xFFE4E4E7);

  const AnimatedDrawer({
    super.key,
    required this.animationController,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      backgroundColor: darkBg,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white10, width: 1)),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nabil's Agency Header
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: accent.withOpacity(0.5)),
                      ),
                      child: const Icon(Icons.terminal_rounded, color: accent, size: 32),
                    ).animate(controller: animationController)
                        .scale(duration: 400.ms, curve: Curves.bounceOut),
                    const SizedBox(height: 20),
                    Text(
                      'Nabil Elbayad',
                      style: GoogleFonts.spaceGrotesk(
                        color: textMain,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate(controller: animationController)
                        .slideX(begin: -0.5, duration: 400.ms),
                    Text(
                      'Software Developer_',
                      style: GoogleFonts.robotoMono(
                        color: accent,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate(controller: animationController)
                        .slideX(begin: -0.5, duration: 500.ms),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.white10, height: 1),
              ),

              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  children: [
                    _buildDrawerItem(
                      icon: Icons.grid_view_rounded,
                      title: 'HOME',
                      index: 0,
                    ),
                    _buildDrawerItem(
                      icon: Icons.sensors_rounded,
                      title: 'TECH_PULSE',
                      index: 1,
                    ),
                    _buildDrawerItem(
                      icon: Icons.layers_outlined,
                      title: 'PROJECTS',
                      index: 2,
                    ),
                    _buildDrawerItem(
                      icon: Icons.alternate_email_rounded,
                      title: 'CONTACT',
                      index: 3,
                    ),
                  ],
                ),
              ),

              // Footer / System Info
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SYSTEM_V1.0.0',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white24,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '© 2026 NABIL.DEV',
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white24,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ).animate(controller: animationController)
                    .fadeIn(delay: 600.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    return ListTile(
      leading: Icon(icon, color: textMain.withOpacity(0.7), size: 22),
      title: Text(
        title,
        style: GoogleFonts.spaceGrotesk(
          color: textMain,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
      ),
      onTap: () => onItemSelected(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hoverColor: accent.withOpacity(0.05),
      splashColor: accent.withOpacity(0.1),
    ).animate().fadeIn(delay: (100 * index).ms).slideX(begin: -0.2);
  }
}