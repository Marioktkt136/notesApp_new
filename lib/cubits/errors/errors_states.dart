
abstract class ErrorsLogsState {}

class ErrorLogsInitial extends ErrorsLogsState{}
class ErrorLogsLoading extends ErrorsLogsState{}
class ErrorLogsSuccess extends ErrorsLogsState{}
class ErrorLogsFailure extends ErrorsLogsState{
  String? error;
  ErrorLogsFailure({this.error});
}
