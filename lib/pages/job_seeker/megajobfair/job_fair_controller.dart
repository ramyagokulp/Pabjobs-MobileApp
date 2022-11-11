import 'package:get/get.dart';
import 'package:pab_jobs/entities/api_service.dart';
import 'package:pab_jobs/entities/job_fair_model.dart';
import 'package:pab_jobs/entities/user_details_model.dart';

class JobFairController extends GetxController {
  var jobFairDetails = <JobFairModel>[].obs;
  Rx<JobFairModel> data = JobFairModel().obs;

  Future<bool> isAppliedMegaJobFair() async {
    var z = await APIService.isAppliedMegaJobFair();
    data(z);
    return true;
  }
}
