import 'package:flutter/material.dart';

import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/summary_and_skills.dart';
import 'utils/download.dart';
import 'widgets/layout.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamed Adel | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _appsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // no-op helper removed; using downloadFile for CV and url_launcher per button actions

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final BuildContext? ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width >= 900;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mohamed Adel'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        actions: isWide
            ? [
                TextButton(
                  onPressed: () => _scrollTo(_homeKey),
                  child: const Text('Home'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_aboutKey),
                  child: const Text('Summary & Skills'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_appsKey),
                  child: const Text('Projects'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_projectsKey),
                  child: const Text('Experience'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_contactKey),
                  child: const Text('Contact'),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: () => downloadFile(
                    '/Mohamed_Adel_Senior_Flutter_CV.pdf',
                    fileName: 'Mohamed_Adel_Senior_Flutter_CV.pdf',
                  ),
                  icon: const Icon(Icons.picture_as_pdf),
                  label: const Text('Download CV'),
                ),
                const SizedBox(width: 12),
              ]
            : null,
      ),
      drawer: isWide
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Navigation',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollTo(_homeKey);
                    },
                  ),
                  ListTile(
                    title: const Text('Summary & Skills'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollTo(_aboutKey);
                    },
                  ),
                  ListTile(
                    title: const Text('Projects'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollTo(_appsKey);
                    },
                  ),
                  ListTile(
                    title: const Text('Experience'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollTo(_projectsKey);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollTo(_contactKey);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.picture_as_pdf),
                    title: const Text('Download CV (PDF)'),
                    onTap: () {
                      Navigator.pop(context);
                      downloadFile(
                        '/Mohamed_Adel_Senior_Flutter_CV.pdf',
                        fileName: 'Mohamed_Adel_Senior_Flutter_CV.pdf',
                      );
                    },
                  ),
                ],
              ),
            ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Section(
                key: _homeKey,
                background: null,
                child: const HeroSection(),
              ),
              Section(
                key: _aboutKey,
                background: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                child: const SummaryAndSkills(),
              ),
              Section(key: _appsKey, child: const ProjectsSection()),
              Section(key: _projectsKey, child: const ExperienceSection()),
              Section(
                key: _contactKey,
                background: Theme.of(context).colorScheme.surfaceContainerHigh,
                child: const ContactSection(),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
