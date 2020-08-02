class Call {
  String callerId;
  String callerName;
  String callerPic;
  String receiverId;
  String receiverName;
  String receiverPic;
  String channelId;
  bool hasDialled;

  Call({
    this.callerId,
    this.callerName,
    this.callerPic,
    this.receiverId,
    this.receiverName,
    this.receiverPic,
    this.channelId,
    this.hasDialled,
  });

  Map<String, dynamic> toJson(Call call) {
    Map<String, dynamic> data = Map();
    data["caller_id"] = call.callerId;
    data["caller_name"] = call.callerName;
    data["caller_pic"] = call.callerPic;
    data["receiver_id"] = call.receiverId;
    data["receiver_name"] = call.receiverName;
    data["receiver_pic"] = call.receiverPic;
    data["channel_id"] = call.channelId;
    data["has_dialled"] = call.hasDialled;
    return data;
  }

  Call.fromJson(Map<String, dynamic> json) {
    this.callerId = json["caller_id"];
    this.callerName = json["caller_name"];
    this.callerPic = json["caller_pic"];
    this.receiverId = json["receiver_id"];
    this.receiverName = json["receiver_name"];
    this.receiverPic = json["receiver_pic"];
    this.channelId = json["channel_id"];
    this.hasDialled = json["has_dialled"];
  }
}
