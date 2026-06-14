import 'package:equatable/equatable.dart';

import '../models/role_ui_model.dart';

class RoleSelectionState extends Equatable {
  const RoleSelectionState({this.selectedRole});

  final RoleUiModel? selectedRole;

  bool get canContinue => selectedRole != null;

  RoleSelectionState copyWith({RoleUiModel? selectedRole}) {
    return RoleSelectionState(selectedRole: selectedRole ?? this.selectedRole);
  }

  @override
  List<Object?> get props => [selectedRole];
}
