module ApplicationHelper

  def passed_status!
    self.status = "passed"
    self.save
  end
end
