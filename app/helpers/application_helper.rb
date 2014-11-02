module ApplicationHelper
  
  # Construct a page title from a base and page-specific string.
  # 
  # page_title  - The String to add at the beginning of the base title.
  #               It defaults to an empty string, but if a title is given,
  #               that will be separated from the base by a vertical bar.
  #
  # Returns the full title on a per-page basis.
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
