import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wp_cafe/bloc/order_bloc.dart';
import 'package:wp_cafe/bloc/order_event.dart';
import 'package:wp_cafe/bloc/order_state.dart';
import 'package:wp_cafe/enums/color_palette.dart';
import 'package:wp_cafe/services/api_service.dart';
import 'package:wp_cafe/utils/snackbar_util.dart';

class RequestCoffee extends StatefulWidget {
  final dynamic cItem;
  const RequestCoffee({Key? key, this.cItem}) : super(key: key);

  @override
  RequestCoffeeState createState() => RequestCoffeeState();
}

class RequestCoffeeState extends State<RequestCoffee> {
  final ApiService apiService = ApiService();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _instruction = TextEditingController();
  bool _isChecked = false;

  Future<void> _requestCoffee() async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<OrderBloc>(context).add(
        PostOrder(widget.cItem['id'], _instruction.text, _isChecked),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is OrderSuccess) {
            SnackbarUtil(context).showSnackbar(message: 'Order placed successfully!');
            Navigator.pop(context);
          } else if (state is OrderError) {
            SnackbarUtil(context).showSnackbar(message: 'Failed to place order: ${state.message}', isSuccess: false);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instructions',
                style: GoogleFonts.sourceSans3(
                  color: const Color(0xFF999A9B),
                  fontSize: 17.0,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: screenWidth - 30.0,
                child: TextFormField(
                  controller: _instruction,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Request instruction (i.e. No Sugar)',
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
                  ),
                  style: GoogleFonts.sourceSans3(color: ColorPalette.textColor),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: screenWidth - 30.0,
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() => _isChecked = value!);
                      },
                      activeColor: ColorPalette.coffeeSelected,
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _isChecked = !_isChecked),
                      child: Text(
                        'For Guest',
                        style: GoogleFonts.sourceSans3(
                          color: const Color(0xFF999A9B),
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: state is! OrderLoading ? _requestCoffee : null,
                child: Container(
                  height: 50.0,
                  width: screenWidth - 30,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: ColorPalette.coffeeSelected,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: state is OrderLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.textColor),
                            ),
                          )
                        : Text(
                            'Request Coffee',
                            style: GoogleFonts.sourceSans3(
                              fontWeight: FontWeight.bold,
                              color: ColorPalette.textColor,
                              fontSize: 17.0,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          );
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   _instruction.dispose();
  //   setState(() {
  //     _isChecked = false;
  //   });
  //   super.dispose();
  // }
}
