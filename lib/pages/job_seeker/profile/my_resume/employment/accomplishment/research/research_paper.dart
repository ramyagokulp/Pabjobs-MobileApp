import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pab_jobs/entities/api_service.dart';
import 'package:pab_jobs/pages/job_seeker/profile/my_resume/employment/accomplishment/research/add_research.dart';
import 'package:pab_jobs/pages/job_seeker/profile/my_resume/employment/accomplishment/research/research_controller.dart';
import 'package:pab_jobs/theme/color_theme.dart';
import 'package:pab_jobs/theme/text_theme.dart';

class ResearchPaper extends StatefulWidget {
  ResearchPaper({Key? key}) : super(key: key);
  @override
  State<ResearchPaper> createState() => _AccomplishmentPaperState();
}

class _AccomplishmentPaperState extends State<ResearchPaper> {
  ResearchController controller = Get.put(ResearchController());
  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          color: PABColorTheme.backgrndColor,
          height: Get.height,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ),
          ),
        );
      } else {
        return Scaffold(
            body: Container(
                color: Color(0xffF5F5F5),
                height: Get.height,
                width: Get.width,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          const SizedBox(height: 62),
                          Container(
                              child: Row(children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(Icons.arrow_back_ios,
                                    color: Colors.black)),
                            const SizedBox(width: 25),
                            Text(
                              "Accomplishment - White Paper / ...",
                              textAlign: TextAlign.left,
                              style: PABTextTheme.headline1.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ])),
                          (controller.data.value.publication!.isNotEmpty)
                              ? Container(
                                  color: Color(0xffF5F5F5),
                                  child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        const SizedBox(height: 24),
                                        ConstrainedBox(
                                            constraints: BoxConstraints(
                                                maxHeight: Get.height * 2,
                                                minHeight: 66 *
                                                    controller.data.value
                                                        .publication!.length
                                                        .toDouble()),
                                            child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: controller.data.value
                                                    .publication!.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                      width: Get.width,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 24),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 16),
                                                      height: 66,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                              height: 16),
                                                          Text(
                                                            controller
                                                                .data
                                                                .value
                                                                .publication![
                                                                    index]
                                                                .publicationTitle!,
                                                            style: PABTextTheme
                                                                .content
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                          const SizedBox(
                                                              height: 2),
                                                          Text(
                                                            controller
                                                                .data
                                                                .value
                                                                .publication![
                                                                    index]
                                                                .publicationUrl!,
                                                            style: PABTextTheme
                                                                .content
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ],
                                                      ));
                                                })),
                                        const SizedBox(height: 14),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 32),
                                          width: Get.width,
                                          child: TextButton(
                                              child: Text(
                                                'Add Research',
                                                style: PABTextTheme.content
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 18,
                                                        horizontal: 31),
                                                primary: Colors.white,
                                                backgroundColor:
                                                    PABColorTheme.primaryColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                              ),
                                              onPressed: () async {
                                                Get.to(() => AddResearchPaper(),
                                                    arguments: controller.data
                                                        .value.publication);
                                              }),
                                        ),
                                      ])))
                              : Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                      const SizedBox(height: 40),
                                      Text(
                                        "Title",
                                        textAlign: TextAlign.left,
                                        style: PABTextTheme.headline1.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 9),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        controller: textController,
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.black),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 17,
                                                    vertical: 17),
                                            labelStyle: PABTextTheme.content
                                                .copyWith(color: Colors.black),
                                            suffixIconColor: Colors.black,
                                            hintText: "Enter Title",
                                            hintStyle: PABTextTheme.content
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        "URL",
                                        textAlign: TextAlign.left,
                                        style: PABTextTheme.headline1.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 9),
                                      TextField(
                                        keyboardType: TextInputType.text,
                                        controller: text1Controller,
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.black),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 17,
                                                    vertical: 17),
                                            labelStyle: PABTextTheme.content
                                                .copyWith(color: Colors.black),
                                            suffixIconColor: Colors.black,
                                            hintText: "",
                                            hintStyle: PABTextTheme.content
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "Link to your Research",
                                        style: PABTextTheme.headline1.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "Description",
                                        style: PABTextTheme.headline1.copyWith(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      const SizedBox(height: 8),
                                      TextField(
                                        maxLines: 4,
                                        keyboardType: TextInputType.multiline,
                                        controller: text2Controller,
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.black),
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 17,
                                                    vertical: 17),
                                            labelStyle: PABTextTheme.content
                                                .copyWith(color: Colors.black),
                                            suffixIconColor: Colors.black,
                                            hintText: "Describe Here",
                                            hintStyle: PABTextTheme.content
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                      ),
                                      const SizedBox(height: 28),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 32),
                                        width: Get.width,
                                        child: TextButton(
                                            child: Text(
                                              'Save Changes',
                                              style: PABTextTheme.content
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 18,
                                                      horizontal: 31),
                                              primary: Colors.white,
                                              backgroundColor:
                                                  PABColorTheme.primaryColor,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(31)),
                                              ),
                                            ),
                                            onPressed: () async {
                                              if( textController.text != "" &&
                                                  text1Controller.text != "" &&
                                                  text2Controller.text != "" 
                                                  ){
APIService.researchDetails(
                                                  textController.text,
                                                  text1Controller.text,
                                                  text2Controller.text, []);
                                              controller.fetchUserDetails();
                                              }else{
                                                 Get.snackbar(
                                                 "Incomplete", "Fill all fields to complete",
                                                 backgroundColor: Colors.white);
                                              }
                                              
                                            }),
                                      ),
                                    ]))
                        ])))));
      }
    });
  }
}
