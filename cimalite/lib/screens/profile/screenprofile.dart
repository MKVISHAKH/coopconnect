

import 'package:cimalite/core/hook/hook.dart';



class ScreenSocietyProfile extends StatefulWidget {
  const ScreenSocietyProfile({super.key});

  @override
  State<ScreenSocietyProfile> createState() => _ScreenSocietyProfileState();
}

class _ScreenSocietyProfileState extends State<ScreenSocietyProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Data? socval;
  List<String> columns = [];
  List<String?> cells = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     getsocietyprof();
     // getShareddata();
    });
  }

  Future<void> getsocietyprof() async {
      final socvalue=await InspectionListFun.instance.getSocietyProfile(context);
     setState(() {
       socval=socvalue;
     });
  }

  Future<bool?> popscreen(BuildContext context) async {
   // SocietyListFunctions.instance.getScietyListNotifier.value = [];
    Navigator.push(context, Approutes().homescreen);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final sessionTimer =
        (context.findAncestorWidgetOfExactType<MyApp>() as MyApp).sessionTimer;

    return ActivityMonitor(
      sessionTimer: sessionTimer,
      child: Stack(
        children: [
          PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) async {
              if (!didPop) {
                if (didPop) return;
                await popscreen(context);
              }
            },
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Theme.of(context).colorScheme.primaryFixed,
              appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onPrimary),
                    onPressed: () {
                      // SocietyListFunctions
                      //     .instance.getScietyListNotifier.value = [];
                      Navigator.pushReplacement(
                          context, Approutes().homescreen);
                    },
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
              body: ListView (
                children: [
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                 //mainAxisSize: MainAxisSize.min,
                 children: [
                  if (socval!=null) ...[
                    Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Center(child: Text(socval?.socName??'',style: Theme.of(context).textTheme.bodyLarge),),
                       ),
                       Padding(
                       padding: const EdgeInsets.all(8.0),
                     child: Row(
                             children: [
                               Text(
                                 "Society Code : ",
                                 // maxLines: 2, // Or any number you want
                                 // overflow: TextOverflow.visible,
                                 // softWrap: true,
                                 style: Theme.of(context)
                                     .textTheme
                                     .bodyLarge
                                     ?.copyWith(
                                       fontSize: 14,
                                     ),
                               ),
                               Text(
                                 socval?.societyCode ??'',
                                 // maxLines: 2, // Or any number you want
                                 overflow: TextOverflow.visible,
                                 softWrap: true,
                                 style: Theme.of(context)
                                     .textTheme
                                     .bodyLarge
                                     ?.copyWith(
                                         fontSize: 14,
                                         fontWeight:
                                             FontWeight.normal),
                               ),
                             ],
                           ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                  Text(
                                    "Reg No : ",
                                    // maxLines: 2, // Or any number you want
                                    // overflow: TextOverflow.visible,
                                    // softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    socval?.regNo ??'',
                                    // maxLines: 2, // Or any number you want
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight:
                                                FontWeight.normal),
                                  ),
                                ],
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                  Text(
                                    "Class : ",
                                    // maxLines: 2, // Or any number you want
                                    // overflow: TextOverflow.visible,
                                    // softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    socval?.classDet?.toUpperCase() ??'',
                                    // maxLines: 2, // Or any number you want
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight:
                                                FontWeight.normal),
                                  ),
                                ],
                              ),
                          ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                              children: [
                                Text(
                                  "Address: ",
                                  // maxLines: 2, // Or any number you want
                                  // overflow: TextOverflow.visible,
                                  // softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                                Text(
                                  socval?.address ??'',
                                  // maxLines: 2, // Or any number you want
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.normal),
                                ),
                                                                      ],
                                                                    ),
                            ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Text(
                                  "District : ",
                                  // maxLines: 2, // Or any number you want
                                  // overflow: TextOverflow.visible,
                                  // softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                                Text(
                                  socval?.districtName ??'',
                                  // maxLines: 2, // Or any number you want
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.normal),
                                ),
                              ],
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Text(
                                  "Thaluk : ",
                                  // maxLines: 2, // Or any number you want
                                  // overflow: TextOverflow.visible,
                                  // softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                                Text(
                                  socval?.talukName ??'',
                                  // maxLines: 2, // Or any number you want
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.normal),
                                ),
                                
                                                      
                              ],
                            ),
                        ),
                        Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(                                                                                  children: [
                                  Text(
                                    "Unit : ",
                                    // maxLines: 2, // Or any number you want
                                    // overflow: TextOverflow.visible,
                                    // softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    socval?.unitName ??'',
                                    // maxLines: 2, // Or any number you want
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight:
                                                FontWeight.normal),
                                  ),
                                                                          ],
                                                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(                                                                                  children: [
                                  Text(
                                    "Email : ",
                                    // maxLines: 2, // Or any number you want
                                    // overflow: TextOverflow.visible,
                                    // softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  Text(
                                    socval?.email ??'',
                                    // maxLines: 2, // Or any number you want
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight:
                                                FontWeight.normal),
                                  ),
                                ],
                                ),
                                ),
                              const SizedBox(height: 10,),
                              Center(child: Text('BRANCHES',style: Theme.of(context).textTheme.bodyLarge),),
                              ScrollableWidget(
                                        child: Card(
                                          elevation: 3,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 2,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Container(
                                            //width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                            color: const Color(
                                                0xff98c1d9), // White background
                                            borderRadius: BorderRadius.circular(
                                                12), // Rounded corners
                                            border: Border.all(
                                              // Thin black border
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                            children: [
                                              DataTable(
                                                headingRowHeight: 30,
                                                dataRowMaxHeight: 28,
                                                dataRowMinHeight: 28,
                                                columnSpacing: 10,
                                                headingRowColor:
                                                    WidgetStateProperty.all(
                                                        const Color(0xff1569C7)),
                                                columns: getColumns(columns = [
                                                  'SI.No',
                                                  'Branch',
                                                  'Branch category',
                                                ]),
                                                rows: getRowsList(socval?.branches??[], context),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                      ),
                                  ),
                  ]else ...[
                FutureBuilder(
                  future: Future.delayed(
                      const Duration(seconds: 10)), // Add a delay of 5 seconds
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                          child:const CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      // After 5 seconds, show the No Data Found image
                      return Center(
                        child: Padding(
                          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                          child: Image.asset(
                            'assets/error/no_data_found.png', // Path to your No Data Found image
                            height: 200,
                            width: 200,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ]
                       
                                
                ],)
              ],),
            )
      )])
    );
  }
   List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Center(
          child: Text(
            column,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }).toList();
  }
 List<DataRow> getRowsList(List<Branch> noticeList, BuildContext context) {
    // String? status;
    // String? action;
    // String? remarks;
    return noticeList.asMap().entries.map((entry) {
      int index = entry.key + 1; // Auto-increment starting from 1
      Branch task = entry.value;

      cells = [
        index.toString(),
        task.branchName,
        task.branchCatName,
      ];
      
      Color rowColor = index % 2 == 0
          ? const Color.fromARGB(255, 200, 227, 245) // Light grey for even rows
          : const Color(0Xff95B9C7); // White for odd rows

      return DataRow(color: WidgetStateProperty.all(rowColor), cells: [
        ...Utils.modelBuilder(cells, (index, cell) {
         // final taskbold = index == 2;

          return DataCell(
            Text(
              '$cell',
              style:Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
           
          );
        }),
      ]);
    }).toList();
  }
}
