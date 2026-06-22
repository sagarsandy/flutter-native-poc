import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/battery/battery_cubit.dart';
import '../../cubit/battery/battery_state.dart';
import '../../utils/utils.dart';

class BatteryWidget extends StatefulWidget {
  const BatteryWidget({super.key});

  @override
  State<BatteryWidget> createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  final BatteryCubit _batteryCubit = BatteryCubit();

  @override
  void initState() {
    super.initState();
    _batteryCubit.startListening();
  }

  @override
  void dispose() {
    _batteryCubit.close();
    super.dispose();
  }

  String chargingStatus(BatteryDataState state) {
    if (state.isCharging) {
      return "Charging";
    } else if (state.percentage == 100) {
      return "Battery Full";
    } else {
      return "Try charging";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _batteryCubit,
      builder: (context, state) {
        if (state is BatteryDataState) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Utils.batteryColor(state.percentage),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Battery',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.battery_charging_full,
                        size: 60,
                        color: Colors.white,
                      ),
                      Column(
                        children: [
                          Text(
                            '${state.percentage}%',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            chargingStatus(state),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.cyan,
            width: 300,
            height: 50,
            child: Text("Loading...."),
          );
        }
      },
    );
  }
}
