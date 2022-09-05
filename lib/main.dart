import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pwa_demo/ext.dart';
import 'package:pwa_demo/presentation/widgets/job_list.dart';

import 'presentation/beamer_location.dart';
import 'presentation/current_screen_provider.dart';
import 'presentation/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routerDelegate = BeamerDelegate(
    locationBuilder: (routeInformation, _) {
      return HomeLocation();
    },
  );

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: LayoutBuilder(builder: (context, constraint) {
        return MaterialApp.router(
          title: 'JobFree',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              chipTheme: const ChipThemeData(
                  labelStyle: TextStyle(
                fontSize: 11,
              )),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 1.0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textTheme: const TextTheme(
                headline6: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                bodyText2: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5656565),
                  fontSize: 12,
                ),
              )),
          routeInformationParser: BeamerParser(),
          routerDelegate: routerDelegate,
          backButtonDispatcher:
              BeamerBackButtonDispatcher(delegate: routerDelegate),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final innerRouterDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: (routeInformation, _) {
      return InnerJobLocation();
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "JobFree",
          style: TextStyle(
              color: lightGreen,
              fontSize: 24,
              letterSpacing: 5,
              fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: paleGrey,
              backgroundImage:
                  NetworkImage("https://i.ibb.co/qLSDDvK/person-1.png"),
            ),
          )
        ],
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (!context.isLargeScreen) {
            return const JobList();
          } else {
            final showMargin = constraints.maxWidth > 1200;

            final horizontalMargin =
                showMargin ? constraints.maxWidth * .1 : 0.0;

            final listviewMaxWidth =
                constraints.maxWidth * (showMargin ? 0.3 : 0.4);
            final detailMaxWidth =
                constraints.maxWidth * (showMargin ? 0.5 : 0.6);

            return Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: listviewMaxWidth, child: const JobList()),
                  SizedBox(
                    width: detailMaxWidth,
                    child: Beamer(
                      key: context.provider!.childBeamerKey,
                      routerDelegate: innerRouterDelegate,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

}
