
import '../../../../utils/constants/exports.dart';

class CAppBAr extends StatelessWidget implements PreferredSizeWidget{
  const  CAppBAr({super.key, this.title,
    this.leadingIcon, this.actions, this.leadingOnPressed,
    this.showBackArrow= false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.md),
      child:  AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: ()=> Get.back(),
            icon: Icon(Iconsax.arrow_left,
            color: dark ? CColor.white : CColor.dark,
            ))

            : leadingIcon !=null ?
        IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
