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
  // Esto puede ser refinado.
  ApiService _apiService = ApiService();
  Map<String, dynamic> _data = {};
  List<String> _cities = ['Maracaibo', 'Caracas', 'Merida', 'Valencia'];

  @override
  void initState() {
    super.initState();
    setState(() {
      boringCall();
    });
  }

  Future<void> boringCall() async {
    for (String aux in _cities) {
      final city = await _apiService.fetchData(city: aux);
      _data.addAll(city);
    }
    setState(() {
      _data = _data;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final DateTime currentDate = DateTime.now();
    //final -> Aqui lista de los dias y su prediccion climatica
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: _data.isEmpty
              ? CircularProgressIndicator()
              : Text(
                  _data['sys'].toString(),
                ),
        ),
      ],
    ));
  }
}
