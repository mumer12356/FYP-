
/// Dart Imports
library;
export 'package:flutter/material.dart';
export 'package:iconsax/iconsax.dart';
export 'dart:async';
export 'package:flutter/foundation.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:camera/camera.dart';
export 'package:path_provider/path_provider.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:flutter/services.dart';
export 'package:home_services_app/bindings/general_bindings.dart';
export 'package:home_services_app/app.dart';

///# Firebase Imports
export 'package:firebase_core/firebase_core.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:home_services_app/firebase_options.dart';


/// Animations
export 'package:flutter/animation.dart';
export 'package:lottie/lottie.dart';
export '../../common/widgets/shimmer/shimmer.dart';
export '../../common/widgets/shimmer/category_shimmer.dart';
export 'package:shimmer/shimmer.dart';
export 'package:image_picker/image_picker.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
export '../../common/widgets/animation/login_animation/login_animation.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:url_launcher/url_launcher_string.dart';
export '../../common/widgets/loaders/animation_loader.dart';



/// Flutter MAP
export 'package:flutter_map_cached_tile_provider/flutter_map_cached_tile_provider.dart';


/// Get
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:google_sign_in/google_sign_in.dart';


/// Network Manager
export '../network_manager/network_manager.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:connectivity_plus/connectivity_plus.dart';


/// Common
// Constructor
export '../../common/constructor/ListofDetails.dart';
export '../../common/constructor/home.dart';


/// Common
//Styles
export '../../common/styles/spacing_styles.dart';


/// Common
// Widgets
export '../../common/widgets/loaders/c_loader.dart';
export '../../common/widgets/success_screen/success_screen.dart';
export '../../common/widgets/login_signup/social_buttons.dart';
export '../../common/widgets/login_signup/form_divider.dart';
export '../../common/widgets/appbar/appbar.dart';
export '../../common/widgets/animation/categories_animation/fade_animation.dart';
export '../../common/widgets/animation/categories_animation/all_category_animation.dart';


/// Utils
// Constants
export '../constants/sizes.dart';
export '../constants/text_string.dart';
export '../constants/colors.dart';
export '../constants/image_string.dart';


/// Utils
export '../device/device_utility.dart';
export '../exception/firebase_auth_exception.dart';
export '../exception/firebase_exception.dart';
export '../exception/format_exception.dart';
export '../formatters/formatters.dart';
export '../helpers/helper_function.dart';
export '../popups/full_screen_loader.dart';
export '../validators/validations.dart';


/// Utils
// Custom Theme
export '../theme/custom_theme/appbar_theme.dart';
export '../theme/custom_theme/bottom_sheet_theme.dart';
export '../theme/custom_theme/checkbox_theme.dart';
export '../theme/custom_theme/chip_theme.dart';
export '../theme/custom_theme/elevated_button_theme.dart';
export '../theme/custom_theme/icon_button_theme.dart';
export '../theme/custom_theme/outline_button_theme.dart';
export '../theme/custom_theme/text_field_theme.dart';
export '../theme/custom_theme/text_theme.dart';
export '../theme/theme.dart';


/// Controllers
export '../../common/widgets/animation/login_animation/login animation controller.dart';
export '../../features/authentication/controllers/login/login_controller.dart';
export '../../features/personalization/controllers/user_controller.dart';
export '../../features/authentication/controllers/signup/verify_email_controller.dart';
export '../../features/authentication/controllers/signup/signup_controller.dart';
export '../../features/authentication/controllers/onboarding/onboarding_controller.dart';
export '../../features/authentication/controllers/forget_password/forget_password_controller.dart';


/// Models
export '../../features/authentication/models/user/user_model.dart';


/// Repositories
export '../../data/repositories/authentication/authentication_repository.dart';
export '../../data/repositories/authentication/user/user_repository.dart';


/// Features  Screens
// Authentications
export '../../features/authentication/screens/login/login.dart';
export '../../features/authentication/screens/login/widgets/login_header.dart';
export '../../features/authentication/screens/login/widgets/login_form.dart';
export '../../features/authentication/screens/signup/signup.dart';
export '../../features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
export '../../features/authentication/screens/signup/widgets/verify_email.dart';
export '../../features/authentication/screens/signup/widgets/signup_header.dart';
export '../../features/authentication/screens/signup/widgets/signup_form.dart';
export '../../features/authentication/screens/password_configuration/forget_password.dart';
export '../../features/authentication/screens/password_configuration/reset_password.dart';
export '../../features/authentication/screens/onboarding/onboarding_skip.dart';
export '../../features/authentication/screens/onboarding/onboarding_page.dart';
export '../../features/authentication/screens/onboarding/onboarding_next_navigation.dart';
export '../../features/authentication/screens/onboarding/onboarding_dot_navigation.dart';
export '../../features/authentication/screens/onboarding/onboarding.dart';


// Personalization
export '../../features/personalization/screens/change_profile_info/re_authenticate-user_login_form.dart';
export '../../features/personalization/screens/Home_Drawer/Profile/Profile_complete.dart';
export '../../features/personalization/screens/Chat_page/Question_Answer.dart';
export '../../features/personalization/screens/Chat_page/ChatOptions.dart';
export '../../features/personalization/screens/Chat_page/Direct_Message.dart';
export '../../features/personalization/screens/Home_Drawer/Address Detail/Update Address Detail.dart';
export '../../features/personalization/screens/Home_Drawer/Address Detail/Show Address Detail.dart';
export '../../features/personalization/screens/Home_Drawer/Invite Friend/privacy.dart';
export '../../features/personalization/screens/Home_Drawer/Profile/Profile Detail add.dart';
export '../../features/personalization/screens/add_profile_detail/Data_Detail.dart';
export '../../features/personalization/screens/Home_Drawer/Address Detail/Address Detail.dart';
export '../../features/personalization/screens/Home_Drawer/Invite Friend/Invite_Friends.dart';
export '../../features/personalization/screens/Home_Drawer/Setting.dart';
export '../../features/personalization/screens/Booking_Page/Booking Screen.dart';
export '../../features/personalization/screens/Home_Drawer/Drawer.dart';


// SHOP
export '../../features/shop/navigation_menu.dart';
export '../../features/shop/screens/Home/home.dart';
export '../../features/shop/screens/Payment_Page/SubscriptionOptionsScreen.dart';
export '../../features/shop/screens/DetailPage/Service_Detail/ServiceDetail.dart';
export '../../features/shop/screens/Home/home_widgets/All_Categories.dart';
export '../../features/shop/screens/Home/home_widgets/Category.dart';
export '../../features/shop/screens/Home/home_widgets/Crouse_Slider.dart';
export '../../features/shop/screens/Home/Popular_Category/Popular_Service.dart';
export '../../features/shop/screens/Home/Tab baar/Popular_Service_tab.dart';
export '../../features/shop/screens/SubHomepage/SecondHomeScreen.dart';
export '../../features/shop/screens/SubHomepage/CarouselSlider.dart';
export '../../features/shop/screens/SubHomepage/Padding_Container.dart';
export '../../features/shop/screens/SubHomepage/Star_Rating.dart';
export '../../features/shop/screens/Payment_Page/Payment_screen.dart';
export '../../features/shop/screens/DetailPage/DetailScreen/DetailScreen.dart';


