// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:my_resume_app/features/landing/pages/gallery_image_detail_page.dart'
    as _i1;
import 'package:my_resume_app/features/landing/pages/home_page.dart' as _i2;
import 'package:my_resume_app/features/splash/views/splash_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    GalleryImageDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryImageDetailRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.GalleryImageDetailPage(
          key: args.key,
          args: args.args,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.GalleryImageDetailPage]
class GalleryImageDetailRoute
    extends _i4.PageRouteInfo<GalleryImageDetailRouteArgs> {
  GalleryImageDetailRoute({
    _i5.Key? key,
    required _i1.GalleryArgsPath args,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          GalleryImageDetailRoute.name,
          args: GalleryImageDetailRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'GalleryImageDetailRoute';

  static const _i4.PageInfo<GalleryImageDetailRouteArgs> page =
      _i4.PageInfo<GalleryImageDetailRouteArgs>(name);
}

class GalleryImageDetailRouteArgs {
  const GalleryImageDetailRouteArgs({
    this.key,
    required this.args,
  });

  final _i5.Key? key;

  final _i1.GalleryArgsPath args;

  @override
  String toString() {
    return 'GalleryImageDetailRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
