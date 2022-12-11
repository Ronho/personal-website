import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'name': 'English Test',
          'en_US': 'English',
          'de_DE': 'Deutsch',
          'system': 'System',
          'blog': 'Blog',
          'blogs': 'Blogs',
          'project': 'Project',
          'projects': 'Projects',
          'experience': 'Experience',
          'experience_screen_title': 'Work Experience and Education',
          'home': 'Home',
        },
        'de_DE': {
          'name': 'Deutsch Test',
          'en_US': 'English',
          'de_DE': 'Deutsch',
          'system': 'System',
          'blog': 'Blog',
          'blogs': 'Blogs',
          'project': 'Projekt',
          'projects': 'Projekte',
          'experience': 'Erfahrung',
          'experience_screen_title': 'Arbeitserfahrung und Ausbildung',
          'home': 'Home',
        }
      };
}
