import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pataa_autofill_view/pataa_autofill_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String pataaCode = "";
  String address1 = "";
  String address2 = "";
  String address3 = "";
  String address4 = "";
  String zipcode = "";
  String cityName = "";
  String stateCode = "";
  String stateName = "";
  String countryCode = "";
  String countryName = "";
  String mapLink = "";
  String firstName = "";
  String lastName = "";
  String userCountryCode = "";
  String mobile = "";
  String error = "";

  bool isResponse = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PataaAutoFillView pataaView = PataaAutoFillView(
      // TODO: INSERT YOUR SECRET KEYS.
      secretKeyiOS: "===INSERT YOUR iOS SECRET KEY===",
      appPrefixiOS: "===INSERT YOUR iOS SECRET KEY===",
      secretKeyAndroid: '===INSERT YOUR Android SECRET KEY===',
      widthAddressInputField: MediaQuery.of(context).size.width - 10,
      heightAddressInputField:
          defaultTargetPlatform == TargetPlatform.iOS ? 100 : 120,
      onLoadData: (data) {
        // if (TargetPlatform.iOS == defaultTargetPlatform) {
        //   FocusManager.instance.primaryFocus?.unfocus();
        // }

        isResponse = true;
        setState(() {
          firstName = "";
          lastName = "";
          address4 = "";
          address3 = "";
          zipcode = "";
          stateName = "";
          address1 = "";
          userCountryCode = "";
          stateCode = "";
          countryName = "";
          pataaCode = "";
          cityName = "";
          countryCode = "";
          mapLink = "";
          address2 = "";
          mobile = "";
          error = "";
          if (data.containsKey("error")) {
            error = data["error"];
          } else {
            firstName = data["firstName"] ?? "";
            lastName = data["lastName"] ?? "";
            address4 = data["address4"] ?? "";
            address3 = data["address3"] ?? "";
            zipcode = data["zipcode"] ?? "";
            stateName = data["stateName"] ?? "";
            address1 = data["address1"] ?? "";
            countryName = data["countryName"] ?? "";

            userCountryCode = data["userCountryCode"] ?? "";
            stateCode = data["stateCode"] ?? "";
            pataaCode = data["pataaCode"] ?? "";
            cityName = data["cityName"] ?? "";
            if (countryName != "Unnamed location") {
              countryCode = data["countryCode"] ?? "";
            }

            mapLink = data["mapLink"] ?? "";
            address2 = data["address2"] ?? "";
            mobile = data["mobile"] ?? "";
          }
        });
      },
    );

    TextStyle getTextStyle({Color color = Colors.black}) =>
        TextStyle(color: color, fontSize: 16);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pataa Auto Fill'),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pataaView,
                  isResponse && error.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First Name: $firstName",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Last Name: $lastName",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Address1: $address1",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Address2: $address2",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Address3: $address3",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Address4: $address4",
                              style: getTextStyle(),
                            ),
                            Text(
                              "City Name: $cityName",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Country Name: $countryName",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Country Code: $countryCode",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Mobile: $mobile",
                              style: getTextStyle(),
                            ),
                            Text(
                              "State: $stateName",
                              style: getTextStyle(),
                            ),
                            Text(
                              "State Code: $stateCode",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Pataa Code: $pataaCode",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Map Link: $mapLink",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Zip Code: $zipcode",
                              style: getTextStyle(),
                            ),
                            Text(
                              "Mobile Country Code: $userCountryCode",
                              style: getTextStyle(),
                            ),
                          ],
                        )
                      : isResponse
                          ? Text(
                              "Error: $error",
                              style: getTextStyle(color: Colors.red),
                            )
                          : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
