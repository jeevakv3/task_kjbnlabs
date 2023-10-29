import '../../allpackages.dart';

class DescriptiveController extends GetxController {
  final repository = DescriptiveRepository();

  var randomValue = 0.obs;

  var failureMessage = false.obs;

  RxInt get successCount => repository.successCount;

  void incrementSuccessCount() {
    failureMessage.value = true;
    repository.incrementSuccessCount();
    update();
  }

  int generateRandomBumber() {
    randomValue.value = Random().nextInt(60);
    return randomValue.value;
  }
}
