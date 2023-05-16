import 'package:url_launcher/url_launcher.dart';

Future<void> termsAndConditions() async {
  if (!await launchUrl(Uri.parse('https://www.chumsy.com/terms.html'),
      mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch terms url');
  }
}

Future<void> privacy() async {
  if (!await launchUrl(Uri.parse('https://www.chumsy.com/pl/privacy.html'),
      mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch privacy url');
  }
}
