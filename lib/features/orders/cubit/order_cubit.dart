import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import '../model/order_model.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit()
    : super(
        OrderState(
          activeOrders: [
            OrderModel(
              id: "ORID4321567890",
              title: "RX - Swiss Training Shoes",
              subtitle: "Arriving today",
              status: OrderStatus.active,
              size: "M",
              price: 1899,
              imagePath:
              "https://static.vecteezy.com/system/resources/thumbnails/046/323/369/small_2x/pair-of-stylish-green-and-gray-running-shoes-for-athletics-png.png",
              isAsset: true,
              colors: [
                AppColors.primaryBlack,
                AppColors.offerRed,
                AppColors.darkGreen,
              ],
              deliveryText: "In Delivery",
              trackingStage: TrackingStage.outForDelivery,
              onPressed: () {},
            ),
            OrderModel(
               id: "ORID987654321234",
              title: "RX - Swiss Training Shoes",
              subtitle: "Arriving today",
              status: OrderStatus.active,
              size: "L",
              price: 1899,
              imagePath:
          "https://static.vecteezy.com/system/resources/thumbnails/046/323/598/small/pair-of-colorful-sports-shoes-for-active-lifestyle-png.png",
              isAsset: true,
              colors: [AppColors.offerBlue, AppColors.offerBrown],
              deliveryText: "In Delivery",
              onPressed: () {}, 
              trackingStage: TrackingStage.shipped,
            ),
          ],
          completedOrders: [
            OrderModel(
              id: "ORID098754321334",
              title: "RX - Swiss Training Shoes",
              subtitle: "Delivered on 12 January 2026",
              status: OrderStatus.completed,
              size: "XL",
              price: 2490,
              imagePath:
          "https://static.vecteezy.com/system/resources/previews/046/407/753/non_2x/unique-and-aesthetically-colorful-details-of-the-upper-mesh-yellow-premium-running-sports-shoes-sneakers-isolated-on-a-transparent-background-png.png",
              isAsset: true,
              colors: [
                AppColors.offerBlue,
                AppColors.offerRed,
                AppColors.darkGreen,
              ],
              deliveryText: "Delivered on 12 January 2026",
              trackingStage: TrackingStage.delivered,
              onPressed: () {
              },
            ),
          ],
        ),
      );
}
