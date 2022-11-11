import 'package:get/get.dart';
import 'package:pab_jobs/entities/api_service.dart';
import 'package:pab_jobs/entities/applied_jobs_model.dart';

class AppliedJobsController extends GetxController {
  var isLoading = true.obs;

  var appliedJobs = <AppliedJobs>[].obs;

  void fetchAppliedJobs() async {
    isLoading(true);
    var z = await APIService.fetchAppliedJobs();
    appliedJobs(z);
    isLoading(false);
  }

  Future<bool> addtofavourites(String id, String action) async {
    bool result = await APIService.addtoFavourites(id, action);
    fetchAppliedJobs();
    return result;
  }
}
