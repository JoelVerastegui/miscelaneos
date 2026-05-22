import 'package:share_plus/share_plus.dart';

class SharePlugin {

  static void shareLink(String link, String subject) {
    SharePlus.instance.share(
      ShareParams(text: link, title: link, subject: subject)
    );
  }

}