require 'spec_helper'

describe 'Application console run' do
  describe 'output' do
    subject { %x(ruby ruby_app.rb #{file_name}) }

    context 'when file exists' do
      let(:file_name) { 'spec/fixtures/webserver.log' }

      let(:expected_visits_report) do
        <<~STDOUT
          /contact 4 visits
          /help_page/1 2 visits
        STDOUT
      end

      let(:expected_unique_views_report) do
        <<~STDOUT
          /contact 3 unique views
          /help_page/1 2 unique views
        STDOUT
      end

      it 'outputs page visits ordered by visits descending order' do
        is_expected.to start_with(expected_visits_report)
      end

      it 'outputs pages unique views ordered by visits descending order' do
        is_expected.to end_with(expected_unique_views_report)
      end
    end
  end
end
