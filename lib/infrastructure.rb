class Infrastructure
  attr_accessor :buildings, :show_buildings_details

  SHOW_BUILDINGS_DETAILS_DEFAULT = false

  BUILDING_GROUPS = {
                      living_buildings:    {id: 1, name: 'Living_buildings',    building_types: [:living_home], colors: {color: :white, background: :green}},
                      produce_buildings:   {id: 2, name: 'Produce_buildings',   building_types: [:produce],     colors: {color: :white, background: :blue}},
                      goverment_buildings: {id: 3, name: 'Goverment_buildings', building_types: [:goverment],   colors: {color: :white, background: :red}},
                      religious_buildings: {id: 4, name: 'Religious_buildings', building_types: [:religious],   colors: {color: :black, background: :yellow}}
  }

  START_LIVING_BUILDINGS = [
      Building.new(type: :living_home),
      Building.new(type: :living_home)
  ]

  def initialize(args = {})
    @buildings = {
        living_buildings: args.has_key?(:living_buildings) ? args[:living_buildings] : START_LIVING_BUILDINGS,
        produce_buildings:   args.has_key?(:produce_buildings)   ? args[:produce_buildings]   : [],
        goverment_buildings: args.has_key?(:goverment_buildings) ? args[:goverment_buildings] : [],
        religious_buildings: args.has_key?(:religious_buildings) ? args[:religious_buildings] : []
    }

    @show_buildings_details = SHOW_BUILDINGS_DETAILS_DEFAULT
  end

  def info
    BUILDING_GROUPS.each do |building_key, building_value|
      printf("%4s %-s", '', "#{building_value[:name]}: [#{@buildings[building_key].count.to_s}]\n".bold.colorize(building_value[:colors]))
      @buildings[building_key].collect {|i| printf i.info} if @show_buildings_details
    end
  end

  def build(args = {})
    return false unless args.has_key?(:type)

    case args[:type]
      when :living_home
        @buildings[:living_buildings] << Building.new(args)
      when :produce
        @buildings[:produce_buildings]  << Building.new(args)
      when :goverment
        @buildings[:goverment_buildings]  << Building.new(args)
      when :religious
        @buildings[:religious_buildings]  << Building.new(args)
      else
        p "Error: Udefined Building Type"
    end
  end

end
