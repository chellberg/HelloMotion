class ContactController < UIViewController
  def viewDidLoad
     super

     @table = UITableView.alloc.initWithFrame(self.view.frame)

    Motion::Layout.new do |layout|
      layout.view self.view
      layout.subviews table: @table
      layout.vertical "|-20-[table]-0-|"
      layout.horizontal "|-0-[table]-0-|"
    end

     @table.dataSource = self
     @table.delegate = self
     @impact = ['Corin Chellberg', 'Matt Jonker', 'Moses Dwaram', 'Josh Kramer', 'Daniel Doezema', 'Tim Neville', 'Zach Thompson', 'Yoshi Tanno']
     @data = @impact + @impact + @impact + @impact + @impact
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
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

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

  def push
    new_controller = DetailController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(new_controller, animated: true)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    self.push
  end

  def initWithNibName(name, bundle: bundle)
    super
      self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemContacts, tag: 1)
    self
  end
end

