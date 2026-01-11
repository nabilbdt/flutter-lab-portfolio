import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});

  // Agency Palette Constants
  static const Color darkBg = Color(0xFF030712);
  static const Color surface = Color(0xFF111827); // Darker Slate
  static const Color accent = Color(0xFF00F5FF);  // Cyber Cyan
  static const Color textMain = Color(0xFFE4E4E7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: darkBg,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              title: Text(
                'SELECTED_WORK',
                style: GoogleFonts.spaceGrotesk(
                  color: textMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final project = _projects[index];
                  return _buildAgencyProjectCard(project, index);
                },
                childCount: _projects.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgencyProjectCard(Map<String, dynamic> project, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image / Icon Header
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: accent.withOpacity(0.05),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  top: -20,
                  child: Icon(project['icon'], size: 140, color: Colors.white.withOpacity(0.03)),
                ),
                Center(
                  child: Icon(project['icon'], size: 48, color: accent),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project['category'].toUpperCase(),
                      style: GoogleFonts.robotoMono(color: accent, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      project['year'],
                      style: GoogleFonts.robotoMono(color: Colors.white24, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  project['title'],
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project['description'],
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white60,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  children: (project['tech'] as List<String>).map((t) => _buildTechTag(t)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 150).ms).slideY(begin: 0.1);
  }

  Widget _buildTechTag(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        tech,
        style: GoogleFonts.robotoMono(color: Colors.white70, fontSize: 9),
      ),
    );
  }

  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Amamaem Platform',
      'description': 'Full-stack development for a high-traffic professional platform with real production constraints.',
      'icon': Icons.layers_rounded,
      'year': '2024',
      'tech': ['NEXT.JS', 'NODE.JS', 'MONGODB', 'DOCKER'],
      'category': 'Professional / MTech',
    },
    {
      'title': 'E-Commerce Engine',
      'description': 'Scalable retail architecture featuring advanced requirement analysis and delivery under tight deadlines.',
      'icon': Icons.shopping_bag_outlined,
      'year': '2023',
      'tech': ['REACT', 'SPRING BOOT', 'POSTGRESQL'],
      'category': 'Full-Stack Delivery',
    },
    {
      'title': 'Startup Business Tool',
      'description': 'Desktop application developed for Minasat El Jadida to automate startup business plan creation.',
      'icon': Icons.analytics_outlined,
      'year': '2022',
      'tech': ['PYTHON', 'PYQT', 'SQLITE'],
      'category': 'Desktop Solution',
    },
    {
      'title': 'Legacy Bridge System',
      'description': 'Enterprise workflow tool connecting legacy Microsoft Access databases with modern data visualizations.',
      'icon': Icons.settings_input_component,
      'year': '2021',
      'tech': ['VB.NET', 'MS ACCESS', 'EXCEL API'],
      'category': 'Industrial Internship',
    },
  ];
}