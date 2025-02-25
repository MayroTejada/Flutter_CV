import 'package:auto_route/auto_route.dart';
import 'package:my_resume_app/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: HomeRoute.page, path: '/Home'),
        AutoRoute(
            page: GalleryImageDetailRoute.page,
            path: '/image-detail',
            fullscreenDialog: true)
      ];
}
