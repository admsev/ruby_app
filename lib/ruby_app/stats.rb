# Stats loads webserver.log and caclculates numbers
# Usage: Stats.new('webserver.log')
class Stats
  def initialize(file_name)
    @data = {}

    load_file(file_name)
  end

  def visits
    @data.map do |url, hosts_visits|
      [url, hosts_visits.values.sum]
    end.sort_by { |i| i[1] }.reverse
  end

  def unique_views
    @data.map do |url, hosts_visits|
      [url, hosts_visits.length]
    end.sort_by { |i| i[1] }.reverse
  end

  private

  def load_file(file_name)
    File.open(file_name, 'r').each do |line|
      load_line(line)
    end
  end

  def load_line(line)
    url, host = line.split(/\s/)

    @data[url] ||= {}

    @data[url][host] ||= 0
    @data[url][host] += 1
  end
end
