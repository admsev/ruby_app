require 'spec_helper'

describe StatsPresenter do
  let(:presenter) { described_class.new(stats) }
  let(:stats) { Stats.new(file_name) }

  # TODO: DRY. potentially, move to shared context
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

  describe '#visits_report' do
    subject { presenter.visits_report }

    let(:expected_result) do
      [
        '/contact 4 visits',
        '/help_page/1 2 visits'
      ]
    end

    it 'returns pages visits counters ordered by ones descending' do
      is_expected.to eq expected_result
    end
  end

  describe '#hosts_report' do
    subject { presenter.hosts_report }

    let(:expected_result) do
      [
        '/contact 3 unique views',
        '/help_page/1 2 unique views'
      ]
    end

    it 'returns pages unique visits counters ordered by ones descending' do
      is_expected.to eq expected_result
    end
  end
end
