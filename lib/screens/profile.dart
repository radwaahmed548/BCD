import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:gp/screens/profile_list_items.dart';
import 'package:gp/components/tools.dart';
// ignore: unused_import
import 'package:gp/components/maindrawer.dart';
import '../components/tools.dart';
// ignore: unused_import
import 'package:gp/screens/calendar_screen.dart';
import 'package:gp/models/login_auth.dart';
import 'package:provider/provider.dart';

const kSpacingUnit = 10;
const kDarkPrimaryColor = Color(0xFF212121);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: Color(0xFF212121),
);

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('images/7-512.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color:Kgradintstartcolor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: KMainColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: IconButton(
            onPressed: () => _drawerKey.currentState.openDrawer(),
            icon: Icon(
              Icons.menu,
              color: KMainColor,
            ),
          ),
        ),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      key: _drawerKey,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.ribbon,
                  text: 'My Profile',
                ),
                GestureDetector(
                  onTap:(){ Navigator.pushNamed(context, '/calendar');},
                  child: ProfileListItem(
                    icon: LineAwesomeIcons.calendar,
                    text: 'My Calender',
                  ),
                ),
                GestureDetector
                  ( onTap:(){ Navigator.pushNamed(context,  '/Community');},
                  child: ProfileListItem(
                    icon: LineAwesomeIcons.handshake,
                    text: 'Community',
                  ),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.bookmark,
                  text: 'Favorite Posts',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Provider.of<Auth>(context, listen: false).logout();
                  },
                  child: ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
