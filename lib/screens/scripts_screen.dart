import 'package:flutter/material.dart';
import 'package:keydata_zipcikti/data/scripts.dart';
import 'package:keydata_zipcikti/screens/tab_screens/akis.dart';
import 'package:keydata_zipcikti/screens/tab_screens/domain_fix.dart';
import 'package:keydata_zipcikti/screens/tab_screens/ikinci_ekran.dart';
import 'package:keydata_zipcikti/screens/tab_screens/panel_fix.dart';
import 'package:keydata_zipcikti/ui/helper/color_helper.dart';

const _tabs = tabs;

class ScriptScreen extends StatefulWidget {
  const ScriptScreen({super.key});

  @override
  State<ScriptScreen> createState() => _ScriptScreenState();
}

class _ScriptScreenState extends State<ScriptScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: _tabs.length, vsync: this);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: _tabs,
        indicatorColor: UIColorHelper.colorData,
        labelColor: UIColorHelper.colorKey,
        padding: const EdgeInsets.only(top: 22),
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: TabBarView(
            controller: _tabController,
            children: const [
              PanelFix(),
              DualScreen(),
              DomainFix(),
              AkisScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
