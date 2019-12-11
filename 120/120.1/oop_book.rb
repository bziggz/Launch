
# THE OBJECT MODEL


  # 1) Example of object creation:

    new_hash = Hash.new

    class NewClass
    end

    new_instance = NewClass.new


  #2) What is a module, and give an example:

    # A Module is a list of behaviors that can be made accessible to a class
    # by way of mix-ins

    module NewModule
      def new_method
        puts "Sup?"
      end
    end

    class NewNewClass
      include NewModule
    end

    another_instance = NewNewClass.new

    another_instance.new_method

# CLASSES AND OBJECTS I 

  # 1) 

    class MyCar1
      attr_accessor :color #2)
      attr_reader :year #2)

      def initialize(y, c, m, s)
        @year = y
        @color = c
        @model = m
        @current_speed = 0 
      end

      def current_speed_up(increase)
        @current_speed += increase
      end

      def brake(decrease)
        @current_speed -= decrease
      end

      def turn_off
        @current_speed = 0
        @engine = "off"
      end

      def spray_paint(new_color)
        self.color = new_color
      end
    end

# CLASSES AND OBJECTS II

    class MyCar2
      attr_accessor :color
      attr_reader :year

      def initialize(y, c, m, s)
        @year = y
        @color = c
        @model = m
        @current_speed = 0 
      end

      def current_speed_up(increase)
        @current_speed += increase
      end

      def brake(decrease)
        @current_speed -= decrease
      end

      def turn_off
        @current_speed = 0
        @engine = "off"
      end

      def spray_paint(new_color)
        self.color = new_color
      end

  #1)

      def self.gas_mileage(gallons, miles)
        miles / gallons
      end

  #2)

      def to__s
        "This car is a #{color} #{year} #{@model}."
      end
    end

  #3)

    class Person
      attr_accessor :name
      def initialize(name)
        @name = name
      end
    end

    bob = Person.new("Steve")
    bob.name = "Bob"

    puts bob.name

# INHERITANCE

      module Convertable # 3
        def top_down
          @top = "down" if @top == "up" && self.can_open_top?
        end

        def top_up
          @top = "up" if @top == "down" && self.can_open_top?
        end

        def can_open_top?
          top == "convertible"
        end
      end

      class Vehicle # 1
        @@number_of_vehicles = 0 #2

        attr_accessor :color
        attr_reader :year

        def initialize(y, c, m)
          @year = y
          @color = c
          @model = m
          @current_speed = 0 
          @@number_of_vehicles += 1
        end

        def current_speed_up(increase)
          @current_speed += increase
        end

        def brake(decrease)
          @current_speed -= decrease
        end

        def turn_off
          @current_speed = 0
          @engine = "off"
        end

        def spray_paint(new_color)
          self.color = new_color
        end

        def self.gas_mileage(gallons, miles)
          miles / gallons
        end

        def self.number_of_vehicles
          puts "Total Number of Vehicles: #{@@number_of_vehicles}"
        end

        def display_age # 6
          "The #{@model} is #{age} years old."
        end

        private # 6

        def age
          Time.now.year - @year
        end
      end

      class MyCar < Vehicle # 1
        SEDAN_DOORS = 4
        COUPE_DOORS = 2 
        include Convertable

        def initialize(y, c, m)
          super(y, c, m)
        end
        
        def to__s
          "This car is a #{color} #{year} #{@model}."
        end
      end

      class MyTruck < Vehicle # 1
        BED = true

        def initialize(y, c, m)
          super(y, c, m )
        end

        def to_s
          "This truck is a #{color} #{year} #{@model}."
        end
      end

puts MyCar.ancestors #4

ranger = MyTruck.new(1995, "blue", "Ranger")

puts ranger.display_age

  #7) 

    class Student
      attr_accessor :name
      attr_writer :grade

      def initialize(name, grade)
        @name = name
        @grade = grade
      end

      def better_grade_than?(student)
        self.grade > student.grade
      end

      protected

      attr_reader :grade
    end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well Done!" if joe.better_grade_than?(bob)

  # 8)

    #hi is a private method, only to be used by other methods in the class
   # either change "private" to "protected", or make hi available publicly
