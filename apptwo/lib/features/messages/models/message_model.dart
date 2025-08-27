class MessageModel {
  final String id;
  final String receiverName;
  final String receiverUid;
  final String senderName;
  final String senderUid;
  final String createdAt;
  final String content;

  MessageModel({
    required this.id,
    required this.receiverName,
    required this.receiverUid,
    required this.senderName,
    required this.senderUid,
    required this.createdAt,
    required this.content,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
    id: map['id'],
    receiverName: map['receiverName'],
    receiverUid: map['receiverUid'],
    senderName: map['senderName'],
    senderUid: map['senderUid'],
    createdAt: map['createdAt'],
    content: map['content'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'receiverName': receiverName,
    'receiverUid': receiverUid,
    'senderName': senderName,
    'senderUid': senderUid,
    'createdAt': createdAt,
    'content': content,
  };
}
