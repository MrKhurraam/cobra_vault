import 'package:flutter/material.dart';
import '../../../helpers/utils.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(Utils.galleryList.length, (index) {
        var item = Utils.galleryList[index];
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.linear,
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
          margin: const EdgeInsets.all(10),
          width: w * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/${item.icon}.png',
                color: Theme.of(context).primaryColor,
                height: 32,
                width: 27,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                item.title,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        );
      }),
    );
  }
}
