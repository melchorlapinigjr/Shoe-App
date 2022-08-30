import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/app/app.locator.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/core/services/api/api_service.dart';
import 'package:flutter_shoe_app/core/services/shared_preferrence/shared_preference.dart';
import 'package:flutter_shoe_app/models/checkout_object.dart';
import 'package:flutter_shoe_app/models/user_object.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:get/get.dart';

class CheckoutPageViewModel extends ChangeNotifier {
  TextEditingController nameOnCardController = TextEditingController();
  TextEditingController provinceAddressController = TextEditingController();
  TextEditingController cityAddressController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  CheckoutPageViewModel();
  User? user;
  double price = 0;
  List<int> productIds = [];
  int quantity = 0;

  final ApiService apiService = locator<ApiService>();
  final SharedPreference sharedPreference = locator<SharedPreference>();
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  final card = PaymentCard();

  void init() {
    numberController.addListener(getCardTypeFrmNumber);
  }

  Future<void> checkOutItem() async {
    productIds.clear();
    getTotalCartPrice();
    notifyListeners();
    try {
      await apiService.checkOut(CheckoutObject(
          userId: int.parse(applicationViewModel.user!.id!),
          productId: productIds,
          quantity: quantity,
          totalPrice: price));
      notifyListeners();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Order placed successfully!')));
    } catch (e) {
      rethrow;
    }
  }

  double getTotalCartPrice() {
    price = 0;
    quantity = 0;
    applicationViewModel.cart.forEach((key, value) {
      productIds.add(key.id!);
      quantity += value;
      price += applicationViewModel.getCartTotalPrice(key);
    });
    return price ?? 0;
  }

  void getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    notifyListeners();
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    notifyListeners();
    card.type = cardType;
    notifyListeners();
  }
}

class PaymentCard {
  CardType? type;
  String? number;
  String? name;
  String? email;
  String? province;
  String? city;
  String? streetName;
  String? postalCode;
  String? contactNumber;

  PaymentCard(
      {this.type,
      this.number,
      this.name,
      this.email,
      this.province,
      this.city,
      this.streetName,
      this.postalCode,
      this.contactNumber});

  @override
  String toString() {
    return '[Type: $type,'
        'Number: $number,'
        'Name: $name,'
        'Email: $email,'
        'Province: $province'
        'City: $city'
        'StreetNumber: $streetName'
        'PostalCode: $postalCode'
        'ContactNumber: $contactNumber]';
  }
}

enum CardType {
  master,
  visa,
  verve,
  discover,
  americanExpress,
  dinersClub,
  jcb,
  others,
  invalid
}

class CardUtils {
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.master:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;
      case CardType.verve:
        img = 'verve.png';
        break;
      case CardType.americanExpress:
        img = 'american_express.png';
        break;
      case CardType.discover:
        img = 'discover.png';
        break;
      case CardType.dinersClub:
        img = 'dinners_club.png';
        break;
      case CardType.jcb:
        img = 'jcb.png';
        break;
      case CardType.others:
        icon = Icon(
          Icons.credit_card,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
      default:
        icon = Icon(
          Icons.warning,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
    }

    Widget? widget;
    if (img.isNotEmpty) {
      widget = Image.asset(
        'lib/resources/assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm

  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return Strings.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return Strings.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return Strings.numberIsInvalid;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.visa;
    } else if (input.startsWith(RegExp(r'((506(0|1))|(507(8|9))|(6500))'))) {
      cardType = CardType.verve;
    } else if (input.startsWith(RegExp(r'((34)|(37))'))) {
      cardType = CardType.americanExpress;
    } else if (input.startsWith(RegExp(r'((6[45])|(6011))'))) {
      cardType = CardType.discover;
    } else if (input.startsWith(RegExp(r'((30[0-5])|(3[89])|(36)|(3095))'))) {
      cardType = CardType.dinersClub;
    } else if (input.startsWith(RegExp(r'(352[89]|35[3-8][0-9])'))) {
      cardType = CardType.jcb;
    } else if (input.length <= 8) {
      cardType = CardType.others;
    } else {
      cardType = CardType.invalid;
    }
    return cardType;
  }
}

class Strings {
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String pay = 'Validate';
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
