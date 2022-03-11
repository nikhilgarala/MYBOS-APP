import 'package:mybos_app/screen/dashboard/ui/dashboard.dart';

class DashBoardPageViewModel {
  DashboardPageState? state;

  int menuIndex = 0;

  DashBoardPageViewModel(DashboardPageState? state) {
    menuIndex = state!.widget.index;
  }
}
