import 'package:flutter/material.dart';

import '../widgets/layout.dart';

class SummaryAndSkills extends StatelessWidget {
  const SummaryAndSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Professional Summary'),
          const SizedBox(height: 8),
          const Text(
            'Performance-driven Senior Mobile Developer with 4+ years of experience specializing in Flutter and cross-platform development. '
            'Strong expertise in Clean Architecture, scalable modular systems, and advanced state management. '
            'Proven ability to deliver enterprise-grade applications including IoT systems, biometric authentication, and real-time platforms. '
            'Experienced in CI/CD automation, mentoring developers, and owning products from concept to store release.',
          ),
          const SizedBox(height: 24),
          const SectionTitle('Core Skills'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              SkillChip('Flutter'),
              SkillChip('Dart'),
              SkillChip('Clean Architecture (Modular)'),
              SkillChip('BLoC'),
              SkillChip('Riverpod'),
              SkillChip('GetX'),
              SkillChip('REST APIs'),
              SkillChip('Firebase'),
              SkillChip('Git & GitHub'),
              SkillChip('Codemagic'),
              SkillChip('App Store Connect'),
              SkillChip('Google Play Console'),
              SkillChip('Unit Testing'),
              SkillChip('Firebase Crashlytics'),
              SkillChip('Performance Profiling'),
              SkillChip('Push Notifications'),
              SkillChip('OAuth2 / PKCE'),
              SkillChip('Payment Gateways (Moyasar)'),
              SkillChip('Face & Biometric Auth'),
              SkillChip('Background Services'),
              SkillChip('Deep Linking'),
              SkillChip('SwiftUI'),
              SkillChip('iOS Development'),
            ],
          ),
          const SizedBox(height: 24),
          const SectionTitle('Education & Certifications'),
          const SizedBox(height: 8),
          const Text(
            '• Bachelor of Computer Science | Zagazig University — 2019',
          ),
          const SizedBox(height: 4),
          const Text('• Stanford CS193p: iOS Development with SwiftUI | 2025'),
        ],
      ),
    );
  }
}
