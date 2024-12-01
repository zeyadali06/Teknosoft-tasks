import 'package:e_commerce_app_development/Core/Utils/Functions/Get_Font_Size.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.totalSeconds, required this.fontSize, required this.afterFinished});

  final int totalSeconds;
  final double fontSize;
  final void Function() afterFinished;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int _totalTime;
  late int _minutes;
  late int _seconds;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_totalTime == 0) {
        widget.afterFinished();
        timer.cancel();
        setState(() {});
      } else {
        _totalTime--;
        _minutes = _totalTime ~/ 60;
        _seconds = _totalTime % 60;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _totalTime = widget.totalSeconds;
    _minutes = _totalTime ~/ 60;
    _seconds = _totalTime % 60;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$_minutes:${_seconds.toString().padLeft(2, '0')}',
        style: TextStyle(fontSize: getResponsiveFontSize(context: context, fontSize: widget.fontSize)),
      ),
    );
  }
}
