class PostDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  THEMES = ['default','simple', 'beige', 'blood', 'moon', 'serif',
   'sky', 'beige', 'night', 'solarized']

  TRANSITIONS =['default', 'cube', 'page', 'concave', 'zoom', 'linear', 'fade', 'none']

  TRANSITION_SPEEDS = ['default', 'fast', 'slow']

  BACKGROUND_TRANSCICTIONS = ['default', 'none', 'slide', 'concave', 'convex', 'zoom']

  def theme_select
  	pair_select(THEMES)
  end

  def transition_select
  	pair_select(TRANSITIONS)
  end

  def transition_speed_select
  	pair_select(TRANSITION_SPEEDS)
  end

  def background_transition_select
  	pair_select(BACKGROUND_TRANSCICTIONS)
  end

  private
  	def pair_select(list)
  	  list.inject([]) do |result, t|
  		result = result << [t, t]
  	  end
  	end
end
