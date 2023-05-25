require 'csv'

class Repository
  def initialize(csv_path = '/Users/alexandrecanacaris/code/alexcanc/fullstack-challenges/02-OOP/03-Cookbook-Day-One/Optional-01-Medium-pocket/lib/posts.csv')
    @csv_path = csv_path
    @posts = []
    load_posts_from_csv
  end


  def all_posts
    @posts
  end

  def add_post(post)
    @posts << post
    save_posts_to_csv
  end

  def find_post_by_index(index)
    @posts[index.to_i]
  end

  def mark_post_as_read(index)
    post = find_post_by_index(index)
    post&.mark_as_read
    save_posts_to_csv
  end

  private

  def load_posts_from_csv
    begin
      CSV.foreach(@csv_path, headers: true) do |row|
        title = row['title']
        content = row['content']
        author = row['author']
        post = Post.new(title, content, author)
        @posts << post
      end
    rescue StandardError => e
      puts "Error loading CSV: #{e.message}"
    end
  end

  def save_posts_to_csv
    CSV.open(@csv_path, 'w') do |csv|
      csv << ['title', 'content', 'author', 'read_status']
      @posts.each do |post|
        csv << [post.title, post.content, post.author, post.read?]
      end
    end
  end
end
