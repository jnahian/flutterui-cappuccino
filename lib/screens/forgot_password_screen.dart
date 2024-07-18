import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wp_cafe/bloc/menu_bloc.dart';
import 'package:wp_cafe/bloc/menu_event.dart';
import 'package:wp_cafe/widgets/buttons/back_button.dart';
import 'package:wp_cafe/widgets/form/forgot_password_form.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) {
        return MenuBloc()..add(FetchMenus());
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
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
                    child: const ForgotPasswordForm(),
                  )
                ],
              ),
            ),
            const Positioned(
              top: 50.0,
              left: 15.0,
              child: BackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
