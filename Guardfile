group :rules do
  guard :shell do
    watch("src/rules/rules.jison") do |m|
      if system("jison src/rules/rules.jison -o src/rules/rules.js")
        n m[0], "Compiled", :success
      else
        n m[0], "Failed", :failed
      end
      nil
    end

    watch("src/rules/rules.js") do |m|
      if system("node \"#{m[0]}\" src/rules/qfrs.rules > bin/endpoints/ILogService/GetRules.json")
        n m[0], "Compiled", :success
      else
        n m[0], "Failed", :failed
      end
      nil
    end

    watch("src/rules/qfrs.rules") do |m|
      if system("node src/rules/rules.js \"#{m[0]}\" > bin/endpoints/ILogService/GetRules.json")
        n m[0], "Compiled", :success
      else
        n m[0], "Failed", :failed
      end
      nil
    end
  end
end

group :assets do
  guard "coffeescript", :input => "src/assets/javascripts", :output => "bin/assets/javascripts"

  guard "haml", :input => "src", :output => "bin", :haml_options => {:cdata => false, :attr_wrapper => '"'} do
    watch %r{^src/.+(\.haml)}
  end

  guard "compass", :input => "src", :output => "bin", :configuration_file => "config.rb" do
    watch %r{^src/.+(\.scss)}
  end
end
