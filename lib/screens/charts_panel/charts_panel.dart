import 'package:flutter/material.dart';
import 'package:iot/screens/charts_panel/widgets/charts_list.dart';

class ChartsPanel extends StatefulWidget {
  const ChartsPanel({super.key});

  @override
  _ChartsPanelState createState() => _ChartsPanelState();
}

class _ChartsPanelState extends State<ChartsPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts Panel'),
      ),
      body: ChartsList(),
    );
  }
}
