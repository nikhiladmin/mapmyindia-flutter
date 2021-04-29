[![Pub](https://img.shields.io/pub/v/mapmyindia_flutter)](https://pub.dev/packages/mapmyindia_flutter/versions/0.0.1)

# mapmyindia_flutter

A Unofficial mapmyindia flutter packages .

Internally use [Mapmyindia REST API](https://www.mapmyindia.com/api/advanced-maps/doc/autosuggest-api) 

## Table of Contents
- [Installation](#installation)
- [Usage](#usage) 
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
  mapmyindia_flutter: ^1.0.7
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
## Usage
  If you need to get latitude and longitude of your current location there is a package recommanded for you [Geolocator](https://pub.dev/packages/geolocator)


  First you need to create an account on [Mapmyindia Signup](https://www.mapmyindia.com/api/signup). If you have allready an account then  [Mapmyindia Login](https://www.mapmyindia.com/api/login) . In reverse geocoding you will use the *REST API Key for Web/Android/iOS*.

## Documentation

### Reverse Geocoding 
  
  Reverse Geocoding is a process to give the closest matching address to a provided geographical coordinates (latitude/longitude). MapmyIndia reverse geocoding API provides real addresses along with nearest popular landmarks for any such geo-positions on the map.

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

### Still Map Image 


  The Still Map Image returns the map as an image which you can display on your application. The API lets you embed MapmyIndia Maps image according to geo-position, pixel size and zoom level of the map on your application without requiring any dynamic page loading. The image can be a retina image and markers can be added to the image to indicate position of any object.

  ```
   String mapImageUrl = MapMyIndiaStillMap("[API_KEY]")
                              .getMapImage(
                                  latitude,
                                  longitude,
                                 );
  ```
  Additional Parameter in *getMapImage()* method are -

|   Parameter   |  Description  |
| ------------- |:----------------------------------------------------------------------------------:|
| markers     | Toptional markers that you may want to add to the map tile.  default Value List(centerLatitude,centerLongitude) | 
| width     | The size of the image requested in pixels as Width.    |  
| height     | The size of the image requested in pixels as Height.     | 
| zoom       | The zoom level for which the image is requested. Ranges from 4 to 18 with 18 being the highest zoomed in level.                                 |
| ssf         | scale factor indicating retina or non-retina tiles. 0→non-retina tiles. 1→retina tiles.                             |

## Upcoming_Feature

- Forward Geocoding
- Autosuggest 
- eLOC
- Traveled Route Image

## License 

[BSD 2-Clause "Simplified" License](https://github.com/nikhiladmin/mapmyindia-flutter/blob/master/LICENSE)

## Issues
Please file any issues, bugs or feature requests as an issue on our GitHub page. Commercial support is available, you can contact us at nikhilbcps@gmail.com.

## Want_to_contribute
If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our code and send us your pull request.


  
