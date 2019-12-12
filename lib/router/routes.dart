import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class Routes {
  static Router router;
  static String root = "/";
  static String forgetPassword = "/forgetPassword";
  static String login = "/login";
  static String confirmNewPassword = "/confirmNewPassword";
  static String photpGalleryPage = "/photpGalleryPage";
  static String videoPalyShowPage = "/videoPalyShowPage";
  static String fLWebviewPage = "/fLWebviewPage";

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(forgetPassword, handler: forgetPasswordHandler);
    router.define(confirmNewPassword, handler: confirmNewPasswordHandler);
    router.define(photpGalleryPage, handler: photpGalleryPageHandler);
    router.define(videoPalyShowPage, handler: videoPalyShowPageHandler);
    router.define(fLWebviewPage, handler: fLWebviewPageHandler);
    Routes.router = router;
  }
}
