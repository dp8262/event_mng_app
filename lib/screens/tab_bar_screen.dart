import 'package:event_mng_app/main.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  final dynamic tabIndex;

  const TabBarScreen({required this.tabIndex, Key? key}) : super(key: key);

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

ValueNotifier<bool> visible = ValueNotifier<bool>(true);

class TabBarScreenState extends State<TabBarScreen> with TickerProviderStateMixin {
  late TabController? _tabController;

  ValueNotifier<int> currentTab = ValueNotifier<int>(0);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.tabIndex);
    currentTab.value = widget.tabIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Stack(children: [
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 70,
                      child: Container(
                          decoration: BoxDecoration(color: Colors.orange,
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                              boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 2, offset: const Offset(0, 1))
                          ]),
                          child: TabBar(
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              automaticIndicatorColorAdjustment: true,
                              overlayColor: MaterialStateProperty.all(Colors.white),
                              labelPadding: const EdgeInsets.all(0),
                              labelColor: Colors.black,
                              onTap: (val) {
                                setState(() {
                                  currentTab.value = val;
                                });
                              },
                              unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey),
                              labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                              indicator: const BoxDecoration(color: Colors.transparent),
                              tabs: const [
                                Tab(
                                    child: Column(children: [
                                      Expanded(flex: 3, child: Icon(Icons.home)),
                                      Expanded(flex: 1, child: SizedBox()),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Home",
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)
                                          ))
                                    ])),
                                Tab(
                                    child: Column(children: [
                                      Expanded(flex: 3, child: Icon(Icons.person)),
                                      Expanded(flex: 1, child: SizedBox()),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Profile",
                                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)
                                          ))
                                    ])),
                              ]))))
            ]),
            body: tabBarOptions()));
  }

  Widget tabBarOptions() {
    return TabBarView(physics: const NeverScrollableScrollPhysics(), controller: _tabController, children: [EventManagementPage(), ProfilePage()]);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
