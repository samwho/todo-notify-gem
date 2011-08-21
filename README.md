# Todo.notify

todo-notify is a command line program designed to work with Gina Trapani's
[todo.txt](github.com/ginatrapani/todo.txt-cli). It takes your todo.txt and
notifies you of a random task. If you set this up with cron, you can have
a periodic reminder of tasks that are on your todo list. Neat, right? :)

# Installation

    gem install todo-notify

# Usage

    todo-notify --path ~/Dropbox/todo/todo.txt

# Output of the --help

Usage: todo-notify [options]

## Placeholders

todo-notify uses a placeholder system for generating its titles and content.
The placeholders are as following:

    %t - The text content of the task.
    %P - The task priority.
    %p - The task +projects.
    %c - The task @contexts.

Example task:    "(A) My task, woot. +project @context"
Example title:   "Todo: %P %p %c"
Example content: "%t"

The notification will then look like this:

    Todo: A +project @context
    My task, woot.

## Notifications

todo-notify uses the "notify-send" command to show its notifications. If your
operating system doesn't have a "notify-send" program then todo-notify will not
work.

## Available arguments

    -p, --path FILE                  Path to your todo.txt FILE.
    -t, --title TITLE                Title of the notification.
    -c, --content CONTENT            The content of the notification.
    -h, --help                       Display this screen.

