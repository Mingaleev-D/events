import 'package:events/features/ui/bloc/event_list/event_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0x0f000000),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextFormField(
                controller: _searchController,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    prefixIcon: const Icon(FluentIcons.search_20_regular),
                    border: InputBorder.none,
                    hintText: 'Search by event name',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black26),
                    prefixIconConstraints:
                        BoxConstraints.tight(const Size.fromRadius(18))),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () => context
                .read<EventListBloc>()
                .add(EventListEvent.search(searchText: _searchController.text)),
            icon: const Icon(FluentIcons.send_20_regular))
      ],
    );
  }
}
