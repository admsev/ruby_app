# frozen_string_literal: true

require_relative 'lib/ruby_app'

stats = Stats.new(ARGV[0])
stats = StatsPresenter.new(stats)

puts stats.visits
puts stats.unique_views
