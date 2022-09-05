import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pwa_demo/job_model.dart';
import 'package:pwa_demo/extensions.dart';
import 'package:pwa_demo/widgets/company_profile_avatar.dart';

import '../colors.dart';

class JobList extends StatelessWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobs = context.provider.jobs;

    return ListView.builder(
      itemCount: jobs.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (c, index) => JobCard(
        model: jobs[index],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final JobModel model;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.isLargeScreen
            ? context.provider.childBeamerKey.currentState?.routerDelegate
                .beamToNamed('/${model.id}', routeState: 'large')
            : context.beamToNamed('/${model.id}', routeState: 'small');
      },
      child: AnimatedBuilder(
          animation: context.isLargeScreen
              ? context.provider.childBeamerKey.currentState!.routerDelegate
              // Prevent uneccessary build when in small screen mode
              : Listenable.merge([]),
          builder: (context, _) {
            return Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-3, 2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    color: Colors.grey[200]!,
                  )
                ],
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: _isSelected(context) ? lightGreen : Colors.transparent,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CompanyProfileAvatar(company: model.company),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                model.role,
                                style: textTheme.headline6,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "\$${model.salaryRange[0]} - ${model.salaryRange[1]}K/${model.salaryInterval}",
                              style: textTheme.bodyText2!,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Wrap(
                          runSpacing: 4.0,
                          spacing: 4.0,
                          children: [
                            _buildChip(context, model.role,
                                color: Colors.grey[200]),
                            _buildChip(context, model.type,
                                color: Colors.grey[200])
                          ],
                        ),
                      ),
                      _buildChip(
                        context,
                        "Apply",
                        color: paleGold,
                        horizontalPad: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  bool _isSelected(BuildContext context) {
    if (!context.isLargeScreen) return false;

    final params = (context.provider.childBeamerKey.currentState
            ?.currentBeamLocation.state as BeamState)
        .pathParameters;

    return params['id'] == model.id.toString();
  }

  Widget _buildChip(
    BuildContext context,
    String text, {
    Color? color,
    double? horizontalPad,
    FontWeight? fontWeight,
  }) =>
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          padding:
              EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPad ?? 8),
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).chipTheme.labelStyle!.copyWith(
                  fontWeight: fontWeight,
                ),
          ),
        ),
      );
}
