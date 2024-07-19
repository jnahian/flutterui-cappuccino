import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_event.dart';
import 'package:wp_cafe/bloc/auth_state.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/screens/dashboard_screen.dart';
import 'package:wp_cafe/screens/forgot_password_screen.dart';
import 'package:wp_cafe/utils/snackbar_util.dart';
import 'package:wp_cafe/widgets/buttons/primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      BlocProvider.of<AuthBloc>(context).add(
        AuthenticateUser(email, password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GlassContainer(
      width: screenWidth,
      blur: 10,
      border: const Border.fromBorderSide(BorderSide.none),
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.black.withOpacity(0.6),
      child: Form(
        key: _formKey,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              SnackbarUtil(context).showSnackbar(message: 'Logged in successfully!');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashboardScreen()));
            } else if (state is AuthError) {
              SnackbarUtil(context).showSnackbar(message: 'Failed to login: ${state.message}', isSuccess: false);
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Email',
                    style: GoogleFonts.sourceSans3(
                      color: const Color(0xFF999A9B),
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: screenWidth - 30.0,
                    child: TextFormField(
                      controller: _emailController,
                      autofocus: false,
                      validator: _validateEmail,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Your work email',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                        hintStyle: GoogleFonts.sourceSans3(
                          color: const Color(0xFF525559),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: ColorPalette.searchBarFill,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: ColorPalette.coffeeSelected),
                        ),
                        errorStyle: GoogleFonts.sourceSans3(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      style: GoogleFonts.sourceSans3(color: ColorPalette.textColor),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Password',
                    style: GoogleFonts.sourceSans3(
                      color: const Color(0xFF999A9B),
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: _validatePassword,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Your password',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      hintStyle: GoogleFonts.sourceSans3(
                        color: const Color(0xFF525559),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: ColorPalette.searchBarFill,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: ColorPalette.coffeeSelected),
                      ),
                      errorStyle: GoogleFonts.sourceSans3(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    style: GoogleFonts.sourceSans3(color: ColorPalette.textColor),
                  ),
                  Container(
                    width: screenWidth - 30.0,
                    // padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (bool? value) {
                                setState(() => _rememberMe = value!);
                              },
                              activeColor: ColorPalette.coffeeSelected,
                            ),
                            GestureDetector(
                              onTap: () => setState(() => _rememberMe = !_rememberMe),
                              child: Text(
                                'Remember Me',
                                style: GoogleFonts.sourceSans3(
                                  color: const Color(0xFF999A9B),
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.sourceSans3(
                              fontSize: 17.0,
                              color: ColorPalette.coffeeSelected,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorPalette.coffeeSelected,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    width: screenWidth,
                    onPressed: _login,
                    buttonText: 'Login',
                    isLoading: state is AuthLoading,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
