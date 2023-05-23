// import 'package:location/location.dart';

class LocationProvider {
  // final Location _location = new Location();
  // bool _serviceEnabled = false;
  // late PermissionStatus _permissionStatus;
  // late LocationData _locationData;

  // get locationData => _locationData;

  Future<String> getLocation() async {
    // _serviceEnabled = await _location.serviceEnabled();
    // if (_serviceEnabled) {
    //   _serviceEnabled = await _location.requestService();
    //   if (!_serviceEnabled) {
    //     return "Location Permission Required";
    //   }
    // }
    // _permissionStatus = await _location.hasPermission();
    // if (_permissionStatus == PermissionStatus.denied) {
    //   _permissionStatus = await _location.requestPermission();
    //   if (_permissionStatus != PermissionStatus.granted) {
    //     return "Location Permission Required";
    //   }
    // }

    // _locationData = await _location.getLocation();
    // print("Latitude ${_locationData.latitude}");
    // return "Location Available";
    return "LOCATION AVAILABLE";
  }
}
