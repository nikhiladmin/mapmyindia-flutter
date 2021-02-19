import 'package:flutter/material.dart';
import 'package:mapmyindia_flutter/mapmyindia_flutter.dart';

class ReverseGeocoding extends StatefulWidget {
  @override
  _ReverseGeocodingState createState() => _ReverseGeocodingState();
}

class _ReverseGeocodingState extends State<ReverseGeocoding> {
  String address = "";
  TextEditingController _latitudeController;
  TextEditingController _longitudeController;

  @override
  void initState() {
    _latitudeController = TextEditingController(text: "23.24950699600395");
    _longitudeController = TextEditingController(text: '77.50027053862578');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Reverse Geocoding")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _latitudeController,
                decoration: InputDecoration(hintText: "Latitude"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _longitudeController,
                decoration: InputDecoration(hintText: "Longitude"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Get Address"),
                onPressed: () {
                  MapMyIndiaGeocoding("[API_KEY]")
                      .getAddress(double.parse(_latitudeController.text),
                          double.parse(_longitudeController.text))
                      .then((getAddress) {
                    setState(() {
                      address = getAddress.formattedAddress;
                    });
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                address,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ));
  }
}
