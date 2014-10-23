module ShoutsHelper
  def link_usernames(text)
    text.gsub(/@\w+/) do |username|
      link_to username, user_path(username.gsub('@',''))
    end.html_safe
  end
end
