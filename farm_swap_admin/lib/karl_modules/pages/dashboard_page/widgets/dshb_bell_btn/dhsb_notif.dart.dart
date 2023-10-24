import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/provider/admin_notifiIncrementer_provider.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardNotifBtn extends StatefulWidget {
  const DashboardNotifBtn({super.key});

  @override
  State<DashboardNotifBtn> createState() => _DashboardNotifBtnState();
}

class _DashboardNotifBtnState extends State<DashboardNotifBtn> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*If  the notification bell is pressed that notification count will be reset to 0 */
        Consumer<AdminNotificationProvider>(
          builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                value.decrementNotif();
                Navigator.of(context).pushNamed(RoutesManager.notificationAdminPage);
              },
              icon: const Icon(CupertinoIcons.bell),
              color: farmSwapTitlegreen,
            );
          },
        ),
        /*If  the get notification provider function has no value then the circle with red background
        will not show */
        Consumer<AdminNotificationProvider>(
          builder: (context, value, child) {
            return (value.getNotifNum() == "")
                ? Container()
                : Positioned(
                    top: 7,
                    right: 7,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Consumer<AdminNotificationProvider>(
                        builder: (context, value, child) {
                          return Text(
                            value.getNotifNum(),
                            style: const TextStyle(
                                fontSize: 7, color: Colors.white, fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                    ),
                  );
          },
        ),

/*
        Positioned(
          top: 7,
          right: 7,
          child: CircleAvatar(
            radius: 6,
            backgroundColor: Colors.red,
            child: Consumer<AdminNotificationProvider>(
              builder: (context, value, child) {
                return Text(value.getNotifNum(), style: const TextStyle(
                  fontSize: 7,
                  color: Colors.white,
                ),);
              },
            ),
          ),
        ),
        */
      ],
    );
  }
}
