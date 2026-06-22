import 'package:beans/ui/widgets/stream_button.dart';
import 'package:flutter/material.dart';

import '../../stream/number_stream.dart';

class StreamNumbersWidget extends StatefulWidget {
  const StreamNumbersWidget({super.key});

  @override
  State<StreamNumbersWidget> createState() => _StreamNumbersWidgetState();
}

class _StreamNumbersWidgetState extends State<StreamNumbersWidget> {
  final NumberStream _controller = NumberStream();

  void _startStream() {
    _controller.start();
  }

  void _stopStream() {
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<int>(
            stream: _controller.stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.data?.toString() ?? '0',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: StreamButtonWidget(
                  isStartStream: true,
                  onTap: _startStream,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: StreamButtonWidget(onTap: _stopStream)),
            ],
          ),
        ],
      ),
    );
  }
}
