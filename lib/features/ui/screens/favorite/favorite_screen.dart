import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Center(child: Text('favorite events will come here')),
    );
  }
}
