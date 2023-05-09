library chumsy_app.globals;

import 'dart:async';

import '../providers/locationprovider.dart';

StreamController messageStreamController = StreamController.broadcast();
LocationProvider locationProvider = LocationProvider();
