import '../../allpackages.dart';

class DescriptiveRepository {
  var successCount = 0.obs;

  void incrementSuccessCount() {
    successCount.value++;
  }

  int getSuccessCount() {
    return successCount.value;
  }
}
