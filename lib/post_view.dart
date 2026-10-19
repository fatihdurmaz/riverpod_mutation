import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'post_viewmodel.dart';

class PostView extends ConsumerWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Örneği'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: posts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Hata: $error')),
        data: (items) => ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: Text(item.subject),
              subtitle: Text('ID: ${item.id}'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final message = await ref
                .read(postViewModelProvider.notifier)
                .sendRequest(23);

            if (!context.mounted) return;

            showModalBottomSheet<void>(
              context: context,
              builder: (context) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(message),
                ),
              ),
            );
          } catch (error) {
            if (!context.mounted) return;

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$error')));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
