import 'package:flutter/material.dart';

class TeamOverview extends StatelessWidget {
  const TeamOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Column(children: [
              Text.rich(
                TextSpan(
                  text: "Team Members\n",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TeamMemberCard(
                        name: 'Tyler Yankee',
                        role: 'Backend and Database',
                        about: 'Tyler is a Data Science, Computer Science '
                            'double major. Tyler took the lead on database '
                            'configuration, and scheduling algorithms for the '
                            'Schedule Builder. In addition he also works with '
                            'Peter and Sangwon to integrate the front and back-end'),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TeamMemberCard(
                        name: 'Sangwon Youn',
                        role: 'Backend and User Authentication',
                        about: 'Sangwon is a senior Computer Science major '
                            'studying abroad at Clarkson. He is responsible for our '
                            'implementation of user authentication, including the user '
                            'sign up and login pages and works with Tyler and Peter to '
                            'integrate the front and back-end building API endpoints. '),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TeamMemberCard(
                        name: 'Niall Pepper',
                        role: 'Frontend',
                        about:
                            'Niall is a sophomore Computer Science student. His '
                            'focus is primarily on the frontend of the schedule builder. '
                            'He also implemented most user input forms besides user sign '
                            'up and login. He also works closely with Niall to maintain '
                            'the consistent look and feel of the frontend.'),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TeamMemberCard(
                        name: 'Peter Dorovitsine',
                        role: 'Backend and Requirements',
                        about:
                            'Peter is a senior Chemical Engineering major. His focus was '
                            'on the interactions between the front and back end, working '
                            'closely with Tyler and Sangwon. Peter collected and organized '
                            'the data from the registrar, and is the '
                            'requirements analyst for the team.'),
                  ]),
              Row(children: const [
                TeamMemberCard(
                    name: 'Robert Licata',
                    role: 'Frontend and API',
                    about:
                        'Robert is a sophomore Computer Science student. Robert is '
                        'responsible for the frontend representation of student information, '
                        'and maintaining some of the endpoints in the API they interact with.'),
              ]),
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
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: '$name\n',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      // const WidgetSpan(
                      //   child: SizedBox(height: 4),
                      // ),
                      TextSpan(
                        text: '$role\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 40,
              color: Colors.black,
            ),
            Flexible(
              flex: 4,
              child: Text.rich(
                TextSpan(
                  text: about,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
