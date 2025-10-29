import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/download.dart';
import '../widgets/layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primaryContainer, scheme.surface],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ConstrainedLayout(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool isWide = constraints.maxWidth >= 900;
              return isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Expanded(child: _IntroText()),
                        SizedBox(width: 32),
                        Expanded(child: _ContactCard()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _IntroText(),
                        SizedBox(height: 24),
                        _ContactCard(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}

class _IntroText extends StatelessWidget {
  const _IntroText();

  // Uses url_launcher via buttons above; no direct helpers needed here.

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Senior Flutter Engineer",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: primary),
        ),
        const SizedBox(height: 8),
        Text(
          'Mohamed Adel',
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          '4+ years designing, developing, and deploying cross‑platform Flutter apps.\n'
          'Expert in clean architecture, state management, CI/CD, and performance.',
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            SkillChip('Flutter'),
            SkillChip('Dart'),
            SkillChip('Clean Architecture'),
            SkillChip('BLoC / Riverpod / GetX'),
            SkillChip('REST / GraphQL'),
            SkillChip('Firebase'),
            SkillChip('CI/CD'),
          ],
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => downloadFile(
            '/Mohamed_Adel_Senior_Flutter_CV.pdf',
            fileName: 'Mohamed_Adel_Senior_Flutter_CV.pdf',
          ),
          icon: const Icon(Icons.picture_as_pdf),
          label: const Text('Download CV (PDF)'),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  static Future<void> _open(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.call),
                SizedBox(width: 8),
                Text('01060168799'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.email_outlined),
                SizedBox(width: 8),
                Text('mohadel1033@gmail.com'),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                FilledButton.tonal(
                  onPressed: () => _open('mailto:mohadel1033@gmail.com'),
                  child: const Text('Email Me'),
                ),
                OutlinedButton(
                  onPressed: () =>
                      _open('https://www.linkedin.com/in/mohamed--adel/'),
                  child: const Text('LinkedIn'),
                ),
                OutlinedButton(
                  onPressed: () => _open('https://github.com/mohadmed-adel'),
                  child: const Text('GitHub'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
