module ApplicationHelper

  #return logo for website
  def logo
    logo = image_tag "logo.png", :alt => "Track Database logo",
                                 :class => "round"
  end

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

