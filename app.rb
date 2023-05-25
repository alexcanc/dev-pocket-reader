require_relative 'repository'
require_relative 'controller'
require_relative 'view'
require_relative 'router'

# Instantiate the necessary objects
repository = Repository.new(File.join(__dir__, 'posts.csv'))
view = View.new
controller = Controller.new(repository, view)
router = Router.new(controller, view)

# Start the application
router.run
