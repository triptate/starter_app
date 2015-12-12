Pry.config.pager = false

# Make the current environment obvious to the user
old_prompt = Pry.config.prompt
env = Pry::Helpers::Text.red Rails.env.upcase

Pry.config.prompt = [
  proc {|*a| "#{env} #{old_prompt.first.call(*a)}"},
  proc {|*a| "#{env} #{old_prompt.second.call(*a)}"},
]
