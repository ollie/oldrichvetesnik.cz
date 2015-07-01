# GitHub repository list.
class Repo
  # GitHub repos API endpoint.
  #
  # @return [String]
  attr_accessor :repos_url

  ###############
  # Class methods
  ###############

  # Load all user's repositories on GitHub.
  #
  # @return [Array<Hash>]
  def self.all
    new('https://api.github.com/users/ollie/repos').all
  end

  # Make a GET request to the GitHub repos endpoint.
  #
  # @param repos_url [String] GitHub repos API endpoint.
  #
  # @return [Array<Hash>] Repositories.
  def self.load_json(repos_url)
    response = Typhoeus.get(
      repos_url,
      headers: { 'User-Agent' => 'ollie/oldrichvetesnik.cz' },
      params:  { sort: :pushed }
    )

    MultiJson.load(response.body)
  end

  # Keep only some repository info.
  #
  # @param repo [Hash] GitHub repository info.
  #
  # @return [Hash] Trimmed down repository info.
  def self.filter_repo_info(repo)
    {
      name:      repo['name'],
      html_url:  repo['html_url'],
      pushed_at: Time.parse(repo['pushed_at'])
    }
  end

  # Slice an array of things in columns.
  #
  # @param items [Array]  Items to split into columns.
  # @param cols  [Fixnum] Number of columns.
  #
  # @return [Array<Array>>]
  def self.slice_in(items, cols)
    per_col = (items.size.to_f / cols).ceil

    cols.times.map do |i|
      a_start = i * per_col
      a_end   = a_start + per_col
      items[a_start...a_end]
    end
  end

  #########################
  # Public instance methods
  #########################

  # Initialize.
  #
  # @param repos_url [String] GitHub repos API endpoint.
  def initialize(repos_url)
    self.repos_url = repos_url
  end

  # Get a list of GitHub repositories in columns.
  #
  # @return [Array<Array>>]
  def all
    repos = self.class.load_json(repos_url)
    repos.map! { |repo| self.class.filter_repo_info(repo) }
    self.class.slice_in(repos, 3)
  end
end
