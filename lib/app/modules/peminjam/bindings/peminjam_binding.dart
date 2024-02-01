import 'package:get/get.dart';

import '../controllers/peminjam_controller.dart';

class PeminjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanController>(
      () => PeminjamanController(),
    );
  }
}
