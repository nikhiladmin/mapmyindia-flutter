import 'dart:async';
import 'dart:io';

import 'package:mapmyindia_flutter/Exceptions/ClientSideException.dart';

import '../model/reverse_geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapMyIndiaGeocoding {
  static const String baseUrl = "http://apis.mapmyindia.com/advancedmaps/v1/";

  // [apiKey] REST API licence key allocated to you by signing into our services and registering yourself as a developer (28 Char Alphanumeric).
  String _apiKey;
  MapMyIndiaGeocoding(this._apiKey);
  Future<ReverseGeocoding> getAddress(double latitude, double longitude,
      // it takes in the country code. LKA, IND, BTN, BGD, NPL for Sri-Lanka, India, Bhutan, Bangladesh, Nepal respectively. Default is India (IND)
      {String region = "IND"}) async {
    ReverseGeocoding address;
    try {
      if (latitude == null || longitude == null || this._apiKey == null) {
        throw ClientSideException("Value cannot be null");
      }
      final response = await http.get(
          "$baseUrl${this._apiKey}/rev_geocode?lat=$latitude&lng=$longitude&region=$region");

      final jsonResponseData = json.decode(response.body);
      if (500 <= response.statusCode && response.statusCode <= 599) {
        throw ClientSideException(jsonResponseData["error_description"]);
        //Mapmyindia Server Error
      } else if (400 <= response.statusCode && response.statusCode <= 499) {
        //CLIENT_CREDENTIAL_EXPIRED check your API key
        throw ClientSideException(jsonResponseData["error_description"]);
      } else if (200 <= response.statusCode && response.statusCode <= 299) {
        address = ReverseGeocoding.fromJson(json.decode(response.body));
      }

      return address;
    } on SocketException catch (_) {
      // Internet Connection not Found
      throw SocketException("Please check you Internet Connection");
    } on TimeoutException catch (_) {
      // Timeout for response
      throw TimeoutException("Internet is too slow");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
