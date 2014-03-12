class DetailController < UIViewController
  def viewDidLoad
     super

     @table = UITableView.alloc.initWithFrame(self.view.bounds)
     Motion::Layout.new do |layout|
      layout.view self.view
      layout.subviews table: @table
      layout.vertical "|-20-[table]-0-|"
      layout.horizontal "|-0-[table]-0-|"
    end

     @table.dataSource = self
     @table.delegate = self
     @data = ['Name: NotTheActualUserYouClicked', 'Company: IASTA', 'Email: NotTheActualUserYouClicked@stubbed.com', 'Work Phone: 317-867-5309', 'Mobile Phone: 317-444-4444', "Driver's license expiration date: yesterday", 'Etc.']
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

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    App.alert("Nope.", {cancel_button_title: "Ok :("})
  end

end

