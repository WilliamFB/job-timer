import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/projects/projects_service.dart';

import '../../../../view_models/project_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  final ProjectsService _projectsService;

  ProjectDetailController({required ProjectsService projectsService})
      : _projectsService = projectsService,
        super(const ProjectDetailState.initial());

  void setProject(ProjectModel projectModel) {
    _sortTasks(projectModel);
    emit(state.copyWith(
        projectModel: projectModel, status: ProjectDetailStatus.complete));
  }

  Future<void> updateProject() async {
    final project = await _projectsService.findById(state.projectModel!.id!);
    _sortTasks(project);
    emit(state.copyWith(
        projectModel: project, status: ProjectDetailStatus.complete));
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWith(status: ProjectDetailStatus.loading));
      final projectId = state.projectModel!.id!;
      await _projectsService.finish(projectId);
      updateProject();
    } catch (e) {
      emit(state.copyWith(status: ProjectDetailStatus.failure));
    }
  }

  void _sortTasks(ProjectModel projectModel) {
    projectModel.tasks.sort((a, b) => b.id!.compareTo(a.id!));
  }
}
