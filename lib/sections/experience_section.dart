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
            elevation: 0,
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
                    'Lead end‑to‑end mobile development for multiple production Flutter apps.',
                  ),
                  _bullet(
                    'Implemented Clean Architecture, modular codebases, and optimized performance.',
                  ),
                  _bullet(
                    'Managed app publishing to Play Store & App Store with CI/CD pipelines.',
                  ),
                  _bullet(
                    'Collaborated across teams to ensure high‑quality releases and mentoring juniors.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
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
                    'Developed and maintained production‑ready Flutter applications.',
                  ),
                  _bullet(
                    'Integrated biometrics, IoT, and real‑time data synchronization for enterprise clients.',
                  ),
                  _bullet(
                    'Delivered optimized mobile solutions ensuring smooth performance and scalability.',
                  ),
                  _bullet(
                    'Collaborated with backend and hardware teams for alignment and testing.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
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
                    'Delivered staging and production apps in Flutter for diverse clients.',
                  ),
                  _bullet(
                    'Optimized app performance and improved UI responsiveness for low‑end devices.',
                  ),
                  _bullet(
                    'Integrated secure APIs and payment gateways ensuring data integrity.',
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
