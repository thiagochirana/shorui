module Shorui
  class Generator
    def self.fetch_routes
      Rails.application.routes.routes.map do |route|
        {
          path: route.path.spec.to_s,
          verb: route.verb,
          controller_action: route.defaults.slice(:controller, :action),
        }
      end.reject { |r| r[:path].include?('(.:format)') }
    end

    def self.generate_readme
      routes = fetch_routes
      content = "# API Documentation\n\n"

      routes.each do |route|
        controller = route[:controller_action][:controller]
        action = route[:controller_action][:action]
        content << "## #{controller.camelize}##{action}\n"
        content << "- **Path:** `#{route[:path]}`\n"
        content << "- **HTTP Verb:** `#{route[:verb]}`\n\n"
      end

      File.write('README.md', content)
      puts "README.md successfully generated in #{Dir.pwd}!"
    end
  end
end
