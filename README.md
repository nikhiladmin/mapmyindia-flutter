[![Pub](https://img.shields.io/pub/v/mapmyindia_flutter)](https://pub.dev/packages/mapmyindia_flutter/versions/0.0.1)

# mapmyindia_flutter

A Unofficial mapmyindia flutter packages .

Internally use [Mapmyindia REST API](https://www.mapmyindia.com/api/advanced-maps/doc/autosuggest-api) 

## Table of Contents
- [Installation](#installation)
- [Documentation](#documentation)
- [Upcoming Feature](#upcoming_feature)
- [License](#license)
- [Issues](#issues)
- [Want to contribute](#want_to_contribute)

## Installation

 #### Depend on it
 Add this to your package's pubspec.yaml file:
```
dependencies:
  mapmyindia_flutter: ^0.0.1
```
#### Install it
You can install packages from the command line:
```
with pub:
$ dart pub get
```
Alternatively, your editor might support dart pub get. Check the docs for your editor to learn more.

#### Import it
Now in your Dart code, you can use:
```
import 'package:mapmyindia_flutter/mapmyindia_flutter.dart';
```
## Documentation

#### Reverse Geocoding 
  
 First you need to create an account on [Mapmyindia Signup](https://www.mapmyindia.com/api/signup). If you have allready an account then  [Mapmyindia Login](https://www.mapmyindia.com/api/login) . In reverse geocoding you will use the *REST API Key for Web/Android/iOS*.

  ```
  import 'package:mapmyindia_flutter/mapmyindia_flutter.dart';
  
  MapMyIndiaGeocoding("[API_KEY]")
        .getAddress(_latitude,_longitude)
                      .then((getAddress) {
                      ReverseGeocoding address = getAddress.formattedAddress;            
    });
  ```
  #### Code explaination
  
  *MapMyIndiaGeocoding* class contain *getAddress(double,double)* method and it return ```Future<ReverseGeocoding>```.
  
  #### ReverseGeocoding Model 
    
|     Data      |  Description  |
| ------------- |:----------------------------------------------------------------------------------:|
| houseNumber   | The house number of the location. It may be empty String if house number not exist | 
| houseName     | The name of the location.    |  
| poi           | The name of the POI if the location is a place of interest (POI).     | 
| poiDist       | distance from nearest POI in metres.                                   |
| street        | The name of the street of the location.                                |
| streetDist    | distance from nearest Street in metres.                                |
| subSubLocality | The name of the sub-sub-locality where the location exists.            |
| subLocality   | The name of the sub-locality where the location exists.                |
| locality      | The name of the locality where the location exists.                    |
| village       | The name of the village if the location exists in a village.          |
| district      |  The name of the district in which the location exists.              |
| subDistrict   | The name of the sub-district in which the location exists.           |
|  city         | The name of the city in which the location exists.                   |
|  state        |The name of the state in which the location exists.                   |
| pincode       | The pin code of the location area.                                   |
| latitude      |  The latitude of the location.                                       |
|longitude      | The longitude of the location.                                       |
|formattedAddress |  The complete human readable address string that is usually the complete postal address of the result. |
|area     | in-case the co-ordinate lies in a country the name of the country would be returned or if the co-ordinate lies in an ocean, the name of the ocean will be returned.|
  
## Upcoming_Feature

- Forward Geocoding
- Autosuggest 
- eLOC
- Still Map Image
- Traveled Route Image

## License 

[BSD 2-Clause "Simplified" License](https://github.com/nikhiladmin/mapmyindia-flutter/blob/master/LICENSE)

## Issues
Please file any issues, bugs or feature requests as an issue on our GitHub page. Commercial support is available, you can contact us at nikhilbcps@gmail.com.

## Want_to_contribute
If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our code and send us your pull request.


  
