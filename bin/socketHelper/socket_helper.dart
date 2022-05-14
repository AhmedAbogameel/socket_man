import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../socket_man.dart';

class SocketHelper {

  late IO.Socket socket;

  bool _isConnected = false;

  void connect({required int port, required String path, Function? onConnect}) {
    socket = IO.io('https://chattime.live:$port/$path',<String, dynamic>{
      'transports': ['websocket'],
      'forceNew': true,
      'query': 'phone=$sender'
    });

    socket.onConnectError((data) {
      print('ConnectError: $data');
    });

    socket.onConnectTimeout((data) {
      print('Timeout: $data');
    });

    socket.onError((data) {
      print('Error: $data');
    });

    socket.onConnect((data) {
      if(_isConnected)
        return;
      _isConnected = true;
      if(onConnect != null)
        onConnect();
    });

    socket.onDisconnect((data) {
      print('Disconnected: ' + data.toString());
    });

    socket.onReconnecting((data) {
      print('Reconnecting: ' + data.toString());
    });

    socket.onReconnect((data) {});

  }

  void disconnect() {
    socket.disconnect();
    socket.dispose();
    _isConnected = false;
  }

  void sendTo({required String event, var data}) =>
      socket.emit(event, data == null ? null : json.encode(data));

  bool get isConnected => socket.connected;

  StreamController<T> listenTo<T>(String event, {bool isBroadCast = false}) {
    StreamController<T> streamController = isBroadCast ? StreamController<T>.broadcast() : StreamController<T>();
    socket.on(event, (data) => streamController.isClosed ? null : streamController.sink.add(data));
    return streamController;
  }

}