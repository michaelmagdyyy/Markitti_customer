import 'package:e_commerce/core/utils/extensions.dart';
import 'package:e_commerce/views/Favorite%20List/favorite_screen.dart';
import 'package:e_commerce/views/auth/reset_password/view.dart';
import 'package:e_commerce/views/auth/verify/view.dart';
import 'package:e_commerce/views/brand_details/view.dart';
import 'package:e_commerce/views/brands/view.dart';
import 'package:e_commerce/views/categories/view.dart';
import 'package:e_commerce/views/change_lang_screen/change_lang_screen.dart';
import 'package:e_commerce/views/edit_password/view.dart';
import 'package:e_commerce/views/edit_profile/view.dart';
import 'package:e_commerce/views/generate_otp/view.dart';
import 'package:e_commerce/views/nav_bar/view.dart';
import 'package:e_commerce/views/static_pages/view.dart';
import 'package:e_commerce/views/sub_categories/view.dart';
import 'package:e_commerce/views/sub_sub/view.dart';
import 'package:e_commerce/views/usage_history/usage_history_screen.dart';
import 'package:flutter/material.dart';

import '../../views/FollowUpInvitationsScreen/FollowUpInvitationsScreen.dart';
import '../../views/InviteFriendsScreen/InviteFriendsScreen.dart';
import '../../views/auth/forget_password/view.dart';
import '../../views/auth/login/view.dart';
import '../../views/auth/register/view.dart';
import '../../views/auth/splash/splash.dart';
import '../../views/change_theme_screen.dart';
import '../../views/list_of_sub_categories/view.dart';
import '../../views/rating/rating_view.dart';
import 'routes.dart';

class AppRoutes {
  static AppRoutes get init => AppRoutes._internal();
  String initial = NamedRoutes.splash;

  AppRoutes._internal();

  Map<String, Widget Function(BuildContext)> appRoutes = {
    NamedRoutes.splash: (c) => const SplashView(),
    NamedRoutes.login: (c) => const LoginView(),
    NamedRoutes.register: (c) => const RegisterView(),
    NamedRoutes.verify: (c) => VerifyView(fromLogin: c.arg['fromLogin']),
    NamedRoutes.forgetPassword: (c) => const ForgetPasswordView(),
    NamedRoutes.resetPassword: (c) => const ResetPasswordView(),
    NamedRoutes.navBar: (c) => const NavBar(),
    NamedRoutes.categories: (c) => CategoriesView(list: c.arg['list']),
    NamedRoutes.subCategories: (c) => SubCategoriesView(categoryModel: c.arg['categoryModel']),
    NamedRoutes.subSub: (c) =>  SubSubView(id: c.arg['id'],title: c.arg['title']),
    NamedRoutes.brands: (c) => const BrandsView(),
    NamedRoutes.brandDetails: (c) =>  BrandDetailsView(model: c.arg['brandModel'],id:  c.arg['id'],),
    NamedRoutes.generateOTP: (c) =>  GenerateOTPView(model: c.arg['brandModel']),
    NamedRoutes.editProfile: (c) => const EditProfileView(),
    NamedRoutes.editPassword: (c) => const EditPasswordView(),
    NamedRoutes.staticPages: (c) => StaticPagesView(title: c.arg['title'],isTerms:c.arg['isTerms'] ),
    NamedRoutes.listOfSubCategoriesView: (c) => ListOfSubCategoriesView(list: c.arg['list']),
    NamedRoutes.rating: (c) => RatingViewScreen(transaction_id: c.arg['transaction_id'],category_id: c.arg['category_id']),
    NamedRoutes.changeLang: (c) => ChangeLangScreen(),
    NamedRoutes.changeTheme: (c) => ChangeThemeScreen(),
    NamedRoutes.inviteFriends: (c) => InviteFriendsScreen(),
    NamedRoutes.followUpInvitations: (c) => FollowUpInvitationsScreen(),
    NamedRoutes.favoritePage: (c) => FavoriteScreen(),
    NamedRoutes.usageHistoryPage: (c) => UsageHistoryScreen(),

  };
}
