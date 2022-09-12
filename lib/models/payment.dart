// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

import 'dart:ui';

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.paymentKey,
    this.saveCardDefault,
    this.showSaveCard,
    this.themeColor,
    this.language,
    this.actionbar,
    this.token,
    this.maskedPanNumber,
    this.customer,
  });

  String paymentKey;
  bool saveCardDefault;
  bool showSaveCard;
  Color themeColor;
  String language;
  bool actionbar;
  String token;
  String maskedPanNumber;
  Customer customer;

  Map<String, dynamic> toJson() => {
        "payment_key": paymentKey == null ? null : paymentKey,
        "save_card_default": saveCardDefault == null ? null : saveCardDefault,
        "show_save_card": showSaveCard == null ? null : showSaveCard,
        "theme_color": themeColor == null
            ? null
            : '#${themeColor.value.toRadixString(16)}',
        "language": language == null ? null : language,
        "actionbar": actionbar == null ? null : actionbar,
        "token": token == null ? null : token,
        "masked_pan_number": maskedPanNumber == null ? null : maskedPanNumber,
        "customer": customer == null ? null : customer.toJson(),
      };
}

class Customer {
  Customer({
    this.firstName,
    this.lastName,
    this.building,
    this.floor,
    this.apartment,
    this.city,
    this.state,
    this.country,
    this.email,
    this.phoneNumber,
    this.postalCode,
  });

  String firstName;
  String lastName;
  String building;
  String floor;
  String apartment;
  String city;
  String state;
  String country;
  String email;
  String phoneNumber;
  String postalCode;

  Map<String, dynamic> toJson() => {
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "building": building == null ? null : building,
        "floor": floor == null ? null : floor,
        "apartment": apartment == null ? null : apartment,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "email": email == null ? null : email,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "postal_code": postalCode == null ? null : postalCode,
      };
}
