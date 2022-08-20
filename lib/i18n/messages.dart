import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'name': 'English Test',
          'en_US': 'English',
          'de_DE': 'Deutsch'
        },
        'de_DE': {
          'name': 'Deutsch Test',
          'en_US': 'English',
          'de_DE': 'Deutsch'
        }
      };
}
