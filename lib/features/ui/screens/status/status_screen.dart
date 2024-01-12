import 'package:auto_route/annotations.dart';
import 'package:events/di/di.dart';
import 'package:events/features/ui/common_widgets/positioned_button.dart';
import 'package:events/features/ui/routes/navigation/home_nav.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key, required this.isSuccess});

  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 32,
              right: 32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                    ),
                    child: Icon(isSuccess
                        ? FluentIcons.checkmark_16_regular
                        : FluentIcons.closed_caption_16_regular),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isSuccess ? 'Success!' : 'Failed!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            PositionedButton(
              text: 'Back to main',
              onPressed: () => getIt<HomeNav>().backToBooking(),
            )
          ],
        ),
      ),
    );
  }
}
