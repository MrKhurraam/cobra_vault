import 'package:flutter/material.dart';

import '../../../helpers/app_color.dart';
import '../../../helpers/utils.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double consumeSpace = 0;
    Utils.galleryList.forEach((element) {
      consumeSpace += element.usedSpace;
    });
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero,
              blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/storage.png',
            color: Theme.of(context).primaryColor,
            height: 32,
            width: 19,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Storage',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 13,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.LIGHT_BACKGROUND_COLOR,
                          borderRadius: BorderRadius.circular(25)),
                      height: 14,
                      width: w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.PROGRESS_COLOR,
                          borderRadius: BorderRadius.circular(25)),
                      height: 14,
                      width: (((consumeSpace * 100) / 64) * (w - 122)) / 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '24.56 GB',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '64 GB',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
