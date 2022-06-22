import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

import '../../../entities/project_status.dart';
import '../../../services/projects/projects_service.dart';
import '../../../view_models/project_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final AuthService _authService;
  final ProjectsService _projectService;

  HomeController(
      {required AuthService authService,
      required ProjectsService projectService})
      : _authService = authService,
        _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final projects = await _projectService.findByStatus(state.projectFilter);

      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } on Exception catch (e, s) {
      log('Erro ao buscar os projetos', error: e, stackTrace: s);

      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filter(ProjectStatus status) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        projects: [],
      ),
    );
    final projects = await _projectService.findByStatus(status);
    emit(
      state.copyWith(
        projectFilter: status,
        status: HomeStatus.complete,
        projects: projects,
      ),
    );
  }

  void updateList() {
    if (state.status == HomeStatus.complete) {
      filter(state.projectFilter);
    } else {
      filter(ProjectStatus.emAndamento);
    }
  }

  void logout() => _authService.signOut();
}
