class BaseResp<T> {
  T data;
  int code;
  String msg;

  BaseResp(this.code, this.msg, this.data);

  BaseResp.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}
