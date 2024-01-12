import 'package:auto_route/annotations.dart';
import 'package:events/di/di.dart';
import 'package:events/features/data/model/event.dart';
import 'package:events/features/ui/common_widgets/positioned_button.dart';
import 'package:events/features/ui/routes/navigation/home_nav.dart';
import 'package:events/features/ui/screens/home/widgets/event_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../data/model/payment_mock.dart';

@RoutePage()
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.event});

  final Event event;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late ValueNotifier<int> _quantityNotifier;
  late ValueNotifier<int> _paymentNotifier;

  @override
  void initState() {
    super.initState();
    _quantityNotifier = ValueNotifier(1);
    _paymentNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    _quantityNotifier.dispose();
    _paymentNotifier.dispose();
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
                    }),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Payment method',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ...List.generate(
                    paymentMethods.length,
                    (index) => ValueListenableBuilder(
                        valueListenable: _paymentNotifier,
                        builder: (context, value, _) {
                          return _PaymentsWidget(
                            isSelected: index == value,
                            text: paymentMethods[index].name,
                            imagePath: paymentMethods[index].imagePath,
                            onPressed: () => _paymentNotifier.value = index,
                          );
                        })),
              ],
            ),
            PositionedButton(
              text: 'Proceed to payment',
              onPressed: () => getIt<HomeNav>().openPayment(),
            )
          ],
        ),
      ),
    );
  }
}

class _PaymentsWidget extends StatelessWidget {
  const _PaymentsWidget(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.imagePath,
      required this.onPressed});

  final bool isSelected;
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        onTap: () => onPressed(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ),
        selected: isSelected,
        tileColor: Colors.grey.shade300,
        selectedTileColor: Colors.grey.shade400,
        leading: Image.asset(
          imagePath,
          height: 28,
          width: 28,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
        ),
        trailing: isSelected
            ? const Icon(FluentIcons.checkmark_16_filled, color: Colors.black)
            : null,
      ),
    );
  }
}
