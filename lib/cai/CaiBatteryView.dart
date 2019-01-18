import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class CaiBatteryView extends StatefulWidget {
  @override
  _CaiBatteryViewState createState() => _CaiBatteryViewState();
}

class _CaiBatteryViewState extends State<CaiBatteryView> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  static const EventChannel eventChannel =
      const EventChannel('samples.flutter.io/charging');
  var _chargingStatus = "回调";
  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus = "回调: $event";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = '回调: unknown.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("get Battrey level"),
              onPressed: _getBattleLevel,
            ),
            Text(_batteryLevel),
            Text(_chargingStatus)
          ],
        ),
      ),
    );
  }

  String _batteryLevel = "unknow";
  Future<Null> _getBattleLevel() async {
    String batteryLevel;
    try {
      final String result =
          await platform.invokeMethod("getBatteryLevel_iOS", ["消息1"]);
      batteryLevel = "battery:$result % ";
    } on PlatformException catch (e) {
      batteryLevel = "Failed  getBattleLevel : ${e.message}";
    } catch (e) {
      batteryLevel = "Failed  getBattleLevel : ${e.message}";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
