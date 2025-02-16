import 'package:flutter/material.dart';
import 'package:smart_school/core/utils/text_style.dart';
import 'package:smart_school/src/profile/presentation/views/user_detail_view.dart';
import 'package:smart_school/src/widget/common_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Profile',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserDetailView(),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xffd7d7d7),
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
          Expanded(
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 3, // Number of tabs
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                )),
                            child: const TabBar(
                              indicatorColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: [
                                Tab(text: 'Personal'),
                                Tab(text: 'Parents'),
                                Tab(text: 'Other'),
                              ],
                              isScrollable: false, // No scrolling
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(), // No swipe
                              children: [
                                Container(
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: 15,
                                        itemBuilder: (context, index) => profileListItem(),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 8.0) // Add spacing between items
                                        )),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                                  child: Column(
                                    children: [
                                      profileListItem(),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                                  child: Column(
                                    children: [
                                      profileListItem(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row profileListItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "Admission Date",
            style: bold(fontSize: 12),
          ),
        ),
        Expanded(
          child: Text(
            "03/18/2021",
            style: medium(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
