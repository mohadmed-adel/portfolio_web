import 'package:url_launcher/url_launcher.dart';

Future<void> downloadFile(String url, {String? fileName}) async {
  // Non-web fallback: open the URL normally.
  final Uri uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
