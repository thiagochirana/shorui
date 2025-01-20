module Shorui
  class Generator
    def self.fetch_routes(ignore_rails_paths = false)
      Rails.application.routes.routes.map do |route|
        path = route.path.spec.to_s.gsub("(.:format)", "")
        
        if ignore_rails_paths && path.start_with?("/rails")
          next 
        end
    
        controller = route.defaults.dig(:controller)
        action = route.defaults.dig(:action)
    
        if controller && action
          {
            path: path,
            verb: route.verb,
            controller_action: { controller: controller, action: action },
            required_params: route.path.required_names,
            optional_params: route.defaults.keys - [:controller, :action]
          }
        end
      end.compact
    end   

    def self.generate_readme(ignore_rails_paths = false)
      routes = fetch_routes(ignore_rails_paths)
      dir_name = File.basename(Dir.pwd)
      formatted_name = dir_name.gsub(/[-_\/|\\.]/, ' ').split.map(&:capitalize).join(' ')
      content = "# #{formatted_name} API Documentation\n\n"

      routes.each do |route|
        if route.nil?
          next
        end

        if ignore_rails_paths
          next if route[:verb].start_with?("/rails")
        end

        controller = route.dig(:controller_action, :controller)
        action = route.dig(:controller_action, :action)

        if controller && action
          required_params = route[:required_params].any? ? route[:required_params].join(', ') : nil
          optional_params = route[:optional_params].any? ? route[:optional_params].join(', ') : nil
    
          content << "#### [#{route[:verb]}] #{route[:path]}\n"
          content << "- **Controller#Action:** `#{controller}##{action}`\n"
          content << "- **Required Params:** `#{required_params}`\n" if required_params
          content << "- **Optional Params:** `#{optional_params}`\n\n" if optional_params
        end
      end
    
      File.write('README.md', content)
      puts "README.md successfully generated in #{Dir.pwd}!"
    end    
  end
end
