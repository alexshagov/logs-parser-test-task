RSpec.shared_examples "statistics with an expected result" do |parameter|
  subject { described_class.new(log_instance) }

  let(:log_path) do
    File.join(File.expand_path('../fixtures', __dir__), 'webserver.log')
  end
  let(:log_instance) { Factories::Log.build(log_path) }

  let(:expected_statistics) do
    # to be overwritten
  end

  it 'returns expected page views statistics' do
    expect(subject.generate!).to include expected_statistics
  end
end
