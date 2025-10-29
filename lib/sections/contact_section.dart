import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/download.dart';
import '../widgets/layout.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static Future<void> _open(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Get in touch'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () => _open('mailto:mohadel1033@gmail.com'),
                icon: const Icon(Icons.email_outlined),
                label: const Text('mohadel1033@gmail.com'),
              ),
              OutlinedButton.icon(
                onPressed: () => _open('tel:01060168799'),
                icon: const Icon(Icons.call),
                label: const Text('01060168799'),
              ),
              OutlinedButton.icon(
                onPressed: () =>
                    _open('https://www.linkedin.com/in/mohamed--adel/'),
                icon: const Icon(Icons.link),
                label: const Text('LinkedIn'),
              ),
              OutlinedButton.icon(
                onPressed: () => _open('https://github.com/mohadmed-adel'),
                icon: const Icon(Icons.code),
                label: const Text('GitHub'),
              ),
              FilledButton.tonalIcon(
                onPressed: () => downloadFile(
                  '/Mohamed_Adel_Senior_Flutter_CV.pdf',
                  fileName: 'Mohamed_Adel_Senior_Flutter_CV.pdf',
                ),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Download CV (PDF)'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
