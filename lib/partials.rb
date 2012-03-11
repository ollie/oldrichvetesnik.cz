module Sinatra
  module Partials
    def partial(template, *args)
      template_array = template.to_s.split('/')
      template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
      options = args.last.is_a?(Hash) ? args.pop : {}
      options.merge!(:layout => false)
      locals = options[:locals].nil? ? {} : options[:locals] # SAVE LOCALS
      if collection = options.delete(:collection) then
        collection.inject([]) do |buffer, member|
          buffer << haml(:"#{template}", options.merge(:layout =>
          false, :locals => {template_array[-1].to_sym => member}.merge(locals))) # MERGE THEM BACK TO EACH
        end.join("\n")
      else
        haml(:"#{template}", options)
      end
    end
  end
end