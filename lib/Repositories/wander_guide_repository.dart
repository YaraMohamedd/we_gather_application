import 'package:we_gather_application/Models/most_sharing_model.dart';
import 'package:we_gather_application/Services/api_services.dart';

class Repository {
  final chiefsApiProvider = Wanderguide();
  Future<MostSharing> getTopSharing() =>chiefsApiProvider.getSharing();
  // Future<Course> getTopChiefCourses() =>chiefsApiProvider.getTopChiefCourse();
// Future<CourselessonsModel> getLessons() =>chiefsApiProvider.getTopLessons();
}
