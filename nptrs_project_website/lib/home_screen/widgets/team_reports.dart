import 'package:flutter/material.dart';

class TeamReports extends StatelessWidget {
  const TeamReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "Team Reports\n",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ]))));
  }
}
