RSpec.describe Repo do
  it 'slice_in 5 in 1' do
    items    = [1, 2, 3, 4, 5]
    expected = [[1, 2, 3, 4, 5]]
    sliced   = Repo.slice_in(items, 1)
    expect(sliced).to eq(expected)
  end

  it 'slice_in 5 in 2' do
    items    = [1, 2, 3, 4, 5]
    expected = [[1, 2, 3], [4, 5]]
    sliced   = Repo.slice_in(items, 2)
    expect(sliced).to eq(expected)
  end

  it 'slice_in 5 in 3' do
    items    = [1, 2, 3, 4, 5]
    expected = [[1, 2], [3, 4], [5]]
    sliced   = Repo.slice_in(items, 3)
    expect(sliced).to eq(expected)
  end

  it 'slice_in 6 in 1' do
    items    = [1, 2, 3, 4, 5, 6]
    expected = [[1, 2, 3, 4, 5, 6]]
    sliced   = Repo.slice_in(items, 1)
    expect(sliced).to eq(expected)
  end

  it 'slice_in 6 in 2' do
    items    = [1, 2, 3, 4, 5, 6]
    expected = [[1, 2, 3], [4, 5, 6]]
    sliced   = Repo.slice_in(items, 2)
    expect(sliced).to eq(expected)
  end

  it 'slice_in 6 in 3' do
    items    = [1, 2, 3, 4, 5, 6]
    expected = [[1, 2], [3, 4], [5, 6]]
    sliced   = Repo.slice_in(items, 3)
    expect(sliced).to eq(expected)
  end

  it 'load_json' do
    data = Repo.load_json('https://api.github.com/users/ollie/repos')
    expect(data).to be_a(Array)
    expect(data.size).to eq(30)
  end

  it 'filter_repo_info' do
    repo = {
      'name'      => 'reminder-ruby',
      'html_url'  => 'https://github.com/ollie/reminder-ruby',
      'pushed_at' => '2013-11-04T10:59:56Z'
    }
    expected = {
      name:      'reminder-ruby',
      html_url:  'https://github.com/ollie/reminder-ruby',
      pushed_at: Time.parse('2013-11-04T10:59:56Z')
    }
    filtered = Repo.filter_repo_info(repo)
    expect(filtered).to eq(expected)
  end

  it 'initialize' do
    repo = Repo.new('https://api.github.com/users/ollie/repos')
    expect(repo.repos_url).to eq('https://api.github.com/users/ollie/repos')
  end

  it 'all' do
    repos = Repo.all
    expect(repos.size).to eq(3)
  end
end
