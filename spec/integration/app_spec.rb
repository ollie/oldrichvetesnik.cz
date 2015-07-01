RSpec.describe App do
  it 'GET /' do
    get '/'

    expect(last_status).to eq(200)
    expect(last_body).to_not be_empty
  end

  it 'GET /cv' do
    get '/cv'

    expect(last_status).to eq(200)
    expect(last_body).to_not be_empty
  end

  it 'GET /github-repositories' do
    get '/github-repositories'

    expect(last_status).to eq(200)
    expect(last_body).to_not be_empty
  end
end
