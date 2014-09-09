class OrangeTree
  def initialize
    @age = 0
    @height = 0
    @oranges = 0
    @max_age = 75
    @max_fruit = 80
    @max_height = 36
    @s_or_no_s = "oranges"
    @grove = nil
  end

  def start
    puts "Congratulations. You just planted an orange tree."
    puts "You can type a number of commands to change your tree."
    puts "Age tree one year, count oranges on tree, pick oranges on tree."
    change_tree
  end

  def change_tree
    puts "What would you like to do?"
    choice = gets.chomp.downcase

    if choice.include?("age")
      one_year_passes
    elsif choice.include?("count")
      count_the_oranges
    elsif choice.include?("pick")
      pick_an_orange
    else
      puts "I don't recognize that command."
      change_tree
    end
  end

  def one_year_passes
    age

    height

    oranges
  end

  def age
    if @age <= @max_age
      new_age = @age + 1
      @age = new_age
      #puts "The orange tree is now #{@age}."
    else
      abort("Your orange tree has died.")
    end
  end

  def height
    if @height <= @max_height
      new_height = @height + 2
      @height = new_height
      #puts "The orange tree is now #{@height} feet tall."
    else
      @height = @max_height#puts "The orange tree is now #{@height} feet tall."
    end
  end

  def oranges
    if @age >= 3 && @oranges <= @max_fruit
      @oranges = 0
      oranges = @age * 3
      @oranges = oranges
    end
  end

  def s_or_no_s
    if @oranges == 1
      @s_or_no_s = "orange"
    end
  end

  def count_the_oranges
    if @age <= 2
      puts "Your tree will not start producing fruit until it turns 3."
      change_tree
    else
      puts "There are now #{@oranges} #{@s_or_no_s}."
    end
  end

  def pick_an_orange
    if @age <= 2 || @oranges == 0
      puts "Your tree whas no fruit."
      change_tree
    end

    puts "You have #{@oranges} #{@s_or_no_s}."
    puts "How many oranges would you like to pick?"
    number = gets.chomp.to_i

    if number > @oranges
      puts "There are only #{@oranges}."
      puts "You can't pick that many oranges."
      number = 0
      pick_an_orange
    end

    fewer_oranges = @oranges - number
    @oranges = fewer_oranges

    s_or_no_s

    if @oranges >= 1
      puts "Oranges are delicious and full of vitamin C!"
      puts "You now have #{@oranges} #{@s_or_no_s}."
      change_tree
    elsif @oranges == 0
      puts "There are no more oranges to pick this year."
      puts "Let's hope the tree gets a year older soon!"
      change_tree
    end
  end

  # def soil_on_tree
  #   case
  #   when @soil_quality == 1
  #     max_age = 100
  #     @oranges += 5
  #     max_fruit = 90
  #   when @soil_quality == 2
  #     max_age = 90
  #     @oranges += 3
  #     max_fruit = 80
  #   when @soil_quality == 3
  #     max_age = 80
  #     @oranges += 2
  #     max_fruit = 70
  #   when @soil_quality == 4
  #     max_age = 70
  #     @oranges += 0
  #     max_fruit = 60
  #   end
  # end
end

class OrangeGrove
  def initialize
    make_grove
  end

  # def soil_quality
  #   if @orange_grove.length >= 100
  #     @soil_quality = 1
  #   elsif @orange_grove.length >=50
  #     @soil_quality = 2
  #   elsif @orange_grove.length >=25
  #     @soil_quality = 3
  #   else
  #     @soil_quality = 4
  #   end
  # end

  def make_grove
    @orange_grove = [ ]

    puts "How many trees do you want in your grove?"
    number = gets.chomp.to_i

    countdown = number

    until countdown == 0
      @orange_grove.push(OrangeTree.new)
      countdown -= 1
    end

    puts "A grove has been planted with #{number} orange trees."
    change_grove
  end

  def change_grove
    puts "What would you like to do to your grove: age your grove or count the oranges?"
    choice = gets.chomp.downcase

    if choice.include?("age")
      grove_age

    elsif choice.include?("count")
      grove_oranges
    else
      puts "I don't recognize that command."
      change_grove
    end
  end

  def grove_age
    @orange_grove.each do |tree|
      tree.one_year_passes
    end
    puts "The trees in the grove are #{@orange_grove.last.age} years old and #{@orange_grove.last.height} feet tall."
    change_grove
  end

  def grove_oranges
    puts "There are a total of #{@orange_grove.last.oranges * @orange_grove.length} oranges in the grove."
    change_grove
  end
end

my_grove = OrangeGrove.new
#my_grove = OrangeTree.new.start
