import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_zoo/apis/api_provider.dart';

import 'bloc/search/search_bloc.dart';
import 'route_generator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider.getInstance(dioHttpClient: Dio()),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(
            create: (context) =>
                SearchBloc(apiProvider: context.read<ApiProvider>()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: homeRoute,
        ),
      ),
    );
  }
}
