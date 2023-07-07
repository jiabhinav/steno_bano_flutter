class ModelNotification {
  Payload? payload;
  String? message;
  String? errormessage;
  String? type;
  int? code;

  ModelNotification({
      this.payload, 
      this.message, 
      this.errormessage, 
      this.type, 
      this.code});

  ModelNotification.fromJson(dynamic json) {
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    message = json['message'];
    errormessage = json['errormessage'];
    type = json['type'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    map['message'] = message;
    map['errormessage'] = errormessage;
    map['type'] = type;
    map['code'] = code;
    return map;
  }

}

class Payload {
  List<NotificationsList>? notifications;

  Payload({
      this.notifications});

  Payload.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(NotificationsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class NotificationsList {
  int? notificationId;
  int? senderId;
  int? receiverId;
  String? notificationTitle;
  String? notification;
  int? notificationType;
  int? seen;
  int? status;
  String? createdAt;

  NotificationsList({
      this.notificationId, 
      this.senderId, 
      this.receiverId, 
      this.notificationTitle, 
      this.notification, 
      this.notificationType, 
      this.seen, 
      this.status, 
      this.createdAt});

  NotificationsList.fromJson(dynamic json) {
    notificationId = json['notification_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    notificationTitle = json['notification_title'];
    notification = json['notification'];
    notificationType = json['notification_type'];
    seen = json['seen'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['notification_id'] = notificationId;
    map['sender_id'] = senderId;
    map['receiver_id'] = receiverId;
    map['notification_title'] = notificationTitle;
    map['notification'] = notification;
    map['notification_type'] = notificationType;
    map['seen'] = seen;
    map['status'] = status;
    map['created_at'] = createdAt;
    return map;
  }

}