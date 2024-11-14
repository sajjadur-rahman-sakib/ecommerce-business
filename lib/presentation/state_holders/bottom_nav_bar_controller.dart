import 'package:ecommerce/presentation/ui/widgets/widgets.dart';

class BottomNavBarController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
