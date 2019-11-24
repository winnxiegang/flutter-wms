class LoginEntity {
  String result;
  List<String> roleNameList;
  List<String> roles;
  int deptId;
  String username;

  LoginEntity(
      {this.result, this.roleNameList, this.roles, this.deptId, this.username});

  LoginEntity.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['roleNameList'] != null) {
      roleNameList = new List<String>();
    }
    if (json['roles'] != null) {
      roles = new List<String>();
    }
    deptId = json['deptId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.roleNameList != null) {
      data['roleNameList'] = [];
    }
    if (this.roles != null) {
      data['roles'] = [];
    }
    data['deptId'] = this.deptId;
    data['username'] = this.username;
    return data;
  }
}
