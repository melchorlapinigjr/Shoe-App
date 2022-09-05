import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/extensions/double_extension.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_item_view.dart';
import 'package:flutter_shoe_app/views/check_out_page/checkout_page_view_model.dart';
import 'package:stacked/stacked.dart';

class CheckoutPageView extends StatelessWidget {
  CheckoutPageView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckoutPageViewModel>.reactive(
        viewModelBuilder: () => CheckoutPageViewModel(),
        builder: (context, viewModel, child) {
          viewModel.init();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Payment Information',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      )),
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
                      controller: viewModel.numberController,
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
                        icon: CardUtils.getCardIcon(viewModel.card.type),
                        labelText: "Card Number",
                      ),
                      onSaved: (String? value) {
                        viewModel.card.number =
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
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: viewModel.applicationViewModel.cart.length,
                      itemBuilder: (BuildContext context, int index) {
                        final shoe = viewModel.applicationViewModel.cart.keys
                            .toList()[index];
                        return CheckoutItemView(shoe: shoe);
                      },
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Price: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            viewModel.getTotalCartPrice().toCurrencyFormat(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await viewModel.checkOutItem();
                          await viewModel.applicationViewModel.getMyCart();
                          await viewModel.applicationViewModel.navigationService
                              .pushNamed(Routes.MyPurchases);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        child: const Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
