class Building
  @@building_count = 0

  def self.next_count_of_building
    (@@building_count += 1).to_s
  end

  attr_reader :size, :type, :name, :influence

  COLORIZE_BUILDINGS = false

  SIZES = {
            small:  {id: 1, capacity: 2, name: 'Small home'},
            middle: {id: 2, capacity: 4, name: 'Middle home'},
            big:    {id: 3, capacity: 6, name: 'Big home'}
  }

  TYPES = {
      living_home: {id: 1, name: 'Living Home', colors: {color: :black, background: :light_green}},
      produce:     {id: 2, name: 'Produce',     colors: {color: :light_white, background: :light_blue}},
      goverment:   {id: 3, name: 'Goverment',   colors: {color: :light_white, background: :light_red}},
      religious:   {id: 4, name: 'Religious',   colors: {color: :black,       background: :light_yellow}}
  }

  INFLUENCES = [:small, :middle, :big]

  def initialize(args = {})
    @name = "Building " + self.class.next_count_of_building

    @name = args[:name] if args.has_key?(:name)
    @size = args.has_key?(:size) ? args[:size]: :small
    @type = args.has_key?(:type) ? args[:type]: :living_home
    @influence = args.has_key?(:influence) ? args[:influence]: :small
  end

  def info
    output_info = "#{@name}: Size: #{SIZES[@size][:name]} | Type: #{TYPES[@type][:name]} | Influence: #{@influence}\n"
    output_info = output_info.colorize(TYPES[@type][:colors]) if COLORIZE_BUILDINGS

    sprintf("%6s %-s", '', output_info)
  end
end
