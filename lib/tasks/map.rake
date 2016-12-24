task filter_maps: :environment do
  Map.includes(:squares)
    .select do |m|
      m.squares.map{ |s| s.group_index }.include? nil
    end.each{ |map| map.destroy }
end
