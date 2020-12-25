module ApplicationHelper
  def navbar_page_title(page_name = '')
    page_name unless page_name.empty?
  end

  def login
    render 'layouts/navbar' if logged_in?
  end
end
