import 'package:get/get.dart';
import 'package:keramik/ui/admin/check_user/admin_check_user_page.dart';
import 'package:keramik/ui/admin/detail/admin_detail_page.dart';
import 'package:keramik/ui/admin/info/admin_info_page.dart';
import 'package:keramik/ui/admin/listKeramik/admin_list_keramik.dart';
import 'package:keramik/ui/admin/search/admin_search_page.dart';
import 'package:keramik/ui/admin/userDetail/admin_user_detial.dart';
import 'package:keramik/ui/auth/login_page.dart';
import 'package:keramik/ui/auth/register_page.dart';
import 'package:keramik/ui/navigator_page.dart';
import 'package:keramik/ui/user/detailRiwayat/user_detail_riwayat.dart';
import 'package:keramik/ui/user/main_menu_page.dart';
import 'package:keramik/ui/web_view.dart';

import 'ui/admin/tambahKeramik/admin_tambah_keramik_page.dart';
import 'ui/detail_keramik.dart';
import 'ui/user/search/user_search_page.dart';

class Routes {
  Routes._();

  static const String navigator = "/navigator";
  static const String login = "/login";
  static const String register = "/register";
  static const String mainMenu = "/mainMenu";
  static const String search = "/search";
  static const String detailRiwayat = "/detailRiwayat";
  static const String adminDetail = "/adminDetail";
  static const String adminSearch = "/adminSearch";
  static const String adminListKeramik = "/adminListKeramik";
  static const String adminInfo = "/adminInfo";
  static const String adminTambahKeramik = "/adminTambahKeramik";
  static const String adminCheckUser = "/adminCheckUser";
  static const String adminDetailAnggota = "/adminDetailAnggota";
  static const String pustawakan = "/pustawakan";
  static const String detailKeramikGeneral = "/detailKeramikGeneral";
  static const String webView = "/webView";

  static final newRoutes = <GetPage>[
    GetPage(name: navigator, page:()=>NavigatorPage()),
    GetPage(name: login, page:()=>LoginPage()),
    GetPage(name: register, page:()=>RegisterPage()),
    GetPage(name: mainMenu, page:()=>MainMenuPage()),
    GetPage(name: search, page:()=>UserSearchPage()),
    GetPage(name: detailRiwayat, page:()=>UserDetailRiwayat()),
    GetPage(name: adminDetail, page:()=>AdminDetailPage()),
    GetPage(name: adminSearch, page:()=>AdminSearchPage()),
    GetPage(name: adminListKeramik, page:()=>AdminListKeramikPage()),
    GetPage(name: adminInfo, page:()=>AdminInfoPage()),
    GetPage(name: adminTambahKeramik, page:()=>AdminTambahKeramikPage()),
    GetPage(name: adminCheckUser, page:()=>AdminCheckUserPage()),
    GetPage(name: adminDetailAnggota, page:()=>AdminUserDetailPage()),
    GetPage(name: detailKeramikGeneral, page:()=>KeramikDetailPage()),
    GetPage(name: webView, page:()=>WebViewPage()),
  ];
}