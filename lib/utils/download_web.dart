// Only compiled on web via conditional imports
import 'dart:html' as html;

Future<void> downloadFile(String url, {String? fileName}) async {
  final html.AnchorElement anchor = html.AnchorElement(href: url)
    ..download = fileName ?? ''
    ..style.display = 'none';
  html.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
