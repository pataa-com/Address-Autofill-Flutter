# Pataa Address Autofill

Official Address Autofill SDK for Flutter to access Pataa API. This plugin supports both iOS and Android.

One of the major reasons of reduced churn rate i.e. a customer filling his cart with selected merchandise from your website but abandoning it before placing his order, is the long and tedious process of address filling. Pataa Navigations has the perfect solution for this problem, the Pataa Address Fill API. Our addressing app Pataa converts a long and complex address into a unique short code like JAIN53, KUMAR100 and simplifies complex addressing systems by sharing precise geo-tagged location, user recommended routes, user recorded voice directions and more, thus making last mile navigation easy. Now instead of long address details, the customer simply enters the Pataa code (^KUMAR100) in the address section and you can navigate straight to it without any hassle.

|               | Android   | iOS    |
| :-------------| :---------| :------|
| **Support**   | SDK 21+   | 10.0+  |

# Pataa AutoFill SDK Implementation Guide

## Features

Use this plugin in your Flutter app to:

* To convert a long and complex address into a unique short code like JAIN53,KUMAR100.
* Simplifies complex addressing systems by sharing precise geo-tagged location.
* User recommended routes, user recorded voice directions and more, thus making last mile navigation easy.

## Getting started

This plugin relies on the native iOS and Android SDK. The native SDKs a few of the services to Flutter to get the Pataa Address Details.

## Usage

To use the plugin you just need to add pataa_autofill_view: ^1.0.5 into your pubspec.yaml file and run pub get.

Further you need the iOS SECRET KEY, iOS PREFIX and ANDROID SECRET KEY to use the plugin.
* [Address API: Homepage] (https://addressapi.pataa.com/#/login)
* [Address API: Documentation] (https://docs.pataa.com)


![image](https://user-images.githubusercontent.com/103625941/163770534-6cec5e08-00c1-48f5-9ab8-4db4027aa820.png)

![image](https://user-images.githubusercontent.com/103625941/164167880-9334e305-62e1-47b1-86c2-1e336a40e481.png)

![image](https://user-images.githubusercontent.com/103625941/164168176-cdf9148e-98e3-4dd4-8bb7-e19b1400ef8e.png)

# Install SDK

To use the Pataa Autofill Flutter SDK :-

## Add following into your package's pubspec.yaml (and run an implicit dart pub get):
pataa_autofill_view: ^1.0.5

Goto iOS folder into the terminal and just run pod install.
If you get the following error :

[!] CocoaPods could not find compatible versions for pod "pataa_autofill_view":
  In Podfile:
    pataa_autofill_view (from `.symlinks/plugins/pataa_autofill_view/ios`)

Specs satisfying the `pataa_autofill_view (from `.symlinks/plugins/pataa_autofill_view/ios`)` dependency were found, but they required a higher minimum deployment target.

Just update the minimum deployment target of the xcode project to 10.0

## Example

    // TODO: INSERT YOUR SECRET KEYS.

    PataaAutoFillView pataaView = PataaAutoFillView(
        secretKeyiOS: "===INSERT YOUR iOS SECRET KEY===",
        appPrefixiOS: "===INSERT YOUR iOS PREFIX KEY===",
        secretKeyAndroid: '===INSERT YOUR Android SECRET KEY===',
        widthAddressInputField: MediaQuery.of(context).size.width - 10,
        heightAddressInputField:
            defaultTargetPlatform == TargetPlatform.iOS ? 100 : 120,
        onLoadData: (data) {
            if (kDebugMode) {
                print('Pataa Details :- $data');
            }
        },
    );

## Changelog

All notable changes to this project will be documented in [this file](./CHANGELOG.md).

## Issues

To report your issues, submit them directly in the [Issues](https://github.com/pataa-com/Address-Autofill-Flutter/issues) section.

## License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)