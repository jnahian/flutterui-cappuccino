import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/enums/color_palette.dart';

class SnackbarUtil {
  final BuildContext context;

  SnackbarUtil(this.context);
  
  void showSnackbar({required String message, bool isSuccess = true}) {
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

    Future.delayed(const Duration(seconds: 3), () {
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Material(
          elevation: 4.0,
          color: ColorPalette.coffeeUnselected,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              children: [
                Icon(
                  widget.isSuccess ? Icons.check_circle : Icons.error,
                  color: widget.isSuccess ? ColorPalette.succees : ColorPalette.danger,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.message,
                    style: GoogleFonts.sourceSans3(
                      color: widget.isSuccess ? ColorPalette.succees : ColorPalette.danger,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
