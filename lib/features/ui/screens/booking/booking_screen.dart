import 'package:auto_route/annotations.dart';
import 'package:events/features/data/model/event.dart';
import 'package:events/features/ui/common_widgets/positioned_button.dart';
import 'package:events/features/ui/screens/home/widgets/event_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.event});

  final Event event;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late ValueNotifier<int> _quantityNotifier;

  @override
  void initState() {
    super.initState();
    _quantityNotifier = ValueNotifier(1);
  }

  @override
  void dispose() {
    _quantityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Event',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: _quantityNotifier,
                    builder: (context, value, _) {
                      return EventItem(
                        event: widget.event,
                        withQuantity: true,
                        quantity: value,
                        onDecrement: () => _quantityNotifier.value--,
                        onIncrement: () => _quantityNotifier.value++,
                      );
                    })
              ],
            ),
            PositionedButton(
              text: 'Proceed to payment',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
