import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wp_cafe/bloc/menu_bloc.dart';
import 'package:wp_cafe/bloc/menu_event.dart';
import 'package:wp_cafe/widgets/form/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MenuBloc()..add(FetchMenus());
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  semanticsLabel: 'WPCafe Logo',
                  // height: 42.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: const LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
