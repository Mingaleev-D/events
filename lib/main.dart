import 'package:events/core/design.dart';
import 'package:flutter/material.dart';

import 'features/ui/details/screens/event_details_screen.dart';
import 'features/ui/model/mock.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme: nunitosans,
        ),
        home: EventDetailsScreen(event: generateEvents[0])
        // const EventListScreens(),
        );
  }
}
