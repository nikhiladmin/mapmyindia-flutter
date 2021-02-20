import 'package:flutter/material.dart';
import 'package:mapmyindia_flutter/mapmyindia_flutter.dart';

class StillMapImage extends StatefulWidget {
  @override
  _StillMapImageState createState() => _StillMapImageState();
}

class _StillMapImageState extends State<StillMapImage> {
  TextEditingController _centerLatitudeController;
  TextEditingController _centerLongitudeController;
  TextEditingController _zoomController;
  TextEditingController _heightController;
  TextEditingController _widthController;
  String mapImageUrl;

  @override
  void initState() {
    _centerLatitudeController =
        TextEditingController(text: "28.595939499830784");
    _centerLongitudeController =
        TextEditingController(text: "77.22556114196777");
    _zoomController = TextEditingController(text: "18");
    _heightController = TextEditingController(text: "480");
    _widthController = TextEditingController(text: "800");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Reverse Geocoding")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _centerLatitudeController,
                  decoration: InputDecoration(hintText: "Center Latitude"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _centerLongitudeController,
                  decoration: InputDecoration(hintText: "Center Longitude"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _zoomController,
                        decoration: InputDecoration(hintText: "Zoom"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextField(
                        controller: _widthController,
                        decoration: InputDecoration(hintText: "Width"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextField(
                        controller: _heightController,
                        decoration: InputDecoration(hintText: "Height"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text("Get Map Image"),
                  onPressed: () {
                    setState(() {
                      mapImageUrl = MapMyIndiaStillMap("[API_KEY]").getMapImage(
                          double.parse(_centerLatitudeController.text),
                          double.parse(_centerLongitudeController.text),
                          height: int.parse(_heightController.text),
                          markers: [
                            [28.595939, 77.225561],
                            [28.596000, 77.2255612]
                          ],
                          width: int.parse(_heightController.text),
                          zoom: int.parse(_zoomController.text));
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                mapImageUrl != null
                    ? Image.network(mapImageUrl)
                    : SizedBox(
                        child: Text("Map Loading"),
                      )
              ],
            ),
          ),
        ));
  }
}
