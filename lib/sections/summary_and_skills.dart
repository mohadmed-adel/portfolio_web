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
            'Senior Flutter Engineer with 4+ years of experience designing, developing, and deploying cross‑platform mobile applications. '
            'Specialized in Flutter & Dart with proven expertise in clean architecture, state management, and scalable app delivery. '
            'Strong focus on performance optimization, CI/CD, and mentoring teams to deliver user‑centric, production‑grade apps.',
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
              SkillChip('REST APIs'),
              SkillChip('GraphQL'),
              SkillChip('Firebase'),
              SkillChip('Clean Architecture'),
              SkillChip('BLoC'),
              SkillChip('Riverpod'),
              SkillChip('GetX'),
              SkillChip('GitHub'),
              SkillChip('Codemagic'),
              SkillChip('App Store Connect'),
              SkillChip('Play Console'),
              SkillChip('Unit Testing'),
              SkillChip('Crashlytics'),
              SkillChip('Push Notifications'),
              SkillChip('OAuth2'),
              SkillChip('Payments'),
              SkillChip('Face Auth'),
              SkillChip('Background Services'),
            ],
          ),
        ],
      ),
    );
  }
}
