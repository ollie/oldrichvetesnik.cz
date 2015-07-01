WebMock
  .stub_request(
    :get,
    'https://api.github.com/users/ollie/repos?sort=pushed'
  )
  .with(
    headers: { 'User-Agent' => 'ollie/oldrichvetesnik.cz' }
  )
  .to_return(
    status: 200,
    body:   File.open('spec/requests/github.json')
  )
