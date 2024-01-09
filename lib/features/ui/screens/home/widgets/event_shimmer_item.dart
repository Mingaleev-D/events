import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventShimmerItem extends StatelessWidget {
  const EventShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.white54,
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 8.0),
            child: _Item(width: 70, height: 90),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Item(width: 100, height: 10),
                SizedBox(height: 5),
                _Item(width: 150, height: 15),
                SizedBox(height: 8),
                _Item(width: 80, height: 10),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 8.0),
            child: Column(
              children: [
                _Item(width: 50, height: 30),
                SizedBox(height: 7),
                _Item(width: 40, height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8))),
    );
  }
}
