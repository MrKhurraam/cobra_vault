import 'package:flutter/material.dart';
import 'backup_button.dart';

class CloudBackup extends StatelessWidget {
  const CloudBackup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/cloudBackup.png',
            color: Theme.of(context).primaryColor,
            height: 30,
            width: 45,
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
                  'Cloud Backup',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '12 July, 2021',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '12:00 AM',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const BackupButton(),
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
