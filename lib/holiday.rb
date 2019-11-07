require 'pry'

  hash =  {
     :winter => {
       :christmas => ["Lights", "Wreath"],
       :new_years => ["Party Hats"]
     },
     :summer => {
       :fourth_of_july => ["Fireworks", "BBQ"]
     },
     :fall => {
       :thanksgiving => ["Turkey"]
     },
     :spring => {
       :memorial_day => ["BBQ"]
     }
   }
def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.map do |season, holiday_list|
    if season == (:winter)
      holiday_list.map {|holiday, celebration| celebration << supply}
    end
  end
end
  
def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].map do |holiday, supplies| 
    supplies
  end.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.map do |season, holiday_list|
    puts "#{season.capitalize}:"
    holiday_list.each do |og_holiday, supplies|
      puts("  #{og_holiday.to_s.split("_").map {|word| word.capitalize }.join(" ")}: #{supplies.join(", ")}")
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holiday_hash.map do |season, holiday_list|
    holiday_list.map do |individual_holiday, celebration|
      individual_holiday if celebration.include? ("BBQ") 
    end
  end.flatten.compact
end
