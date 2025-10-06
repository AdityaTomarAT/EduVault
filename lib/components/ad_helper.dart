import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8934781250967740/2237291302';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8934781250967740/2237291302';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
