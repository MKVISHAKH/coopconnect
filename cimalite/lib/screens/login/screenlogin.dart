import 'package:cimalite/core/hook/hook.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usercontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  bool passtoggle = true;
  String locationMessage = 'Current Location of the User';
  String lat = '';
  String long = '';
  double doublelat = 0;
  double doublelong = 0;
  late LoadingProvider loadingProvider;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(50),
            elevation: 3,
            shadowColor: Theme.of(context).colorScheme.primary,
            child: SizedBox(
              width: 300,
              height: 450,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.primary
                        ])),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Theme(
                        data: MyTheme.googleFormTheme,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'LOGIN',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 5),
                                child: TextFormField(
                                    controller: _usercontroller,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter valid Username";
                                      } else if (value.contains('.') ||
                                          value.contains("-") ||
                                          value.contains(" ") ||
                                          value.contains(",")) {
                                        return "Enter valid Username";
                                      }
                                      return null;
                                    }),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context, Approutes().forgotusrScreen);
                            //   },
                            //   child: Text(
                            //     'Forgot Username?',
                            //     style: Theme.of(context).textTheme.labelSmall,
                            //   ),
                            // ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5),
                                child: TextFormField(
                                    controller: _passcontroller,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                      prefixIcon: Theme(
                                        data: MyTheme.appIconTheme,
                                        child: const Icon(
                                          Icons.lock,
                                        ),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          setState(() {
                                            passtoggle = !passtoggle;
                                          });
                                        },
                                        child: Theme(
                                          data: MyTheme.appIconTheme,
                                          child: Icon(
                                            passtoggle
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                        ),
                                      ),
                                    ),
                                    obscureText: passtoggle,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter password';
                                      }
                                      // else if (value.length < 8) {
                                      //   return 'Please enter atleast 8 characters';
                                      // }

                                      else if (value.contains(' ')) {
                                        return 'Remove space from password';
                                      }
                                      return null;
                                    }),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context, Approutes().forgotpswrdScreen);
                            //   },
                            //   child: Text(
                            //     'Forgot Password?',
                            //     style: Theme.of(context).textTheme.labelSmall,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Theme.of(context).colorScheme.secondary,
                                    Theme.of(context).colorScheme.secondary
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Theme(
                                data: MyTheme.buttonStyleTheme,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      getlogin(context);
                                    }
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Consumer<LoadingProvider>(
                                builder: (context, loadingProvider, child) {
                              return loadingProvider.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 2, 128, 6),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Future getlogin(BuildContext context) async {
    try {
       loadingProvider = context.read<LoadingProvider>();

      FirebaseMessaging messaging=FirebaseMessaging.instance;
      String? deviceTkn;
      loadingProvider.toggleLoading();
    final value = await SharedPrefManager.instance.getdeviceinfo();
    final val = await SharedPrefManager.instance.getdeviceTkn();
    final tkn=val.devicetoken;
    if((tkn??"").isEmpty){
    String? token=await messaging.getToken();
        deviceTkn=token;
    }else{
      deviceTkn=val.devicetoken;
    }
      final username = _usercontroller.text;
      final password = _passcontroller.text;
      final logreq = Loginreq(
       socCode: username,
       password: password,
       phone: value.phone,
       deviceid: value.deviceid,
       devicetoken: deviceTkn,
       phoneos: value.phoneos,
       androidid: value.androidid,
       appversion: value.appversion,
       buildnumber: value.buildnumber
       );

      final loginResponse = await Ciadata().login(logreq);
      final resultAsjson = jsonDecode(loginResponse.toString());
      final loginval = Loginresp.fromJson(resultAsjson as Map<String, dynamic>);

      loadingProvider.toggleLoading();
      if (loginResponse == null) {
        if (!context.mounted) return;

        CommonFun.instance.showApierror(context, "Something went wrong");
      } else if (loginResponse.statusCode == 200 &&
          loginval.status == 'success') {
        final sharedPrefLogin = Sharedpref.value(
            userId: loginval.data!.userId,
            socId: loginval.data!.socId,
            socCode: loginval.data!.socCode,
            socName: loginval.data!.socName,
            email: loginval.data!.email,
            mobile: loginval.data!.mobile,
            active: loginval.data!.active,
            accesstoken: loginval.data!.accessToken);
        addLoginShareddata(sharedPrefLogin);
        /*wklycollection function */

        /**************************/
        if (!context.mounted) return;

        Navigator.pushReplacement(context, Approutes().homescreen);

        //showLoginerror(_scaffoldKey.currentContext!);
      } else if (loginval.status == 'failure') {
        if (!context.mounted) return;
        CommonFun.instance
            .showApierror(context, "Username or password Incorrect");

        // showLoginerror(context, 2);
      } else if (loginResponse.statusCode == 500) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Sever Not Reachable");

        // showLoginerror(context, 3);
      } else if (loginResponse.statusCode == 408) {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Connection time out");

        //showLoginerror(context, 4);
      } else {
        if (!context.mounted) return;
        CommonFun.instance.showApierror(context, "Something went wrong");
        //showLoginerror(context, 5);
      }
    } catch (e) {

      loadingProvider.toggleLoading();

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }

  addLoginShareddata(Sharedpref value) async {
    await SharedPrefManager.instance.addSharedData(value);
  }
}
