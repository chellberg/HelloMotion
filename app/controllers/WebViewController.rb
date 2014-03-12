class WebViewController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    NSUserDefaults.standardUserDefaults.registerDefaults({UserAgent: "ipad-demo"})

    @webview = UIWebView.alloc.initWithFrame [[0,0], [self.view.frame.size.width, self.view.frame.size.height]]
    self.view = @webview

    @toolbar = UIToolbar.alloc.initWithFrame [[0, self.view.frame.size.height - 98], [self.view.frame.size.width, 49]]
    @toolbar.tintColor = UIColor.redColor
    @toolbar.translucent = true

    @backItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(101, target: self.view, action:'goBack')
    @forwardItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(102, target: self.view, action:'goForward')
    @reloadItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target: self.view, action:'reload')
    @stopItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemStop, target: self.view, action:'stopLoading')
    @stopItem.enabled = true

    toolbarItems = [
      @backItem,
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace, target:nil, action:nil),
      @forwardItem,
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace, target:nil, action:nil),
      @reloadItem,
      UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemFlexibleSpace, target:nil, action:nil),
      @stopItem
    ]
    @toolbar.setItems(toolbarItems, animated:false)
    Motion::Layout.new do |layout|
      layout.view view
      layout.subviews toolbar: @toolbar
      layout.vertical "|->=20-[toolbar]-56-|"
      layout.horizontal "|-[toolbar]-|"
    end

    url = NSURL.URLWithString("http://qa.lvh.me:5100")
    request = NSURLRequest.requestWithURL(url)
    self.view.loadRequest request

  end

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Web', image:UIImage.imageNamed('iasta.png'), tag: 1)
    self
  end
end
