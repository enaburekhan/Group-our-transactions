module ApplicationHelper
  def navbar_page_title(page_name = '')
    page_name unless page_name.empty?
  end

  def login
    if logged_in?
      render 'layouts/navbar'
    end  
  end

end

