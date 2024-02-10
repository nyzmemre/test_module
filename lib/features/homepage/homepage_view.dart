import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../leaderboard/leader_board_view.dart';
import '../level_map/level_map_view.dart';
import '../options/settings_view.dart';
import '../profile/profile_view.dart';
import '../../product/utility/constants/image_paths.dart';
import '../../product/utility/constants/text_constant.dart';
import '../../product/widgets/my_scaffold.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> levelList=List.generate(20, (index) => index);
    return MyScaffold(
        /*appBar: AppBar(
          title: Text('HomePage'),
        ),*/
        child: Center(child:SingleChildScrollView(
      child: Container(
        height: context.sized.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImagePaths.homepageBgImage), fit: BoxFit.fill )
        ),
        child: Column(
          children:[
context.sized.emptySizedHeightBoxHigh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

            Transform(alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                3.1415926535897932 / 4,
              ),

            child:  SizedBox(
                width: context.sized.width*.2,
                child: Image.asset(ImagePaths.spaceShipImage)),
            ),
                SizedBox(
                  width: context.sized.width*.5,
                  child: Image.asset(ImagePaths.appNameImage)),
              ],
            ),
            Container(
              padding: context.padding.normal,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: context.sized.width*.3,
                      child: Image.asset(ImagePaths.mascotImage)),
                  Expanded(
                   // width: context.sized.width-context.sized.width*.2,
                    child: Column(
                      children: [
                        levelWideButtonWidget(context, TextConstant.startTEXT, const LevelMapView()),
                        levelWideButtonWidget(context, TextConstant.profileTEXT, const ProfileView()),
                        levelWideButtonWidget(context, TextConstant.pointsTEXT, const LeaderBoardView()),
                        levelWideButtonWidget(context, TextConstant.settingsTEXT, const SettingsView()),
                      ],
                    ),
                  )
                ],
              ),
            ),


          ]
          ),
      ))));
  }

  Widget levelWideButtonWidget(BuildContext context, String buttonText, Widget page) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>page));
      },
      child: Container(
                        width: context.sized.width*.5,
                          padding: context.padding.normal,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(ImagePaths.levelWideButtonBg))
                          ),
                        child: Text(buttonText, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 30),),
                        //  child: Image.asset(ImagePaths.levelWideButtonBg)

                      ),
    );
  }
}
