class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
  end

  def real_puts message=""
    $stdout.puts message
  end

  def run



  projects = ["none"]
  tasks = []


  running = true

    while running
      projects_menu
      input = gets.chomp
      case input
      when "list"
        puts "Projects:\n  #{projects[0]}"
      when "create"
        projects.delete_if{|proj| proj == "none" }
        puts "Please enter the new project name:\n"
        project_name = gets.chomp
        projects << project_name

      when "rename"
        puts "Please enter the project name to rename:\n"
        project_name = gets.chomp
        if projects.include?(project_name)
          projects.delete_if{|proj| proj == project_name}
        puts "Please enter the new project name:\n"
        new_name = gets.chomp
        projects << new_name
        puts "Projects:\n  #{projects[0]}"
        else
          puts "Project not found."
        end
      when "delete"
        puts "Please enter the project name to delete:\n"
        project_name = gets.chomp
        projects.delete_if{|proj| proj == project_name}
        if projects.empty?
          puts "Projects:\n  none"
        else
          puts "Projects:\n  #{projects[0]}"
        end
      when "edit"
        puts "What project would you like to edit?"
        project_name = gets.chomp
        puts "Editing Project: #{project_name}"
        puts "'list' to list tasks"
        puts "'create' to create a new task"
        puts "'edit' to edit a task"
        puts "'complete' to complete a task and remove it from the list"
        editing = true
          while editing
            input = gets.chomp
            case input
            when "list"
              if tasks.empty?
                puts "  none"
              else
                puts "#{tasks.each{|hash| p hash }}"
              end
            when "create"
              puts "Please enter the new task name"
              task_name = gets.chomp
              task = Hash.new
              task[:name] = task_name
              tasks << task
            when "edit"
              puts "What task would you like to edit?"
              edit_task_name = gets.chomp
              if tasks.include?(:name => edit_task_name)

                tasks.delete_if{|task| task[:name] = edit_task_name }
                puts "What do you want to rename it?"
                new_task_name = gets.chomp
                task[:name] = new_task_name
                tasks << task
              elsif
              puts "task not found: '#{edit_task_name}'"
              end
            when "complete"
              puts "What task is completed?"
              completed_task_name = gets.chomp
              if tasks.include?(:name => completed_task_name)
                tasks << task[completed_task_name] = "completed"
                puts "#{completed_task_name}: completed"
              elsif
              puts "task not found: '#{completed_task_name}'"
              end


            when "back"
              editing = false
            end
          end
      when "quit"
        running = false
      end
    end

  end

  def projects_menu
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'rename' to rename a project"
    puts "'edit' to edit a project"
  end


end
