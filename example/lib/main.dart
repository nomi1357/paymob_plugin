import 'package:flutter/material.dart';
import 'dart:async';

import 'package:paymob_plugin/paymob_plugin.dart';
import 'package:paymob_plugin/models/payment.dart';
import 'package:paymob_plugin/models/order.dart';
import 'package:paymob_plugin/models/payment_key_request.dart';
import 'package:paymob_plugin/models/payment_result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String apiKey =
  'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRJd056RXNJbTVoYldVaU9pSXhOall6TURjeE16WXlMakl4TkRVME5DSjkuZ0NiQnNiaW12SUswcGZzV084Q1RNUWtQUjFvOGpFdDYtdGY3UWFMeTdUWnU3S3FWYXBaNlNqMlZYMGladVh6Yk9PWkhzRmRDdVdaeUVQc0N3QnZYaXc=';
  String _auth = '';
  int _orderId;
  String _paymentKey = '';

  String _error = 'No Error';
  String _result = 'Unknown';
  String _token = 'Unknown';
  String _maskedPan = 'Unknown';

  Future<void> authenticateRequest() async {
    try {
      String result = await PaymobPlugin.authenticateRequest(apiKey);
      if (!mounted) return;

      setState(() {
        _auth = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = '$e';
      });
    }
  }

  Future<void> registerOrder() async {
    try {
      int result = await PaymobPlugin.registerOrder(
        Order(
          authToken: _auth,
          deliveryNeeded: "false",
          amountCents: "35000",
          currency: "PKR",
          merchantOrderId: 1263,
          items: [
            Item(
                name: "ASC1515",
                amountCents: "35000",
                description: "Smart Watch",
                quantity: "1",),
            // Item(
            //     name: "ERT6565",
            //     amountCents: "1000",
            //     description: "Power Bank",
            //     quantity: "1",)
          ],
          // shippingData: ShippingData(
          //     apartment: "803",
          //     email: "claudette09@exa.com",
          //     floor: "42",
          //     firstName: "Clifford",
          //     street: "Ethan Land",
          //     building: "8028",
          //     phoneNumber: "+86(8)9135210487",
          //     postalCode: "01898",
          //     extraDescription: "8 Ram , 128 Giga",
          //     city: "Jaskolskiburgh",
          //     country: "CR",
          //     lastName: "Nicolas",
          //     state: "Utah"),
          // shippingDetails: ShippingDetails(
          //     notes: "test",
          //     numberOfPackages: 1,
          //     weight: 1,
          //     weightUnit: "Kilogram",
          //     length: 1,
          //     width: 1,
          //     height: 1,
          //     contents: "product of some sorts"),
        ),
      );
      if (!mounted) return;

      setState(() {
        _orderId = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = '$e';
      });
    }
  }

  Future<void> requestPaymentKey() async {
    try {
      String result = await PaymobPlugin.requestPaymentKey(
        PaymentKeyRequest(
          authToken: _auth,
          amountCents: "35000",
          expiration: 3600,
          orderId: _orderId.toString(),
          billingData: BillingData(
              apartment: "803",
              email: "claudette09@exa.com",
              floor: "42",
              firstName: "Clifford",
              street: "Ethan Land",
              building: "8028",
              phoneNumber: "+86(8)9135210487",
              postalCode: "01898",
              city: "Jaskolskiburgh",
              country: "CR",
              lastName: "Nicolas",
              state: "Utah"),
          currency: "PKR",
          integrationId: 12740,
          lockOrderWhenPaid: "false",
        ),
      );
      if (!mounted) return;

      setState(() {
        _paymentKey = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = '$e';
      });
    }
  }

  Future<void> startPayActivityNoToken() async {
    try {
      PaymentResult result = await PaymobPlugin.startPayActivityNoToken(Payment(
        paymentKey: _paymentKey,
        saveCardDefault: false,
        showSaveCard: true,
        themeColor: Color(0xFF002B36),
        language: "en",
        actionbar: true,
      ));
      if (!mounted) return;

      setState(() {
        _result = result.dataMessage;
        _token = result.token;
        _maskedPan = result.maskedPan;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = '$e';
      });
    }
  }

  Future<void> startPayActivityToken() async {
    try {
      String result = await PaymobPlugin.startPayActivityToken(Payment(
        paymentKey: _paymentKey,
        saveCardDefault: false,
        showSaveCard: true,
        themeColor: Color(0xFF002B36),
        language: "en",
        actionbar: true,
        token: _token,
        maskedPanNumber: _maskedPan,
        customer: Customer(
            firstName: "Eman",
            lastName: "Ahmed",
            phoneNumber: "+201012345678",
            email: "example@gmail.com",
            building: "7",
            floor: "9",
            apartment: "91",
            city: "Alexandria",
            state: "NA",
            country: "Egypt",
            postalCode: "NA"),
      ));
      if (!mounted) return;

      setState(() {
        _result = result;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = '$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                onPressed: () async {
                  await authenticateRequest();
                },
                child: Text('Authentication Request'),
              ),
              Text('auth: $_auth'),
              MaterialButton(
                onPressed: () async {
                  await registerOrder();
                },
                child: Text('Order Registration API'),
              ),
              Text('orderId: $_orderId'),
              MaterialButton(
                onPressed: () async {
                  await requestPaymentKey();
                },
                child: Text('Payment Key Request'),
              ),
              Text('paymentKey: $_paymentKey'),
              Divider(),
              MaterialButton(
                onPressed: () async {
                  print(_paymentKey);
                  await startPayActivityNoToken();
                },
                child: Text('startPayActivityNoToken'),
              ),
              MaterialButton(
                onPressed: () async {
                  await startPayActivityToken();
                },
                child: Text('startPayActivityToken'),
              ),
              Text(
                'error: $_error',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "TRANSACTION_SUCCESSFUL : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('result: $_result'),
              Text(
                "TRANSACTION_SUCCESSFUL_CARD_SAVED",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('token: $_token'),
              Text('maskedPan: $_maskedPan'),
            ],
          ),
        ),
      ),
    );
  }
}
