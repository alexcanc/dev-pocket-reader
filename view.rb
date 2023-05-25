class View
  def display_welcome_message
    puts "---------------------------------"
    puts "Welcome to your DEV Pocket Reader"
    puts "---------------------------------"
  end

  def display_menu
    puts "----------------------------"
    puts "What do you want to do next?"
    puts "----------------------------"
    puts "1. List posts"
    puts "2. Save post for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. Exit"
  end

  def display_posts(posts)
    puts "List posts"
    puts "---------------------------------"
    posts.each_with_index do |post, index|
      status = post.read? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{status} - #{post.title} (#{post.author})"
    end
  end

  def display_post_content(post)
    puts "Read post"
    puts "---------------------------------"
    puts "#{post.title} by #{post.author}"
    puts post.content
    puts "---------------------------------"
  end

  def display_exit_message
    puts "Bye bye!"
  end

  def ask_for_path
    puts "Save post for later"
    puts "---------------------------------"
    print "Path? > "
    gets.chomp
  end

  def ask_for_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end

  def display_invalid_input_message(message)
    puts "Invalid input! #{message}"
  end
end
