import 'package:flutter/material.dart';
import 'package:pwa_demo/data/models/job_model.dart';
import 'package:pwa_demo/ext.dart';
import 'package:pwa_demo/presentation/theme/colors.dart';

import 'user_profile_avatar.dart';

class JobDetailWidget extends StatelessWidget {
  const JobDetailWidget({Key? key, required this.model}) : super(key: key);

  final JobModel model;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: context.isLargeScreen
          ? null
          : AppBar(
              title: Text(
                model.role,
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _CompanyInfoWidget(model: model),
            _JobBenefitWidget(model: model),
            Padding(
              padding: const EdgeInsets.all(24).copyWith(top: 35),
              child: Text(
                "Description",
                style: textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                model.description,
                style: textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(50)),
                ),
                child: const Text(
                  "Apply Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CompanyInfoWidget extends StatelessWidget {
  const _CompanyInfoWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final JobModel model;

  @override
  Widget build(BuildContext context) {
    const dot =
        Expanded(child: CircleAvatar(radius: 2, backgroundColor: Colors.grey));

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: grayColor,
              borderRadius: BorderRadius.circular(7),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 36),
                Text(
                  "${model.role}\n",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.company.name),
                      ...[dot, Text(model.company.location), dot],
                      Text(model.postedDate),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CompanyProfileAvatar(
              company: model.company,
              radius: 40,
            ),
          )
        ],
      ),
    );
  }
}

class _JobBenefitWidget extends StatelessWidget {
  const _JobBenefitWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final JobModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBenefit(
            context,
            benefitCaption: "Salary",
            benefit: "\$${model.salaryRange[0]} - ${model.salaryRange[1]}K",
            color: paleGold,
            iconData: Icons.monetization_on_outlined,
          ),
          _buildBenefit(
            context,
            benefitCaption: "Job Type",
            benefit: model.type,
            color: palePurple,
            iconData: Icons.access_alarm_outlined,
          ),
          _buildBenefit(
            context,
            benefitCaption: "Position",
            benefit: model.position,
            color: paleBlue,
            iconData: Icons.accessibility_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildBenefit(
    BuildContext context, {
    required String benefitCaption,
    required String benefit,
    required Color color,
    required IconData iconData,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: Icon(iconData, size: 20, color: Colors.black87),
        ),
        const SizedBox(height: 12),
        Text(benefitCaption, style: textTheme.bodyText2),
        const SizedBox(height: 4),
        Text(benefit, style: textTheme.bodyText1!.copyWith(fontSize: 12)),
      ],
    );
  }
}
