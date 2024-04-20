import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdlive_healthcare_app_ui/data/constants/constants.dart';
import 'package:mdlive_healthcare_app_ui/widgets/bottom_nav.dart';

import '../data/models/category.dart';
import '../data/models/doctor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: const Color(0xff23355f),
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w).copyWith(bottom: 20.h, top: 70.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Hello,', style: TextStyle(fontSize: 23.h, fontWeight: FontWeight.w300)),
                    Text('Aleksandr', style: TextStyle(fontSize: 40.h, fontWeight: FontWeight.w500)),
                  ]),
                  CircleAvatar(
                    radius: 32.r,
                    backgroundImage: ExactAssetImage(Constants.main),
                    foregroundImage: ExactAssetImage(Constants.patient),
                  ),
                ]),
              ),

              /// Card
              Container(
                height: 160.h,
                padding: const EdgeInsets.symmetric(horizontal: 32).w,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final width = constraints.maxWidth;
                    //log(width.toString());
                    return Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
                      color: Colors.transparent,
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: ExactAssetImage(Constants.bg),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(0).copyWith(left: 10.w, right: 10.w),
                          decoration: BoxDecoration(
                            color: const Color(0xb03a4d7f),
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                          child: Row(children: [
                              ClipRRect(
                                child: Image(
                                  image: const ExactAssetImage(Constants.toonDoc),
                                  height: 90.h,
                                  width: 90.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            10.w.spaceX(),
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 25.h).copyWith(right: 10.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40.h,
                                        margin: EdgeInsets.only(right: 20.w),
                                        child: Text(
                                          'Self check up Covid-19',
                                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      5.h.spaceY(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 3.w, bottom: 10.h),
                                            constraints: BoxConstraints(maxWidth: width - 160.w, maxHeight: 45.h),
                                            child: Text(
                                              'Contains Several list of Question to check Your physical Condition',
                                              maxLines: 2,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Colors.white.withOpacity(0.7),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Icon(CupertinoIcons.forward, color: Colors.white, size: 18.r),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              25.h.spaceY(),

              /// TextField
              Container(
                height: 70.h,
                padding: const EdgeInsets.symmetric(horizontal: 32).w,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  focusNode: focusNode,
                  controller: textEditingController,
                  style: TextStyle(color: color.primaryContainer),
                  decoration: InputDecoration(
                    fillColor: const Color(0xff3a4d7f).withOpacity(0.3),
                    filled: true,
                    hintText: 'How can I help you?',
                    hintStyle: TextStyle(color: color.inversePrimary, fontWeight: FontWeight.w300, fontSize: 14),
                    contentPadding: const EdgeInsets.all(20).r,
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.0.w),
                      child: Icon(CupertinoIcons.search, color: Colors.white, size: 25.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12).r,
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12).r,
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              30.h.spaceY(),

              /// LIstView
              SizedBox(
                height: 75.h,
                child: ListView.builder(
                    itemCount: HealthCategory.getAll.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (c, index) {
                      return buildCategoryItem(index);
                    }),
              ),

              30.h.spaceY(),

              ///Row
              Padding(
                padding: const EdgeInsets.all(32).r.copyWith(top: 0, bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Top doctors', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300)),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),

              10.h.spaceY(),

              /// LIstView
              Container(
                //height: 218,
                constraints: BoxConstraints(minHeight: 218.h, maxHeight: 228.h),
                child: ListView.builder(
                  itemCount: Doctor.getAll.length,
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemBuilder: (context, index) => buildDoctorItem(index),
                ),
              ),

              20.h.spaceY(),
            ]),
          ),

          /// BNB
          bottomNavigationBar: CustomBottomNav(
            context: context,
            page: 0,
          ),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: condition(
            index == 0,
            const EdgeInsets.only(left: 32),
            condition(
              index == 2,
              const EdgeInsets.only(right: 32),
              const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          constraints: const BoxConstraints(minWidth: 170),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xff3a4d7f),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xff4671C6),
                    BlendMode.multiply,
                  ),
                  child: Image(
                    image: ExactAssetImage(Constants.healthIcons[index]),
                    height: 48.h,
                    width: 48.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              15.w.spaceX(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HealthCategory.getAll[index].title!,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  5.h.spaceY(),
                  Text(
                    '${HealthCategory.getAll[index].doctorsAvailable!} doctors',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// Doctor Item
  Widget buildDoctorItem(int index) {
    final doctor = Doctor.getAll[index];
    return Card(
      margin: condition(
        index == 0,
        const EdgeInsets.only(left: 32, right: 16),
        condition(
          index == 6,
          const EdgeInsets.only(right: 32),
          const EdgeInsets.only(right: 16),
        ),
      ),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.transparent,
      child: Container(
        width: 170.w,
        padding: const EdgeInsets.all(15).r,
        decoration: BoxDecoration(
          color: const Color(0xff3a4d7f) /*Colors.white.withOpacity(0.15)*/,
          borderRadius: BorderRadius.circular(12).r,
        ),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10).r,
            height: 60.h,
            child: CircleAvatar(foregroundImage: ExactAssetImage(doctor.picture!), radius: 35),
          ),
          10.h.spaceY(),
          Text(
            doctor.name!,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            doctor.role!,
            style: TextStyle(fontSize: 13.sp, color: Colors.white.withOpacity(0.6)),
          ),
          14.h.spaceY(),
          Text(
            'Availability:',
            style: TextStyle(fontSize: 12.sp, color: Colors.white.withOpacity(0.3)),
          ),
          Text(
            'Tue, 26 May at 9:30',
            style: TextStyle(fontSize: 13.sp, color: Colors.white.withOpacity(0.7)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ]),
      ),
    );
  }
}
