module ApplicationHelper
  
  def title(page_title, head_title = nil)
    head_title = page_title if head_title.nil?
    content_for :page_title do
      "<h1 id='page_title'>#{page_title}</h1>".html_safe
    end
    content_for :head_title do
      head_title
    end
  end
  
end
