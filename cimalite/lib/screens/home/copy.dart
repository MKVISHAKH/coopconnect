import 'package:cimalite/core/hook/hook.dart';

class Screenhome extends StatefulWidget {
  const Screenhome({super.key});

  @override
  State<Screenhome> createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  String locationMessage = 'Current Location of the User';
  Timer? locationTimer;

  @override
  void initState() {
    super.initState();
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primaryFixed,
            title: Center(
                child: Text("Do You want to exit App?",
                    style: Theme.of(context).textTheme.titleSmall)),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () => Navigator.pop(context, false),
                child: Text('NO',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('YES',
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ],
          ));

  @override
  void dispose() {
    //Livelocationfun.instance.stopTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionTimer =
        (context.findAncestorWidgetOfExactType<MyApp>() as MyApp).sessionTimer;

    return ActivityMonitor(
      sessionTimer: sessionTimer,
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          // log('BackButton pressed!');
          if (!didPop) {
            //final nav=Navigator.of(context);
            if (didPop) return;
            final result = await showWarning(context);
            // print(result);
            if (result != null && result) {
              SystemNavigator.pop(); // This will properly exit the app
            }
          }
        },
        child: Scaffold(
          drawer: const Navbar(),
          body: Material(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Color(0xffAFDCEC),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.525,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(60),
                              // bottomLeft: Radius.circular(50)
                            )),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Lottie.asset(
                              'assets/animation/home/Animation - 1730091121508.json',
                              width: MediaQuery.of(context).size.width,
                              //height: MediaQuery.of(context).size.height/2
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.14,
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "CIMA ", // Replace with your dynamic name
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              textScaler: TextScaler.noScaling,
                            ),
                            Text(
                              "Lite ", // Replace with your dynamic name
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              textScaler: TextScaler.noScaling,
                            ),
                            Text(
                              "MOBILE APP", // Replace with your dynamic name
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              textScaler: TextScaler.noScaling,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.6,
                    left: MediaQuery.of(context).size.width * 0.24,
                    right: MediaQuery.of(context).size.width * 0.24,
                    child: Text(
                      "For Co-operative Society", // Replace with your dynamic name
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      textScaler: TextScaler.noScaling,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.9,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,

                        // borderRadius:const BorderRadius.only(bottomRight: Radius.circular(70))
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.89,
                      //padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xffAFDCEC),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(65),
                            // topRight: Radius.circular(30),
                            // bottomLeft: Radius.circular(30),
                            // bottomRight: Radius.circular(30),
                          )),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 24,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.18,
                            height: MediaQuery.of(context).size.height / 4,
                            child: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 140,
                              ),
                              children: [
                                InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryFixed,
                                  onTap: () async {
                                    InspectionListFun.instance
                                        .getinspLst(context);
                                    Navigator.pushReplacement(
                                        context, Approutes().screeninsplist);
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    margin: const EdgeInsets.all(5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            "assets/home/reports001.jpg",
                                            fit: BoxFit.contain,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const Text(
                                          "പരിശോധനാ റിപ്പോർട്ടുകൾ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Poppins-Medium'),
                                          maxLines: 2, // Or any number you want
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          textScaler: TextScaler.noScaling,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryFixed,
                                  onTap: () {
                                    InspectionListFun.instance
                                        .getinspNoticeLst(context);
                                    Navigator.pushReplacement(
                                        context, Approutes().screeninspnotice);
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    margin: const EdgeInsets.all(5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            "assets/home/action001.jpg",
                                            fit: BoxFit.contain,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const Text(
                                          'പരിശോധനാ നോട്ടീസുകൾ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Poppins-Medium'),
                                          maxLines: 2, // Or any number you want
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          textScaler: TextScaler.noScaling,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 30,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
