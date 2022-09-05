import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pwa_demo/ext.dart';
import 'package:pwa_demo/main.dart';

import '../data/models/job_model.dart';
import 'widgets/detail_widgets.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    JobModel? job;

    try {
      job = context.provider!.jobs.firstWhere(
          (element) => element.id.toString() == state.pathParameters['id']);
    } catch (e) {}

    return [
      const BeamPage(
        key: ValueKey('home'),
        title: "Home",
        name: '/',
        child: MyHomePage(
          currentIndex: 0,
        ),
      ),
      if (!context.isLargeScreen && state.pathParameters.containsKey('id'))
        BeamPage(
          key: ValueKey('job-${job!.id}'),
          title: "${job.company.name} - ${job.role}",
          name: '/:id',
          child: JobDetailWidget(
            model: job,
          ),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/:id'];
}

class InnerJobLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    JobModel? job;

    try {
      job = context.provider!.jobs.firstWhere(
          (element) => element.id.toString() == state.pathParameters['id']);
    } catch (e) {
      job = context.provider!.jobs.first;
    }

    return [
      if (state.pathParameters.containsKey('id'))
        BeamPage(
          key: ValueKey('job-${job.id}'),
          title: "${job.company.name} - ${job.role}",
          name: '/:id',
          child: JobDetailWidget(
            model: job,
          ),
        )
      else
        BeamPage(
          key: ValueKey('job-${job.id}'),
          title: "${job.company.name} - ${job.role}",
          name: '/0',
          child: JobDetailWidget(
            model: job,
          ),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/:id'];
}
