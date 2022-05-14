class SocketStrings {

  static const String chatChannel = 'clients';
  static const int chatPort = 3300;

  static const String getChatsEvent = 'chats';
  static const String getChatDetailsEvent = 'chatData';
  static const String sendMessageEvent = 'chatMessage';
  static const String replyToMessageEvent = 'replyMessage';
  static const String listenToMessageEvent = 'message';
  static const String listenToNewChatEvent = 'message_notification';
  static const String acceptMoaqbEvent = "acceptMoaqb";

  static const String searchChatsEvent = 'searchCahts';

  static const String seenEvent = 'seen';
  static const String onlineEvent = 'online';
  static const String typingEvent = 'typing';
  static const String listenToDeletedMessageEvent = 'delete';
  static const String deleteMessageEvent = 'deleteMessage';

  static const String renameGroupEvent = 'renameGroup';

  static const String blockEvent = 'block';
  static const String adminsChatsEvent = 'admins';

  static const String pinEvent = 'pin';
  static const String unpinEvent = 'unpin';

  static const String archiveEvent = 'archive';
  static const String unarchiveEvent = 'unarchive';
  static const String getArchivedChatsEvent = 'archivedChats';

  static const String forwardEvent = 'forward';

  static const String addGroupMemberEvent = 'addGroupMember';
  static const String removeGroupMemberEvent = 'removeGroupMember';

  static const String groupStatusEvent = 'groupStatus';
  static const String groupAdminStatusEvent = 'groupAdminStatus';

  static const String contactsChannel = 'contacts';
  static const int contactsPort = 4000;

  static const String addContactEvent = 'addContact';
  static const String getContactEvent = 'getContact';
  static const String removeContactEvent = 'removeContact';

  static const String receiveContactEvent = 'friend';
  static const String sendContactEvent = 'send_contacts';

}