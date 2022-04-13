@students = []


def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exist?(filename)
        load_students(filename)
         puts "Loaded #{@students.count} students from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
            @students << {name: name, cohort: cohort.to_sym}
        end
    file.close
end

def input_students
    
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    name = gets.chomp
    
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        name = gets.chomp
    end
    
    @students
end

def print_header 
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_student_list(names)
  names.each_with_index do |name, index|
      puts "#{index + 1}. #{name[:name]} (#{name[:cohort]} cohort)"
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save"
    puts "4. Load"
    puts "9. Exit"
end

def process(selection)
    case selection
        when "1"
        input_students
        when "2"
        show_students
        when "3"
        save_students
        when "4"
        load_students
        when "9"
        exit
        else
        puts "I don't know what you meant, try again"
      end
end
    
def interactive_menu
    
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def show_students
    print_header
    print_student_list(@students)
    print_footer(@students)
end

def save_students
    
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

# students = input_students
# print_header
# print(students)
# print_footer(students)

# print(students)
try_load_students
interactive_menu