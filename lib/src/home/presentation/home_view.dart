import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widget/zoom_in_out.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'Rescue\nMe',
            style: textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const Gap(18),
          Expanded(
            child: ZoomInOutWidget(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  shape: BoxShape.circle,
                ),
                width: size.width * 0.8,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(28),
                child: Text(
                  'Enviar nofiticación de emergencia',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.white),
          Text(
            'Tu ubicación actual es:',
            style: textTheme.bodyMedium,
          ),
          Text(
            'La Paz, Bolivia',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Text('Latitud: -12.332'),
          const Text('Longitud: -12.332'),
        ],
      ),
    );
  }
}
