import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 32).copyWith(bottom: 20, top: 70),
                child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Hello,', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300)),
                    Text('Aleksandr', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
                  ]),
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: ExactAssetImage(Constants.main),
                    foregroundImage: ExactAssetImage(Constants.patient),
                  ),
                ]),
              ),

              /// Card
              Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final width = constraints.maxWidth;
                    //log(width.toString());
                    return Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: Colors.transparent,
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: ExactAssetImage(Constants.bg),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(0).copyWith(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xb03a4d7f),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(children: [
                            const ClipRRect(
                                //borderRadius: BorderRadius.circular(100),
                                child: Image(
                              image: ExactAssetImage(Constants.toonDoc),
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                                )),
                            10.spaceX(),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 35),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  const Text(
                                    'Self check up Covid-19',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                  ),
                                  10.spaceY(),
                                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                    Container(
                                      //width: width,
                                      margin: const EdgeInsets.only(right: 5),
                                      constraints: BoxConstraints(maxWidth: width - 160),
                                      child: Text(
                                        'Contains Several list of Questions to check Your physical Condition',
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.7)),
                                      ),
                                    ),
                                    const Icon(CupertinoIcons.forward, color: Colors.white, size: 18),
                                  ]),
                                ]),
                              ),
                            )
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              ),

              25.spaceY(),

              /// TextField
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: const Padding(
                      padding: EdgeInsetsDirectional.only(end: 8.0),
                      child: Icon(CupertinoIcons.search, color: Colors.white, size: 25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              30.spaceY(),

              /// LIstView
              SizedBox(
                height: 75,
                child: ListView.builder(
                    itemCount: HealthCategory.getAll.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (c, index) {
                      return buildCategoryItem(index);
                    }),
              ),

              30.spaceY(),

              ///Row
              Padding(
                padding: const EdgeInsets.all(32).copyWith(top: 0, bottom: 8),
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

              10.spaceY(),

              /// LIstView
              SizedBox(
                height: 218,
                child: ListView.builder(
                  itemCount: Doctor.getAll.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildDoctorItem(index),
                ),
              ),

              20.spaceY(),
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
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              15.spaceX(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HealthCategory.getAll[index].title!,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  5.spaceY(),
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
        width: 170,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xff3a4d7f) /*Colors.white.withOpacity(0.15)*/,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 60,
            child: CircleAvatar(foregroundImage: ExactAssetImage(doctor.picture!), radius: 35),
          ),
          10.spaceY(),
          Text(doctor.name!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(
            doctor.role!,
            style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.6)),
          ),
          14.spaceY(),
          Text(
            'Availability:',
            style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.3)),
          ),
          Text(
            'Tue, 26 May at 9:30',
            style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
          ),
        ]),
      ),
    );
  }
}
