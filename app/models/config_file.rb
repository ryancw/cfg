class ConfigFile < ActiveRecord::Base
  serialize :configs

  def as_file
    output = [self.title]
    self.configs.each {|item| output << "#{item[0]}: #{item[1]}"}
    output.join("\n")
  end
end
