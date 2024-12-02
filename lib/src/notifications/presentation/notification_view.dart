import 'package:flutter/material.dart';

import 'widgets/item_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notificaciones',
            style: textTheme.displaySmall,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                ItemWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
