import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rogchat/constants/app_strings.dart';
import 'package:rogchat/models/message.dart';
import 'package:rogchat/models/user.dart';

class ChatService {
  static final Firestore _firestore = Firestore.instance;

  Future<void> sendMessage(
      Message message, User sender, User receiver) async {
    var map = message.toJson();

    await _firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    return await _firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }

  void setImageMsg(String url, String receiverId, String senderId) async {
    Message message;

    message = Message.imageMessage(
        message: "IMAGE",
        receiverId: receiverId,
        senderId: senderId,
        photoUrl: url,
        timestamp: Timestamp.now(),
        type: 'image');

    // create imagemap
    var map = message.toJsonWithImage();

    // var map = Map<String, dynamic>();
    await _firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);

    _firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }
}
