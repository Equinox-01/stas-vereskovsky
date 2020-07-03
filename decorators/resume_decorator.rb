class ResumeDecorator
  class << self
    def looking_for_job?(experiences)
      experiences.none? do |experience|
        experience['time'].include?('Present')
      end
    end

    def envelope?(contact)
      contact['name'] == 'envelope'
    end

    def render_contact(contact)
      if envelope?(contact)
        "<li class=\"#{contact['name']}\"><i class=\"fa fa-#{contact['name']}\"></i><a href='mailto:#{contact['link']}'>#{contact['link']}</a></li>"
      else
        "<li class=\"#{contact['name']}\"><i class=\"fab fa-#{contact['name']}\"></i><a href='https://#{contact['link']}'>#{contact['link']}</a></li>"
      end
    end
  end
end
