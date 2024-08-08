import 'package:map_mvvm/app/service_locator.dart';
import '../services/admin/admin_service.dart';
import '../services/admin/admin_service_memory_impl.dart';
import '../services/menuAdminService/menuAdmin_service.dart';
import '../services/menuAdminService/menuAdmin_service_memory_implement.dart';
import '../services/notifyService/notifyservices.dart';
import '../services/notifyService/notifyservicesmemory.dart';
import '../services/payment/payment_service.dart';
import '../services/payment/payment_service_mock.dart';
import '../services/stallService/stall_service.dart';
import '../services/stallService/stall_service_memory_implement.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_memory_impl.dart';
import '../views/adminLogin/adminLogin_viewmodel.dart';
import '../views/login/login_viewmodel.dart';
import '../views/menuAdmin/menu_viewmodel.dart';
import '../views/notify/notifyviewmodel.dart';
import '../views/payment/payment_view_model.dart';
import '../views/stalls/stall_viewmodel.dart';

final locator = ServiceLocator.locator;

void initializeServiceLocator() {
  locator.registerLazySingleton<MenuAdminService>(
      () => MenuAdminServiceMemoryImpl());
  locator.registerLazySingleton<StallService>(() => StallServiceMemoryImpl());
  locator.registerLazySingleton<UserService>(() => UserServiceMemoryImpl());
  locator.registerLazySingleton<AdminService>(() => AdminServiceMemoryImpl());
  locator.registerLazySingleton<PaymentService>(() => PaymentServiceMock());
  locator.registerLazySingleton<NotifyService>(() => NotifyServiceMemory());

  locator.registerLazySingleton<MenuViewModel>(() => MenuViewModel());
  locator.registerLazySingleton<StallViewModel>(() => StallViewModel());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator
      .registerLazySingleton<adminLoginViewModel>(() => adminLoginViewModel());
  locator.registerLazySingleton<PaymentViewModel>(() => PaymentViewModel());
  locator.registerFactory<NotifyViewModel>(() => NotifyViewModel());
}
