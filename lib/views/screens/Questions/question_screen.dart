import 'package:calmnest/controllers/question_controller.dart';
import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/views/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionTabScreen extends StatefulWidget {
  @override
  _QuestionTabScreenState createState() => _QuestionTabScreenState();
}

class _QuestionTabScreenState extends State<QuestionTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    QuestoinController questoinController =
        Provider.of<QuestoinController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: questoinController.answers.entries.map((entry) {
          return QuestionTab(entry.key, _tabController);
        }).toList(),
      
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.arrow_back),
      //         onPressed: () {
      //           if (_tabController.index > 0) {
      //             _tabController.animateTo(_tabController.index - 1);
      //           }
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(Icons.arrow_forward),
      //         onPressed: () {
      //           if (_tabController.index < 3) {
      //             _tabController.animateTo(_tabController.index + 1);
      //           } else {
      //             navigateToRoute(context, const DashboardScreen());
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class QuestionTab extends StatefulWidget {
  QuestionTab(this.question, this.tabController, {super.key});
  String question;
  TabController tabController;

  @override
  State<QuestionTab> createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  String answer = "";

  @override
  Widget build(BuildContext context) {
      QuestoinController questoinController =
        Provider.of<QuestoinController>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.question.toString(),
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20.0),
          if (answer == "")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = "Yes";
                      questoinController.updateAnswers(widget.question, "Yes");
                    });
                    if (widget.tabController.index < 3) {
                      widget.tabController
                          .animateTo(widget.tabController.index + 1);
                    } else {
                      navigateToRoute(context, const DashboardScreen());
                    }
                  },
                  child: const Text('Yes'),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = "No";
                      questoinController.updateAnswers(widget.question, "No");

                    });
                    if (widget.tabController.index < 3) {
                      widget.tabController
                          .animateTo(widget.tabController.index + 1);
                    } else {
                      navigateToRoute(context, const DashboardScreen());
                    }
                  },
                  child: const Text('No'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
