// To parse this JSON data, do
//
//     final paymentKeyRequest = paymentKeyRequestFromJson(jsonString);

import 'dart:convert';

String paymentKeyRequestToJson(PaymentKeyRequest data) =>
    json.encode(data.toJson());

class PaymentKeyRequest {
  PaymentKeyRequest({
    this.authToken,
    this.amountCents,
    this.expiration,
    this.orderId,
    this.billingData,
    this.currency,
    this.integrationId,
    this.lockOrderWhenPaid,
  });

  String authToken;
  String amountCents;
  int expiration;
  String orderId;
  BillingData billingData;
  String currency;
  int integrationId;
  String lockOrderWhenPaid;

  Map<String, dynamic> toJson() => {
        "auth_token": authToken == null ? null : authToken,
        "amount_cents": amountCents == null ? null : amountCents,
        "expiration": expiration == null ? null : expiration,
        "order_id": orderId == null ? null : orderId,
        "billing_data": billingData == null ? null : billingData.toJson(),
        "currency": currency == null ? null : currency,
        "integration_id": integrationId == null ? null : integrationId,
        "lock_order_when_paid":
            lockOrderWhenPaid == null ? null : lockOrderWhenPaid,
      };
}

class BillingData {
  BillingData({
    this.apartment,
    this.email,
    this.floor,
    this.firstName,
    this.street,
    this.building,
    this.phoneNumber,
    this.shippingMethod,
    this.postalCode,
    this.city,
    this.country,
    this.lastName,
    this.state,
  });

  String apartment;
  String email;
  String floor;
  String firstName;
  String street;
  String building;
  String phoneNumber;
  String shippingMethod;
  String postalCode;
  String city;
  String country;
  String lastName;
  String state;

  Map<String, dynamic> toJson() => {
        "apartment": apartment == null ? null : apartment,
        "email": email == null ? null : email,
        "floor": floor == null ? null : floor,
        "first_name": firstName == null ? null : firstName,
        "street": street == null ? null : street,
        "building": building == null ? null : building,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "shipping_method": shippingMethod == null ? null : shippingMethod,
        "postal_code": postalCode == null ? null : postalCode,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "last_name": lastName == null ? null : lastName,
        "state": state == null ? null : state,
      };
}
