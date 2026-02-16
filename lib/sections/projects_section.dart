import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static Future<void> _open(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Widget _card(
    BuildContext context, {
    required String title,
    required String description,
    required List<(String, String)> links, // (label, url)
  }) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      color: Theme.of(context).colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(
            context,
          ).colorScheme.outlineVariant.withValues(alpha: 0.2),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: links
                  .map(
                    (l) => OutlinedButton.icon(
                      onPressed: () => _open(l.$2),
                      icon: Icon(
                        l.$1.toLowerCase().contains('play')
                            ? Icons.android
                            : l.$1.toLowerCase().contains('github') ||
                                  l.$1.toLowerCase().contains('repo')
                            ? Icons.code
                            : Icons.apple,
                      ),
                      label: Text(l.$1),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth >= 900;
          final int columns = isWide ? 2 : 1;
          final double gap = 16;
          final double cardWidth = isWide
              ? (constraints.maxWidth - gap) / columns
              : constraints.maxWidth;

          final List<Widget> cards = [
            _card(
              context,
              title: 'Tell Me',
              description:
                  'Task-driven collaboration platform with secure phone authentication, real-time messaging, and scalable backend integration.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/tell-me-now/id6747941577',
                ),
              ],
            ),
            _card(
              context,
              title: 'AICTIME',
              description:
                  'Enterprise IoT attendance system with biometric integration, secure low-latency data sync, and high reliability.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/aictime/id1642321818',
                ),
              ],
            ),
            _card(
              context,
              title: 'AgriUnions',
              description:
                  'Large-scale marketplace for the Saudi agricultural sector featuring advanced search, secure payments, and real-time tracking.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D9%86%D8%B5%D8%A9-%D8%A7%D9%84%D8%B2%D8%B1%D8%A7%D8%B9%D9%8A%D8%A9/id1445694218',
                ),
              ],
            ),
            _card(
              context,
              title: 'Zontec',
              description:
                  'Event management platform with real-time booking, check-in system, and optimized UI/UX for high concurrency.',
              links: const [], // No link provided in CV
            ),
            _card(
              context,
              title: 'Erba7',
              description:
                  'Mobile app for offers and rewards to help users save and earn.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/erba7/id6751342864',
                ),
              ],
            ),
            _card(
              context,
              title: 'Ogee Decor',
              description:
                  'Interior design assistant with real‑world materials and instant cost estimation.',
              links: const [
                (
                  'Google Play',
                  'https://play.google.com/store/apps/details?id=com.ogee',
                ),
              ],
            ),
            _card(
              context,
              title: 'Clean Architecture Boilerplates',
              description:
                  'Modular Flutter boilerplates (Riverpod & BLoC) adopted across production apps to improve development speed and code consistency.',
              links: const [
                (
                  'Riverpod Repo',
                  'https://github.com/mohadmed-adel/clean-architecture-riverpod.git',
                ),
                (
                  'BLoC Repo',
                  'https://github.com/mohadmed-adel/clean-architecture-riverpod/tree/bloc',
                ),
              ],
            ),
          ];

          return Wrap(
            spacing: gap,
            runSpacing: gap,
            children: cards
                .map((c) => SizedBox(width: cardWidth, child: c))
                .toList(),
          );
        },
      ),
    );
  }
}
