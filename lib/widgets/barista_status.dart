import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ci.dart';
import 'package:wp_cafe/bloc/auth_bloc.dart';
import 'package:wp_cafe/bloc/auth_event.dart';
import 'package:wp_cafe/bloc/auth_state.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class BaristaStatus extends StatefulWidget {
  const BaristaStatus({Key? key}) : super(key: key);

  @override
  BaristaStatusState createState() => BaristaStatusState();
}

class BaristaStatusState extends State<BaristaStatus> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(const FetchBaristaStatus()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          String statusText = "Offline";
          // Color statusColor = Colors.red;
          if (state is BaristaStatusLoaded && state.baristaStatus) {
            print(state.baristaStatus);
            setState(() {
              statusText = "Online";
              // statusColor = Colors.red;
            });
          }

          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Iconify(Ci.dot_04_l, color: Colors.green),
              Text(
                "Barista is $statusText",
                style: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.textColor,
                  fontSize: 14.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
