require_relative 'view'
require_relative 'controller'

class Router
  def initialize(controller, view)
    @controller = controller
    @view = view
  end

  def run
    @view.display_welcome_message
    loop do
      @view.display_menu
      choice = gets.chomp.to_i

      case choice
      when 1
        @controller.list_posts
      when 2
        @controller.save_post
      when 3
        @controller.read_post
      when 4
        @controller.mark_post_as_read
      when 5
        @controller.exit_program
        break
      else
        @view.display_invalid_input_message("Invalid choice!")
      end
    end
  end
end
