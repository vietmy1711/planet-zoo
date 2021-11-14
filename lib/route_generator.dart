import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:planet_zoo/bloc/search/search_bloc.dart';
import 'package:planet_zoo/models/animal/animal.dart';
import 'package:planet_zoo/screens/animal_detail/animal_detail_screen.dart';
import 'package:planet_zoo/screens/map/map_screen.dart';

import 'apis/api_provider.dart';
import 'screens/animal_detect/animal_detect_screen.dart';
import 'screens/qr_code/qr_code_screen.dart';
import 'screens/navigation_screen.dart';
import 'screens/report/report_screen.dart';

const String homeRoute = '/home';
const String qrCodeRoute = '/qrCode';
const String animalDetectRoute = '/animalDetect';
const String reportRoute = '/report';
const String mapRoute = '/map';
const String animalDetailRoute = '/animalDetail';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider<SearchBloc>.value(
            value: context.read<SearchBloc>(),
            child: const NavigationScreen(),
          ),
        );
      case qrCodeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider<SearchBloc>.value(
            value: context.read<SearchBloc>(),
            child: const QrCodeScreen(),
          ),
        );
      case animalDetectRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider<SearchBloc>.value(
            value: context.read<SearchBloc>(),
            child: const AnimalDetectScreen(),
          ),
        );
      case reportRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ReportScreen(),
        );
      case mapRoute:
        return MaterialPageRoute<LatLng?>(
          settings: settings,
          builder: (context) => const MapScreen(),
        );
      case animalDetailRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                AnimalDetailScreen(animal: settings.arguments as Animal));
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<SearchBloc>(
            create: (context) =>
                SearchBloc(apiProvider: context.read<ApiProvider>()),
            child: const NavigationScreen(),
          ),
        );
    }
  }
}
