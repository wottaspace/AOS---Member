import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:arcopen_employee/utils/services/jobs_service.dart';
import 'package:okito/okito.dart';

class KService {
  void registerServices() {
    Okito.inject<AuthService>(AuthService());
    Okito.inject<JobsService>(JobsService());
  }
}
