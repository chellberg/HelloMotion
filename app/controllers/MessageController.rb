class MessageController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "You have no messages"
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label

    @label2 = UILabel.alloc.initWithFrame(CGRectZero)
    @label2.text = "or inboxes"
    @label2.sizeToFit
    @label2.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 50)
    self.view.addSubview @label2

    @label3 = UILabel.alloc.initWithFrame(CGRectZero)
    @label3.text = ":("
    @label3.sizeToFit
    @label3.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 130)
    self.view.addSubview @label3

    right_button = UIBarButtonItem.alloc.initWithTitle("Push", style: UIBarButtonItemStyleBordered, target:self, action:'push' )
    self.navigationItem.rightBarButtonItem = right_button
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Messages', image:UIImage.imageNamed('messages.png'), tag: 1)
    self
  end

end
