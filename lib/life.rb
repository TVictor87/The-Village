class Life
  attr_reader :start_time, :now_time

  def initialize(args = {})
    @start_time = args.has_key?(:start_time) ? args[:start_time] : Time.now
    @now_time = args.has_key?(:now_time) ? args[:now_time] : Time.now
  end

  def live
    Thread.new do
      for i in 0..500
        system "clear"
        general_info i

        yield

        sleep(1)
        @now_time += 1.days
      end
    end
  end

  private

  def general_info(iteration)
    printf("%-s %80s",
           ("Time is: "    + @now_time.strftime("%b %e, %Y")      ).colorize(background: :red).ljust(19),
           ('Living day: ' + iteration.to_s         + "\n").colorize(background: :blue)
    )
    printf("\n")
  end
end