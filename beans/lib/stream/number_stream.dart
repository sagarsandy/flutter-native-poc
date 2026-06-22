import 'dart:async';

class NumberStream {
  final StreamController<int> _controller = StreamController<int>();

  Timer? _timer;

  bool _isRunning = false;

  Stream<int> get stream => _controller.stream;

  bool get isRunning => _isRunning;

  int _count = 1;

  void start() {
    if (_isRunning) {
      print("Stream is already running");
      return;
    }

    _isRunning = true;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _controller.add(_transform(_count));

      _count++;

      if (_count > 100) {
        _count = 1;
      }
    });
  }

  int _transform(int value) {
    return value;
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
  }

  void dispose() {
    stop();
    _controller.close();
  }
}
