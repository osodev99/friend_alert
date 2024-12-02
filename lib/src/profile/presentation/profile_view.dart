import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perfil',
            style: textTheme.displaySmall,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text('Nombre'),
                  subtitle: Text('Hailey Doe'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text('Correo'),
                  subtitle: Text('hailey@doe.com'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text('Telefono'),
                  subtitle: Text('+591 12345678'),
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Telefonos de confianza',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const Gap(8),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: const Text('Juan Perez'),
                  onTap: () => _showBottomSheet(context),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      builder: (newContext) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Juan Perez',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '+591 12345678',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                ),
              ],
            ),
            const Gap(12),
            Center(
              child: FilledButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Eliminar contacto'),
                ),
              ),
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}
