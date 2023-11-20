import 'package:flutter/material.dart';

import '../../../helpers/app_color.dart';

class BackupButton extends StatefulWidget {
  const BackupButton({
    Key? key,
  }) : super(key: key);

  @override
  State<BackupButton> createState() => _BackupButtonState();
}

class _BackupButtonState extends State<BackupButton> {
  bool synced = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          synced ? synced = false : synced = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color:
              synced ? Theme.of(context).cardColor : AppColors.PROGRESS_COLOR,
          borderRadius: BorderRadius.circular(50),
        ),
        child: synced
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 9),
                child: Row(
                  children: [
                    Text(
                      'Sync',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    synced
                        ? const Icon(
                            Icons.check_circle,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            : const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 9),
                child: Text(
                  'Backup Now',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
      ),
    );
  }
}
