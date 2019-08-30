import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:customer_signature/test_signature2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signature1 extends StatefulWidget {
  @override
  _Signature1State createState() => _Signature1State();
}

class _Signature1State extends State<Signature1> {
  Color _color = Colors.black;
  GlobalKey<SignatureState> _key = GlobalKey<SignatureState>();
  Uint8List _pngBytes;

  _getSignature() async {
    final image = await _key.currentState.getData();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    setState(() {
      _pngBytes = byteData.buffer.asUint8List();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBEEE4),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.signature),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Signature2()),
              );
            },
          )
        ],
        title: Text('Customer signature 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.height,
                  height: 200,
                  color: Colors.white,
                  child: Signature(
                    key: _key,
                    color: _color,
                    strokeWidth: 3,
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print('red');
                          setState(() {
                            _color = Colors.red;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('green');
                          setState(() {
                            _color = Colors.green;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.green,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('black');
                          setState(() {
                            _color = Colors.black;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print('amber');
                          setState(() {
                            _color = Colors.amber;
                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(FontAwesomeIcons.eraser),
                        onPressed: () {
                          _key.currentState.clear();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.save),
                        onPressed: _getSignature,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            _pngBytes == null ? Container() : Image.memory(_pngBytes)
          ],
        ),
      ),
    );
  }
}
