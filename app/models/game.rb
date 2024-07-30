class Game
  attr_reader :attacker, :defender
  
  def intialize(attacker, defender)
    @attacker = attacker
    @defender = defender
  end

  def attack(target)
    hits = roll_to_hit
    wounds = roll_to_wound(hits, target)
    final_wounds = apply_saves(wounds, target)
    apply_damage(final_wounds, target)
  end

    # Roll to hit based on weapon skill
  def roll_to_hit
    total_hits = 0
    @attacks.times do
        roll = rand(1..6)
        if roll >= @ws
            if roll == 6
                total_hits += 1  # Critical hit always adds at least one hit
                total_hits += handle_critical_hit_effects
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
  def roll_to_wound(hits, target)
      hits.times.count do
          roll = rand(1..6)
          roll >= wound_check(target)
      end
  end

  def wound_check(target)
    if @strength >= target.toughness * 2
        2
    elsif @strength > target.toughness
        3
    elsif @strength == target.toughness
        4
    elsif @strength >= target.toughness / 2
        5
    else
        6
    end
  end

  # Apply armor saves to reduce the number of effective wounds
  def apply_saves(wounds, target)
    best_save = calculate_best_save(target)
    wounds - wounds.times.count { rand(1..6) >= best_save }
  end

  # Calculate the best save possible, considering invulnerable saves
  def calculate_best_save(target)
    modified_save = target.save + @ap
    [target.invul_save, modified_save].compact.min
  end

  # Apply damage based on the final number of wounds that were not saved
  def apply_damage(final_wounds, target)
    damage_dealt = final_wounds * @damage
    damage_dealt.times { target.wound }
    damage_dealt
  end
end