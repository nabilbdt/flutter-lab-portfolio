import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvedNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CurvedNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CurvedNavigationBar> createState() => _CurvedNavigationBarState();
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {

  // Theme Colors
  static const Color darkSurface = Color(0xFF111827);
  static const Color accentCyan = Color(0xFF00F5FF);
  static const Color textDim = Color(0xFF71717A);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.fromLTRB(24, 0, 24, MediaQuery.of(context).padding.bottom + 10),
      child: Container(
        decoration: BoxDecoration(
          color: darkSurface.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.grid_view_rounded, 'HOME', 0),
              _buildNavItem(Icons.sensors_rounded, 'PULSE', 1),
              _buildNavItem(Icons.layers_outlined, 'WORK', 2),
              _buildNavItem(Icons.alternate_email_rounded, 'MAIL', 3),
            ],
          ),
        ),
      ),
    ).animate().slideY(begin: 1, duration: 600.ms, curve: Curves.easeOutQuart);
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = widget.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Indicator Bar
            AnimatedContainer(
              duration: 300.ms,
              height: 2,
              width: isSelected ? 20 : 0,
              decoration: BoxDecoration(
                color: accentCyan,
                boxShadow: [
                  BoxShadow(color: accentCyan.withOpacity(0.5), blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              icon,
              color: isSelected ? accentCyan : textDim,
              size: 22,
            ).animate(target: isSelected ? 1 : 0)
                .shimmer(color: accentCyan.withOpacity(0.3))
                .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1)),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.robotoMono(
                fontSize: 9,
                color: isSelected ? Colors.white : textDim,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}