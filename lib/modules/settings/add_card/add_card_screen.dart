import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/modules/settings/add_card/add_card_controller.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/navigation/k_app_bar.dart';
import 'package:credit_card_input_form/constants/constanst.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import 'package:credit_card_input_form/model/card_info.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final AddCardController controller = AddCardController();
  
  @override
  Widget build(BuildContext context) {
    final buttonDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
    );

    final buttonTextStyle = TextStyle(color: Colors.white, fontSize: 14);

    final cardDecoration = BoxDecoration(
      boxShadow: <BoxShadow>[BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))],
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Okito.theme.primaryColor,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    );
    return Scaffold(
      appBar: KAppBar(
        title: "Add Payment method",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CreditCardInputForm(
                  cardHeight: 170,
                  showResetButton: true,
                  onStateChange: (currentState, CardInfo cardInfo) {
                    if (currentState == InputState.DONE) {
                      controller.cardInfo = cardInfo;
                    }
                  },
                  initialAutoFocus: false, // optional
                  prevButtonDecoration: buttonDecoration,
                  nextButtonDecoration: buttonDecoration,
                  prevButtonTextStyle: buttonTextStyle,
                  nextButtonTextStyle: buttonTextStyle,
                  resetButtonDecoration: buttonDecoration,
                  resetButtonTextStyle: buttonTextStyle,
                  frontCardDecoration: cardDecoration,
                  backCardDecoration: cardDecoration,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: KButton(
          color: ColorConstants.greenColor,
          onPressed: () {
            controller.addPaymentMethod();
          },
          title: "SAVE",
        ),
      ),
    );
  }
}
