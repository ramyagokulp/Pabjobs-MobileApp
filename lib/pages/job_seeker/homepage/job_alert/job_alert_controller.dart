import 'package:get/get.dart';
import 'package:pab_jobs/entities/api_service.dart';
import 'package:pab_jobs/entities/job_details_model.dart';
import 'package:pab_jobs/entities/recomended_job_details_model.dart';
import 'package:pab_jobs/entities/user_details_model.dart';

class JobAlertController extends GetxController {
  var isLoading = true.obs;

  // var recomendedjobdetails = <RecomendedJobDetails>[].obs;
  Rx<RecomendedJobDetails> data = RecomendedJobDetails(data: []).obs;

  void fetchrecomendedjobDetails() async {
    isLoading(true);
    var z = await APIService.fetchrecomendedjobDetails();
    data(z);
    isLoading(false);
  }
}
