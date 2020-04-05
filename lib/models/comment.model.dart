class Comment {
  int postId;
  int id;
  String name;
  String body;
  String email;

  Comment({this.postId, this.id, this.name, this.body, this.email});

  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    body = json['body'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['body'] = this.body;
    data['email'] = this.email;
    return data;
  }
}
