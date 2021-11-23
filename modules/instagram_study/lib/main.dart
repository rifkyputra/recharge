import 'package:flutter/material.dart';

import 'widgets/modal/modal_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Instagram Study'),
          elevation: 0,
          leading: IconButton(
            onPressed: () => '',
            icon: Icon(Icons.camera_alt_rounded),
          ),
          actions: [
            IconButton(
              onPressed: () => '',
              icon: Icon(
                Icons.account_balance_wallet_outlined,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _modalButtonCupertino(context),
                  _modalButtonMaterial(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _modalButtonCupertino(BuildContext context) {
    return ElevatedButton(
      child: Text('Modal Alert Cupertino'),
      onPressed: () {
        ModalInfo.cupertinoPopup(
          context: context,
          onTap: () {
            Navigator.of(context).pop();
          },
          title: 'Map Information',
          content:
              'Report a problem with the Map data legal notices (c) OpenStreetMap',
        );
      },
    );
  }

  Widget _modalButtonMaterial(BuildContext context) {
    return ElevatedButton(
      child: Text('Modal Alert Material'),
      onPressed: () {
        ModalInfo.materialPopup(
          context: context,
          onTap: () {
            Navigator.of(context).pop();
          },
          title: 'Map Information',
          content:
              'Report a problem with the Map data legal notices (c) OpenStreetMap',
        );
      },
    );
  }
}
