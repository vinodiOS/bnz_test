import 'package:benzy_test/common_widgets/rich_text.dart';
import 'package:benzy_test/screens/food_status_card.dart';
import 'package:benzy_test/screens/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<HomeProvider>(context, listen: false);
    dataProvider.fetchFoodDetails();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    String convertDate(String date) {
      var dateTime = DateFormat('y-M-d').parse(date);
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Benzy Test"),
      ),
      body: homeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : (homeProvider.error == "")
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserDetailsWidget(
                        user: homeProvider.foodDetails?.user,
                        fineAmount: homeProvider.fineAmount),
                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeProvider.foodDetails?.reports.length,
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [//"${homeProvider.foodDetails?.reports[i].date ?? ""}"
                                        BenzyRichText(title: "Date", subTitle: convertDate(homeProvider.foodDetails?.reports[i].date ?? "")),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        if (homeProvider.foodDetails?.reports[i]
                                            .optIns is Map)
                                          FoodStatusCard(
                                              optsIn: homeProvider.foodDetails
                                                  ?.reports[i].optIns),
                                        if (homeProvider.foodDetails?.reports[i]
                                            .optIns is List)
                                          const Text("Data not available")
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            );
                          }),
                    )
                  ],
                )
              : Text("Error: ${homeProvider.error}"),
    );
  }
}
