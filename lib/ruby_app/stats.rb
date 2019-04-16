require 'set'

# Stats loads webserver.log and caclculates numbers
# Usage: Stats.new('webserver.log')
class Stats
  attr_reader :visits
  attr_reader :hosts

  def initialize(file_name)
    @visits = {}
    @hosts = {}

    load_file(file_name)
  end

  private

  def load_file(file_name)
    File.open(file_name, 'r').each do |line|
      load_line(line)
    end
  end

  def load_line(line)
    url, host = line.split(/\s/)

    update_visits(url, host)
    update_hosts(url, host)
  end

  def update_visits(url, host)
    @visits[url] = @visits[url].to_i + 1
  end

  def update_hosts(url, host)
    @hosts[url] ||= Set.new
    @hosts[url].add(host)
  end
end
