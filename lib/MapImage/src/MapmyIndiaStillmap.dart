import 'package:mapmyindia_flutter/Exceptions/ClientSideException.dart';

class MapMyIndiaStillMap {
  static const String baseUrl = "http://apis.mapmyindia.com/advancedmaps/v1/";

  // [apiKey] REST API licence key allocated to you by signing into our services and registering yourself as a developer (28 Char Alphanumeric).
  String _apiKey;
  MapMyIndiaStillMap(this._apiKey);
  String getMapImage(
    //[Required Parameter] a WGS-84 position coordinate that specifies the centre of the image requested.

    double centerLatitude,
    double centerLongitude,

    // [Optional Parameter]
    {
    //optional markers that you may want to add to the map tile.  default Value [centerLatitude,centerLongitude]
    List<List<double>> markers,
    // The size of the image requested in pixels as <Width>x<Height>.
    int width = 800,
    int height = 480,

    // The zoom level for which the image is requested. Ranges from 4 to 18 with 18 being the highest zoomed in level.
    int zoom = 16,
    // scale factor indicating retina or non-retina tiles. 0→non-retina tiles. 1→retina tiles.
    bool ssf = true,
  }) {
    String markersData = "";
    // default Value of markers [centerLatitude,centerLongitude]
    if (markers == null) {
      markers = [
        [centerLatitude, centerLongitude]
      ];
    }
    try {
      markers.forEach((coordinates) {
        if (coordinates.length != 2) {
          throw ClientSideException(
              "Markers coordinates must be in the form of [[latitude,longitude],[.. , ..],...]");
        } else {
          markersData += "${coordinates[0]},${coordinates[1]}|";
        }
      });
      return ("$baseUrl${this._apiKey}/still_image?center=$centerLatitude,$centerLongitude&zoom=$zoom&size=${width}x$height&ssf=${ssf ? '1' : '0'}&markers=${markersData}>");
    } catch (e) {
      print(e.toString());
    }
  }
}
