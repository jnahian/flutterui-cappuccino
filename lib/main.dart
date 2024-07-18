import 'package:flutter/material.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/order_bloc.dart';
import 'package:wp_cafe/screens/dashboard_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(const FetchUserData()),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardPage(),
      ),
    );
  }
}
