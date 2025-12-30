import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const id = 'filters-screen';

  final Function saveFilter;
  final Map<String, bool> currentFilter;
  FiltersScreen(this.saveFilter, this.currentFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'] as bool;
    _lactoseFree = widget.currentFilter['lactose'] as bool;
    _vegetarian = widget.currentFilter['vegetarian'] as bool;
    _vegan = widget.currentFilter['vegan'] as bool;
    super.initState();
  }

  Widget BuildSwitchListTiles(
      {required String title,
      required String description,
      required Function onchange,
      required bool value}) {
    return SwitchListTile(
      value: value,
      onChanged: (_) => onchange(_),
      title: Text(
        title,
        style:
            const TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: Text(
                'Adjust your meal selection.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          BuildSwitchListTiles(
            title: 'Gluten-free',
            description: 'Only include gluten-free meals.',
            value: _glutenFree,
            onchange: (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          BuildSwitchListTiles(
            title: 'Lactose-free',
            description: 'Only include lactose-free meals.',
            value: _lactoseFree,
            onchange: (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          BuildSwitchListTiles(
            title: 'Vegetarian',
            description: 'Only include vegetarian meals.',
            value: _vegetarian,
            onchange: (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),
          BuildSwitchListTiles(
            title: 'Vegan',
            description: 'Only include vegan meals.',
            value: _vegan,
            onchange: (newValue) {
              setState(
                () {
                  _vegan = newValue;
                },
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    final selectedFilter = {
                      'gluten': _glutenFree,
                      'lactose': _lactoseFree,
                      'vegetarian': _vegetarian,
                      'vegan': _vegan,
                    };

                    widget.saveFilter(selectedFilter);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    alignment: Alignment.centerRight,
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
