import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:x_equis/core/prefs/app_prefs.dart';
import 'package:x_equis/src/shared/models/models.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perfil',
            style: textTheme.displaySmall,
          ),
          FutureBuilder(
            future: AppPrefs.loadUserJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = UserModel.fromJson(snapshot.data!);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      title: const Text('Nombre'),
                      subtitle: Text(user.name),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      title: const Text('Correo'),
                      subtitle: Text(user.email),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      title: const Text('Telefono'),
                      subtitle: Text(user.phone),
                    ),
                    const Gap(8),
                  ],
                );
              }
              return const SizedBox(height: 20);
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 2)),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        title: const Text('Juan Perez'),
                        onTap: () => _showBottomSheet(context),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
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
