import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';

class VisitorLocalDataSource extends LocalDataSource {
  VisitorLocalDataSource(
    super._sharedPreferences,
    super._logger,
  ) : super();
}
