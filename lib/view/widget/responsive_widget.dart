import 'package:flutter/material.dart';
import 'package:mourytech/utils/device_size.dart';

class ResponsiveWidget extends StatefulWidget {
  const ResponsiveWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  late DeviceSize deviceSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceSize = DeviceSize(context);
    deviceSize.sizeChangedNotifier.addListener(_onSizeChange);
  }

  @override
  void dispose() {
    deviceSize.sizeChangedNotifier.removeListener(_onSizeChange);
    super.dispose();
  }

  void _onSizeChange() {
    // setState(() {
    //   print("size changed>>${DeviceSize.width}");
    // });
    // print("width >>${DeviceSize.width}, height  >>${DeviceSize.height}");
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}