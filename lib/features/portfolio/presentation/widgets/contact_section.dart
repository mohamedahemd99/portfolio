import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/gradient_text.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: info.spacing(ResponsiveSpacing.md),
            vertical: info.spacing(ResponsiveSpacing.xxl),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.contentMaxWidth,
            ),
            child: Column(
              children: [
                GradientText(
                  'Get In Touch',
                  gradient: AppColors.primaryGradient,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
                Container(
                  width: 60,
                  height: 4,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.md)),
                Text(
                  'Let\'s work together on your next project',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Content
                if (info.isMobile)
                  Column(
                    children: [
                      _buildContactInfo(info),
                      SizedBox(height: info.spacing(ResponsiveSpacing.xl)),
                      _buildContactForm(info),
                    ],
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContactInfo(info)),
                      SizedBox(width: info.spacing(ResponsiveSpacing.xl)),
                      Expanded(flex: 2, child: _buildContactForm(info)),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactInfo(ResponsiveInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Information',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.md)),

        const Text(
          'Feel free to reach out through any of these channels.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

        _ContactItem(
          icon: Icons.location_on,
          title: 'Location (UAE)',
          value: PortfolioData.location,
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

        _ContactItem(
          icon: Icons.location_on,
          title: 'Location (Egypt)',
          value: PortfolioData.location1,
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

        _ContactItem(
          icon: Icons.email,
          title: 'Email',
          value: PortfolioData.email,
          isLink: true,
          onTap: () => _launchURL('mailto:${PortfolioData.email}'),
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

        _ContactItem(
          icon: Icons.phone,
          title: 'Phone (UAE)',
          value: PortfolioData.phone,
          isLink: true,
          onTap: () => _launchURL('tel:${PortfolioData.phone}'),
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

        _ContactItem(
          icon: Icons.phone,
          title: 'Phone (Egypt)',
          value: PortfolioData.phone1,
          isLink: true,
          onTap: () => _launchURL('tel:${PortfolioData.phone1}'),
        ),
      ],
    );
  }

  Widget _buildContactForm(ResponsiveInfo info) {
    return GlassContainer(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.xl)),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                hintText: 'John Doe',
              ),
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            SizedBox(height: info.spacing(ResponsiveSpacing.md)),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Your Email',
                hintText: 'john@example.com',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Required';
                if (!value!.contains('@')) return 'Invalid email';
                return null;
              },
            ),
            SizedBox(height: info.spacing(ResponsiveSpacing.md)),

            TextFormField(
              controller: _subjectController,
              decoration: const InputDecoration(labelText: 'Subject'),
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            SizedBox(height: info.spacing(ResponsiveSpacing.md)),

            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message'),
              maxLines: 5,
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

            GradientButton(
              text: 'Send Message',
              icon: Icons.send,
              width: double.infinity,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent!')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool isLink;
  final VoidCallback? onTap;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.value,
    this.isLink = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              isLink && onTap != null
                  ? GestureDetector(
                onTap: onTap,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
                  : Text(
                value,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}