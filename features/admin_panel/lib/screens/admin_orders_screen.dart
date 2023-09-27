// import 'package:admin_panel/admin_panel.dart';
// import 'package:core/core.dart';
// import 'package:core_ui/core_ui.dart';
// import 'package:flutter/material.dart';
//
// class AdminOrdersScreen extends StatelessWidget {
//   const AdminOrdersScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'adminPage.orders'.tr(),
//       ),
//       body: BlocBuilder<AdminPanelBloc, AdminPanelState>(
//         builder: (_, AdminPanelState state) {
//           if (state.ordersList.isNotEmpty) {
//             return Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: AppDimens.padding_20,
//                 vertical: AppDimens.padding_10
//               ),
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: state.ordersList.length,
//                       itemBuilder: (_, int index) {
//                         return
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
