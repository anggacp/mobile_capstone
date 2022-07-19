import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../API/login_service.dart';
import 'LoginRequestModel.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
  }

  // Future<void> loginUser(String username, String password) async {
  //   final response = await _loginService
  //       .fetchLogin(LoginRequestModel(username: username, password: password));
  //
  //   print(response);
  //
  //   if (response?.data?.accessToken != null) {
  //     /// Set isLogin to true
  //     //  _authManager.login(response);
  //
  //   }
  //   if (response?.data?.accessToken == null) {
  //     print("ini res $response");
  //   }
  // }
}