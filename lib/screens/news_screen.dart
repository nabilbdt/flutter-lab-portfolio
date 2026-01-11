import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/news_service.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  List<dynamic> _articles = [];
  bool _isLoading = true;
  bool _hasError = false;

  // Agency Palette (Matches your HomeScreen & Projects)
  static const Color darkBg = Color(0xFF030712);
  static const Color surface = Color(0xFF111827);
  static const Color accent = Color(0xFF00F5FF); // Cyber Cyan
  static const Color textMain = Color(0xFFE4E4E7);
  static const Color textDim = Color(0xFF71717A);

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    setState(() => _isLoading = true);
    try {
      final articles = await _newsService.fetchTechNews();
      setState(() {
        _articles = articles;
        _isLoading = false;
        _hasError = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildNewsFeedHeader(),
          if (_isLoading)
            _buildLoadingState()
          else if (_hasError)
            _buildErrorState()
          else
            _buildNewsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchNews,
        backgroundColor: accent,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.refresh_rounded, color: darkBg),
      ).animate().scale(delay: 500.ms),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 160,
      floating: false,
      pinned: true,
      backgroundColor: darkBg,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        title: Text(
          'TECH_PULSE',
          style: GoogleFonts.spaceGrotesk(
            color: textMain,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        background: Stack(
          children: [
            Positioned(
              right: -30,
              top: 20,
              child: Icon(Icons.rss_feed_rounded, size: 150, color: accent.withOpacity(0.05)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsFeedHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest insights into Cloud, DevOps & AI.",
              style: GoogleFonts.inter(color: textDim, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Container(height: 1, width: 60, color: accent),
          ],
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1),
      ),
    );
  }

  Widget _buildLoadingState() {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: accent, strokeWidth: 2),
            const SizedBox(height: 20),
            Text(
              "FETCHING_DATA...",
              style: GoogleFonts.robotoMono(color: accent, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.terminal_rounded, size: 48, color: Colors.redAccent),
            const SizedBox(height: 20),
            Text(
              "CONNECTION_ERROR",
              style: GoogleFonts.spaceGrotesk(color: textMain, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Failed to establish handshake with the news provider.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: textDim, fontSize: 13),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: _fetchNews,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: accent),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text("RETRY_CONNECTION", style: GoogleFonts.robotoMono(color: accent, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final article = _articles[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: NewsCard(
                article: article,
                index: index,
              ),
            ).animate().fadeIn(delay: (index * 50).ms).slideY(begin: 0.1);
          },
          childCount: _articles.length,
        ),
      ),
    );
  }
}