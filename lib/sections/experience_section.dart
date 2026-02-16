import 'package:flutter/material.dart';

import '../widgets/layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  Widget _bullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• '),
        Expanded(child: Text(text)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Professional Experience'),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shadowColor: Colors.black12,
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
                    'Mobile Application Developer – The United Systems | Jan 2024 – Present',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _bullet(
                    'Leading end-to-end development of multiple production Flutter applications.',
                  ),
                  _bullet(
                    'Standardized Clean Architecture and modular codebases, reducing technical debt.',
                  ),
                  _bullet(
                    'Automated build & release workflows using CI/CD pipelines.',
                  ),
                  _bullet(
                    'Mentored junior developers and enforced high-quality code reviews.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shadowColor: Colors.black12,
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
                    'Mobile Engineer – ZKTeco | Mar 2022 – May 2024',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _bullet(
                    'Developed enterprise Flutter applications for clients across the MENA region.',
                  ),
                  _bullet(
                    'Worked closely with IoT and hardware teams to align mobile and device features.',
                  ),
                  _bullet(
                    'Optimized rendering and memory usage to maintain 60 FPS on mid-range devices.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shadowColor: Colors.black12,
            color: Theme.of(context).colorScheme.surfaceContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
                    'Mobile Engineer – Innovation Agency | Mar 2021 – Mar 2022',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _bullet(
                    'Delivered cross-platform mobile apps for startups and enterprise clients.',
                  ),
                  _bullet(
                    'Integrated third-party APIs and payment systems with a strong focus on security.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
