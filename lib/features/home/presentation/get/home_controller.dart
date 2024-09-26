import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/api/data/repositories/api_repo.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/utils/utils.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/utils/custom_logs.dart';
import '../../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final ApiRepo apiRepo;
  HomeController({required this.apiRepo});

  String tagWord = "";
  RxBool isLoading = false.obs;


  getSearchWord(BuildContext context, String inputText) async{
    if (inputText.isNotEmpty) {
      isLoading(true);


      // await apiRepo.getSearchTagsApi(inputText.removeAllWhitespace).then((value) async {
      //   CustomLogger.log(value.best.toString(), object: this);
      //
      // }).onError<CustomError>((error, stackTrace) async {
      //   CustomLogger.log(error.message, object: this);
      // });
      isLoading(false);
      Get.toNamed(AppPages.ON_HOME_SEARCH_TAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: inputText,
        AppPages.ARG_TAG_LIST: SearchApiResponse(best: [], top: [], recommended: [], exact: [], popular: [], related: [])});

    } else {
      showSnackBar(context, AppStrings.searchTag);
    }
  }
}
