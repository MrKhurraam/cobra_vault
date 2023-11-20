import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/utils.dart';
import '../../widgets/app_bar.dart';
import 'components/setting_card.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: 'Settings',
        showActionButtons: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DisplaySettingCard(
              title: 'General Settings', lst: Utils.generalSettingList),
          DisplaySettingCard(title: 'Privacy', lst: Utils.privacyList),
          DisplaySettingCard(
              title: 'Communication',
              lst: Utils.communicationList,
              showCommunication: true),
          DisplaySettingCard(title: 'Others', lst: Utils.othersList),
        ],
      ),
    );
  }
}
