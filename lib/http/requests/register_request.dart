import 'base_request.dart';

class RegisterRequest extends BaseRequest {
  final String name;
  final String email;
  final String password;
  final String deviceType;
  final String deviceId;
  final String badgeNumber;
  final DateTime expiryDate;

  RegisterRequest({
    required this.badgeNumber,
    required this.deviceId,
    required this.deviceType,
    required this.email,
    required this.expiryDate,
    required this.name,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "badge_number": badgeNumber,
      "device_id": deviceId,
      "expiry_date": expiryDate.toIso8601String(),
      "email": email,
      "password": password,
      "device_type": deviceType,
    };
  }
}
