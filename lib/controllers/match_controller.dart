import 'package:get/get.dart';
import '../models/match_model.dart';
import '../services/match_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/foundation.dart';


class MatchController extends GetxController {
  var matches = <MatchModel>[].obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  int _loadedItems = 0;
  final int _batchSize = 20;
  final int _maxItems = 5000000;
  var thumbnailCache = <String, Uint8List>{}.obs;
  DefaultCacheManager cacheManager = DefaultCacheManager();

  @override
  void onInit() {
    super.onInit();
    loadMoreData();
  }

  Future<void> loadMoreData() async {
    if (_loadedItems >= _maxItems) return;
    List<MatchModel> newMatches = await MatchService.fetchMatches(_loadedItems, _batchSize);
    matches.addAll(newMatches);
    _loadedItems += _batchSize;
    refreshController.loadComplete();
  }

  void onRefresh() async {
    matches.clear();
    thumbnailCache.clear();
    _loadedItems = 0;
    await loadMoreData();
    refreshController.refreshCompleted();
  }
  Future<Uint8List?> getCachedThumbnail(String url) async {
      if (thumbnailCache.containsKey(url)) {
        return thumbnailCache[url]; // Return cached thumbnail
      }
      Uint8List? thumbnail = await getVideoThumbnail(url);
      if (thumbnail != null) {
        thumbnailCache[url] = thumbnail;  // Store in memory
      }
      return thumbnail;
  }
  Future<Uint8List?> getVideoThumbnail(String url) async {
      Uint8List? thumbnail = await VideoThumbnail.thumbnailData(
        video: url,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 1280,
        maxHeight: 720,
        quality: 75,
      );
      return thumbnail;
    }
  
}
