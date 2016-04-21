class Village
  @@village_count = 0

  def self.next_count_of_building
    (@@village_count += 1).to_s
  end

  attr_reader :peoples, :belivers, :type, :happiness
  attr_accessor :name, :infrastructure

  TYPES = ['Small Village', 'Middle Village', 'Big Village']

  def initialize(args = {})
    @name = args.has_key?(:name) ? args[:name]: "Village " + self.class.next_count_of_building
    @peoples = 10.0
    @belivers = 0
    @type = TYPES[0]
    @happines = 50
    @infrastructure = Infrastructure.new
  end

  def info
    # TODO: Make it with printf
    printf("%s", ">>>>> #{@name} <<<<< \n".colorize(color: :light_pink, background: :black))

    printf("%2s %s", '', "Peoples: #{@peoples.to_i} [#{belivers}]\n")
    printf("%2s %s", '', "Type: #{@type}\n")
    printf("%2s %s", '', "Happines #{@happines} [:)]\n")
    printf "\n"
    printf("%2s %s", '', "Infrastructure\n".colorize(color: :light_cyan, background: :black))
    @infrastructure.info
  end

  def pluse_one_month
    @peoples += ((@peoples * (@happines - 25) )/ 1200)
    @peoples = @peoples.round(2)
  end
end