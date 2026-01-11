import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Theme Colors: Modern Agency Aesthetic for Nabil
  final Color darkBg = const Color(0xFF030712);
  final Color primaryAccent = const Color(0xFF2563EB); // Deep Blue
  final Color secondaryAccent = const Color(0xFF00F5FF); // Cyber Cyan
  final Color glassBorder = Colors.white.withOpacity(0.1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: Stack(
        children: [
          // Background Orbs
          Positioned(
            top: -100,
            right: -50,
            child: _buildBlurOrb(primaryAccent.withOpacity(0.15), 300),
          ),
          Positioned(
            bottom: 100,
            left: -50,
            child: _buildBlurOrb(secondaryAccent.withOpacity(0.1), 250),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildHeroSection(),
                  const SizedBox(height: 30),
                  _buildImpactRow(),
                  const SizedBox(height: 40),
                  _buildSectionTitle("Technical Expertise"),
                  _buildModernSkillGrid(),
                  const SizedBox(height: 40),
                  _buildSectionTitle("Professional Journey"),
                  _buildExperienceTimeline(),
                  const SizedBox(height: 40),
                  _buildSectionTitle("Education"),
                  _buildEducationCard(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurOrb(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ).animate().fadeIn(duration: 2.seconds).scale(begin: const Offset(0.8, 0.8));
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.code_rounded, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              "NABIL.DEV",
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        _buildAvailabilityBadge(),
      ],
    ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2);
  }

  Widget _buildAvailabilityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: secondaryAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: secondaryAccent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: secondaryAccent, shape: BoxShape.circle),
          ).animate(onPlay: (c) => c.repeat()).scale(duration: 1.seconds, curve: Curves.easeInOut),
          const SizedBox(width: 8),
          Text(
            "Available",
            style: GoogleFonts.inter(color: secondaryAccent, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nabil Elbayad",
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),
        const SizedBox(height: 12),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [primaryAccent, secondaryAccent],
          ).createShader(bounds),
          child: Text(
            "Software Developer_",
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 20),
        Text(
          "Building scalable, future-proof systems. Specializing in Cloud Engineering, DevOps, and Full-stack development with a focus on digital transformation.",
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 600.ms),
      ],
    );
  }

  Widget _buildImpactRow() {
    return Row(
      children: [
        _buildImpactBadge("Java / JS", "Stack"),
        const SizedBox(width: 15),
        _buildImpactBadge("Docker/AWS/Azure", "Cloud Focus"),
      ],
    ).animate().fadeIn(delay: 800.ms).scale();
  }

  Widget _buildImpactBadge(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          border: Border.all(color: glassBorder),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: GoogleFonts.spaceGrotesk(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            Text(label, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.5), fontSize: 11)),
          ],
        ),
      ),
    );
  }

  Widget _buildModernSkillGrid() {
    final List<Map<String, dynamic>> skills = [
      {"name": "React / Next.js", "icon": Icons.web, "color": Colors.cyan},
      {"name": "Spring", "icon": Icons.settings_input_component, "color": Colors.green},
      {"name": "Docker / DevOps", "icon": Icons.terminal, "color": Colors.blue},
      {"name": "SQL / NOSQL", "icon": Icons.storage, "color": Colors.orange},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.6,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.02),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: glassBorder),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(skills[index]['icon'], color: skills[index]['color'], size: 24),
              const SizedBox(height: 8),
              Text(skills[index]['name'], style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
        ).animate().fadeIn(delay: (150 * index).ms).scale();
      },
    );
  }

  Widget _buildExperienceTimeline() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: glassBorder),
      ),
      child: Column(
        children: [
          _buildTimelineItem("Freelance Developer", "MTech", "2023 - Present", true),
          const Divider(color: Colors.white10, height: 30),
          _buildTimelineItem("PFE Intern", "MTech", "2023", false),
          const Divider(color: Colors.white10, height: 30),
          _buildTimelineItem("Software Intern", "Minasat El Jadida", "2021", false),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String role, String company, String date, bool isActive) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: isActive ? secondaryAccent : Colors.white24,
            shape: BoxShape.circle,
            boxShadow: isActive ? [BoxShadow(color: secondaryAccent.withOpacity(0.5), blurRadius: 8)] : null,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(role, style: GoogleFonts.spaceGrotesk(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 2),
              Text("$company • $date", style: GoogleFonts.inter(color: Colors.white54, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cycle Ingénieur",
            style: GoogleFonts.spaceGrotesk(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            "2ème Année - Option Développement Logiciel",
            style: GoogleFonts.inter(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 8),
          Text(
            "Focus: Cloud Architecture & Scalable Systems",
            style: GoogleFonts.robotoMono(color: secondaryAccent, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.robotoMono(
          color: secondaryAccent,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
          fontSize: 12,
        ),
      ),
    );
  }
}