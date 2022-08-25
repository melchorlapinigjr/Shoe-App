import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_page_view_model.dart';
import 'package:flutter_shoe_app/views/check_out_page/show_checkout_item_view.dart';
import 'package:stacked/stacked.dart';
import 'package:country_list_pick/country_list_pick.dart';

class CheckoutPageView extends StatefulWidget {
  const CheckoutPageView({Key? key}) : super(key: key);

  @override
  State<CheckoutPageView> createState() => _CheckoutPageViewState();
}

class _CheckoutPageViewState extends State<CheckoutPageView> {
  final formGlobalKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final _paymentCard = PaymentCard();

  //var _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutPageViewModel>.reactive(
        viewModelBuilder: () => CheckOutPageViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Payment Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            body: Form(
              key: formGlobalKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    const Text(
                      'Credit Card Accepted',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'lib/resources/assets/images/mastercard.png',
                          width: 30.0,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'lib/resources/assets/images/visa.png',
                          width: 30.0,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'lib/resources/assets/images/american_express.png',
                          width: 30.0,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'lib/resources/assets/images/dinners_club.png',
                          width: 30.0,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'lib/resources/assets/images/discover.png',
                          width: 30.0,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'lib/resources/assets/images/jcb.png',
                          width: 30.0,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'lib/resources/assets/images/verve.png',
                          width: 30.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19),
                        CardNumberInputFormatter()
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        icon: CardUtils.getCardIcon(_paymentCard.type),
                        labelText: "Card Number",
                      ),
                      onSaved: (String? value) {
                        //print('onSaved = $value');
                        //print('Num controller has = ${numberController.text}');
                        _paymentCard.number =
                            CardUtils.getCleanedNumber(value!);
                      },
                      validator: CardUtils.validateCardNum,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: viewModel.nameOnCardController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Name on Card",
                      ),
                      // onSaved: (String? value) {
                      //   viewModel.card.name = value;
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 53,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: CountryListPick(
                        theme: CountryTheme(
                          isShowFlag: false,
                          isShowTitle: true,
                          isShowCode: true,
                          isDownIcon: true,
                          labelColor: Colors.blueAccent,
                        ),
                        initialSelection: '+63',
                        onChanged: (CountryCode) {},
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: viewModel.provinceAddressController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Province",
                      ),
                      onSaved: (String? value) {
                        viewModel.card.province = value;
                      },
                      validator: (String? value) =>
                          value!.isEmpty ? Strings.fieldReq : null,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: viewModel.cityAddressController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "City/Town",
                      ),
                      onSaved: (String? value) {
                        viewModel.card.city = value;
                      },
                      validator: (String? value) =>
                          value!.isEmpty ? Strings.fieldReq : null,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: viewModel.streetAddressController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Street Name, Building, House No.',
                      ),
                      onSaved: (String? value) {
                        viewModel.card.streetName = value;
                      },
                      validator: (String? value) =>
                          value!.isEmpty ? Strings.fieldReq : null,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: viewModel.postalCodeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Postal Code",
                      ),
                      onSaved: (String? value) {
                        viewModel.card.postalCode = value;
                      },
                      validator: (String? value) =>
                          value!.isEmpty ? Strings.fieldReq : null,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: viewModel.contactNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Contact Number",
                      ),
                      onSaved: (String? value) {
                        viewModel.card.contactNumber = value;
                      },
                      validator: (String? value) =>
                          value!.isEmpty ? Strings.fieldReq : null,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email address",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: viewModel.emailController,
                      onSaved: (String? value) {
                        viewModel.card.email = value;
                      },
                      validator: (String? value) =>
                          value!.isEmpty ? Strings.fieldReq : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.blueAccent,
                    ),
                    const Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const ShowCheckOutItemView(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      _paymentCard.type = cardType;
    });
  }
}
