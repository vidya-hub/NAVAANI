import 'package:flutter/material.dart';
import 'package:navaninew/market/colors.dart';

class FilterBar extends StatelessWidget {
  final List<String> filtersApplied = [
    'T-Shirt',
    ' 1000',
    'Red',
    'XL',
    'Jockey'
  ];
  final String orderSelected = 'Price: lowest to highest';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.0,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 7.0),
            itemCount: filtersApplied.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return Chip(
                padding: EdgeInsets.all(12.0),
                backgroundColor: ThemeColor.BLACK,
                label: Text(filtersApplied[index],
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .apply(color: ThemeColor.SECONDARY)),
              );
            },
          ),
        ),

        // filter actions
        Container(
          padding: EdgeInsets.all(16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // filter button
            InkWell(
              onTap: () {
                // change here
                Navigator.pushNamedAndRemoveUntil(context, '/filters', (route) => route.isFirst);
              },
              child: Row(children: [
                Icon(Icons.filter_list),
                SizedBox(width: 10.0),
                Text('Filters', style: Theme.of(context).textTheme.bodyText2)
              ]),
            ),

            // order button
            InkWell(
              onTap: () {},
              child: Row(children: [
                Icon(Icons.swap_vert),
                SizedBox(width: 10.0),
                Text(orderSelected,
                    style: Theme.of(context).textTheme.bodyText2)
              ]),
            ),
          ]),
        )
      ],
    );
  }
}
