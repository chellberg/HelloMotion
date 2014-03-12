class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible # makeKey - this window will be receiving touch events

    webview_controller = WebViewController.alloc.initWithNibName(nil, bundle:nil)

    messages_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    messages_nav_controller = UINavigationController.alloc.initWithRootViewController(messages_controller)
    messages_nav_controller.title = 'Messages'

    contacts_controller = ContactsController.alloc.initWithNibName(nil, bundle:nil)
    contacts_nav_controller = UINavigationController.alloc.initWithRootViewController(contacts_controller)
    contacts_nav_controller.title = 'Contacts'


    notification_controller = NotificationController.alloc.initWithNibName(nil, bundle:nil)
    notification_nav_controller = UINavigationController.alloc.initWithRootViewController(notification_controller)

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle:nil)
    # tab_controller.tabBar.setBarStyle(UIBarStyleBlack)
    tab_controller.tabBar.translucent = true
    tab_controller.tabBar.selectedImageTintColor = UIColor.redColor
    tab_controller.tabBar.tintColor = UIColor.redColor

    tab_controller.viewControllers = [webview_controller, contacts_nav_controller, messages_nav_controller, notification_nav_controller]

    @window.rootViewController = tab_controller

    true
  end

end


