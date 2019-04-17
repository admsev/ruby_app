# StatsPresenter represents Stats according to the requirements
# Usage:
# stats = Stats.new('webserver.log')
# presenter = StatsPresenter.new(stats)
class StatsPresenter < SimpleDelegator
  def visits
    super.map { |e| "#{e[0]} #{e[1]} visits" }
  end

  def unique_views
    super.map { |e| "#{e[0]} #{e[1]} unique views" }
  end
end
