RSpec.configure do |c|
  c.before(:each) do

    PaxfulEngine.configure do |c|
      c.paxful_key = ENV["PAXFUL_ACCESS_KEY"]
      c.paxful_secret = ENV["PAXFUL_ACCESS_SECRET"]
    end

  end
end
