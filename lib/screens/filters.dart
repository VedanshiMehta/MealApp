import 'package:flutter/material.dart';
import 'package:meal_app/enum/filter.dart';
// import 'package:meal_app/screens/tabs.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FiltersScreen> createState() {
    return _FilterSCreenState();
  }
}

class _FilterSCreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegitarianFilterSet = false;
  var _veganFilterSet = false;
  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree]!;
    _vegitarianFilterSet = widget.currentFilter[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      // drawer: MainDrawer(
      //     onSelectScreen: ((identifier) => {
      //           Navigator.of(context).pop(),
      //           if (identifier == 'meals')
      //             {
      //               Navigator.of(context).pushReplacement(
      //                 MaterialPageRoute(
      //                   builder: (ctx) => const TabScreen(),
      //                 ),
      //               ),
      //             }
      //         })),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegitarianFilterSet,
              Filter.vegan: _veganFilterSet,
            },
          );
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _glutenFreeFilterSet = isChecked),
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _lactoseFreeFilterSet = isChecked),
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegitarianFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _vegitarianFilterSet = isChecked),
              title: Text(
                'Vegietarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegietarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) =>
                  setState(() => _veganFilterSet = isChecked),
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
