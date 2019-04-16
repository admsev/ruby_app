require 'pp'
# StatsPresenter represents Stats according to the requirements
# Usage:
# stats = Stats.new('webserver.log')
# presenter = StatsPresenter.new(stats)
# presenter.visits_report
# presenter.hosts_report
class StatsPresenter < SimpleDelegator
  def visits
    super.sort_by { |_page, visits_count| visits_count }.reverse
  end

  def visits_report
    visits.map do |page|
      "#{page[0]} #{page[1]} visits"
    end
  end

  def hosts_report
    hosts_counters.map do |page|
      "#{page[0]} #{page[1]} unique views"
    end
  end

  private

  def hosts_counters
    counters = hosts.each_with_object({}) do |(url, hosts_set), result|
      result[url] = hosts_set.length
    end
    counters.sort_by { |_page, hosts_count| hosts_count }.reverse
  end

end
