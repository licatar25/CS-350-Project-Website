import "package:flutter/material.dart";
import "widgets/project_overview.dart";
import 'widgets/team_overview.dart';
import 'widgets/team_reports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NPTRS Majorizer",
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        body: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height,
          child: ListView(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
              children: const [
                ProjectOverview(),
                SizedBox(height: 8),
                TeamOverview(),
                SizedBox(height: 8),
                TeamReports(),
              ]),
        )));
  }
}
