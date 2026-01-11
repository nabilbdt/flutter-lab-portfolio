import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  static const String _apiKey = '63bb8c0084a940349042a5fc7843dd18';
  static const String _baseUrl = 'https://newsapi.org/v2';

  Future<List<dynamic>> fetchTechNews() async {
    try {

      final response = await http.get(
        Uri.parse('$_baseUrl/top-headlines?category=technology&language=en&apiKey=$_apiKey'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['articles'] ?? [];
      } else {
        print('API Error: ${response.statusCode}');
        return _getMockNews();
      }
    } catch (e) {
      print('Network Error: $e');
      return _getMockNews();
    }
  }

  List<dynamic> _getMockNews() {
    return [
      {
        'title': 'The Rise of Next.js in Enterprise Architecture',
        'description': 'How server-side rendering is becoming the standard for modern scalable web applications.',
        'urlToImage': 'https://images.unsplash.com/photo-1618477388954-7852f32655ec?w=800',
        'publishedAt': '2026-01-11T10:00:00Z',
        'source': {'name': 'Cloud Engineering'},
      },
      {
        'title': 'Dockerizing Spring Boot: Best Practices for 2026',
        'description': 'Optimizing container images for faster CI/CD pipelines and lower memory footprint.',
        'urlToImage': 'https://images.unsplash.com/photo-1605379399642-870262d3d051?w=800',
        'publishedAt': '2026-01-10T14:20:00Z',
        'source': {'name': 'DevOps Digest'},
      },
      {
        'title': 'MongoDB Atlas vs Self-Hosted: A Cost Analysis',
        'description': 'Evaluating managed database solutions for high-traffic Moroccan e-commerce platforms.',
        'urlToImage': 'https://images.unsplash.com/photo-1544383023-53f0c6742860?w=800',
        'publishedAt': '2026-01-09T09:15:00Z',
        'source': {'name': 'Data Systems'},
      },
      {
        'title': 'AI-Driven Automation in Software Delivery',
        'description': 'Using LLMs to accelerate requirement analysis and unit testing in production environments.',
        'urlToImage': 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
        'publishedAt': '2026-01-08T16:45:00Z',
        'source': {'name': 'Future Dev'},
      },
    ];
  }
}