// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:pab_jobs/entities/api_service_recruiter.dart';
import 'package:pab_jobs/entities/candidate_details_model.dart';

class SearchRController extends GetxController {
  var isLoading = true.obs;

  Rx<CandidateDetailsModel> data2 = CandidateDetailsModel().obs;

  void FetchSearchJobDetails(
    String q,
  ) async {
    isLoading(true);
    var z = await ApiServiceRecruiter.fetchSearchJobDetails(q);
    data2(z);
    isLoading(false);
  }
}
