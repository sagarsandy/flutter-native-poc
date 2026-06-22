import 'package:flutter/material.dart';

class StreamButtonWidget extends StatelessWidget {
  final Function onTap;
  final bool isStartStream;
  const StreamButtonWidget({
    super.key,
    this.isStartStream = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isStartStream ? Icons.play_arrow : Icons.stop_circle),
          const SizedBox(width: 8),
          Text(isStartStream ? 'Start Stream' : 'Stop Stream'),
        ],
      ),
    );
  }
}
