class Village
  @@village_count = 0

  def self.next_count_of_building
    (@@village_count += 1).to_s
  end

  attr_reader :peoples, :belivers, :type
  attr_accessor :name, :infrastructure

  TYPES = ['Small Village', 'Middle Village', 'Big Village']

  def initialize(args = {})
    @name = args.has_key?(:name) ? args[:name]: "Village " + self.class.next_count_of_building
    @peoples = 10.0
    @belivers = 0
    @type = TYPES[0]
    # @happines = 50
    @infrastructure = Infrastructure.new
  end

  def info
    # TODO: Make it with printf
    printf("%s", ">>>>> #{@name} <<<<< \n".colorize(color: :light_pink, background: :black))

    printf("%2s %s", '', "Peoples: #{@peoples.to_i} [#{belivers}]\n")
    printf("%2s %s", '', "Type: #{@type}\n")
    curr_happines = happines
    curr_happines_smile = ":|"

    if curr_happines <= 25
      curr_happines_smile = ":("
    elsif curr_happines > 25 && curr_happines <= 50
      curr_happines_smile = ":|"
    elsif curr_happines > 50 && curr_happines <= 75
      curr_happines_smile = ":)"
    else
      curr_happines_smile = "B)"
    end
    printf("%2s %s", '', "Happines #{curr_happines} [#{curr_happines_smile}]\n")

    printf "\n"
    printf("%2s %s", '', "Infrastructure\n".colorize(color: :light_cyan, background: :black))
    @infrastructure.info
  end

  def pluse_one_month
    @peoples += ((@peoples * (happines - 25) )/ 1200)
    @peoples = @peoples.round(2)
  end

  def happines
    # 0% - Bad
    # 25% - is Zero
    # 50% - Normal
    # 75% - Good
    # 100% - Great

    capacity = 0
    @infrastructure.buildings[:living_buildings].each do |curr_building|
      capacity += Building::SIZES[curr_building.size][:capacity]
    end

    happines_level = 100 - (100 * peoples.to_i / capacity) + 25
    happines_level = 0   if happines_level < 0
    happines_level = 100 if happines_level > 100
    happines_level.to_i
  end
end