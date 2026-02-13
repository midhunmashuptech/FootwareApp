import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/cart/view/checkout_screen.dart';
import 'package:footware_app/features/cart/view/select_address.dart';
import 'package:footware_app/features/catergory_based_products/view/category_based_apparel.dart';
import 'package:footware_app/features/common/routes.dart';
import 'package:footware_app/features/home/view/most_popular_screen.dart';
import 'package:footware_app/features/home/view/special_offers.dart';
import 'package:footware_app/features/orders/model/order_model.dart';
import 'package:footware_app/features/orders/view/orders_page.dart';
import 'package:footware_app/features/orders/view/track_order.dart';
import 'package:footware_app/features/products_details/view/product_details_screen.dart';
import 'package:footware_app/features/profile/view/notifications.dart';
import 'package:footware_app/features/profile/view/privacy_and_policy.dart';
import 'package:footware_app/features/profile_options/bloc/edit_profile_bloc.dart';
import 'package:footware_app/features/profile_options/bloc/edit_profile_event.dart';
import 'package:footware_app/features/profile_options/view/add_address.dart';
import 'package:footware_app/features/profile_options/view/edit_address.dart';
import 'package:footware_app/features/profile_options/view/edit_profile_screen.dart';
import 'package:footware_app/features/home/view/bottom_navigation.dart';
import 'package:footware_app/features/home/view/home_page.dart';
import 'package:footware_app/features/home/view/wishlist_screen.dart';
import 'package:footware_app/features/profile_options/view/saved_address.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.bottomNavigation:
        return MaterialPageRoute(builder: (_) => BottomNavigation());

      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
          create: (_) => EditProfileBloc()..add(LoadProfile()),
            child: const EditProfilePage(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case Routes.wishlist:
        return MaterialPageRoute(builder: (_) => WishlistScreen());

      case Routes.savedAddress:
        return MaterialPageRoute(builder: (_) => SavedAddressPage());

      case Routes.addNewAddress:
        return MaterialPageRoute(builder: (_) => AddNewAddressPage());

      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => Notifications());

      case Routes.categoryBasedApparels:
        final String category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CategoryBasedApparel(category: category),
        );

      case Routes.orders:
        return MaterialPageRoute(builder: (_) => OrdersPage());

      case Routes.mostPopular:
        return MaterialPageRoute(builder: (_) => MostPopularScreen());

      case Routes.editAddress:
        return MaterialPageRoute(builder: (_) => EditAddressPage());

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => ProductDetailsPage());
      case Routes.privacyAndPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyAndPolicy());

      case Routes.checkout:
        return MaterialPageRoute(builder: (_) => CheckoutPage());

      case Routes.addressSelectionPage:
        return MaterialPageRoute(builder: (_) => AddressSelectionPage());

      case Routes.trackOrder:
        final order = settings.arguments as OrderModel;
        return MaterialPageRoute(builder: (_) => TrackOrderPage(order: order));

      case Routes.specialOffers:
        return MaterialPageRoute(builder: (_) => SpecialOffers());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text("Route not found!")),
        );
    }
  }
}
