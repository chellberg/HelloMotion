class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible # makeKey - this window will be receiving touch events

    @window.rootViewController = TapController.alloc.initWithNibName(nil, bundle: nil)

    true
  end
end


