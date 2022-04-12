@students = []

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
    puts "7. Save"
    puts "9. Exit"
end



def interactive_menu
    
    loop do
        print_menu
        selection = gets.chomp
      case selection
        when "1"
        input_students
        when "2"
        show_students
        when "7"
        save_students
        when "9"
        exit
        else
        puts "I don't know what you meant, try again"
      end
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

interactive_menu