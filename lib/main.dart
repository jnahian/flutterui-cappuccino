import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_event.dart';
import 'package:wp_cafe/bloc/order_bloc.dart';
import 'package:wp_cafe/screens/dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
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
        title: "WPCafe",
        debugShowCheckedModeBanner: false,
        home: DashboardScreen(),
      ),
    );
  }
}
