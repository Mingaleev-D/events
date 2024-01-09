import 'package:auto_route/annotations.dart';
import 'package:events/features/ui/common_widgets/positioned_button.dart';
import 'package:flutter/material.dart';
import '../../../data/model/event.dart';
import 'widgets/about_selection.dart';
import 'widgets/event_section.dart';
import 'widgets/sliver_image_app_bar.dart';
import 'widgets/speaker_selection.dart';

@RoutePage()
class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverImageAppBar(event: event),
                EventSection(event: event),
                SpeakerSelection(event: event),
                AboutSelection(event: event)
              ],
            ),
            PositionedButton(
              text: 'Book',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
