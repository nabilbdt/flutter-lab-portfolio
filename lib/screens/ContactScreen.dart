import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  // Agency Branding Constants
  static const Color darkBg = Color(0xFF030712);
  static const Color surface = Color(0xFF111827);
  static const Color accent = Color(0xFF00F5FF);
  static const Color textMain = Color(0xFFE4E4E7);
  static const Color textDim = Color(0xFF71717A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Header Section
              _buildAgencyBadge(),
              const SizedBox(height: 24),
              Text(
                  "CONNECT_WITH_ME",
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -1,
                  )
              ).animate().fadeIn().slideX(begin: -0.2),
              const SizedBox(height: 12),
              Text(
                  "I'm currently open to digital transformation projects and software engineering opportunities.",
                  style: GoogleFonts.inter(color: textDim, height: 1.5, fontSize: 16)
              ).animate().fadeIn(delay: 200.ms),

              const SizedBox(height: 48),

              // Form Section
              _buildAgencyTextField("FULL_NAME", Icons.person_outline),
              _buildAgencyTextField("EMAIL_ADDRESS", Icons.alternate_email),
              _buildAgencyTextField("PROJECT_BRIEF", Icons.terminal_rounded, maxLines: 4),

              const SizedBox(height: 12),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    foregroundColor: darkBg,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                      "TRANSMIT_MESSAGE",
                      style: GoogleFonts.robotoMono(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                      )
                  ),
                ),
              ).animate().scale(delay: 800.ms).shimmer(delay: 2.seconds),

              const SizedBox(height: 40),
              _buildSocialFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgencyBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: accent.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "CONTACT_v1.0",
        style: GoogleFonts.robotoMono(color: accent, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    ).animate().fadeIn();
  }

  Widget _buildAgencyTextField(String label, IconData icon, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.robotoMono(color: textDim, fontSize: 11, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            style: const TextStyle(color: Colors.white),
            cursorColor: accent,
            decoration: InputDecoration(
              filled: true,
              fillColor: surface,
              prefixIcon: Icon(icon, color: accent.withOpacity(0.7), size: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: accent),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildSocialFooter() {
    return Center(
      child: Text(
        "NABIL.DEV // 2026 // CASABLANCA",
        style: GoogleFonts.robotoMono(color: textDim.withOpacity(0.5), fontSize: 10),
      ),
    );
  }
}