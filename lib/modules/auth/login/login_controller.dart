import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/config/routes/k_routes.dart';
import 'package:arcopen_employee/constants/app_constants.dart';
import 'package:arcopen_employee/http/requests/login_request.dart';
import 'package:arcopen_employee/http/responses/member_profile_response.dart';
import 'package:arcopen_employee/utils/helpers/k_storage.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/mixins/validation_mixin.dart';
import 'package:arcopen_employee/utils/repositories/auth_repository.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:arcopen_employee/widgets/dialogs/k_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class LoginController extends OkitoController with ValidationMixin, ToastMixin {
  LoginController._internal();
  static final LoginController _singleton = LoginController._internal();

  factory LoginController() {
    return _singleton;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (kDebugMode) {
        emailController.text = "steveb@yopmail.com";
        passwordController.text = "12345678";
        setState(() {});
      }
    });
    super.initState();
  }

  final AuthRepository _repository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    if (formKey.currentState!.validate()) {
      KLoader().show();
      _repository.login(request: LoginRequest(email: emailController.text, password: passwordController.text)).then((value) async {
        KLoader.hide();
        if (value.user.userType != "member") {
          this.showErrorToast("This app is reserved to users with member profile. Consider using the enquirer app instead.");
          return;
        }
        KStorage().write(key: AppConstants.accessTokenKey, value: value.accessToken);

        Okito.use<AuthService>().profileExists = value.profileExists;
        Okito.use<AuthService>().user = value.user;
        if (value.profileExists) {
          final MemberProfileResponse memberProfileResponse = await _repository.readMemberProfile();
          Okito.use<AuthService>().profile = memberProfileResponse.profile;
        }

        if (value.profileExists) {
          KRouter().push(KRoutes.exploreRoute, replace: true);
        } else {
          KRouter().push(KRoutes.profileRoute, replace: true);
        }
      }).catchError((e) {
        KLoader.hide();
        this.showErrorToast(e.message);
      });
    }
  }
}
