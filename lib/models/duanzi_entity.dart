class DuanziEntity {
  List<DuanziResult> result;
  int code;
  String message;

  DuanziEntity({this.result, this.code, this.message});

  DuanziEntity.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<DuanziResult>();
      (json['result'] as List).forEach((v) {
        result.add(new DuanziResult.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class DuanziResult {
  String thumbnail;
  String images;
  String topCommentsContent;
  String forward;
  String video;
  String type;
  String down;
  String sid;
  String topCommentsUid;
  String uid;
  String passtime;
  String topCommentsVoiceuri;
  String topCommentsName;
  String name;
  String header;
  String comment;
  String text;
  String up;
  String topCommentsHeader;

  DuanziResult(
      {this.thumbnail,
      this.images,
      this.topCommentsContent,
      this.forward,
      this.video,
      this.type,
      this.down,
      this.sid,
      this.topCommentsUid,
      this.uid,
      this.passtime,
      this.topCommentsVoiceuri,
      this.topCommentsName,
      this.name,
      this.header,
      this.comment,
      this.text,
      this.up,
      this.topCommentsHeader});

  DuanziResult.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    images = json['images'];
    topCommentsContent = json['top_comments_content'];
    forward = json['forward'];
    video = json['video'];
    type = json['type'];
    down = json['down'];
    sid = json['sid'];
    topCommentsUid = json['top_comments_uid'];
    uid = json['uid'];
    passtime = json['passtime'];
    topCommentsVoiceuri = json['top_comments_voiceuri'];
    topCommentsName = json['top_comments_name'];
    name = json['name'];
    header = json['header'];
    comment = json['comment'];
    text = json['text'];
    up = json['up'];
    topCommentsHeader = json['top_comments_header'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    data['top_comments_content'] = this.topCommentsContent;
    data['forward'] = this.forward;
    data['video'] = this.video;
    data['type'] = this.type;
    data['down'] = this.down;
    data['sid'] = this.sid;
    data['top_comments_uid'] = this.topCommentsUid;
    data['uid'] = this.uid;
    data['passtime'] = this.passtime;
    data['top_comments_voiceuri'] = this.topCommentsVoiceuri;
    data['top_comments_name'] = this.topCommentsName;
    data['name'] = this.name;
    data['header'] = this.header;
    data['comment'] = this.comment;
    data['text'] = this.text;
    data['up'] = this.up;
    data['top_comments_header'] = this.topCommentsHeader;
    return data;
  }
}
