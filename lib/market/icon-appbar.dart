import 'package:flutter/material.dart';
import 'package:navaninew/market/filter-bar.dart';
import 'package:navaninew/market/colors.dart';

/// Returns [AppBar] containing icon on right and title in center
///
/// The arguments [context], [title] and [onCLick] must not be null.
///
/// Requires argument [hasFilter] to allows filter on
/// bottom of app (by setting less bottom padding).
///
/// Supply [rightIcon] to change the icon on right side (default: Search)
AppBar iconAppBar({
  context,
  title,
  onClick,
  hasFilter = false,
  rightIcon = Icons.search,
}) {
  return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black, size: 20.0),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.white,
      elevation: hasFilter ? 2 : 0,
      centerTitle: true,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold)),
      bottom: PreferredSize(
          preferredSize:
              !hasFilter ? Size.fromHeight(0) : Size.fromHeight(100.0),
          child: !hasFilter ? Container() : FilterBar()),
      actions: [
        (rightIcon != null)
            ? IconButton(
                icon: Icon(rightIcon, color: ThemeColor.BLACK, size: 20.0),
                onPressed: onClick,
              )
            : Container(),
      ]);
}
