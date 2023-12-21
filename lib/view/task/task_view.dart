import 'package:flutter/material.dart';
import 'package:ht_re/service/task_services.dart';
import 'package:ht_re/view/task/project_view.dart';
import 'package:ht_re/view/task/task_add.dart';
import 'package:ht_re/view/task/team_view.dart';
class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  // TeamController teamController = Get.put(TeamController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        backgroundColor: Colors.pink,
        title: Text("Task",style: TextStyle(fontSize: 16,color:Colors.white),),
        centerTitle: true,
      ),
      floatingActionButton: InkWell(
        onTap: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskAdd()));
        },
        child: Container(
          width: 120,
          padding: EdgeInsets.all(08),
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(18)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Task"),
              Icon(Icons.add)
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TeamView()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff59d6f9),
                            Color(0xff7f85f1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: MediaQuery.of(context).size.width/2.3,
                      height: 40,
                      child: Center(
                        child: Text("Add Team"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectView()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff59d6f9),
                            Color(0xff7f85f1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: MediaQuery.of(context).size.width/2.3,
                      height: 40,
                      child: Center(
                        child: Text("Add Project"),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}
