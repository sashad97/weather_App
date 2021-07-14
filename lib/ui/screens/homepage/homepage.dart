import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/ui/screens/sideNav/sideNav.dart';
import 'package:weather/ui/screens/today/today.dart';
import 'package:weather/ui/screens/weekly/weekly.dart';
import 'package:weather/ui/widget/tabbar_widget.dart';
import 'package:weather/utils/constants/colors.dart';
import 'homepage_view_model.dart';



class Homepage extends StatefulWidget {
 
 @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
      TabController tabController;
    @override
    void initState (){
      super.initState();

      tabController = new TabController(length:3 , vsync: this);
    }

    int selectedIndex = 0;
    Color textColor = Colors.green;
    List<NavigationItem> items = [
        NavigationItem( Icons.calendar_today_outlined, 'Today'),
        NavigationItem( Icons.calendar_view_day_outlined, 'Weekly'),
        NavigationItem( Icons.share, 'Share'),
    ];

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomepageViewModel>.withConsumer(
        viewModelBuilder: () => HomepageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            key: _scaffoldKey,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            drawer: SideNavpage(),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(icon: Icon(Icons.menu, size: 30, color: AppColors.grey,),
                           onPressed: (){ _scaffoldKey.currentState.openDrawer();}),
              actions: [
                  IconButton(icon: Icon(Icons.search, size: 30,color: AppColors.grey,),
                           onPressed: (){})
              ],
            ),
      bottomNavigationBar: new Material(
        elevation: 0.0,
        color: AppColors.grey,
        child: TabBar(
          indicatorWeight: 1.0 ,
          indicatorColor: Colors.transparent,
          controller: tabController,
          onTap: (value){
                  setState ((){
                    selectedIndex = tabController.index ;
                  }
                  );
                },
          tabs: [
              TabBarWidget(selectedIndex == items.indexOf(items.elementAt(0)), item: items.elementAt(0)),
              TabBarWidget(selectedIndex == items.indexOf(items.elementAt(1)), item: items.elementAt(1)),
              TabBarWidget(selectedIndex == items.indexOf(items.elementAt(2)), item: items.elementAt(2)),
          ]
          ),
        ),

        body: TabBarView(
          controller: tabController,
          children: [
              Today(),
              Weekly(),
              InkWell(
                onTap: (){

                },
              )
          ]
          ),
   );
        }
    );
  }
}