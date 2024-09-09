import 'package:codelab_training/codelabs/lab_five/api_wheater/api_wheather.dart';
import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:flutter/material.dart';

class LabFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizons'),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            routerCore.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: WeeklyForecastList(),
    );
  }
}

class WeeklyForecastList extends StatefulWidget {
  @override
  State<WeeklyForecastList> createState() => _WeeklyForecastListState();
}

class _WeeklyForecastListState extends State<WeeklyForecastList> {
  ApiService _apiService = ApiService();
  late Map<String, dynamic> _data;

  @override
  void initState() {
    super.initState();
    setState(() {
      boringCall();
    });
  }

  Future<void> boringCall() async {
    final origin = await _apiService.fetchData();
    setState(() {
      _data = origin;
      print(_data['sys']);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final DateTime currentDate = DateTime.now();
    //final -> Aqui lista de los dias y su prediccion climatica
    return SingleChildScrollView(
        child: Center(
      child: _data.isEmpty
          ? CircularProgressIndicator()
          : Text(
              _data['sys'],
            ),
    ));
  }
}
