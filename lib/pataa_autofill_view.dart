import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PataaAutoFillView extends StatefulWidget {
  final Function(Map) onLoadData;
  final double heightAddressInputField;
  final double widthAddressInputField;

  final String secretKeyiOS;
  final String appPrefixiOS;
  final String secretKeyAndroid;

  const PataaAutoFillView({
    Key? key,
    required this.secretKeyiOS,
    required this.appPrefixiOS,
    required this.secretKeyAndroid,
    required this.onLoadData,
    required this.heightAddressInputField,
    required this.widthAddressInputField,
  }) : super(key: key);

  @override
  State<PataaAutoFillView> createState() => _PataaAutoFillViewState();
}

class _PataaAutoFillViewState extends State<PataaAutoFillView> {
  static const MethodChannel _channel = MethodChannel('pataa_autofill_sdk');

  @override
  void initState() {
    setHandler();

    super.initState();
  }

  setHandler() {
    _channel.setMethodCallHandler(methodCallHandler);
  }

  Future<dynamic> methodCallHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'pataa_autofill_sdk':
        Map valueMap = json.decode(methodCall.arguments);
        widget.onLoadData(valueMap);
        return null;

      default:
        throw PlatformException(code: 'notimpl', message: 'not implemented');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = <String, String>{};
    data['secretKeyiOS'] = widget.secretKeyiOS;
    data['appPrefixiOS'] = widget.appPrefixiOS;
    data['secretKeyAndroid'] = widget.secretKeyAndroid;

    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox(
          height: widget.heightAddressInputField,
          child: PlatformViewLink(
            viewType: 'NativeViews',
            surfaceFactory:
                (BuildContext context, PlatformViewController controller) {
              return AndroidViewSurface(
                controller: controller as AndroidViewController,
                gestureRecognizers: const <
                    Factory<OneSequenceGestureRecognizer>>{},
                hitTestBehavior: PlatformViewHitTestBehavior.opaque,
              );
            },
            onCreatePlatformView: (PlatformViewCreationParams params) {
              return PlatformViewsService.initSurfaceAndroidView(
                id: params.id,
                viewType: 'NativeViews',
                layoutDirection: TextDirection.ltr,
                creationParams: data,
                creationParamsCodec: const StandardMessageCodec(),
                onFocus: () {
                  params.onFocusChanged(true);
                },
              )
                ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
                ..create();
            },
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        height: widget.heightAddressInputField,
        width: widget.widthAddressInputField,
        child: UiKitView(
          viewType: 'NativeView',
          creationParams: data,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    }

    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }
}
