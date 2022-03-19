import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final void Function() onSearched;

  const SearchField({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onSearched,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final focusNode = FocusNode();
  final LayerLink layerLink = LayerLink();
  late TextEditingController controller;
  late List<String> suggestionList;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    //WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());

    suggestionList = widget.items;

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 8),
          child: buildOverlay(),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;

    if (focusNode.hasFocus) {
      focusNode.unfocus();
    }
  }

  Widget buildOverlay() {
    return Material(
      elevation: 8,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestionList[index]),
              onTap: () {
                controller.text = suggestionList[index];
                hideOverlay();
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: filterSuggestions,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  void filterSuggestions(String value) {
    final newSuggestions = widget.items.where(
      (element) {
        return element.toLowerCase().contains(
              value.toLowerCase(),
            );
      },
    ).toList();

    setState(() {
      suggestionList = newSuggestions;
    });
  }
}

class MobileSearchBar extends SearchDelegate {
  List<String> searchTerms = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var searchedTerm in searchTerms) {
      if (searchedTerm.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchedTerm);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var searchedTerm in searchTerms) {
      if (searchedTerm.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(searchedTerm);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
