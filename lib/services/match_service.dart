import 'dart:async';
import '../models/match_model.dart';

class MatchService {
  static Future<List<MatchModel>> fetchMatches(int start, int batchSize) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate API delay
      return List.generate(
        batchSize,
        (index) => MatchModel(
          title: 'Marble Magic P8',
          headerTitle: 'HÔM NAY  THÁNG 12',
          time: '01:00 13/09',
          status: (start + index) % 3 == 0 ? 'LIVE' : ((start + index) % 3 == 1 ? 'Đặt lịch' : 'Hủy lịch'),
          videoUrl: 'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4',
          iconsUrl: '',
          remainingTime: '03:59',
        ),
      );
    } catch (e) {
      throw Exception('Failed to fetch matches'); 
    }
  }
}
