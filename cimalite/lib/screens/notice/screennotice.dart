import 'dart:io';
import 'dart:math';

import 'package:cimalite/core/hook/hook.dart';

import 'package:intl/intl.dart';

class ScreenInspNotice extends StatefulWidget {
  const ScreenInspNotice({super.key});

  @override
  State<ScreenInspNotice> createState() => _ScreenInspNoticeState();
}

class _ScreenInspNoticeState extends State<ScreenInspNotice> {
  List<String> columns = [];
  List<String?> cells = [];
  int? selectedInspectionid;
  List<DatumVal>? insplist = [];
  List<Map<String, Object>> inspectionlst = [];
  String cmpltdt = '';
  String inspecDt = '';
  String apprvDt = '';
  String notDt = '';
  Sharedpref? sharedValue;
  String? socName;
  String? socCode;
  String? extractedString;
  final TextEditingController _dateToController = TextEditingController();
  final TextEditingController _dateFromController = TextEditingController();
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   //insplist =  InspectionListFun.instance.getInspectionNoticeListNotifier.value;
    //   insplist = await InspectionListFun.instance.getinspNoticeLst(context);

    //   setState(() {
    //     inspectionlst = insplist!.map((bus) {
    //       //String societyname = bus.societyName ?? "";
    //       return {
    //         'inspNo': bus.inspNumber ?? '', // routeId as int
    //         'inspId': bus.inspectionId ?? 0, // Display label
    //       };
    //     }).toList();
    //   });
    // });
    getdata();
    super.initState();
  }

  void getdata() async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    setState(() {
      socName = sharedValue?.socName ?? '';
      socCode = sharedValue?.socCode ?? '';
    });
  }

  Future<bool?> popscreen(BuildContext context) async {
    InspectionListFun.instance.getInspectionNoticeListNotifier.value=[];
    Navigator.push(context, Approutes().homescreen);
    return true;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sessionTimer =
        (context.findAncestorWidgetOfExactType<MyApp>() as MyApp).sessionTimer;

    return ActivityMonitor(
      sessionTimer: sessionTimer,
      child: PopScope(
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
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    InspectionListFun.instance.getInspectionNoticeListNotifier.value=[];
                    Navigator.pushReplacement(context, Approutes().homescreen);
                  },
                ),
                title: Text(
                  "Inspection Notice",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                )),
            body: Column(
              //children: [ScrollableWidget(child: buildScheduledTab())],
              children: [
                inputfiledDisplay(),
                Expanded(child: ScrollableWidget(child: buildScheduledTab())),
              ],
            )),
      ),
    );
  }

  Widget inputfiledDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color(0xff1569C7),
      ),
      child: Theme(
        data: MyTheme.googleFormTheme,
        child: Column(
          children: [
            Text(socName ?? '',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 16)),
            Text('Society code:${socCode ?? ''}',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('From Date',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(right: 105.0),
                  child: Text('To Date',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width /
                      2.2, // Adjust width if needed
                  //height: MediaQuery.of(context).size.height/20, // Adjust width if needed
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary, // Background color
                      borderRadius: BorderRadius.circular(
                          6.0), // Optional rounded corners
                    ),
                    child: TextFormField(
                      controller: _dateFromController,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'From Date',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 12),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12)),
                      readOnly: true,
                      onTap: () => _selectDate(context, _dateFromController),
                    ),
                  ),
                ),
                //const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width /
                      2.2, // Adjust width if needed
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary, // Background color
                      borderRadius: BorderRadius.circular(
                          6.0), // Optional rounded corners
                    ),
                    child: TextFormField(
                      controller: _dateToController,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'To Date',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 12),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12)),
                      readOnly: true,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.only(right: 190.0),
            //   child: Text('Select Inspection No',
            //       style: Theme.of(context)
            //           .textTheme
            //           .labelMedium
            //           ?.copyWith(fontWeight: FontWeight.bold)),
            // ),
            // SizedBox(
            //   //width: MediaQuery.of(context).size.width / 1.5,
            //   child: Container(
            //     height: 40,
            //     decoration: BoxDecoration(
            //       color: Theme.of(context)
            //           .colorScheme
            //           .onPrimary, // Background color
            //       borderRadius:
            //           BorderRadius.circular(6.0), // Optional rounded corners
            //     ),
            //     child: DropdownButtonFormField<int>(
            //       items: inspectionlst.map((soc) {
            //         return DropdownMenuItem<int>(
            //           value: soc['inspId'] as int, // Use socid as the value
            //           child: Text(
            //             soc['inspNo'] as String,
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .displaySmall
            //                 ?.copyWith(fontSize: 12),
            //           ),
            //         );
            //       }).toList(),
            //       onChanged: (int? newValue) {
            //         setState(() {
            //           selectedInspectionid = newValue; // Store the selected socid
            //         });
            //         // fetchbranch(
            //         //     selectedSocietyid); // Call API with the selected ID
            //       },
            //       value: selectedInspectionid, // Pre-selected value if any
            //       style: TextStyle(
            //         color: Theme.of(context).colorScheme.onPrimary,
            //       ),
            //       icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            //       decoration: InputDecoration(
            //           hintText: 'Select Inspection No',
            //           hintStyle: Theme.of(context)
            //               .textTheme
            //               .displaySmall
            //               ?.copyWith(fontSize: 12),
            //           contentPadding: const EdgeInsets.symmetric(
            //               vertical: 10, horizontal: 12)),
            //       dropdownColor: Theme.of(context).colorScheme.onPrimary,
            //       validator: (value) {
            //         if (value == null) {
            //           return 'Select Inspection No';
            //         }
            //         return null;
            //       },
            //     ),
            //   ),
            // ),
            const SizedBox(height: 15),
            //button
            Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Theme(
                data: MyTheme.buttonStyleTheme,
                child: ElevatedButton(
                  onPressed: () async {
                    InspectionListFun.instance.getinspNoticeSortLst(
                        selectedInspectionid,
                        _dateFromController.text,
                        _dateToController.text,
                        context);
                  },
                  child: Text(
                    'GET',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScheduledTab() {
    return ValueListenableBuilder(
        valueListenable:
            InspectionListFun.instance.getInspectionNoticeListNotifier,
        builder: (BuildContext context, List<DatumVal> newList, Widget? _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              if (newList.isNotEmpty) ...[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary),
                    //borderRadius:const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                  ),
                  child: DataTable(
                    headingRowHeight: 35,
                    dataRowMaxHeight: 35,
                    dataRowMinHeight: 35,
                    columnSpacing: 20,
                    headingRowColor:
                        WidgetStateProperty.all(const Color(0xff1569C7)),
                    columns: getColumns(columns = [
                      'SI.No',
                      'Branch',
                      'Inspection No',
                      'Inspection Date',
                      'Inspected By',
                      ''
                    ]),
                    rows: getRows(newList, context),
                  ),
                ),
              ] else ...[
                FutureBuilder(
                  future: Future.delayed(
                      const Duration(seconds: 10)), // Add a delay of 5 seconds
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 100.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      // After 5 seconds, show the No Data Found image
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100.0),
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
            ],
          );
        });
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

  List<DataRow> getRows(List<DatumVal> newList, BuildContext context) {
    return newList.asMap().entries.map((entry) {
      int index = entry.key + 1; // Auto-increment starting from 1
      DatumVal task = entry.value;

      String? cmpDt = task.attendedDate;
      if (cmpDt == null) {
        cmpltdt = '';
      } else {
        DateTime parseDate = DateFormat("yyyy-MM-dd").parse(cmpDt);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat('dd-MM-yyyy');
        cmpltdt = outputFormat.format(inputDate);
      }
      cells = [
        index.toString(),
        task.branchName ?? '',
        task.inspNumber ?? '',
        cmpltdt,
        task.inspectedBy ?? '',
      ];
      // final reasonColors = {
      //   'Approved': const Color.fromARGB(255, 8, 92, 238),
      //   'Notice Generated': Colors.green,
      // };
      Color rowColor = index % 2 == 0
          ? const Color.fromARGB(255, 200, 227, 245) // Light grey for even rows
          : const Color(0Xff95B9C7); // White for odd rows

      return DataRow(color: WidgetStateProperty.all(rowColor), cells: [
        ...Utils.modelBuilder(cells, (index, cell) {
          //final taskbold = index == 1;
          final taskbold = index == 2;
          return DataCell(
            Text(
              '$cell',
              style: taskbold
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w700)
                  : Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
          );
        }),
        DataCell(
          Center(
            child: Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Theme(
                data: MyTheme.buttonStyleTheme,
                child: ElevatedButton(
                  onPressed: () async {
                    InspectionListFun.instance.getinspNotice(
                      context,
                      task.inspectionId,
                    );

                    showModalBottomSheet(
                        enableDrag: true,
                        isDismissible: true,
                        isScrollControlled: true,
                        backgroundColor: const Color(0xff98c1d9),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        )),
                        context: context,
                        builder: (context) => buildSheet());
                  },
                  child: Text(
                    'VIEW',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ),
        )
      ]);
    }).toList();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        // controller.text = "${picked.toLocal()}".split(' ')[0];
        DateTime fromDate = picked;
        controller.text = DateFormat('dd-MM-yyyy').format(fromDate);
        DateTime toDate = picked.add(const Duration(days: 30));
        _dateToController.text = DateFormat('dd-MM-yyyy').format(toDate);
        //_dateToController.text = DateFormat('yyyy-MM-dd').format(toDate);
      });
    }
  }

  Widget buildSheet() {
    // width: MediaQuery.of(context).size.width,
    //height: MediaQuery.of(context).size.height/2,
    return DraggableScrollableSheet(
        initialChildSize: 0.8, // 70% of screen height initially
        minChildSize: 0.3, // Min height when collapsed
        maxChildSize: 1.0, // Max height when fully expanded
        expand: false, // Allows dragging to control height
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: ValueListenableBuilder(
                valueListenable:
                    InspectionListFun.instance.getnoticeNotifierNotifier,
                builder: (BuildContext context, List<DatumValue> noticeList,
                    Widget? _) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: noticeList.length,
                      itemBuilder: (context, index) {
                        //final inspdet = noticeList[index];
                        // final inspdate = inspdet.inspectionDate;
                        // final apprvDate = inspdet.approveDate;
                        // final notDate = inspdet.noticeDate;
                        // if (inspdate == null) {
                        //   inspecDt = '';
                        // } else {
                        //   DateTime parseDate =
                        //       DateFormat("yyyy-MM-dd HH:mm:ss").parse(inspdate);
                        //   var inputDate = DateTime.parse(parseDate.toString());
                        //   var outputFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
                        //   inspecDt = outputFormat.format(inputDate);
                        //   print(inspecDt);
                        // }
                        // if (apprvDate == null) {
                        //   apprvDt = '';
                        // } else {
                        //   DateTime parseDate =
                        //       DateFormat("yyyy-MM-dd HH:mm:ss").parse(apprvDate);
                        //   var inputDate = DateTime.parse(parseDate.toString());
                        //   var outputFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
                        //   apprvDt = outputFormat.format(inputDate);
                        //   print(apprvDt);
                        // }
                        // if (notDate == null) {
                        //   notDt = '';
                        // } else {
                        //   DateTime parseDate =
                        //       DateFormat("yyyy-MM-dd HH:mm:ss").parse(notDate);
                        //   var inputDate = DateTime.parse(parseDate.toString());
                        //   var outputFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
                        //   notDt = outputFormat.format(inputDate);
                        //   print(notDt);
                        // }
                        return Column(
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Text('NOTICES',
                                style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                       children: [
                                         Text(
                                           "Inspection No : ",
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
                                         Flexible(
                                           child: Text(
                                             noticeList.first.inspNo??'',
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
                                         ),
                                       ],
                                     ),
                            ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Row(
                                       children: [
                                         Text(
                                           "Inspection Date : ",
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
                                         Flexible(
                                           child: Text(
                                             noticeList.first.inspectionDate??'',
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
                                         ),
                                       ],
                                     ),
                                   ),
                            // ScrollableWidget(child: inputfiledDisplay()),
                            const SizedBox(height: 5),
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
                                        headingRowHeight: 35,
                                        dataRowMaxHeight: 35,
                                        dataRowMinHeight: 35,
                                        columnSpacing: 15,
                                        headingRowColor:
                                            WidgetStateProperty.all(
                                                const Color(0xff1569C7)),
                                        columns: getColumns(columns = [
                                          'SI.No',
                                          'Notice No',
                                          'Type',
                                          ''
                                        ]),
                                        rows: getRowsList(noticeList, context),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Container(
                                      //   height: 30,
                                      //   width: 100,
                                      //   decoration: BoxDecoration(
                                      //     gradient: LinearGradient(
                                      //       begin: Alignment.topLeft,
                                      //       end: Alignment.bottomRight,
                                      //       colors: [
                                      //         Theme.of(context)
                                      //             .colorScheme
                                      //             .primary,
                                      //         Theme.of(context)
                                      //             .colorScheme
                                      //             .primary
                                      //       ],
                                      //     ),
                                      //     borderRadius:
                                      //         BorderRadius.circular(12.0),
                                      //   ),
                                      //   child: Theme(
                                      //     data: MyTheme.buttonStyleTheme,
                                      //     child: ElevatedButton(
                                      //       onPressed: () async {
                                      //         // final inspId = task.inspId;
                                      //         Navigator.pop(context);
                                      //         // Navigator.push(context, Approutes().screensActionRprt);

                                      //         //openFile(task,context);
                                      //       },
                                      //       child: Text(
                                      //         'Back',
                                      //         style: Theme.of(context)
                                      //             .textTheme
                                      //             .displayMedium,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      //socdet=noticeList.single,

                      );
                }),
          );
        });
  }

  List<DataRow> getRowsList(List<DatumValue> noticeList, BuildContext context) {
    // String? status;
    // String? action;
    // String? remarks;
    return noticeList.first.notices!.asMap().entries.map((entry) {
      int index = entry.key + 1; // Auto-increment starting from 1
      Notice task = entry.value;

      cells = [
        index.toString(),
        task.description,
        task.reason,
      ];
      final reasonColors = {
        'SHO NOTICE': const Color.fromARGB(255, 174, 15, 3),
        'SERIOUS NOTICE': const Color.fromARGB(255, 235, 78, 117),
        'MILD NOTICE': const Color.fromARGB(255, 14, 121, 18),
        'MEDIUM NOTICE': const Color.fromARGB(255, 221, 135, 7),
        'DEMAND NOTICE': Colors.purple,
      };
      Color rowColor = index % 2 == 0
          ? const Color.fromARGB(255, 200, 227, 245) // Light grey for even rows
          : const Color(0Xff95B9C7); // White for odd rows

      return DataRow(color: WidgetStateProperty.all(rowColor), cells: [
        ...Utils.modelBuilder(cells, (index, cell) {
          final taskbold = index == 2;

          return DataCell(
            Text(
              '$cell',
              style: taskbold
                  ? Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: reasonColors[task.reason],
                      fontWeight: FontWeight.bold)
                  : Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            onTap: (){
              switch(index){
                case 1:openFile(task, context);
                break;
              }
            }
          );
        }),
        DataCell(
          Center(
            child: Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary
                  ],
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Theme(
                data: MyTheme.buttonStyleTheme,
                child: ElevatedButton(
                  onPressed: () async {
                    // final inspId = task.inspId;

                    openFile(task, context);
                  },
                  child: Text(
                    'NOTICE',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]);
    }).toList();
  }

  Future openFile(Notice task, BuildContext context) async {
    final file = await dwnloadFile(task, context);
    if (file == null) {
      Fluttertoast.showToast(
          msg: "No Data Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 15.0);
    } else {
      OpenFile.open(file.path);
    }
  }

  Future<File?> dwnloadFile(Notice task, BuildContext context) async {
    try {
      final dwnldresp = await Ciadata().dwnldNotice(task.fileurl);
      RegExp regExp = RegExp(r"/([^/]+)\.pdf$");

      // Extracting the match
      Match? match = regExp.firstMatch(task.fileurl ?? '');
      //String extractedString;
      if (match != null) {
        extractedString = match.group(1)!;
        print(extractedString); // Output: 52_NOTI_3211_2025
      } else {
        print("No match found");
      }
      if (dwnldresp == null) {
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "No Data Found");
      } else if (dwnldresp.statusCode == 200) {
        Random random = Random();
        int random3digit = 100 + random.nextInt(900);
        var now = DateTime.now();
        DateFormat dateFormat = DateFormat("dd-MM-yyyy");
        String datenow = dateFormat.format(now);
        String name = "${extractedString}_${datenow}_$random3digit.pdf";

        final appStorage = await getApplicationDocumentsDirectory();
        final file = File('${appStorage.path}/$name');

        final raf = file.openSync(mode: FileMode.write);
        raf.writeFromSync(dwnldresp.data);
        await raf.close();
        return file;
      } else if (dwnldresp.statusCode == 500) {
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "Sever Not Reachable");

        // showLoginerror(context, 3);
      } else if (dwnldresp.statusCode == 408) {
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        if (!context.mounted) return null;
        CommonFun.instance.showApierror(context, "No Data Found");
        //showLoginerror(context, 5);
      }
    } catch (e) {
      if (!context.mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
    return null;
  }
}
