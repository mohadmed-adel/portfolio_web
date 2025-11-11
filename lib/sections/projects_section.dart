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
      elevation: 0,
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
              title: 'Tell Me Now',
              description:
                  'Task collaboration and messaging app with phone‑number sign‑in and real‑time updates.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/tell-me-now/id6747941577',
                ),
              ],
            ),
            _card(
              context,
              title: 'AicTime',
              description:
                  'Real‑time attendance tracking with biometric & IoT integration.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/aictime/id1642321818',
                ),
              ],
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
              title: 'المنصة الزراعية',
              description:
                  'Agricultural platform connecting farmers and traders with marketplace services.',
              links: const [
                (
                  'App Store',
                  'https://apps.apple.com/eg/app/%D8%A7%D9%84%D9%85%D9%86%D8%B5%D8%A9-%D8%A7%D9%84%D8%B2%D8%B1%D8%A7%D8%B9%D9%8A%D8%A9/id1445694218',
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
              title: 'Clean Architecture Riverpod Template',
              description:
                  'Production-ready Flutter template demonstrating clean architecture principles with Riverpod state management. Features layered architecture (data, domain, presentation), dependency injection, error handling, and best practices for scalable app development.',
              links: const [
                (
                  'GitHub',
                  'https://github.com/mohadmed-adel/clean-architecture-riverpod.git',
                ),
              ],
            ),
            _card(
              context,
              title: 'Clean Architecture BLoC Template',
              description:
                  'Flutter template showcasing clean architecture with BLoC pattern state management. Includes feature-based structure, Freezed for immutable models, GoRouter for navigation, dependency injection with GetIt, and comprehensive testing setup. Demonstrates event-driven architecture with proper separation of concerns.',
              links: const [
                (
                  'GitHub',
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
