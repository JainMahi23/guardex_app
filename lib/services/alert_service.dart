// import 'location_service.dart';
// import 'sms_service.dart';

// class AlertService {
//   static Future<void> triggerSOS() async {
//     String link = await LocationService.getLocationLink();

//     // await SmsService.sendSOS(
//     //   message: "🚨 Emergency! Help me.\nLocation: $link",
//     // );
//     await SmsService.sendSOS(
//   "HELP ME! I FEEL UNSAFE",
//   locationLink,
// );
//   }
// }
import 'location_service.dart';
import 'sms_service.dart';

class AlertService {
  static Future<void> triggerSOS() async {
    // 1. Get location link first
    String locationLink = await LocationService.getLocationLink();

    // 2. Send SOS
    await SmsService.sendSOS(
      "🚨 HELP! I AM IN DANGER",
      locationLink,
    );
  }
}