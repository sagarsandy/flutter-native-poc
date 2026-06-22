import 'package:beans/cubit/battery/battery_cubit.dart';
import 'package:beans/platform/native_communication.dart';
import 'package:beans/ui/widgets/battery_widget.dart';
import 'package:beans/ui/widgets/device_info.dart';
import 'package:beans/ui/widgets/stream_numbers_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BatteryCubit batteryCubit = BatteryCubit();

  @override
  void initState() {
    super.initState();
    batteryCubit.startListening();
  }

  Future<void> handleInfoIconTap() async {
    final Object version =
        await NativeCommunication.invoke<int>(method: "getBatteryLevel") ??
        "--";
    print("The version is $version");
    try {
      await NativeCommunication.invoke<void>(method: "openSettings");
    } catch (_) {
      print("Something wrogn !!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            DeviceInfoWidget(),
            BatteryWidget(),
            StreamNumbersWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info_outline, size: 32),
        onPressed: () {
          handleInfoIconTap();
        },
      ),
    );
  }
}
