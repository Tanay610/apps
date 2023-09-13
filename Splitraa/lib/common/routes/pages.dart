
import 'package:chatty/pages/contacts/index.dart';
import 'package:chatty/pages/frame/welcome/index.dart';
import 'package:chatty/pages/message/index.dart';
import 'package:chatty/pages/message/voicecall/index.dart';
import 'package:chatty/pages/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:chatty/common/middlewares/middlewares.dart';

import 'package:get/get.dart';

import '../../pages/frame/sign_in/index.dart';
import '../../pages/message/chat/index.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
 
  static final List<GetPage> routes = [
    // about boot up the app
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

  
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    /*
    // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    // 最新路由
    GetPage(name: AppRoutes.EmailLogin, page: () => EmailLoginPage(), binding: EmailLoginBinding()),
    GetPage(name: AppRoutes.Register, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.Forgot, page: () => ForgotPage(), binding: ForgotBinding()),
    GetPage(name: AppRoutes.Phone, page: () => PhonePage(), binding: PhoneBinding()),
    GetPage(name: AppRoutes.SendCode, page: () => SendCodePage(), binding: SendCodeBinding()),
    

    //消息 */
    
    // contact page
    GetPage(name: AppRoutes.Contact, 
    page: () => ContactPage(), 
    binding: ContactBinding()),
    

    // message page
    GetPage(name: AppRoutes.Message,
     page: () => const MessagePage(), binding: MessageBinding(),
     middlewares: [
       RouteAuthMiddleware(priority: 1),
     ],),


     //我的
    GetPage(name: AppRoutes.Profile, 
    page: () => const ProfilePage(),
    binding: ProfileBinding()),
    
    /// chat detail
    GetPage(name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),

/*//聊天详情
    GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),*/
    GetPage(name: AppRoutes.VoiceCall, page: () => VoiceCallPage(), binding: VoiceCallBinding()),

    /*
    GetPage(name: AppRoutes.VideoCall, page: () => VideoCallPage(), binding: VideoCallBinding()),*/
    
  ];






}
