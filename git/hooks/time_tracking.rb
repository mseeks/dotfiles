require "ruby_git_hooks"
require "tickspot"
require "yaml"

class TimeTrackCommitHook < RubyGitHooks::Hook
  def initialize
    config = YAML.load_file("tickspot.yml")

    company = config["company"]
    email = config["email"]
    password = config["password"]
    @task = config["task"]
    @tick = Tickspot::Client.new(company, email, password)
  end

  def check
    if !commit_message_file
      STDERR.puts "Warning: Hook must be run as commit-msg only"
      return true  # don't actually cause commit to fail
    end

    $stdin.reopen(File.open("/dev/tty", "r")) # get the right input

    puts "How many minutes did this commit take you?"
    minutes = $stdin.gets
    hours = minutes.to_i / 60.0

    puts @tick.create_entry(task_id: @task, hours: hours, date: Date.today, notes: File.open(commit_message_file, "r").read)

    return true
  end
end

