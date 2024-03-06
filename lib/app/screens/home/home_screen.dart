import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pragma/app/providers/cat/cat_provider.dart';
import 'package:pragma/app/screens/home/widgets/cat_card.dart';
import 'package:pragma/app/screens/home/widgets/cat_search.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ref.read(catProvider.notifier).fetchAll());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const CatSearch(),
            const SizedBox( height: 16.0),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(catProvider);
                  if (state.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.error) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Error al cargar los gatos'),
                        ElevatedButton(
                          onPressed: () {
                            unawaited(
                              ref.read(catProvider.notifier).fetchAll(),
                            );
                          },
                          child: const Text('Reintentar'),
                        ),
                      ],
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      unawaited(ref.read(catProvider.notifier).fetchAll());
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.catsFiltered.length,
                      itemBuilder: (context, index) {
                        return CatCard(cat: state.catsFiltered[index]);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
