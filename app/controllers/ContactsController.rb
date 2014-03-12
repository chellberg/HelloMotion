class ContactsController < UIViewController
  def viewDidLoad
     super

     @table = UITableView.alloc.initWithFrame(self.view.bounds)
     self.view.addSubview @table

     @table.dataSource = self
     @table.delegate = self
     @impact = ['Corin Chellberg', 'Matt Jonker', 'Moses Dwaram', 'Josh Kramer', 'Daniel Doezema', 'Tim Neville', 'Zach Thompson', 'Yoshi Tanno']
     @data = @impact + @impact + @impact
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
      self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemContacts, tag: 1)
    self
  end
end

