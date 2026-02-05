import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footware_app/features/common/app_colors.dart';
import '../cubit/order_cubit.dart';
import '../cubit/order_state.dart';
import '../widgets/order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.shopping_bag_outlined,size: 28,),
                SizedBox(width: 8),
                Text("My Orders",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: AppColors.primaryRed,
              labelColor: AppColors.primaryRed,
              unselectedLabelColor: AppColors.primaryBlack,
              dividerColor: AppColors.secondaryGrey,
              tabs: [
                Tab(text: "Active"),
                Tab(text: "Completed"),
              ],
            ),
          ),
          body: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              return TabBarView(
                children: [
                  ListView(
                    children: state.activeOrders
                        .map((e) => OrderCard(order: e))
                        .toList(),
                  ),
                  ListView(
                    children: state.completedOrders
                        .map((e) => OrderCard(order: e))
                        .toList(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
