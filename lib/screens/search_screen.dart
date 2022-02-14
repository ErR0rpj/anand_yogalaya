import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

//This screen actually creates a delegate and it is not a screen. Delegate means
// like if we click on search the screen converts the app bar to search.
class SearchScreen extends SearchDelegate<String> {
  List<String> trial = ['apsdp', 'dga', 'gdjbkldgh', 'awijfdjxnng'];
  String result = '';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: DASHBOARD_TEXT_COLOR,
        ),
      ),
      IconButton(
        onPressed: () {
          //Add filter
        },
        icon: const Icon(
          Icons.tune,
          color: loginbutton,
        ),
      ),
      const SizedBox(width: VS_SIZEDBOX_SIZE),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          context,
          result,
        );
      },
      icon: const Icon(
        Icons.chevron_left_rounded,
        size: BACK_BUTTON_ICON_SIZE,
        color: DASHBOARD_TEXT_COLOR,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = trial.where(
        (element) => element.toLowerCase().contains(query.toLowerCase()));

    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions.elementAt(index)),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: suggestions.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = trial.where(
        (element) => element.toLowerCase().contains(query.toLowerCase()));

    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions.elementAt(index)),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: suggestions.length,
    );
  }
}
