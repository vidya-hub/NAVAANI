// import 'package:navaninew/HomeScreen.dart';
// // import 'package:navaninew/Profilepage.dart';
// // import 'package:navaninew/account_page.dart';
// import 'package:navaninew/order_page.dart';
// import 'package:bloc/bloc.dart';

// enum NavigationEvents {
//   HomePageClickEvent,
//   // MyAccountPageClickEvent,
//   MyOrdersPageClickEvent,
// }

// abstract class NavigationState {}

// class NavigationBloc extends Bloc<NavigationEvents, NavigationState> {
//   NavigationBloc(NavigationState initialState) : super(initialState);

//   @override
//   NavigationState get initialState => HomeScreen();

//   @override
//   Stream<NavigationState> mapEventToState(NavigationEvents event) async* {
//     switch (event) {
//       case NavigationEvents.HomePageClickEvent:
//         yield HomeScreen();
//         break;
//       // case NavigationEvents.MyAccountPageClickEvent:
//       //   yield ProfileScreen();
//       //   break;
//       case NavigationEvents.MyOrdersPageClickEvent:
//         yield OrderPage();
//         break;
//     }
//   }
// }
