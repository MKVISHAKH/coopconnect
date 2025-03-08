
import 'dart:developer';

import 'package:cimalite/core/hook/hook.dart';
import 'package:url_launcher/url_launcher.dart';



class Screenhome extends StatefulWidget {
  const Screenhome({super.key});

  @override
  State<Screenhome> createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  String locationMessage = 'Current Location of the User';
  Timer? locationTimer;
  double doublelat = 0;
  double doublelong = 0;
  @override
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
                 // Livelocationfun.instance.stopTracking();
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
                        height: MediaQuery.of(context).size.height / 1.669,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              // bottomLeft: Radius.circular(50)
                            )),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Image.asset(
                              'assets/home/the-cooperation-555x420-removebg-preview.png',
                              width: MediaQuery.of(context).size.width/2,
                              height: MediaQuery.of(context).size.height/4
                            ),
                            // Lottie.asset(
                            //   'assets/animation/home/Animation - 1730091121508.json',
                            //   width: MediaQuery.of(context).size.width,
                            //   height: MediaQuery.of(context).size.height/3.8
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.115,
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
                      child: Text(
                        "CO-OP CONNECT", // Replace with your dynamic name
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        textScaler: TextScaler.noScaling,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.176,
                    left: MediaQuery.of(context).size.width * 0.24,
                    right: MediaQuery.of(context).size.width * 0.24,
                    child: Text(
                      "For Co-operative Society", // Replace with your dynamic name
                      style: TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      textScaler: TextScaler.noScaling,
                    ),
                  ),
                  
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.8,
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
                      height: MediaQuery.of(context).size.height / 1.75,
                      //padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xffAFDCEC),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(55),
                            topRight: Radius.circular(55),
                            // bottomLeft: Radius.circular(30),
                            // bottomRight: Radius.circular(30),
                          )),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 12,
                            child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Container(
                                        width: 35, // Reduce width
                                        height: 35,
                                        //padding:const EdgeInsets.all(4), 
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                            colors: [Colors.blue.shade300, Colors.blue.shade900],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                offset:const Offset(4, 4),
                                                blurRadius: 6,
                                              ),
                                              BoxShadow(
                                                color: const Color(0xffAFDCEC).withOpacity(0.8),
                                                offset:const Offset(-4, -4),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            icon:const FaIcon(FontAwesomeIcons.facebook, color: Colors.white,size: 20,),
                                            onPressed: () {
                                              launchSocURL('https://www.facebook.com/keralarcs', context);
                                            },
                                          ),
                                        ),
                                    ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Container(
                                        width: 35, // Reduce width
                                        height: 35,
                                          decoration: BoxDecoration(
                                            gradient:const LinearGradient(
                                            colors: [Color.fromARGB(255, 207, 9, 243), Color.fromARGB(255, 219, 65, 246)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                offset:const Offset(4, 4),
                                                blurRadius: 6,
                                              ),
                                              BoxShadow(
                                                color: const Color(0xffAFDCEC).withOpacity(0.8),
                                                offset:const Offset(-4, -4),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            icon:const FaIcon(FontAwesomeIcons.instagram, color: Colors.white,size: 20,),
                                            onPressed: () {
                                              launchSocURL('https://www.instagram.com/rcs.kerala/', context);
                            
                                              
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(right: 5.0),
                                      child: Container(
                                        width: 35, // Reduce width
                                        height: 35,
                                          decoration: BoxDecoration(
                                            gradient:const LinearGradient(
                                            colors: [Color.fromARGB(255, 54, 188, 58), Color.fromARGB(255, 2, 224, 9)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                offset:const Offset(4, 4),
                                                blurRadius: 6,
                                              ),
                                              BoxShadow(
                                                color: const Color(0xffAFDCEC).withOpacity(0.8),
                                                offset:const Offset(-4, -4),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            icon:const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,size: 20,),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ),
                                    //_build3DIconButton(FontAwesomeIcons.facebook, Colors.blue,25),
                                    //_build3DIconButton(FontAwesomeIcons.instagram, Color.fromARGB(255, 207, 9, 243),25),
                                    //_build3DIconButton(FontAwesomeIcons.whatsapp, Color.fromARGB(255, 54, 188, 58),25),
                                  ],
                              ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.18,
                            //height: MediaQuery.of(context).size.height / 2.388,
                            child: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 135,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              children: [
                                InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryFixed,
                                  onTap: () async {
                                  launchSocURL('https://cooperation.kerala.gov.in/2019/04/11/circulars/', context);
                                   
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    //margin: const EdgeInsets.all(5),
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
                                            "assets/home/inspection.jpg",
                                            fit: BoxFit.contain,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const Text(
                                          "ആർ‌സി‌എസ് സർക്കുലർ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
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
                                  launchSocURL('https://cooperation.kerala.gov.in/', context);
                                    
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    // margin: const EdgeInsets.all(5),
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
                                            "assets/home/schedule.jpg",
                                            fit: BoxFit.contain,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const Text(
                                          'സേവനങ്ങൾ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
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
                                          'പരിശോധനാ റിപ്പോർട്ടുകൾ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
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
                                              fontSize: 14,
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.18,
                            height: MediaQuery.of(context).size.height / 15,
                            child: InkWell(
                                  splashColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryFixed,
                                  onTap: () {
                                  },
                              child: Card(
                                        color: Colors.white,
                                        elevation: 8,
                                        margin: const EdgeInsets.all(5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                child:const Column(
                                  children: [
                                    SizedBox(height: 10,),
                                     Text(
                                              'സഹകരണ മാനുവൽ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
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
                          )
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
                        // Stack(
                        //   children: [
                        //     IconButton(
                        //       icon: Icon(
                        //         Icons.notifications,
                        //         color: Theme.of(context).colorScheme.onPrimary,
                        //         size: 25,
                        //       ),
                        //       onPressed: () {
                        //         // Handle notification button press
                        //       },
                        //     ),
                        //     Positioned(
                        //       right: 10,
                        //       top: 8,
                        //       child: Container(
                        //         padding:const EdgeInsets.all(2),
                        //         decoration:const BoxDecoration(
                        //           color: Colors.red,
                        //           shape: BoxShape.circle,
                        //         ),
                        //         constraints:const BoxConstraints(
                        //           minWidth: 10,
                        //           minHeight: 10,
                        //         ),
                        //         child:const Text(
                        //           '', // Replace with dynamic count or leave blank for just a dot
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 10,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
  void launchSocURL(String url,BuildContext context) async {
  Uri uri = Uri.parse(url);
  bool canLaunch = await canLaunchUrl(uri);
  log("Can launch URL: $canLaunch"); 
  try{
    if (canLaunch) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!context.mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }catch(e){
      if (!context.mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
  }
  
}
}
