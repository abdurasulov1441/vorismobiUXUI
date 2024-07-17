import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hand_signature/signature.dart';

HandSignatureControl control = new HandSignatureControl(
  threshold: 0.01,
  smoothRatio: 0.65,
  velocityRange: 2.0,
);

ValueNotifier<String?> svg = ValueNotifier<String?>(null);

ValueNotifier<ByteData?> rawImage = ValueNotifier<ByteData?>(null);

ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);

class Imzoqoyish extends StatelessWidget {
  bool get scrollTest => false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signature Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 2.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints.expand(),
                              color: Colors.white,
                              child: HandSignature(
                                control: control,
                                type: SignatureDrawType.shape,
                                // supportedDevices: {
                                //   PointerDeviceKind.stylus,
                                // },
                              ),
                            ),
                            CustomPaint(
                              painter: DebugSignaturePainterCP(
                                control: control,
                                cp: false,
                                cpStart: false,
                                cpEnd: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      CupertinoButton(
                        onPressed: () {
                          control.clear();
                          svg.value = null;
                          rawImage.value = null;
                          rawImageFit.value = null;
                        },
                        child: Text('clear'),
                      ),
                      CupertinoButton(
                        onPressed: () async {
                          svg.value = control.toSvg(
                            color: Colors.blueGrey,
                            type: SignatureDrawType.shape,
                            fit: true,
                          );

                          rawImage.value = await control.toImage(
                            color: Colors.blueAccent,
                            background: Colors.greenAccent,
                            fit: false,
                          );

                          rawImageFit.value = await control.toImage(
                            color: Colors.black,
                            //background: Colors.greenAccent,
                            fit: true,
                          );
                        },
                        child: Text('export'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildScaledImageView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScaledImageView() => Container(
        width: 192.0,
        height: 96.0,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white30,
        ),
        child: ValueListenableBuilder<ByteData?>(
          valueListenable: rawImageFit,
          builder: (context, data, child) {
            if (data == null) {
              return Container(
                color: Colors.red,
                child: Center(
                  child: Text('not signed yet (png)\nscaleToFill: true'),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.transparent,
                child: Image.memory(data.buffer.asUint8List()),
              );
            }
          },
        ),
      );
}
