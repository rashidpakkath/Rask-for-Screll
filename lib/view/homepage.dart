import 'package:flutter/material.dart';
import 'package:flutter_project_test/controller/provaider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: switch (ref.watch(getUserProviders)) {
          AsyncData(:final value) => ListView.builder(
              itemCount: value!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 280,
                    color: const Color.fromARGB(255, 68, 233, 255),
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          value[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(value[index].body),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          AsyncError(:final error, :final stackTrace) => const Center(
              child: Text("No Data"),
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            ),
        });
  }
}
