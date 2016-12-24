task delete_bad_maps: :environment do
  Map.includes(:squares).select do |map|
    map.squares.map{ |s| s.group_index }.include? nil
  end.each{ |map| map.destroy }
end
