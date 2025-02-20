import 'dart:io';
import 'dart:math';
import 'package:cimalite/core/hook/hook.dart';
import 'package:intl/intl.dart';

class ScreenInspectionList extends StatefulWidget {
  const ScreenInspectionList({super.key});

  @override
  State<ScreenInspectionList> createState() => _ScreenInspectionListState();
}

class _ScreenInspectionListState extends State<ScreenInspectionList> {
  List<String> columns = [];
  List<String?> cells = [];

  int? selectedSocietyid;
  int? selectedBranchid;
  //Map<String, int> socIdMap = {};
  String cmpltdt = '';
  Sharedpref? sharedValue;
  String? socName;
  String? socCode;

  final TextEditingController _dateToController = TextEditingController();
  final TextEditingController _dateFromController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    final sharedValue = await SharedPrefManager.instance.getSharedData();
    setState(() {
      socName = sharedValue?.socName ?? '';
      socCode = sharedValue?.socCode ?? '';
    });
  }

  Future<bool?> popscreen(BuildContext context) async {
    InspectionListFun.instance.getInspectionListNotifier.value = [];
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
                      InspectionListFun
                          .instance.getInspectionListNotifier.value = [];
                    Navigator.pushReplacement(context, Approutes().homescreen);
                  },
                ),
                title: Text(
                  "Inspection Details",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                )),
            body: Column(
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
      // height: MediaQuery.of(context).size.height/2.6 ,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color(0xff1569C7),
      ),
      child: Theme(
        data: MyTheme.googleFormTheme,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 15),
            //button
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
                      InspectionListFun.instance.getInspecLstSort(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScheduledTab() {
    return ValueListenableBuilder(
        valueListenable: InspectionListFun.instance.getInspectionListNotifier,
        builder: (BuildContext context, List<Datum> newList, Widget? _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ScrollableWidget(child: inputfiledDisplay()),
              const SizedBox(height: 5),
              if (newList.isNotEmpty) ...[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onSecondary),
                    //borderRadius:const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                  ),
                  child: DataTable(
                    dataRowMaxHeight: 35,
                    dataRowMinHeight: 30,
                    headingRowHeight: 30,
                    columnSpacing: 15,
                    headingRowColor:
                        WidgetStateProperty.all(const Color(0xff1569C7)),
                    columns: getColumns(columns = [
                      'SI.No',
                      'Branch',
                      'Inspection No',
                      'Inspection Date',
                      'Inspected By',
                      'Action Status',
                      ''
                    ]),
                    rows: getRows(newList),
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

  List<DataRow> getRows(List<Datum> newList) {
    return newList.asMap().entries.map((entry) {
      int index = entry.key + 1; // Auto-increment starting from 1
      Datum task = entry.value;

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
        task.actionStatus??'',
      ];
      Color rowColor = index % 2 == 0
          ? const Color.fromARGB(255, 200, 227, 245) // Light grey for even rows
          : const Color(0Xff95B9C7); // White for odd rows

      return DataRow(color: WidgetStateProperty.all(rowColor), cells: [
        ...Utils.modelBuilder(cells, (index, cell) {
          final taskbold = index == 5;

          return DataCell(
            Text(
              '$cell',
              style: taskbold
                  ? Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: const Color.fromARGB(255, 32, 18, 227), fontWeight: FontWeight.bold)
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
                    // final inspId = task.inspId;

                    openFile(task, context);
                  },
                  child: Text(
                    'REPORTS',
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

  Future openFile(Datum task, BuildContext context) async {
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

  Future<File?> dwnloadFile(Datum task, BuildContext context) async {
    try {
      final dwnldresp = await Ciadata().dwnldPdf(task.inspectionId);
      String? message;

      if (dwnldresp == null) {
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 15.0);
      } else if (dwnldresp.statusCode == 200) {
        Random random = Random();
        int random3digit = 100 + random.nextInt(900);

        String name =
            "${task.socId}_${task.branchId}_${task.attendedDate}_$random3digit.pdf";

        final appStorage = await getApplicationDocumentsDirectory();
        final file = File('${appStorage.path}/$name');

        final raf = file.openSync(mode: FileMode.write);
        raf.writeFromSync(dwnldresp.data);
        await raf.close();
        return file;
      } else if (message == 'Unauthenticated' || dwnldresp.statusCode == 401) {
        if (!context.mounted) return null;
        CommonFun.instance.signout(context);
      } else if (dwnldresp.statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Sever Not reached",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 15.0);
      } else if (dwnldresp.statusCode == 408) {
        Fluttertoast.showToast(
            msg: "Connection time out",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 15.0);
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 15.0);
      }
    } catch (e) {
      if (!context.mounted) return null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    }
    return null;
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
        DateTime fromDate = picked;
        controller.text = DateFormat('dd-MM-yyyy').format(fromDate);
        DateTime toDate = picked.add(const Duration(days: 30));
        _dateToController.text = DateFormat('dd-MM-yyyy').format(toDate);
      });
    }
  }

  // fetchbranch(int? socid, BuildContext context) async {
  //   print(socid);
  //   branchlst = await InspectionListFun.instance.fetchBranch(socid, context);
  //   setState(() {
  //     branchlist = branchlst!.map((branch) {
  //       String branchname = branch.branchName ?? "";
  //       return {
  //         'branch_id': branch.branchId!, // routeId as int
  //         'branch_name': branchname, // Display label
  //       };
  //     }).toList();
  //   });
  // }
}
