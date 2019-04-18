require 'spec_helper'

describe StatsPresenter do
  let(:presenter) { described_class.new(stats) }

  let(:stats) do
    double(
      visits:       [['/contact', 4], ['/help_page/1', 2]],
      unique_views: [['/contact', 3], ['/help_page/1', 2]]
    )
  end

  describe '#visits' do
    subject { presenter.visits }

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

  describe '#unique_views' do
    subject { presenter.unique_views }

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
