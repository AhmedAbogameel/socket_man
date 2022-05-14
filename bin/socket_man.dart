import 'dart:developer';

import 'socketHelper/socket_helper.dart';
import 'socketHelper/strings.dart';

const String sender = '0510090384';
const String receiver = '0555555555';

void main(List<String> arguments) {

  /// Connect to Server
  SocketHelper socketHelper = SocketHelper()..connect(
    port: SocketStrings.chatPort,
    path: SocketStrings.chatChannel,
  );

  /// Listening To New Chat
  final newChatSC = socketHelper.listenTo(SocketStrings.listenToNewChatEvent);
  newChatSC.stream.listen((event) {
    print('-'*8);
    print(SocketStrings.listenToNewChatEvent);
    print(event.toString());
    print('-'*8);
  });

  /// Listening To New Message for [Receiver] Chat
  // final newMessagesSC = socketHelper.listenTo(SocketStrings.listenToMessageEvent);
  // newMessagesSC.stream.listen((event) {
  //   print('-'*8);
  //   print(SocketStrings.listenToMessageEvent);
  //   print(event.toString());
  //   print('-'*8);
  // });

  /// Send Message
  Future.delayed(
    Duration(seconds: 4),
        () {
          socketHelper.sendTo(
            event: SocketStrings.sendMessageEvent,
            data: {
              'sender': sender,
              'reciever': receiver,
              'msg': 'Test Message from Dart CLI',
              'type': 'text',
            },
          );
        },
  );

}
