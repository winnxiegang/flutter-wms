
import 'package:flutter_wms/utils/CommonUtils.dart';

class HttpErrorEvent {
  final String message;
  HttpErrorEvent(this.message);

  static errorHandleFunction(message) {
    CommonUtils.eventBus.fire(new HttpErrorEvent(message));
    return message;
  }
}