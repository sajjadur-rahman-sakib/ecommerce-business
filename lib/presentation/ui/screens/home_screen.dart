import 'package:ecommerce/presentation/ui/utils/assets_path.dart';
import 'package:ecommerce/presentation/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerce/presentation/ui/widgets/home_banner_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SearchTextField(
              textEditingController: TextEditingController(),
            ),
            const SizedBox(height: 16),
            const HomeBannerSlider(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      centerTitle: false,
      actions: [
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}
