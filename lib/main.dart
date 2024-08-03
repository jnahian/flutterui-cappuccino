import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_event.dart';
import 'package:wp_cafe/bloc/auth_state.dart';
import 'package:wp_cafe/bloc/order_bloc.dart';
import 'package:wp_cafe/enums/color_palette.dart';
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
        home: AuthWrapper(),
        // routes: {
        //   '/login': (context) => LoginScreen(),
        //   '/notifications': (context) => NotificationScreen(),
        //   '/settings': (context) => SettingScreen(),
        // },
      ),
    );
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => ErrorPage());
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print("State: $state");
          if (state is AuthInitial || state is Unauthenticated) {
            return LoginScreen();
          } else if (state is Authenticated || state is UserDataLoaded) {
            return DashboardScreen();
          } else {
            return Scaffold(
              backgroundColor: ColorPalette.scaffoldBg,
              body: Center(
                child: const CircularProgressIndicator(
                  color: ColorPalette.coffeeSelected,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
