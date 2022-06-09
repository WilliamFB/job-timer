import './projects_service.dart';
import '../../entities/project.dart';
import '../../entities/project_status.dart';
import '../../repositories/projects/project_repository.dart';
import '../../view_models/project_model.dart';

class ProjectsServiceImpl implements ProjectsService {
  final ProjectRepository _projectRepository;

  ProjectsServiceImpl({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStatus(status);
    return projects.map(ProjectModel.fromEntity).toList();
  }
}
