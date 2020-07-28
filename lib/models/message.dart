import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderId;
  String receiverId;
  String type;
  String message;
  FieldValue timestamp;
  String photoUrl;

  Message(
      {this.senderId,
        this.receiverId,
        this.type,
        this.message,
        this.timestamp
        });

  Message.imageMessage(
      {this.senderId,
        this.receiverId,
        this.type,
        this.message,
        this.timestamp,
        this.photoUrl
      });

  Message.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    type = json['type'];
    message = json['message'];
    timestamp = json['timestamp'];
//    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['type'] = this.type;
    data['message'] = this.message;
    data['timestamp'] = this.timestamp;
//    data['photoUrl'] = this.photoUrl;
    return data;
  }
}