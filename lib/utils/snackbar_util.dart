import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class SnackbarUtil {
  // static void showSnackbar(BuildContext context, String message, {bool isSuccess = true}) {
  //   // final snackBar = SnackBar(
  //   //   content: Text(message),
  //   //   duration: const Duration(seconds: 300),
  //   //   showCloseIcon: true,
  //   //   elevation: 0,
  //   // );

  //   final snackBar = SnackBar(
  //     content: Row(
  //       children: [
  //         Icon(
  //           isSuccess ? Icons.check_circle : Icons.error,
  //           color: Colors.white,
  //         ),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: Text(
  //             message,
  //             style: const TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       ],
  //     ),
  //     backgroundColor: isSuccess ? Colors.green : Colors.red,
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(15.0),
  //     ),
  //     margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
  //     duration: const Duration(seconds: 3),
  //     showCloseIcon: true,
  //     animation: CurvedAnimation(
  //       parent: AnimationController(
  //         vsync: ScaffoldMessenger.of(context),
  //         duration: const Duration(milliseconds: 300),
  //       )..forward(),
  //       curve: Curves.easeInOut,
  //     ),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  static void showSnackbar(BuildContext context, String message, {bool isSuccess = true}) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 30.0,
        left: 60.0,
        right: 60.0,
        child: SlideInSnackBar(
          message: message,
          isSuccess: isSuccess,
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 5), () {
      overlayEntry.remove();
    });
  }
}

class SlideInSnackBar extends StatefulWidget {
  final String message;
  final bool isSuccess;

  const SlideInSnackBar({super.key, required this.message, required this.isSuccess});

  @override
  SlideInSnackBarState createState() => SlideInSnackBarState();
}

class SlideInSnackBarState extends State<SlideInSnackBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Material(
        color: ColorPalette().coffeeUnselected,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              Icon(
                widget.isSuccess ? Icons.check_circle : Icons.error,
                color: widget.isSuccess ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.message,
                  style: GoogleFonts.sourceSans3(
                    color: widget.isSuccess ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
