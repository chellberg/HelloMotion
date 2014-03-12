class NotificationController < UIViewController
  def viewDidLoad
     super

     @table = UITableView.alloc.initWithFrame(self.view.bounds)
     self.view.addSubview @table

     @table.dataSource = self
     @table.delegate = self
     @data = ['IASTA Zach submitted a profile on IASTA', 'ZacCo submitted a profile on IASTA', 'Your RFx Evaluation on IASTA has been received']
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    # return UITableViewCell for the row
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = @data[indexPath.row]
    cell

  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def push
    new_controller = ContactsController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(new_controller, animated: true)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    self.push
    # alert = UIAlertView.alloc.init
    # alert.message = "#{@data[indexPath.row]} tapped!"
    # alert.show
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle('Notifications (3)', image:UIImage.imageNamed('notifications.png'), tag: 1)
    self
  end
end

