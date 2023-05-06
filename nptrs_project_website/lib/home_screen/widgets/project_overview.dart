import 'package:flutter/material.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsetsDirectional.all(24),
      child: Row(
        children: [
          Flexible(
              flex: 2,
              child: Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: "Project Overview\n",
                      style: Theme.of(context).textTheme.headlineMedium),
                  TextSpan(
                    text: """
Majorizer is an application that simplifies course planning for students and advisors. It streamlines the tedious process of crossreferencing prerequisites and common courses between majors and minors.\n
Features:
  -   Add and save up to two majors and two minors to be considered for course planning.
  -   Add and save previous courses to generate schedules that account for credit already earned.
  -   Integrated Course Catalog, GPA Calculator, and Advisor Contact page for easy access to commonly needed information.                        
  -   Student list for Advisor's convenience.
""",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ))),
          const SizedBox(width: 24),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Image.asset(
              "/schedulebuilder_screenshot.png",
              alignment: Alignment.centerRight,
              semanticLabel: "Schedule Builder Screenshot",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ));
  }
}
