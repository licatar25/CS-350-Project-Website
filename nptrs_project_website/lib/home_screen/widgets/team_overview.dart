import 'package:flutter/material.dart';

class TeamOverview extends StatelessWidget {
  const TeamOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Column(children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Team Members\n",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                WidgetSpan(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                      TeamMemberCard(
                          name: 'Tyler Yankee',
                          role: 'Backend and Database',
                          about:
                              'About: Tyler is a Data Science, Computer Science double major.'),
                      TeamMemberCard(
                          name: 'Sangwon Youn',
                          role: 'Backend and User Authentication',
                          about: 'About: '),
                      TeamMemberCard(
                          name: 'Niall Pepper',
                          role: 'Frontend',
                          about: 'About:'),
                      TeamMemberCard(
                          name: 'Peter Dorvitsine', role: '', about: ''),
                      TeamMemberCard(
                          name: 'Robert Licata', role: 'role', about: ''),
                    ]))
              ]))
            ])));
  }
}

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String about;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: '$name\n',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextSpan(
                      text: '$role\n',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextSpan(
                      text: '$about\n',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
