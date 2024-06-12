class MessageModel {
  final String text;
  final bool isMine;

  MessageModel({
    required this.text,
    required this.isMine,
  });

  Map<String, dynamic> toJson() => {
    'text': text,
    'isMine': isMine,
  };

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'],
      isMine: json['isMine'],
    );
  }
}
