import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/component/gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:getx_app/app/modules/bottom_bar/controllers/project_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectView extends GetView<ProjectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text('远程实习项目'),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          backgroundColor: Color(0xFFFFD800),
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        child: BannerWidget(),
                      ),
                    ),
                    Container(
                      height: 41.h,
                      child: LabelBar(),
                    )
                  ],
                ),
                Positioned.fill(
                  top: 191.h,
                  child: DropdownWidget(),
                )
              ],
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class BannerWidget extends GetView<ProjectController> {
  List swiperImages = [
    "https://res.hulianpai.com/upload/agreement/202110/1634005280.png",
    "https://res.hulianpai.com/upload/agreement/202106/1623146457.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Swiper(
        itemCount: swiperImages.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.network(
              swiperImages[index],
              fit: BoxFit.fill,
            ),
            onTap: () {
              if (index == 0) {
                _launchURL('http://www.hulianpai.com');
              } else {
                _launchURL('openapp.jdmoble://', slaveUrl: 'tel:18640998729');
              }
            },
          );
          // return Image.network(
          //   swiperImages[index],
          //   fit: BoxFit.fill,
          // );
        },
        indicatorLayout: PageIndicatorLayout.SCALE,
        autoplay: true,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              activeColor: Colors.white, activeSize: 12.0),
        ),
        // control: new SwiperControl(),
      ),
    );
  }

  _launchURL(String url, {String? slaveUrl}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      if (slaveUrl!.isNotEmpty) {
        if (await canLaunch(slaveUrl)) {
          await launch(slaveUrl);
        } else {
          throw 'Could not launch $slaveUrl';
        }
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}

class LabelBar extends StatefulWidget {
  LabelBar({Key? key}) : super(key: key);

  @override
  _LabelBarState createState() => _LabelBarState();
}

class _LabelBarState extends State<LabelBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late tabBarContorller = DefaultTabController(length: 6, child: child);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      enableFeedback: true,
      labelColor: Color(0xFF282828),
      labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
      unselectedLabelColor: Color(0xFF444444),
      unselectedLabelStyle: TextStyle(fontSize: 15.sp),
      indicatorColor: Color(0xFFFFD800),
      tabs: [
        Text('推荐'),
        Text('实习'),
        Text('兼职'),
        Text('项目'),
        Text('校园大使'),
        Text('其它'),
      ],
      onTap: (index) {
        print(index);
      },
    );
  }
}

class DropdownWidget extends StatefulWidget {
  DropdownWidget({Key? key}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<Map> statusList = [
    {'name': '全部', 'selected': true},
    {'name': '未开始', 'selected': false},
    {'name': '招募中', 'selected': false},
    {'name': '已结束', 'selected': false},
  ];
  List<Map> reportList = [
    {'name': '全部', 'selected': true},
    {'name': '已参加', 'selected': false},
    {'name': '未参加', 'selected': false},
  ];
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  final GlobalKey _stackKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        key: _stackKey,
        children: [
          Column(
            children: [
              GZXDropDownHeader(
                items: [
                  GZXDropDownHeaderItem(
                    '状态筛选',
                    iconData: Icons.arrow_drop_down,
                    iconDropDownData: Icons.arrow_drop_up,
                  ),
                  GZXDropDownHeaderItem(
                    '报名筛选',
                    iconData: Icons.arrow_drop_down,
                    iconDropDownData: Icons.arrow_drop_up,
                  ),
                ],
                controller: _dropdownMenuController,
                stackKey: _stackKey,
                onItemTap: (index) {
                  print('DownHeader onItemTap Index:${index}');
                },
                // 头部的高度
                height: 40.h,
                // 头部背景颜色
                style: TextStyle(
                  color: Color(0xFF282828),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                dropDownStyle: TextStyle(
                  color: Color(0xFFFA5533),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                iconSize: 24,
                iconColor: Color(0xFF282828),
                iconDropDownColor: Color(0xFFFA5533),
              ),
              Text('这里是列表'),
            ],
          ),
          GZXDropDownMenu(
            controller: _dropdownMenuController,
            menus: [
              DropdownMenuBuilderFactory(
                menuMaxHeight: 300.h,
                menuItemHeight: 35.h,
                itemCount: statusList.length,
                menuItemBuilder: (BuildContext context, int index) {
                  var item = statusList[index];
                  return Container(
                    height: 35.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            item['name'],
                            style: TextStyle(
                              color: item['selected']
                                  ? Color(0xFFFA5533)
                                  : Colors.black,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        item['selected']
                            ? Icon(
                                Icons.check,
                                color: Color(0xFFFA5533),
                                size: 15.w,
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                  );
                },
                onItemTap: (BuildContext context, int index) {
                  print('状态筛选点击了第${index}项');
                },
              ).dropdownMenuBuilder,
              DropdownMenuBuilderFactory(
                menuMaxHeight: 300.h,
                menuItemHeight: 35.h,
                itemCount: reportList.length,
                menuItemBuilder: (BuildContext context, int index) {
                  var item = reportList[index];
                  return Container(
                    height: 35.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Text(
                            item['name'],
                            style: TextStyle(
                              color: item['selected']
                                  ? Color(0xFFFA5533)
                                  : Colors.black,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        item['selected']
                            ? Icon(
                                Icons.check,
                                color: Color(0xFFFA5533),
                                size: 15.w,
                              )
                            : SizedBox(),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                  );
                },
                onItemTap: (BuildContext context, int index) {
                  print('报名筛选点击了第${index}项');
                },
              ).dropdownMenuBuilder,
            ],
            animationMilliseconds: 200,
            dropdownMenuChanging: (isShow, index) {
              // 状态改变时
            },
            dropdownMenuChanged: (isShow, index) {
              // 状态改变后
            },
          )
        ],
      ),
    );
  }
}

/// 下拉菜单构建工厂
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
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 0.6,
          indent: 16,
          endIndent: 16,
        ),
        itemCount: itemCount,
      ),
    );
  }

  get dropdownMenuBuilder {
    return _dropdownMenuBuilder;
  }
}
