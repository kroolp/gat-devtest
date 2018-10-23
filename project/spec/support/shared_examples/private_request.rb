RSpec.shared_examples 'private request' do |method, path|
  before do
    send(method, path, headers: { 'Authorization' => nil })
  end

  it "responds with unauthorized status" do
    expect(response).to have_http_status :unauthorized
  end

  it 'returns body with error message' do
    expect(response_json[:error]).to eq 'Not Authorized'
  end
end
