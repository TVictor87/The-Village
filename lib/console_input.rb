class ConsoleInput
  class << self
    def new
      @instance ||= self
    end

    def catch_input(current_village)
      while input_text = gets.chomp
        case input_text
          when /b/
            # ================================ BUILDINGS ================================
            # bi - build item with id 'i'

            building_id = input_text.byteslice(1).to_i
            found_buildings = Infrastructure::BUILDING_GROUPS.select {|key, curr_b| curr_b[:id] == building_id }
            unless found_buildings.empty?
              current_village.infrastructure.build(type: found_buildings.values[0][:building_types][0])
              printf "Building of #{found_buildings.values[0][:building_types][0]}\n"
            end

          when /d/
            # ================================ DISPLAYS ================================
            # dy - display all infl
            # dn - hide info

            current_village.infrastructure.show_buildings_details = input_text.byteslice(1) == 'y'
        end
      end
    end
  end
end