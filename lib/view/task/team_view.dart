import 'package:flutter/material.dart';
import 'package:ht_re/service/task_services.dart';
import 'package:ht_re/view/task/team_add.dart';
import 'package:get/get.dart';


class TeamView extends StatefulWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  TeamController teamController = Get.put(TeamController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        backgroundColor: Colors.pink,
        title: Text("Team",style: TextStyle(fontSize: 16,color:Colors.white),),
        centerTitle: true,
      ),

      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
                height: 45,
                width: 120,
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  heroTag: "google",
                  backgroundColor: const Color(0xff3b4682),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TeamAdd()),
                  ),
                  child: const Text("Add team"),
                )),
          ),

          // button third

          // Add more buttons here
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Obx(
                    () {
                  if(teamController.isTeamLoaders.isTrue)
                  {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      ),
                    );

                  }
                  else
                  {
                    if(teamController.teams.isNotEmpty)
                    {
                      return Container(
                        // padding: EdgeInsets.all(10),
                        // height: 110 * teamController.teams.length.toDouble(),
                        child: ListView.builder(
                            shrinkWrap: true,

                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: teamController.teams.length,
                            itemBuilder: ((context, index) {

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(.4),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              child: Text(
                                                teamController.teams[index].name,
                                                style: const TextStyle(
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 1,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(teamController.teams[index].designation,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(teamController.teams[index].phone.toString()),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 12),
                                                    child: Icon(Icons.mail)
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(left: 03),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          teamController.teams[index].email,
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w400),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            })),
                      );
                    }
                    else
                    {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(child: Text("No teams")),
                      );
                    }

                  }

                }
            ),
          ],
        ),
      ),
    );
  }
}
