require_relative 'lib/village'
require_relative 'lib/building'
require_relative 'lib/infrastructure'
require_relative 'lib/life'
require_relative 'lib/console_input'
require_relative 'config/initializers/fixnum'

# Gem Colorize needed
require 'colorize'

world1 = Life.new
mamayenko = Village.new

world1.live do
  mamayenko.pluse_one_month
  mamayenko.info
end

Thread.new do
  ConsoleInput.catch_input mamayenko
end

# ================== Events  ==================
mamayenko.infrastructure.build(type: :goverment, name: "Cільска рада")
sleep(5)
mamayenko.infrastructure.build(type: :produce)
sleep(5)
mamayenko.infrastructure.build(type: :religious, name: "Церквушка")
sleep(5)
mamayenko.infrastructure.build(type: :goverment, name: "Халупа Полісмена")
sleep(100)


