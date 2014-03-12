class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible # makeKey - this window will be receiving touch events

    webview_controller = WebViewController.alloc.initWithNibName(nil, bundle:nil)

    messages_controller = MessageController.alloc.initWithNibName(nil, bundle: nil)

    contacts_controller = ContactController.alloc.initWithNibName(nil, bundle:nil)
    contacts_nav_controller = UINavigationController.alloc.initWithRootViewController(contacts_controller)

    notification_controller = NotificationController.alloc.initWithNibName(nil, bundle:nil)

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
    tab_controller.tabBar.translucent = true
    tab_controller.tabBar.selectedImageTintColor = UIColor.redColor
    tab_controller.tabBar.tintColor = UIColor.redColor

    tab_controller.viewControllers = [webview_controller, contacts_nav_controller, messages_controller, notification_controller]

    @window.rootViewController = tab_controller

    true
  end

end


