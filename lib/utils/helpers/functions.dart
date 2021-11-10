import 'dart:io';

class DisableSslVerificationOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void disableSslVerification() {
  HttpOverrides.global = DisableSslVerificationOverride();
}
