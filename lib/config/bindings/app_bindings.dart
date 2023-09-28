import 'package:get/get.dart';
import 'package:nettapp/features/auth/controller/auth_controller.dart';
import 'package:nettapp/features/scheduled%20visits/controller/controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(),
      permanent: true,
    );

    Get.put<VisitController>(
      VisitController(),
      permanent: true,
    );
  }
}