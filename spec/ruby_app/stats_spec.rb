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
    it 'returns a number of visits for each page ordeded descending' do
      is_expected.to eq([['/contact', 4], ['/help_page/1', 2]])
    end
  end

  describe '#unique_views' do
    subject { stats.unique_views }
    it 'returns a number of unique views for each page ordered descending' do
      is_expected.to eq([['/contact', 3], ['/help_page/1', 2]])
    end
  end
end
