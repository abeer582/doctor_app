import 'package:go_router/go_router.dart';
import '../../features/doctors/data/models/doctor_model.dart';
import '../../features/doctors/presentation/screens/doctor_details_screen.dart';
import '../../features/doctors/presentation/screens/find_doctors_screen.dart';
import '../../features/doctors/presentation/screens/screens/favourite_doctors_screen.dart';
import '../../features/doctors/presentation/screens/screens/select_time.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/otp_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/main/presentation/screens/home_screen.dart';
import '../../features/role/presentation/screens/choose_role_screen.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: '/choose-role', builder: (_, __) => const ChooseRoleScreen()),
      GoRoute(path: '/signup', builder: (_, __) => const SignupScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/forgot', builder: (_, __) => const ForgotPasswordScreen()),
      GoRoute(path: '/otp', builder: (_, __) => const OtpScreen()),
      GoRoute(path: '/reset', builder: (_, __) => const ResetPasswordScreen()),
      GoRoute(path: '/home', builder: (_, __) =>  HomeScreen()),
GoRoute(
path: '/find-doctors',
builder: (_, __) => const FindDoctorsScreen(),
),
GoRoute(
path: '/favourites',
builder: (_, __) => const FavouriteDoctorsScreen(),
),
GoRoute(
path: '/doctor-details',
builder: (context, state) {
final doctor = state.extra as Doctor;
return DoctorDetailsScreen(doctor: doctor);
},
),
GoRoute(
path: '/select-time',
builder: (context, state) {
final doctor = state.extra as Doctor;
return SelectTimeScreen(doctor: doctor);},
)],
  );
}