import 'package:flutter/material.dart';
import 'package:mourytech/utils/device_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DeviceSize(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}