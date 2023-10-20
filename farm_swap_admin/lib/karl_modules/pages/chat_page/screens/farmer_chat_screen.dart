import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/farmer_chat_searchbar.dart';
import 'package:flutter/material.dart';

import '../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';

class FarmerChatScreen extends StatefulWidget {
  const FarmerChatScreen({super.key});

  @override
  State<FarmerChatScreen> createState() => _FarmerChatScreenState();
}

class _FarmerChatScreenState extends State<FarmerChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const DashBoardTitleText(
            myText: "Farmer Chat",
            myColor: Colors.black,
          ),
          actions: const [
            /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                    HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
            Padding(
              padding: EdgeInsets.all(10),
              /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                      HEIGH AND WIDTH OF THE TEXT FIELD */
              child: SizedBox(
                width: 250,
                height: 15,
                /*THE ACTUAL SEARCH BAR WHICH IS A TEXT FIELD, THIS IS A CLASS I CREATED 
                        IN A SEPRATE FILE, CHECK THAT IN WIDGET_DASHBOARD_SEARCH.DART */
                child: FarmerChartSearchBar(),
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ]),
    );
  }
}
