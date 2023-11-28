import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/transaction_userwallet_balance/provider/Specific_walletUser_details_Provider.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../wallet_management_balance/widget/wallet_textfield.dart';
import '../widgets/update_Balance_Farmer.dart';

// ignore: must_be_immutable
class FarmerWalletTabBarView extends StatefulWidget {
  FarmerWalletTabBarView({super.key, this.documentID});
  final String? documentID;
  String selectedId = "";

  @override
  State<FarmerWalletTabBarView> createState() => _FarmerWalletTabBarViewState();
}

TextEditingController searchController = TextEditingController();
String searchValue = "";

class _FarmerWalletTabBarViewState extends State<FarmerWalletTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 2,
            offset: const Offset(1, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Row(
              children: [
                const Text(
                  'Farmer Wallet',
                  style: TextStyle(
                    color: Color(0xFF09041B),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: searchController,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFDA6317),
                      height: 1.5,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      filled: true,
                      fillColor: const Color(0xFFF9A84D).withOpacity(0.10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search here',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFDA6317),
                        size: 18,
                      ),
                      prefixIconColor: const Color(0xFFDA6317),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        searchValue = searchController.text;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 35, right: 35, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: greenLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'User',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Registration Date",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Wallet Balance",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(
                height: 320,
                child: _buildFarmerWalletList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  //this is for the farmer collection build list
  Widget _buildFarmerWalletList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_FarmerUsers')
          .where('accountStatus', isEqualTo: 'Active')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: greenNormalHover,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final logs = snapshot.data!.docs;

          if (logs.isEmpty) {
            return const Center(
              child: Text('No revenue reports available!'),
            );
          }

          // This will sort the documents based on the 'dateTime' field
          logs.sort((a, b) {
            var dateTimeA = a['registrationDate'];
            var dateTimeB = b['registrationDate'];

            //This will check if the dateTime field is a Timestamp and convert to DateTime
            if (dateTimeA is Timestamp) {
              dateTimeA = dateTimeA.toDate();
            }

            if (dateTimeB is Timestamp) {
              dateTimeB = dateTimeB.toDate();
            }
            // this will perform the descending order base on the date and its time
            return (dateTimeB as DateTime).compareTo(dateTimeA as DateTime);
          });

          return ListView(
            children: logs.map<Widget>((document) {
              return _buildFarmerWalletListItems(document);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildFarmerWalletListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["registrationDate"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);

    TextEditingController amountController = TextEditingController();
    UpdateBalance updateBalance = UpdateBalance();

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["balance"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase) {
        return ListTile(
          title: Container(
            width: 780,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                //this expanded holding the userRole of the user in each tile
                Text(
                  "${data["userRole"]}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                //this expanded holding the profilepic, firstname, last name and address of the user
                SizedBox(
                  width: 230,
                  child: Row(
                    children: [
                      //this padding holds the profile image of the admin
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: //this will display the users profile picture in each listtile
                            CachedNetworkImage(
                          imageUrl: data["profilePhoto"] ??
                              "", // Provide a default empty string if it's null
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 20,
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),

                      //this column holds the admin users info
                      //like firstname, lastname and address
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //first column that holds the admin user firstname and username
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "${data["firstname"]} ",
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "${data["lastname"]}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //second column that holds the admin user address
                          Text(
                            "${data["city_baranggay"]}, ${data["city_municipality"]}",
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //this holds the date
                Expanded(
                  flex: 1,
                  child: Text(
                    dateFinal,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),

                //this holds the wallet balance  of the user
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          "${data["balance"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      //icon button for adding a balance to the wallet
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          size: 20,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.selectedId = "${data["userId"]}";
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "Additional Balance to ${data["firstname"]} ${data["lastname"]} wallet."),
                                  content: Container(
                                    width: 400,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                            "Enter additional balance : "),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        WalletTextField(
                                          controller: amountController,
                                          enabled: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Add"),
                                      onPressed: () async {
                                        AdminLogsInsertDataDb adminLogs =
                                            AdminLogsInsertDataDb();
                                        //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                        final email = FirebaseAuth
                                            .instance.currentUser!.email;
                                        final userId = FirebaseAuth
                                            .instance.currentUser!.uid;
                                        /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                        adminLogs.createAdminLogs(
                                            email,
                                            userId,
                                            "Add_Farmer_Balance",
                                            DateTime.now());
                                        /*
                                      In this function when the ADD button is clicked 
                                      it will update the selected id the balance 
                                      */

                                        await updateBalance.updateBalance(
                                            amountController.text,
                                            widget.selectedId);
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog

                                        // ignore: use_build_context_synchronously
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Successful'),
                                              content: const Text(
                                                  'You successfully add balance to this account!'),
                                              actions: [
                                                TextButton(
                                                  child: const Text("Ok"),
                                                  onPressed: () async {
                                                    Navigator.of(context)
                                                        .pop(); // Close the AlertDialog
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FarmerWalletTabBarView(),
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                      //icon button for deducting a balance to the wallet
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.selectedId = "${data["userId"]}";
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "Deduct Balance to ${data["firstname"]} ${data["lastname"]} wallet."),
                                  content: Container(
                                    width: 400,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                            "Enter deduction balance : "),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        WalletTextField(
                                          controller: amountController,
                                          enabled: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Deduct"),
                                      onPressed: () async {
                                        CheckBalance checkBalance =
                                            CheckBalance();
                                        final balance = await checkBalance
                                            .getBalanceFromFirestore(
                                                widget.selectedId);
                                        // Parsing the amountController.text into double
                                        final deductAmount =
                                            double.parse(amountController.text);
                                        if (balance >= deductAmount) {
                                          AdminLogsInsertDataDb adminLogs =
                                              AdminLogsInsertDataDb();
                                          //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                          final email = FirebaseAuth
                                              .instance.currentUser!.email;
                                          final userId = FirebaseAuth
                                              .instance.currentUser!.uid;
                                          /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                          adminLogs.createAdminLogs(
                                              email,
                                              userId,
                                              "Deduct_Farmer_Balance",
                                              DateTime.now());
                                          /*
                                      In this function when the DEDUCT button is clicked 
                                      it will update the selected id the balance 
                                      */

                                          await updateBalance
                                              .updateBalanceDeduct(
                                                  amountController.text,
                                                  widget.selectedId);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context)
                                              .pop(); // Close the AlertDialog
                                          // ignore: use_build_context_synchronously
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Successful'),
                                                content: const Text(
                                                    'You successfully deduct balance to this account!'),
                                                actions: [
                                                  TextButton(
                                                    child: const Text("Ok"),
                                                    onPressed: () async {
                                                      Navigator.of(context)
                                                          .pop(); // Close the AlertDialog
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            FarmerWalletTabBarView(),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Warning!'),
                                                content: const Text(
                                                    'This account has lower balance in the wallet. Please try again!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                      //icon button for details of specific user wallet
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.selectedId = "${data["userId"]}";
                            });
                            //assign the widget.selectedId to setAdminUserId
                            //to bring in other class
                            Provider.of<SpecificWalletDetailsProvider>(context,
                                    listen: false)
                                .setUserId(widget.selectedId);
                            //this will navigate to specific admin activity page
                            Navigator.of(context).pushNamed(
                                RoutesManager.specificwalletfarmerdetails);
                          },
                          icon: const Icon(
                            Icons.info,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    //if search bar is empty this one will display
    else {
      return ListTile(
        title: Container(
          width: 780,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              //this expanded holding the userRole of the user in each tile
              Text(
                "${data["userRole"]}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              //this expanded holding the profilepic, firstname, last name and address of the user
              SizedBox(
                width: 230,
                child: Row(
                  children: [
                    //this padding holds the profile image of the admin
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: //this will display the users profile picture in each listtile
                          CachedNetworkImage(
                        imageUrl: data["profilePhoto"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),

                    //this column holds the admin users info
                    //like firstname, lastname and address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //first column that holds the admin user firstname and username
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "${data["firstname"]} ",
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "${data["lastname"]}",
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //second column that holds the admin user address
                        Text(
                          "${data["city_baranggay"]}, ${data["city_municipality"]}",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //this holds the date
              Expanded(
                flex: 1,
                child: Text(
                  dateFinal,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),

              //this holds the wallet balance  of the user
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        "${data["balance"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //icon button for adding a balance to the wallet
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 20,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.selectedId = "${data["userId"]}";
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Additional Balance to ${data["firstname"]} ${data["lastname"]} wallet."),
                                content: Container(
                                  width: 400,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text("Enter additional balance : "),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      WalletTextField(
                                        controller: amountController,
                                        enabled: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("Add"),
                                    onPressed: () async {
                                      AdminLogsInsertDataDb adminLogs =
                                          AdminLogsInsertDataDb();
                                      //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                      final email = FirebaseAuth
                                          .instance.currentUser!.email;
                                      final userId = FirebaseAuth
                                          .instance.currentUser!.uid;
                                      /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                      adminLogs.createAdminLogs(email, userId,
                                          "Add_Farmer_Balance", DateTime.now());
                                      /*
                                      In this function when the ADD button is clicked 
                                      it will update the selected id the balance 
                                      */

                                      await updateBalance.updateBalance(
                                          amountController.text,
                                          widget.selectedId);
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context)
                                          .pop(); // Close the AlertDialog

                                      // ignore: use_build_context_synchronously
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Successful'),
                                            content: const Text(
                                                'You successfully add balance to this account!'),
                                            actions: [
                                              TextButton(
                                                child: const Text("Ok"),
                                                onPressed: () async {
                                                  Navigator.of(context)
                                                      .pop(); // Close the AlertDialog
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        FarmerWalletTabBarView(),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Close"),
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the AlertDialog
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    //icon button for deducting a balance to the wallet
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.selectedId = "${data["userId"]}";
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Deduct Balance to ${data["firstname"]} ${data["lastname"]} wallet."),
                                content: Container(
                                  width: 400,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text("Enter deduction balance : "),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      WalletTextField(
                                        controller: amountController,
                                        enabled: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("Deduct"),
                                    onPressed: () async {
                                      CheckBalance checkBalance =
                                          CheckBalance();
                                      final balance = await checkBalance
                                          .getBalanceFromFirestore(
                                              widget.selectedId);
                                      // Parsing the amountController.text into double
                                      final deductAmount =
                                          double.parse(amountController.text);
                                      if (balance >= deductAmount) {
                                        AdminLogsInsertDataDb adminLogs =
                                            AdminLogsInsertDataDb();
                                        //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                        final email = FirebaseAuth
                                            .instance.currentUser!.email;
                                        final userId = FirebaseAuth
                                            .instance.currentUser!.uid;
                                        /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                        adminLogs.createAdminLogs(
                                            email,
                                            userId,
                                            "Deduct_Farmer_Balance",
                                            DateTime.now());
                                        /*
                                      In this function when the DEDUCT button is clicked 
                                      it will update the selected id the balance 
                                      */

                                        await updateBalance.updateBalanceDeduct(
                                            amountController.text,
                                            widget.selectedId);
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                        // ignore: use_build_context_synchronously
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Successful'),
                                              content: const Text(
                                                  'You successfully deduct balance to this account!'),
                                              actions: [
                                                TextButton(
                                                  child: const Text("Ok"),
                                                  onPressed: () async {
                                                    Navigator.of(context)
                                                        .pop(); // Close the AlertDialog
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FarmerWalletTabBarView(),
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Warning!'),
                                              content: const Text(
                                                  'This account has lower balance in the wallet. Please try again!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Close"),
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the AlertDialog
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                    //icon button for details of specific user wallet
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.selectedId = "${data["userId"]}";
                          });
                          //assign the widget.selectedId to setAdminUserId
                          //to bring in other class
                          Provider.of<SpecificWalletDetailsProvider>(context,
                                  listen: false)
                              .setUserId(widget.selectedId);
                          //this will navigate to specific admin activity page
                          Navigator.of(context).pushNamed(
                              RoutesManager.specificwalletfarmerdetails);
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Colors.green,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
