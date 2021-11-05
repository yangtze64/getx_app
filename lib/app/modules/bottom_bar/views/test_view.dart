import 'package:flutter/material.dart';
import 'package:getx_app/app/component/gzx_dropdown_menu/gzx_dropdown_menu.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({
    required this.name,
    required this.isSelected,
  });
}

class GZXDropDownMenuTestPage extends StatefulWidget {
  @override
  _GZXDropDownMenuTestPageState createState() =>
      _GZXDropDownMenuTestPageState();
}

class _GZXDropDownMenuTestPageState extends State<GZXDropDownMenuTestPage> {
  List<String> _dropDownHeaderItemStrings = ['品牌'];
  List<SortCondition> _brandSortConditions = [];
  late SortCondition _selectBrandSortCondition;
  late SortCondition _selectDistanceSortCondition;
  GZXDropDownHeader
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  String _dropdownMenuChange = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _brandSortConditions.add(SortCondition(name: '全部', isSelected: true));
    _brandSortConditions.add(SortCondition(name: '金逸影城', isSelected: false));
    _brandSortConditions
        .add(SortCondition(name: '中影国际城我比较长，你看我选择后是怎么显示的', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '星美国际城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '博纳国际城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '大地影院', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '嘉禾影城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '太平洋影城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城1', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城2', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城3', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城4', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城5', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城6', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城7', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城8', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '万达影城9', isSelected: false));
    _selectBrandSortCondition = _brandSortConditions[0];
  }

  @override
  Widget build(BuildContext context) {
    print('_GZXDropDownMenuTestPageState.build');

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      backgroundColor: Colors.white,
      // GZXDropDownMenu目前只能在Stack内，后续有时间会改进，以及支持CustomScrollView和NestedScrollView
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
//              SizedBox(height: 20,),
              // 下拉菜单头部
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: [
                  GZXDropDownHeaderItem(
                    _dropDownHeaderItemStrings[0],
                    iconData: Icons.keyboard_arrow_down,
                    iconDropDownData: Icons.keyboard_arrow_up,
                  ),
                ],
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {
                  print('GZXDropDownHeader onItemTap Index:${index}');
                },
//                // 头部的高度
//                height: 40,
//                // 头部背景颜色
//                color: Colors.red,
//                // 头部边框宽度
//                borderWidth: 1,
//                // 头部边框颜色
//                borderColor: Color(0xFFeeede6),
//                // 分割线高度
//                dividerHeight: 20,
//                // 分割线颜色
//                dividerColor: Color(0xFFeeede6),
//                // 文字样式
                style: TextStyle(color: Color(0xFF666666), fontSize: 14),
//                // 下拉时文字样式
                dropDownStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
//                // 图标大小
//                iconSize: 20,
//                // 图标颜色
//                iconColor: Color(0xFFafada7),
//                // 下拉时图标颜色
//                iconDropDownColor: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: Text('列表'),
              ),
            ],
          ),
          // 下拉菜单，注意GZXDropDownMenu目前只能在Stack内，后续有时间会改进，以及支持CustomScrollView和NestedScrollView
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 300,
            // 下拉后遮罩颜色
//          maskColor: Theme.of(context).primaryColor.withOpacity(0.5),
//          maskColor: Colors.red.withOpacity(0.5),
            dropdownMenuChanging: (isShow, index) {
              // 状态改变时
            },
            dropdownMenuChanged: (isShow, index) {
              //
            },
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              // GZXDropdownMenuBuilder(
              //     dropDownHeight: 40 * 8.0,
              //     dropDownWidget:
              //         _buildConditionListWidget(_brandSortConditions, (value) {
              //       _selectBrandSortCondition = value;
              //       _dropDownHeaderItemStrings[0] =
              //           _selectBrandSortCondition.name == '全部'
              //               ? '品牌'
              //               : _selectBrandSortCondition.name;
              //       _dropdownMenuController.hide();
              //       setState(() {});
              //     })),
              DropdownMenuBuilderFactory(
                menuMaxHeight: 320.0,
                itemCount: _brandSortConditions.length,
                menuItemBuilder: (BuildContext context, int index) {
                  var item = _brandSortConditions[index];
                  return Container(
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(
                              color: item.isSelected
                                  ? Color(0xFFFA5533)
                                  : Colors.black,
                            ),
                          ),
                        ),
                        item.isSelected
                            ? Icon(
                                Icons.check,
                                color: Color(0xFFFA5533),
                                size: 16,
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  );
                },
                onItemTap: (BuildContext context, int index) {
                  print('状态筛选点击了第${index}项');
                },
              )._dropdownMenuBuilder,
            ],
          ),
        ],
      ),
    );
  }

  _buildConditionListWidget(
      items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        return gestureDetector(items, index, itemOnTap, context);
      },
    );
  }

  GestureDetector gestureDetector(items, int index,
      void itemOnTap(SortCondition sortCondition), BuildContext context) {
    SortCondition goodsSortCondition = items[index];
    return GestureDetector(
      onTap: () {
        for (var value in items) {
          value.isSelected = false;
        }
        goodsSortCondition.isSelected = true;

        itemOnTap(goodsSortCondition);
      },
      child: Container(
        //            color: Colors.blue,
        height: 40,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                goodsSortCondition.name,
                style: TextStyle(
                  color: goodsSortCondition.isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                ),
              ),
            ),
            goodsSortCondition.isSelected
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  )
                : SizedBox(),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownMenuBuilderFactory {
  final double menuMaxHeight;
  final double menuItemHeight;
  int itemCount;
  IndexedWidgetBuilder menuItemBuilder;
  void Function(BuildContext context, int index) onItemTap;

  late double dropDownHeight;
  late GZXDropdownMenuBuilder _dropdownMenuBuilder;

  DropdownMenuBuilderFactory({
    required this.menuMaxHeight,
    required this.itemCount,
    required this.menuItemBuilder,
    required this.onItemTap,
    this.menuItemHeight = 40.0,
  }) {
    double menuTotalHeight = itemCount * menuItemHeight;
    dropDownHeight =
        menuTotalHeight > menuMaxHeight ? menuMaxHeight : menuTotalHeight;
    _dropdownMenuBuilder = GZXDropdownMenuBuilder(
      dropDownHeight: dropDownHeight,
      dropDownWidget: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: menuItemBuilder(context, index),
            onTap: () {
              () {
                print('item onTap');
              }();
              onItemTap(context, index);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1.0),
        itemCount: itemCount,
      ),
    );
  }

  get dropdownMenuBuilder {
    return _dropdownMenuBuilder;
  }
}
