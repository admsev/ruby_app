require 'spec_helper'

describe Stats do
  let(:stats) { described_class.new(file_name) }

  let(:file_name) { 'webserver.log' }
  let(:webserver_log_content) do
    StringIO.new <<~TXT
      /help_page/1 126.318.035.038
      /contact 184.123.665.067
      /help_page/1 126.318.035.039
      /contact 184.123.665.067
      /contact 184.123.665.068
      /contact 184.123.665.069
    TXT
  end

  before do
    allow(File).to receive(:open).with(file_name, 'r').and_return(webserver_log_content)
  end

  describe '#visits' do
    subject { stats.visits }

    it 'returns a number of visits for each page' do
      is_expected.to eq('/help_page/1' => 2, '/contact' => 4)
    end
  end

  describe '#hosts' do
    subject { stats.hosts }
    let(:expected_result) do
      {
        '/help_page/1' => Set['126.318.035.038', '126.318.035.039'],
        '/contact'     => Set['184.123.665.067', '184.123.665.068', '184.123.665.069']
      }
    end

    it 'returns a number of unique hosts visited each page' do
      is_expected.to eq expected_result
    end
  end
end
