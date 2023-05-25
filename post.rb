class Post
  attr_reader :title, :content, :author
  attr_accessor :read_status

  def initialize(title, content, author)
    @title = title
    @content = content
    @author = author
    @read_status = false
  end

  def read?
    @read_status
  end

  def mark_as_read
    @read_status = true
  end
end
