import 'package:get/get.dart';
import 'package:we_gather_application/Utils/Langs/ar.dart';
import 'package:we_gather_application/Utils/Langs/en.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
