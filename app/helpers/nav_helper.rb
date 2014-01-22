module NavHelper
  def nav_link link_text, link_path
    content_tag(:li) do
      link_to link_text, link_path
    end
  end
end