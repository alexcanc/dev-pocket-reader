require_relative 'post'
require_relative 'view'

class Controller
  def initialize(repository, view)
    @repository = repository
    @view = view
  end

  def list_posts
    posts = @repository.all_posts
    @view.display_posts(posts)
  end

  def save_post
    path = @view.ask_for_path
    # Scrape post data from the given path
    title = "Sample Title"
    content = "Sample Content"
    author = "Sample Author"
    post = Post.new(title, content, author)
    @repository.add_post(post)
  end

  def read_post
    index = @view.ask_for_index
    post = @repository.find_post_by_index(index)
    if post
      @view.display_post_content(post)
    else
      @view.display_invalid_input_message("Invalid index!")
    end
  end

  def mark_post_as_read
    index = @view.ask_for_index
    @repository.mark_post_as_read(index)
  end

  def exit_program
    @view.display_exit_message
  end
end
