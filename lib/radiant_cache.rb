module Radiant::Cache
  def self.clear
    Dalli::Client.new.flush
  end
end
