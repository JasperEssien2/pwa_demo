import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pwa_demo/data/models/job_model.dart';

import 'theme/colors.dart';

class AppProvider extends InheritedWidget {
  AppProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  final childBeamerKey = GlobalKey<BeamerState>();

  final jobs = [
    JobModel(
      id: 0,
      role: "Product Designer",
      type: "Full-time",
      position: "Entry-Level",
      description: """
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
      salaryRange: [120, 250],
      salaryInterval: "Month",
      postedDate: "24hr",
      company: Company(
        icon: FontAwesomeIcons.google,
        location: 'California',
        name: 'Google',
        backgroundColor: Colors.orange[300],
      ),
    ),
    JobModel(
      id: 1,
      role: "IOS Developer",
      type: "Full-time",
      position: "Mid-Senior Level",
      description: """
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
      salaryRange: [150, 200],
      salaryInterval: "Month",
      postedDate: "1hr",
      company: Company(
        icon: Icons.apple,
        location: 'California',
        name: 'Apple',
        backgroundColor: Colors.grey[350],
      ),
    ),
    JobModel(
      id: 2,
      role: "Flutter Mobile Developer",
      type: "Contract",
      position: "Senior-Level",
      description: """
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
      salaryRange: [50, 70],
      salaryInterval: "Hour",
      postedDate: "2Wks",
      company: Company(
        icon: FontAwesomeIcons.google,
        location: 'Canada',
        name: 'Google',
        backgroundColor: Colors.orange[300],
      ),
    ),
    JobModel(
      id: 3,
      role: "Technical Product Manager",
      type: "Full-time",
      position: "Senior-Level",
      description: """
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
      salaryRange: [250, 300],
      salaryInterval: "Month",
      postedDate: "30days",
      company: Company(
        icon: FontAwesomeIcons.facebook,
        location: 'Sweden',
        name: 'Facebook',
        backgroundColor: paleBlue,
      ),
    ),
    JobModel(
      id: 4,
      role: "Aws Engineer",
      type: "Contract",
      position: "Entry-Level",
      description: """
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
      salaryRange: [50, 120],
      salaryInterval: "Month",
      postedDate: "30days",
      company: Company(
        icon: FontAwesomeIcons.amazon,
        location: 'Germany',
        name: 'Amazon',
        backgroundColor: Colors.deepPurple[300],
      ),
    ),
  ];

  static AppProvider of(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<AppProvider>()!
        .widget as AppProvider;
  }

  @override
  bool updateShouldNotify(AppProvider oldWidget) {
    return false;
  }
}
