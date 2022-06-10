import 'package:job_timer/app/entities/project_task.dart';

import '../../entities/project.dart';
import '../../entities/project_status.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatus status);
  Future<Project> addTask(int projectId, ProjectTask task);
  Future<Project> findById(int projectId);
  Future<void> finish(int projectId);
}
