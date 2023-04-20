import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdlive_healthcare_app_ui/data/models/doctor.dart';

import '../widgets/bottom_nav.dart';

class Chat extends ConsumerStatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  ConsumerState<Chat> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
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
          56.spaceY(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: 'Chats'.edit(textStyle: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),

          18.spaceY(),

          /// TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              focusNode: focusNode,
              style: TextStyle(color: color.primaryContainer),
              controller: textEditingController,
              decoration: InputDecoration(
                fillColor: const Color(0xff3a4d7f).withOpacity(0.3),
                filled: true,
                hintStyle: TextStyle(color: color.inversePrimary),
                hintText: 'Search, e.g. Dr',
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

          15.spaceY(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  final doctor = Doctor.getAll[index];
                  return Container(
                    width: MediaQuery.of(context).size.width - 50,
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                    decoration: BoxDecoration(color: const Color(0xff3a4d7f), borderRadius: BorderRadius.circular(15)),
                    child: Row(children: [
                      Stack(alignment: Alignment.bottomRight + const Alignment(0, -0.2), children: [
                        CircleAvatar(radius: 25, backgroundImage: ExactAssetImage(doctor.picture!)),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1.5, color: const Color(0xff3a4d7f)),
                            ),
                            width: 10,
                            height: 10),
                      ]),
                      15.spaceX(),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(doctor.name!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                            Text('14:22', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.4))),
                          ]),
                          5.spaceY(),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            condition(
                              index != 5,
                              Text(doctor.message!, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7))),
                              Row(children: [
                                const Icon(CupertinoIcons.phone_arrow_down_left, color: Colors.redAccent, size: 14),
                                5.spaceX(),
                                Text(doctor.message!, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7))),
                              ]),
                            ),
                            condition(
                              doctor.messageCount != 0,
                              Container(
                                  height: 18,
                                  width: 18,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: color.inversePrimary, shape: BoxShape.circle),
                                  child: Text('${doctor.messageCount}', style: const TextStyle(fontSize: 12, color: Colors.white))),
                              Container(),
                            ),
                          ]),
                        ]),
                      )
                    ]),
                  );
                },
              ),
            ),
          ),

          3.spaceY(),
        ]),

        /// BNB
        bottomNavigationBar: CustomBottomNav(
          context: context,
          page: 2,
        ),
      ),
    );
  }
}
