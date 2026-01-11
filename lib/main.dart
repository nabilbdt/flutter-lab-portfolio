import 'package:exam_nabil_elbayad/screens/ContactScreen.dart';
import 'package:exam_nabil_elbayad/screens/news_screen.dart';
import 'package:exam_nabil_elbayad/screens/projects_screen.dart';
import 'package:exam_nabil_elbayad/widgets/animated_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'widgets/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    
    return MaterialApp(
      title: 'Mon Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const HomeScreen(),
    const NewsScreen(),
    ProjectsScreen(),
    const ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Use extendBody to let content flow behind the Bottom Bar like in your screenshots
      extendBody: true,
      drawer: AnimatedDrawer(
        animationController: _animationController,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _scaffoldKey.currentState?.closeDrawer();
          _animationController.reverse(); // Reset icon
        },
      ),
      body: Stack(
        children: [
          // Current Screen
          _screens[_currentIndex],

          // Agency Style Menu Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: GestureDetector(
              onTap: () {
                if (_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState?.closeDrawer();
                  _animationController.reverse();
                } else {
                  _scaffoldKey.currentState?.openDrawer();
                  _animationController.forward();
                }
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  // Dark glass effect instead of bright white circle
                  color: const Color(0xFF111827).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController,
                    color: const Color(0xFF00F5FF), // Cyber Cyan
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}