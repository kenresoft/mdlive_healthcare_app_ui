import 'dart:developer';

import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdlive_healthcare_app_ui/data/constants/constants.dart';
import 'package:mdlive_healthcare_app_ui/widgets/bottom_nav.dart';

import '../data/models/category.dart';
import '../data/models/doctor.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
      child: Scaffold(
        backgroundColor: const Color(0xff23355f),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 76),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Hello,', style: TextStyle(fontSize: 16)),
                Text('Kenneth', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              ]),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: ExactAssetImage(Constants.bg),
                  foregroundImage: ExactAssetImage(Constants.profile),
                ),
              ),
            ]),
          ),

          /// Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final width = constraints.maxWidth - 140;
                log(width.toString());
                return Card(
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: ExactAssetImage(Constants.main), fit: BoxFit.fitWidth),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(35).copyWith(left: 10, right: 10),
                      decoration: BoxDecoration(color: const Color(0xb03a4d7f), borderRadius: BorderRadius.circular(12)),
                      child: Row(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              image: ExactAssetImage(Constants.patient),
                              height: 65,
                              width: 65,
                              fit: BoxFit.cover,
                            )),
                        10.spaceX(),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const Text('Self check up Covid-19', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            10.spaceY(),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              SizedBox(
                                width: width,
                                child: Text(
                                  'Contains several list of questions to check your physical condition',
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
                                ),
                              ),
                              const Icon(CupertinoIcons.forward, color: Colors.white, size: 18),
                            ]),
                          ]),
                        )
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),

          20.spaceY(),

          /// TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              focusNode: focusNode,
              controller: textEditingController,
              style: TextStyle(color: color.primaryContainer),
              decoration: InputDecoration(
                fillColor: const Color(0xff3a4d7f).withOpacity(0.3),
                filled: true,
                hintText: 'How can I help you?',
                hintStyle: TextStyle(color: color.inversePrimary),
                contentPadding: const EdgeInsets.all(20),
                suffixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(end: 8.0),
                  child: Icon(CupertinoIcons.search, color: Colors.white, size: 20),
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

          20.spaceY(),

          /// LIstView
          SizedBox(
            height: 70,
            child: ListView.builder(
                itemCount: HealthCategory.getAll.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (c, index) {
                  return buildCategoryItem(index);
                }),
          ),

          20.spaceY(),

          ///Row
          Padding(
            padding: const EdgeInsets.all(20).copyWith(top: 0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Top doctors', style: TextStyle(fontSize: 21)),
                Text('See all', style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7))),
              ],
            ),
          ),

          /// LIstView
          SizedBox(
            height: 190,
            child: ListView.builder(
                itemCount: Doctor.getAll.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (c, index) {
                  return buildDoctorItem(index);
                }),
          ),

          20.spaceY(),
        ]),

        /// BNB
        bottomNavigationBar: CustomBottomNav(
          context: context,
          page: 0,
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        log(width.toString());
        return Card(
          margin: condition(
            index == 0,
            const EdgeInsets.only(left: 25),
            condition(
              index == 2,
              const EdgeInsets.only(right: 25),
              const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.transparent,
          child: Container(
            //width: width / 2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xff3a4d7f), borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(image: ExactAssetImage(Constants.healthIcons[index]), height: 35, width: 35, fit: BoxFit.cover),
              ),
              5.spaceX(),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(HealthCategory.getAll[index].title!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                5.spaceY(),
                Text('${HealthCategory.getAll[index].doctorsAvailable!} doctors', style: const TextStyle(fontSize: 13)),
              ]),
            ]),
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
        const EdgeInsets.only(left: 25, right: 10),
        condition(
          index == 6,
          const EdgeInsets.only(right: 25),
          const EdgeInsets.only(right: 10),
        ),
      ),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: const Color(0xff3a4d7f) /*Colors.white.withOpacity(0.15)*/, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Container(margin: const EdgeInsets.all(10), height: 48, child: CircleAvatar(foregroundImage: ExactAssetImage(doctor.picture!), radius: 35)),
          5.spaceX(),
          Text(doctor.name!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          10.spaceY(),
          Text(doctor.role!, style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.6))),
          Text('Availability:', style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.3))),
          5.spaceY(),
          Text('Tue, 26 May at 9:30', style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7))),
        ]),
      ),
    );
  }
}
