import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petronas_sample/src/business_logic/blocs/place_search/place_search_cubit.dart';

class PlaceSearchDeligate extends SearchDelegate {
  Timer? _debounce;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        context.read<PlaceSearchCubit>().searchPlace(query);
      });
    });
    return BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
      builder: (_, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.result.isNotEmpty) {
          return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (_, i) {
              final data = state.result[i];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.formattedAddress??''),
                onTap: () {
                  close(context, data);
                },
              );
            },
          );
        } else {
          return const Center(
            child: Text('Type any place'),
          );
        }
      },
    );
  }
}
