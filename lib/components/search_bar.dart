import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/search_bar_item.dart';
import 'package:personal_website/services/size.dart';

class SearchBar extends StatefulWidget {
  final Function onFocusLeft;
  final Function(String text) updateLastSearch;
  final List<SearchBarItem> Function(String text) search;
  final String lastSearch;
  final double width;
  final double height;
  final bool isSmall;

  const SearchBar({
    Key? key,
    required this.onFocusLeft,
    required this.search,
    required this.lastSearch,
    required this.updateLastSearch,
    required this.width,
    required this.height,
    required this.isSmall,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _focusNode = FocusNode();
  final LayerLink layerLink = LayerLink();
  late String lastSearch;
  late TextEditingController textController;
  OverlayEntry? _overlayEntry;
  List<SearchBarItem> items = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();

        Overlay.of(context)?.insert(_overlayEntry!);
      } else {
        widget.updateLastSearch(lastSearch);
        widget.onFocusLeft();
        if (_overlayEntry != null) {
          _overlayEntry!.remove();
          _overlayEntry = null;
        }
      }
    });
    lastSearch = widget.lastSearch;
    textController = TextEditingController(text: lastSearch);
    textController.addListener(() {
      String text = textController.text;
      lastSearch = text;
      if (text.isNotEmpty) {
        setState(() {
          items = widget.search(text);
        });
      } else {
        setState(() {
          items = [];
        });
      }
    });

    if (lastSearch.isNotEmpty) {
      items = widget.search(lastSearch);
    }
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    _focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        width: layerLink.leaderSize!.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          child: Material(
            elevation: 4.0,
            child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: items
                    .map((item) => ListTile(
                          leading: Icon(item.icon),
                          title: Text('${item.text} • ${item.category.tr}'),
                          onTap: () {
                            item.onTap();
                          },
                        ))
                    .toList()),
          ),
        ),
      );
    });
  }

  InputDecoration getInputDecoration(bool isSmall) {
    if (widget.isSmall) {
      return InputDecoration(
        hintText: 'search_hinttext'.tr,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(
          left: SizeService.minPadding,
          right: SizeService.minPadding,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      );
    } else {
      return InputDecoration(
        hintText: 'search_hinttext'.tr,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextField(
          autofocus: true,
          controller: textController,
          focusNode: _focusNode,
          decoration: getInputDecoration(widget.isSmall),
        ),
      ),
    );
  }
}
