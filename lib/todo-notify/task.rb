module Todo
  class Task
    # The regular expression used to match contexts.
    def self.contexts_regex
       /(?:\s+|^)@\w+/
    end

    # The regex used to match projects.
    def self.projects_regex
       /(?:\s+|^)\+\w+/
    end

    # The regex used to match priorities.
    def self.priotity_regex
      /^\([A-Za-z]\)\s+/
    end

    # Creates a new task. The argument that you pass in must be a string.
    def initialize task
      @orig = task
    end

    # Returns the original content of the task.
    #
    # Example:
    #
    #   task = Todo::Task.new "(A) @context +project Hello!"
    #   task.orig #=> "(A) @context +project Hello!"
    def orig
      @orig
    end

    # Returns the priority, if any.
    #
    # Example:
    #
    #   task = Todo::Task.new "(A) Some task."
    #   task.priority #=> "A"
    #
    #   task = Todo::Task.new "Some task."
    #   task.priority #=> nil
    def priority
      @priority ||= if orig =~ self.class.priotity_regex
        orig[1]
      else
        nil
      end
    end

    # Retrieves an array of all the @context annotations.
    #
    # Example:
    #
    #   task = Todo:Task.new "(A) @context Testing!"
    #   task.context #=> ["@context"]
    def contexts
      @contexts ||= orig.scan(self.class.contexts_regex).map { |item| item.strip }
    end

    # Retrieves an array of all the +project annotations.
    #
    # Example:
    #
    #   task = Todo:Task.new "(A) +test Testing!"
    #   task.projects #=> ["+test"]
    def projects
      @projects ||= orig.scan(self.class.projects_regex).map { |item| item.strip }
    end

    # Gets just the text content of the todo, without the priority, contexts
    # and projects annotations.
    #
    # Example:
    #
    #   task = Todo::Task.new "(A) @test Testing!"
    #   task.text #=> "Testing!"
    def text
      @text ||= orig.
        gsub(self.class.priotity_regex, '').
        gsub(self.class.contexts_regex, '').
        gsub(self.class.projects_regex, '').
        strip
    end
  end
end
