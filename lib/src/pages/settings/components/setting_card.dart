import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../helpers/app_color.dart';
import '../../../models/setting_model.dart';
import '../../../widgets/custom_icon_button.dart';

class DisplaySettingCard extends StatelessWidget {
  DisplaySettingCard({Key? key,
    required this.title,
    required this.lst,
    this.showCommunication = false})
      : super(key: key);
  List<SettingModel> lst;
  String title;
  bool showCommunication;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        padding: const EdgeInsets.only(
            left: 10, top: 15, bottom: 10, right: 10),
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10),
              child: Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/${lst[index].icon}.png',
                          height: 20,
                          width: 20,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                lst[index].title,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Visibility(
                                visible: lst[index].subTitle != null,
                                child: Text('${lst[index].subTitle}',
                                    maxLines: 3,
                                    softWrap: true,
                                    style:
                                    Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
            Visibility(
              visible: showCommunication,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    CustomIconButton(
                      onTap: null,
                      icon: FontAwesomeIcons.linkedin,
                      color:  AppColors.FULL_DARK,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomIconButton(
                      onTap: null,
                      icon: FontAwesomeIcons.facebook,
                      color:  AppColors.FULL_DARK,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomIconButton(
                      onTap: null,
                      icon: FontAwesomeIcons.twitter,
                      color:  AppColors.FULL_DARK,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
