import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        title: const Text('Notificación de emergencia'),
        subtitle: const Text('Hace 5 minutos'),
        leading: const Icon(Icons.warning),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => _showBottomSheet(context),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      builder: (newContext) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Juan Perez',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                'Te envio una notificacion de emergencia',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('+591 12345678'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                ),
              ],
            ),
            const Divider(),
            Text(
              'Datos de la emergencia',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(4),
            const Text('Fecha: 12/12/2021'),
            const Text('Hora: 12/12/2021'),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plaza murillo',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Lat: 12345678',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Lng: 12345678',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
