import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as pkgffi;

import 'package:flutter/material.dart';
import 'package:utilities/main.dart';

class FfiPage extends StatelessWidget {
  const FfiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [ScanRfid()],
        ),
      ),
    );
  }
}

class ScanRfid extends StatelessWidget {
  const ScanRfid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RfidFfi.instance.init();

    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade300),
          height: 80,
          width: MediaQuery.of(context).size.width * .66,
        ),
        ElevatedButton(
          onPressed: () {
            final res = RfidFfi.instance.epcTidUser?.call();
            print(res?.toDartString());
            // print(res);
          },
          child: Text('Start Scanning'),
        )
      ],
    );
  }
}

class RfidFfi {
  RfidFfi._();

  static final RfidFfi _instance = RfidFfi._();

  static RfidFfi get instance => RfidFfi._instance;

  static DynamicLibrary? _lib;

  void init() async {
    _lib = Platform.isAndroid ? DynamicLibrary.open('libDeviceAPI.so') : null;
    if (_lib == null) {
      print('fail to load library');
    }
    func = _lib
        ?.lookup<NativeFunction<Pointer<pkgffi.Utf8> Function()>>(
            "UHF_InventorySingle_R2000")
        .asFunction(isLeaf: true);

    epcTidUser = _lib
        ?.lookup<NativeFunction<Pointer<pkgffi.Utf8> Function()>>(
            "UHF_GET_EPCTID")
        .asFunction(isLeaf: true);

    initUhf = _lib
        ?.lookup<NativeFunction<Int8 Function()>>("UHF_Init")
        .asFunction(isLeaf: true);

    openAndConnect = _lib
        ?.lookup<NativeFunction<Int8 Function()>>("UHF_OpenAndConnect")
        .asFunction(isLeaf: true);
  }

  // final int Function(int x, int y)? nativeAdd =
  // _lib?.lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
  //   .asFunction();

  Pointer<pkgffi.Utf8> Function()? func;
  Pointer<pkgffi.Utf8> Function()? epcTidUser;

  int Function()? initUhf;

  int Function()? openAndConnect;

  // Function inventorySingleTag() {
  //   return _lib
  //       ?.lookup<NativeFunction<Int32 Function(Int8, Int8, Int8)>>(
  //           "UHF_InventorySingle_R2000")
  //       .asFunction;
  // }
  //UHFGetProtocolType

  // int result = this.getDeviceAPI().UHFInit(this.config.getDeviceName());
  //       if (result > -1) {
  //           result = this.getDeviceAPI().UHFOpenAndConnect_Ex(this.config.getUart());
  //           Log.i(TAG, "init() Uart = " + this.config.getUart());
  //           if (result > -1) {
  //               this.setPowerOn(true);
  //               this.setConnectStatus(ConnectionStatus.CONNECTED);
  //               return true;
  //           }

  //           Log.e(TAG, "init() err UHFOpenAndConnect result:" + result);
  //           String strName = this.config.getDeviceName();
  //           if (strName.equals(DeviceConfiguration.C4000_6577) || strName.equals(DeviceConfiguration.C4000_6582) || strName.equals(DeviceConfiguration.C4050_6582) || strName.equals(DeviceConfiguration.C4050_8909)) {
  //               this.getDeviceAPI().UHFCloseAndDisconnect();
  //               result = this.getDeviceAPI().UHFOpenAndConnect(this.config.getUart());
  //               if (result > -1) {
  //                   this.setPowerOn(true);
  //                   this.setConnectStatus(ConnectionStatus.CONNECTED);
  //                   return true;
  //               }
  //           }
  //       } else {
  //           Log.e(TAG, "init() err UHFInit result:" + result);
  //       }
}
