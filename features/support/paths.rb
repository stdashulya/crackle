module NavigationHelpers
  def path_to(page_name)
    case page_name

      when /the homepage/
        root_path
      when /the users page/
        users_path
      when /the register page/
        new_user_registration_path
      when /the login page/
        new_user_session_path

      # Add more page name => path mappings here

      else
        raise "Can't find mapping from \"#{page_name}\" to a path."
    end
  end
end

World(NavigationHelpers)
