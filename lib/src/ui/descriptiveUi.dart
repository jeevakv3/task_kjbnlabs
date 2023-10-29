import '../../allpackages.dart';

class Descriptive extends StatefulWidget {
  const Descriptive({Key? key}) : super(key: key);

  @override
  State<Descriptive> createState() => _DescriptiveState();
}

class _DescriptiveState extends State<Descriptive>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controller;
  Color customBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color customWhiteColor = const Color.fromARGB(255, 237, 237, 237);

  var glowing = true;
  var scale = 1.0;

  var controller = Get.put(DescriptiveController());

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Descriptive'),
        backgroundColor: AppColors.kPrimary,
      ),
      body: Column(
        children: [
          SizedBox(
              width: w,
              height: h * 0.3,
              child: AspectRatio(
                aspectRatio: 208 / 71,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: const Color(0x4960F9).withOpacity(.5),
                        spreadRadius: 4,
                        blurRadius: 50)
                  ]),
                  child: MaterialButton(
                    onPressed: () {},
                    splashColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Widget 1 See Message :',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Container(
                                  constraints: BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Obx(() => Text(controller
                                          .failureMessage.value
                                      ? 'Success Count: ${controller.successCount}'
                                      : 'Try again'))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: h * 0.2,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    glowing = !glowing;
                    scale = 1.0;
                  });
                  randomNumberChanges();
                },
                child: AnimatedContainer(
                  transform: Matrix4.identity()..scale(scale),
                  duration: const Duration(milliseconds: 200),
                  height: h * 0.3,
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.kPrimary,
                          AppColors.kBlack,
                        ],
                      ),
                      boxShadow: glowing
                          ? [
                              BoxShadow(
                                color: AppColors.kPrimary.withOpacity(0.6),
                                spreadRadius: 1,
                                blurRadius: 16,
                                offset: const Offset(-8, 0),
                              ),
                              BoxShadow(
                                color: AppColors.kBlack.withOpacity(0.6),
                                spreadRadius: 1,
                                blurRadius: 16,
                                offset: const Offset(8, 0),
                              ),
                              BoxShadow(
                                color: AppColors.kPrimary.withOpacity(0.2),
                                spreadRadius: 16,
                                blurRadius: 32,
                                offset: const Offset(-8, 0),
                              ),
                              BoxShadow(
                                color: AppColors.kBlack.withOpacity(0.2),
                                spreadRadius: 16,
                                blurRadius: 32,
                                offset: const Offset(8, 0),
                              )
                            ]
                          : []),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Widget 2",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "onTap",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                  height: h * 0.3,
                  width: 160,
                  child: AspectRatio(
                    aspectRatio: 208 / 71,
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.lightBlue,
                            spreadRadius: 4,
                            blurRadius: 1)
                      ]),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Widget 3 Random no:',
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            36.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Obx(() => Text(
                                        'Random number ${controller.generateRandomBumber()}'))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  randomNumberChanges() {
    int randomValue = controller.generateRandomBumber();
    int timestamp = DateTime.now().second;
    print('randomnumber $randomValue');
    print('timeStamp $timestamp');
    if (randomValue == timestamp) {
      controller.incrementSuccessCount();
      Get.snackbar('Success', 'Success Count: ${controller.successCount}');
    } else {
      controller.failureMessage.value = false;
      // Get.snackbar('Try Again', '',
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
