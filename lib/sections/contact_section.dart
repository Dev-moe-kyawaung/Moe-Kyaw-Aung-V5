import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/bento_card.dart';
import '../widgets/open_url.dart';
import '../widgets/section_header.dart';

class ContactSection extends StatefulWidget {
  final GlobalKey contactKey;
  const ContactSection({super.key, required this.contactKey});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      key: widget.contactKey,
      margin: const EdgeInsets.only(bottom: 22),
      child: BentoCard(
        tone: 2,
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, c) {
            final mobile = c.maxWidth < 900;

            return Flex(
              direction: mobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeader(
                        label: 'Contact',
                        title: 'Let’s build.',
                        subtitle: 'A clean contact area with form validation and direct links.',
                      ),
                      const SizedBox(height: 16),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: name,
                              decoration: const InputDecoration(labelText: 'Name'),
                              validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: email,
                              decoration: const InputDecoration(labelText: 'Email'),
                              validator: (v) => (v == null || !v.contains('@')) ? 'Please enter a valid email' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: message,
                              maxLines: 5,
                              decoration: const InputDecoration(labelText: 'Message'),
                              validator: (v) => (v == null || v.trim().length < 10)
                                  ? 'Message should be at least 10 characters'
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: FilledButton.icon(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Message ready to send')),
                                    );
                                  }
                                },
                                icon: const Icon(Icons.send_rounded, size: 18),
                                label: const Text('Send Message'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20, height: 20),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ContactBox(
                        title: 'Social Links',
                        child: Column(
                          children: AppData.socialLinks.map(
                            (s) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: TextButton(
                                  onPressed: () => openUrl(s['url']!),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      s['name']!,
                                      style: TextStyle(
                                        color: dark ? AppTheme.textDark : AppTheme.textLight,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _ContactBox(
                        title: 'Direct',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: ${AppData.contactEmail}'),
                            const SizedBox(height: 10),
                            ...AppData.contactPhones.map((p) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(p),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ContactBox extends StatelessWidget {
  final String title;
  final Widget child;

  const _ContactBox({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: dark ? AppTheme.panelDark.withOpacity(0.30) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: AppTheme.yellow, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
