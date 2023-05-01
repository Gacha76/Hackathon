import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  // final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 245, 245, 1),
      body: SingleChildScrollView(
        child: Container(
          //padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.topCenter,
                  height: 150.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 5,
                          offset: const Offset(0, 10))
                    ],
                    color: Color.fromARGB(245, 99, 87, 204),
                  ),
                  //child: Image.asset("assets/bgImage.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 82,
                            // backgroundImage:
                            //     AssetImage('assets/images/Profile.png'),
                            backgroundImage:
                                AssetImage('assets/images/Profile.png'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Tourist name',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'touristemail@gmail.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(130, 130, 130, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ProfileMenuWidget(
              title: "Tourist Details",
              icon: Icons.account_circle_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Previous Travels",
              icon: Icons.beach_access,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Notification ",
              icon: Icons.notifications_active_outlined,
              onPress: () {},
            ),
            ProfileMenuWidget(
              title: "Settings ",
              icon: Icons.settings_outlined,
              onPress: () {},
            ),
          ]),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(),
        ),
        child: Icon(
          icon,
          size: 30,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(),
              ),
              child: const Icon(
                Icons.arrow_circle_right_sharp,
                color: Colors.black,
              ),
            )
          : null,
    );
  }
}
