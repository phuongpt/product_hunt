import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt/core/constants/constants.dart';
import 'package:product_hunt/features/topic_search/topic_search.dart';

class TopicSearchBar extends StatefulWidget {
  const TopicSearchBar({super.key});

  @override
  State<TopicSearchBar> createState() => _TopicSearchBarState();
}

class _TopicSearchBarState extends State<TopicSearchBar> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicSearchBloc, TopicSearchState>(
      builder: (context, state) {
        return TextField(
          controller: _textController,
          autocorrect: false,
          autofocus: true,
          onChanged: (text) {
            context.read<TopicSearchBloc>().add(
                  SearchTermChanged(searchTerm: text),
                );
          },
          style: TextStyles.defaultStyle,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: kMaxPadding, vertical: kDefaultPadding),
            hintText: 'Search Topic',
            hintStyle: TextStyles.defaultStyle,
            filled: true,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.backgroundColorReverse),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.backgroundColorReverse),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.backgroundColorReverse),
            ),
            suffixIcon: GestureDetector(
              onTap: _onClearTapped,
              child: const Icon(Icons.clear, color: ColorPalette.backgroundColorReverse),
            ),
          ),
        );
      },
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    context.read<TopicSearchBloc>().add(const SearchTermChanged(searchTerm: ''));
  }
}
