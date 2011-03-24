module ApplicationHelper
  
  # because who wants to type that whole thing out every time?
  def clear
    "<div class='clear'></div>".html_safe
  end
  
  # helper for <title> and <h1> title tags
  def title(page_title, head_title = nil)
    head_title = page_title if head_title.nil?
    content_for :page_title do
      "<h1 id='page-title'>#{page_title}</h1>".html_safe
    end
    content_for :head_title do
      head_title
    end
  end
  
  # accepts block of html to be displayed in the actions section
  # (top right of main content area)
  def actions(&block)
    content_for :actions do
      with_output_buffer(&block)
    end
  end
  
  # this is for pure awesome and entertainment
  def random_hello
    hellos = [
      "aloha",
      "guten tag",
      "ni hao",
      "ohai",
      "konnichiwa",
      "bonjour",
      "shalom",
      "ciao",
      "moin moin",
      "privet",
      "hola",
      ]
    
    hellos[rand(hellos.size)].capitalize
  end
  
end
