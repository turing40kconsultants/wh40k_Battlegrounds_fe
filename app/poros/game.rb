class Game
  attr_reader :attacker, :defender
  
  def initialize(attacker, defender)
    @attacker = attacker
    @defender = defender
  end

  def attack(defender)
    hits = roll_to_hit
    wounds = roll_to_wound(hits, defender)
    final_wounds = apply_saves(wounds, defender)
    apply_damage(final_wounds, defender)
  end

    # Roll to hit based on weapon skill
  def roll_to_hit
    total_hits = 0
    @attacker.weapons[0].attacks do #only the first weaepon will make attacks
        roll = rand(1..6)
        if roll >= @attacker.weapons[0].ws
            if roll == 6
                total_hits += 1  # Critical hit always adds at least one hit
                # total_hits += handle_critical_hit_effects #lets come back to this later
            else
                total_hits += 1
            end
        end
    end
    total_hits
  end

  # Handle additional effects from critical hits such as 'Lethal hits' and 'Sustained hit X'
  def handle_critical_hit_effects
    additional_hits = 0
    @abilities.each do |ability|
        case ability
        when "Lethal hits"
            additional_hits += 1  # Directly counts as an additional wound later in logic, not here
        when /Sustained Hits (\d+)/
            additional_hits += $1.to_i  # Add the number X of additional hits
        end
    end
    additional_hits
  end

  # Roll to wound the target based on hits achieved
  def roll_to_wound(hits, defender)
      hits.times.count do
          roll = rand(1..6)
          roll >= wound_check(defender)
      end
  end

  def wound_check(defender)
    if @attacker.weapons[0].strength >= defender.toughness * 2
        2
    elsif @attacker.weapons[0].strength > defender.toughness
        3
    elsif @attacker.weapons[0].strength == defender.toughness
        4
    elsif @attacker.weapons[0].strength >= defender.toughness / 2
        5
    else
        6
    end
  end

  # Apply armor saves to reduce the number of effective wounds
  def apply_saves(wounds, defender)
    best_save = calculate_best_save(defender)
    wounds - wounds.times.count { rand(1..6) >= best_save }
  end

  # Calculate the best save possible, considering invulnerable saves
  def calculate_best_save(defender)
    modified_save = defender.sv + @attacker.weapons[0].ap
    [defender.invul_sv, modified_save].compact.min
  end

  def weapon_damage_roll
    if @attacker.weapons[0].damage.to_i
      @attacker.weapons[0].damage.to_i
    elsif @attacker.weapons[0].damage == "D6+2"
      rand(1..6) + 2
    end
  end

  # Apply damage based on the final number of wounds that were not saved
  def apply_damage(final_wounds, defender)
    # require 'pry'; binding.pry
    damage_dealt = final_wounds * weapon_damage_roll
    damage_dealt.times { defender.wound }
    damage_dealt
  end
end