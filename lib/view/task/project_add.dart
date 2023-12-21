import 'package:flutter/material.dart';
import 'package:ht_re/service/task_services.dart';
import 'package:get/get.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  TextEditingController projectNameController = TextEditingController();
  TextEditingController sub_taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TeamController projectController =   Get.put(TeamController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        backgroundColor: Colors.pink,
        title: Text("Add Projects",style: TextStyle(fontSize: 16,color:Colors.white),),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(()
      {
        if(projectController.isProjectSaveLoaders.isTrue)
        {
          return InkWell(
            onTap: ()
            {

            },
            child: Padding(
              padding:  EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width! - 100,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0XFFffbf96),
                      Color(0XFFfe7096),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,color: Colors.white,
                  ),
                ),
              ),
            ),
          );

        }
        else
        {
          return InkWell(
            onTap: ()
            {
              print("projectController.selectTeamForProject");
              print(projectController.projectName.text);
              print(projectController.selectTeamForProject.length);



              projectController.selectTeamForWholeProject.clear();
              for(int i = 0; i<projectController.teams.length;i++)
              {
                for(int j = 0; j<projectController.selectTeamForProject.length;j++)
                {
                  if(projectController.teams[i].user == projectController.selectTeamForProject[j])
                  {
                    setState(() {
                      var body =
                      {
                        "id": projectController.teams[i].id,
                        "user_id": "${projectController.teams[i].userId}",
                        "user": "${projectController.teams[i].user}",
                        "name": "${projectController.teams[i].name}",
                        "designation": "${projectController.teams[i].designation}",
                        "email": "${projectController.teams[i].email}",
                        "phone": "${projectController.teams[i].phone}",
                        "created_at": "${projectController.teams[i].createdAt}",
                        "updated_at": "${projectController.teams[i].updatedAt}"
                      };
                      projectController.selectTeamForWholeProject.add(body);
                    });
                  }
                  else
                  {
                    continue;
                  }
                }

              }

              if(projectController.projectName.text.isNotEmpty && projectController.selectTeamForWholeProject.isNotEmpty)
              {
                projectController.addProject(projectController.projectName.text);

              }
              else
              {
                Get.snackbar("Alert", "Please fill all fields",
                    backgroundColor: Colors.black.withOpacity(0.4),
                    colorText: Colors.white,
                    icon: Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: Padding(
              padding:  EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width! - 100,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0XFFffbf96),
                      Color(0XFFfe7096),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text('Add Project',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                ),
              ),
            ),
          );
        }
      }),

        body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Project Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller:projectController.projectName,
              decoration: InputDecoration(
                hintText: "Project name",
                filled: true,
                fillColor: const Color(0xffeaf0f6),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() => _onButtonPressed1()),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffeaf0f6)),
                width: MediaQuery.of(context).size.width! / 2.4,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Select team",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(() {
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  for(int i = 0; i<projectController.teams.length; i++)
                    for(int j = 0; j<projectController.selectTeamForProject.length; j++)
                      if(projectController.selectTeamForProject[j] == projectController.teams[i].user)
                        ListTile(
                          title: Text("${projectController.teams[i].email}"),
                          trailing: Text("${projectController.teams[i].designation}"),
                        ),
                  projectController.selectTeamForProject.isNotEmpty?
                  Divider(
                    color: Colors.grey,
                  ):Container(),
                ],
              );
            }
            ),
          ],
        ),
      ),

    );
  }
  void _onButtonPressed1() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (context) {

            return Container(
              height: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 20,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(width: 3,),
                        Text("Select Team",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff624F82),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 70,
                            height: 35,
                            child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  for(int i = 0; i< projectController.teams.length;i++)
                    Obx(() {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            // onTap: () => _selectItempriority1("Naveenraj@gmail.com"),
                            onTap: ()
                            {
                              if(projectController.selectTeamForProject.contains(projectController.teams[i].user))
                              {
                                setState(() {
                                  projectController.selectTeamForProject.remove(projectController.teams[i].user);

                                });

                              }
                              else
                              {
                                setState(() {
                                  projectController.selectTeamForProject.add(projectController.teams[i].user);

                                });


                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff624F82),
                              ),
                              width: MediaQuery.of(context).size.width! - 10,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${projectController.teams[i].email}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text(
                                            "${projectController.teams[i].designation}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if(projectController.selectTeamForProject.contains(projectController.teams[i].user))
                                            {
                                              setState(() {
                                                projectController.selectTeamForProject.remove(projectController.teams[i].user);

                                              });

                                            }
                                            else
                                            {
                                              setState(() {
                                                projectController.selectTeamForWholeProject.add(projectController.teams[i]);
                                                projectController.selectTeamForProject.add(projectController.teams[i].user);

                                              });

                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            width: 30,
                                            height: 30,
                                            child:  projectController.selectTeamForProject.contains(projectController.teams[i].user)
                                                ?Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.black,
                                                  size: 20,
                                                )):Container(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                ],
              ),
            );

        });
  }

}
