module ApplicationHelper
  #return titles for pages
  def title
    base_title = "Track Database"
    if@title.nil?
    base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

