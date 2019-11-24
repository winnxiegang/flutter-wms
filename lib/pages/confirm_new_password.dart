import 'package:flutter/material.dart';

class ConfirmNewPasswordPage extends StatefulWidget {
  final String phone, code;

  const ConfirmNewPasswordPage({
    this.code,
    this.phone,
    Key key,
  }) : super(key: key);

  @override
  ConfirmNewPasswordPageState createState() =>
      new ConfirmNewPasswordPageState();
}

class ConfirmNewPasswordPageState extends State<ConfirmNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("appBar标题"), centerTitle: true),
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("内容区域"));
  }
}
