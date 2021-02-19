class ReverseGeocoding {
  //The response code of the operation. The 400 series is for client side (yours) error while 500 series for server side (ours) error, 200 for success.
  int responseCode;
  //The version of the API you’re connected to.
  String version;
  // The house number of the location.
  String houseNumber;
  //The name of the location.
  String houseName;
  // The name of the POI if the location is a place of interest (POI).
  String poi;
  //distance from nearest POI in metres.
  String poiDist;
  // The name of the street of the location.
  String street;
  //distance from nearest Street in metres.
  String streetDist;
  // The name of the sub-sub-locality where the location exists.
  String subSubLocality;
  // The name of the sub-locality where the location exists.
  String subLocality;
  // The name of the locality where the location exists.
  String locality;
  // The name of the village if the location exists in a village.
  String village;
  // The name of the district in which the location exists.
  String district;
  String subDistrict;
  // The name of the sub-district in which the location exists.
  // The name of the city in which the location exists.
  String city;
  //The name of the state in which the location exists.
  String state;
  // The pin code of the location area.
  String pincode;
  // The latitude of the location.
  double latitude;
  // The longitude of the location.
  double longitude;
  // The complete human readable address string that is usually the complete postal address of the result.
  String formattedAddress;
  //in-case the co-ordinate lies in a country the name of the country would be returned or if the co-ordinate lies in an ocean, the name of the ocean will be returned.
  String area;

  ReverseGeocoding.fromJson(Map<String, dynamic> json) {
    responseCode = json["responseCode"] as int;
    version = json["version"] as String;
    houseNumber = json["results"][0]["houseNumber"];
    houseName = json["results"][0]["houseName"];
    poi = json["results"][0]["poi"];
    poiDist = json["results"][0]["poi_dist"];
    street = json["results"][0]["street"];
    streetDist = json["results"][0]["street_dist"];
    subSubLocality = json["results"][0]["subSubLocality"];
    subLocality = json["results"][0]["subLocality"];
    locality = json["results"][0]["locality"];
    village = json["results"][0]["village"];
    district = json["results"][0]["district"];
    subDistrict = json["results"][0]["subDistrict"];
    city = json["results"][0]["city"];
    state = json["results"][0]["state"];
    pincode = json["results"][0]["pincode"];
    latitude = double.parse(json["results"][0]["lat"]);
    longitude = double.parse(json["results"][0]["lng"]);
    area = json["results"][0]["india"];
    formattedAddress = json["results"][0]["formatted_address"];
  }
}
