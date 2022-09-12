// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.authToken,
    this.deliveryNeeded,
    this.amountCents,
    this.currency,
    this.merchantOrderId,
    this.items,
    this.shippingData,
    this.shippingDetails,
  });

  String? authToken;
  String? deliveryNeeded;
  String? amountCents;
  String? currency;
  int? merchantOrderId;
  List<Item>? items;
  ShippingData? shippingData;
  ShippingDetails? shippingDetails;

  Map<String, dynamic> toJson() => {
        "auth_token": authToken == null ? null : authToken,
        "delivery_needed": deliveryNeeded == null ? null : deliveryNeeded,
        "amount_cents": amountCents == null ? null : amountCents,
        "currency": currency == null ? null : currency,
        "merchant_order_id": merchantOrderId == null ? null : merchantOrderId,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "shipping_data": shippingData == null ? null : shippingData!.toJson(),
        "shipping_details":
            shippingDetails == null ? null : shippingDetails!.toJson(),
      };
}

class Item {
  Item({
    this.name,
    this.amountCents,
    this.description,
    this.quantity,
  });

  String? name;
  String? amountCents;
  String? description;
  String? quantity;

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "amount_cents": amountCents == null ? null : amountCents,
        "description": description == null ? null : description,
        "quantity": quantity == null ? null : quantity,
      };
}

class ShippingData {
  ShippingData({
    this.apartment,
    this.email,
    this.floor,
    this.firstName,
    this.street,
    this.building,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
    this.city,
    this.country,
    this.lastName,
    this.state,
  });

  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? city;
  String? country;
  String? lastName;
  String? state;

  Map<String, dynamic> toJson() => {
        "apartment": apartment == null ? null : apartment,
        "email": email == null ? null : email,
        "floor": floor == null ? null : floor,
        "first_name": firstName == null ? null : firstName,
        "street": street == null ? null : street,
        "building": building == null ? null : building,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "postal_code": postalCode == null ? null : postalCode,
        "extra_description": extraDescription == null ? null : extraDescription,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "last_name": lastName == null ? null : lastName,
        "state": state == null ? null : state,
      };
}

class ShippingDetails {
  ShippingDetails({
    this.notes,
    this.numberOfPackages,
    this.weight,
    this.weightUnit,
    this.length,
    this.width,
    this.height,
    this.contents,
  });

  String? notes;
  int? numberOfPackages;
  int? weight;
  String? weightUnit;
  int? length;
  int? width;
  int? height;
  String? contents;

  Map<String, dynamic> toJson() => {
        "notes": notes == null ? null : notes,
        "number_of_packages":
            numberOfPackages == null ? null : numberOfPackages,
        "weight": weight == null ? null : weight,
        "weight_unit": weightUnit == null ? null : weightUnit,
        "length": length == null ? null : length,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "contents": contents == null ? null : contents,
      };
}
