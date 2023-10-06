import 'package:nasa_comp_app/features/report/models/report_model.dart';

class VideoModel{
  String? image;
  String? title;
  String? video;
  List<ReportModel>? reports;
  VideoModel(this.image,this.title,this.video,this.reports);
}