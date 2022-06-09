import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/converters/project_status_converter.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;

  late String name;

  @ProjectStatusConverter()
  late ProjectStatus status;

  late int estimate;
  final tasks = IsarLinks<ProjectTask>();
}
