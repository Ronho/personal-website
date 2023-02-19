import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // Text that are equal for all languages.
          'name': 'Ron Robin Holzapfel',
          'en_US': 'English',
          'de_DE': 'Deutsch',

          // Different texts.
          'welcome': 'Welcome \u0001F917, I am Ron!',
          'motivation_text': 'I have a passion for topics that are related to '
              'data and artificial intelligence. Reinforcement learning in '
              'particular has been a source of fascination for me. It is in '
              'this context that my love of learning new things comes in '
              'handy.\n\n'
              'I am very pleased that you are visiting my website. Here you '
              'will not only find information about my professional career so '
              'far, but also about some of my private projects and blog '
              'entries on interesting and exciting topics.',
          'system': 'System',
          'blog': 'Blog',
          'blogs': 'Blogs',
          'project': 'Project',
          'projects': 'Projects',
          'experience': 'Experience',
          'experience_screen_title': 'Work Experience and Education',
          'home': 'Home',
          'imprint': 'Imprint',
          'data_protection': 'Data Protection',
          'changelog': 'Changelog',
          'search': 'Search',
          'search_hinttext': 'Full-Text Search...',
        },
        'de_DE': {
          'welcome': 'Willkommen 🤗, ich bin Ron!',
          'motivation_text': 'Ich habe eine Leidenschaft für Themen rund um '
              'Daten und Künstliche Intelligenz. Vor allem das Reinforcement '
              'Learning hat mich in seinen Bann gezogen. In diesem '
              'Zusammenhang kommt mir meine Freude daran, neue Dinge zu '
              'lernen, sehr zugute.\n\n'
              'Es freut mich, dass du meine Seite besuchst. Hier findest du '
              'nicht nur Informationen über meinen bisherigen Werdegang, '
              'sondern auch über meine privaten Projekte und Blogeinträge zu '
              'interessanten und spannenden Themen.',
          'system': 'System',
          'blog': 'Blog',
          'blogs': 'Blogs',
          'project': 'Projekt',
          'projects': 'Projekte',
          'experience': 'Erfahrung',
          'experience_screen_title': 'Arbeitserfahrung und Ausbildung',
          'home': 'Home',
          'imprint': 'Impressum',
          'data_protection': 'Datenschutz',
          'changelog': 'Changelog',
          'search': 'Suche',
          'search_hinttext': 'Volltextsuche...',
        }
      };
}
