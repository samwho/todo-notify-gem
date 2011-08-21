Gem::Specification.new do |s|
  s.name = %q{todo-notify}
  s.version = "0.1"
  s.date = %q{2011-08-21}
  s.authors = ["Sam Rose"]
  s.email = %q{samwho@lbak.co.uk}
  s.summary = %q{A command line program for reminding you of items on your todo list.}
  s.description = %q{A command line program for reminding you of items on your todo list.}
  s.homepage = %q{http://github.com/samwho/todo-notify-gem}
  s.required_ruby_version = '>= 1.9.2'
  s.license = 'GPL-2'
  s.bindir = 'bin'
  s.executables = ["todo-notify"]
  s.add_dependency 'todo-txt'
  s.requirements << 'The "notify-send" command line program.'
  s.requirements << 'A "todo.txt" file in Gina Trapani\'s todo.txt format.'

  # Add all files to the files parameter.
  s.files = []
  Dir["**/*.*"].each { |path| s.files.push path }
  s.files.push ".gemtest"
end
