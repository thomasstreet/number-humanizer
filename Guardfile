# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Installed by guard-jasmine-node

# JavaScript/CoffeeScript watchers

guard 'jasmine-node', jasmine_node_bin: 'jasmine-node', all_after_pass: false do
  watch(%r{^spec/([^\.]+)\.spec\.(js\.coffee|js|coffee)})  { |m| "spec/#{m[1]}.spec.#{m[2]}" }
  watch(%r{^lib/([^\.]+)\.(js\.coffee|js|coffee)})        { |m| "spec/#{m[1]}.spec.#{m[2]}" }
end
