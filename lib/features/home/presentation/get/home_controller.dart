import 'package:flutter/cupertino.dart';
import 'package:flutter_launcher_icons/config/config.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/api/data/repositories/api_repo.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/styles/colors.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/utils/utils.dart';
import 'package:hashtag/event_bus.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/utils/custom_logs.dart';
import '../../../../routes/app_pages.dart';

const String ediTagScreenKey = "edit_tag_screen";

class HomeController extends GetxController {
  final ApiRepo apiRepo;

  HomeController({required this.apiRepo}) {
    refreshHashTagList();
  }

  String tagWord = "";
  RxBool isLoading = false.obs;

  List<String> hashTagList = <String>[];

  final TextEditingController tagEditController = TextEditingController();

  getSearchWord(BuildContext context, String inputText) async {
    if (inputText.isNotEmpty) {
      isLoading(true);

      await apiRepo.getSearchTagsApi(inputText.removeAllWhitespace).then((value) async {
        Get.toNamed(AppPages.ON_HOME_SEARCH_TAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: inputText, AppPages.ARG_TAG_LIST: value, AppPages.ARG_APP_BAR_COLORS: AppColors.getRandomGradientColor()});
      }).onError<CustomError>((error, stackTrace) async {
        if (context.mounted) {
          showSnackBar(context, "Sorry no tag found");
        }
      });
      isLoading(false);
    } else {
      showSnackBar(context, AppStrings.searchTag);
    }
  }

  handleEditTagInput(String value) {
    value = value.trimLeft();
    if (value.isNotEmpty) {
      if (value.endsWith(' ')) {
        ConfigService.selectedTags.add('#$value');
        tagEditController.clear();
        refreshHashTagList();
        eventBus.fire(HashButtonUpdate());
      }
    }
  }

  removeHashTagFromList(String tag) {
    ConfigService.selectedTags.remove(tag);
    eventBus.fire(HashButtonUpdate());
    refreshHashTagList();
  }

  refreshHashTagList() {
    hashTagList.clear();
    hashTagList.assignAll(ConfigService.selectedTags);
    update([ediTagScreenKey]);
  }

  showDeleteConfirmationDialog(BuildContext context) {
    if (hashTagList.isNotEmpty) {
      showAlertDialog(context, "Are you sure?", "Do you really want to delete all your selected tags?", () {
        ConfigService.selectedTags.clear();
        hashTagList.clear();
        eventBus.fire(HashButtonUpdate());
        tagEditController.clear();

        update([ediTagScreenKey]);

        Get.back();
      });
    }
  }

  void copyAction(BuildContext context) {
    var tagsString = ConfigService.selectedTagsList.join(', ');
    copyToClipboard(context, tagsString);
  }
}
