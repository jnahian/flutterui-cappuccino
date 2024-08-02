import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_event.dart';
import 'package:wp_cafe/bloc/order_bloc.dart';
import 'package:wp_cafe/pages/error_page.dart';
import 'package:wp_cafe/screens/dashboard_screen.dart';
import 'package:wp_cafe/screens/login_screen.dart';
import 'package:wp_cafe/screens/notification_screen.dart';
import 'package:wp_cafe/screens/request_coffee_screen.dart';
import 'package:wp_cafe/screens/setting_screen.dart';

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
      child: MaterialApp(
        title: "WPCafe",
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: (settings) {
        //   if (settings.name == '/notifications') {
        //     return MaterialPageRoute(
        //       builder: (context) => NotificationScreen(),
        //       fullscreenDialog: true, // Open as fullscreen dialog
        //     );
        //   }
        //   return null;
        // },
        onGenerateRoute: (settings) {
          final arguments = settings.arguments;

          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => DashboardScreen());
            case '/login':
              return MaterialPageRoute(builder: (context) => LoginScreen());
            case '/notifications':
              return MaterialPageRoute(
                builder: (context) => NotificationScreen(),
                fullscreenDialog: true,
              );
            case '/settings':
              return MaterialPageRoute(
                builder: (context) => SettingScreen(),
                fullscreenDialog: true,
              );
            case '/request':
              if (arguments is String) {
                return MaterialPageRoute(
                  builder: (context) => RequestCoffeeScreen(itemId: arguments),
                );
              }
              return _errorRoute();
            default:
              return _errorRoute();
          }
        },
        initialRoute: '/',
        home: DashboardScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/notifications': (context) => NotificationScreen(),
          '/settings': (context) => SettingScreen(),
        },
      ),
    );
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => ErrorPage());
  }
}
