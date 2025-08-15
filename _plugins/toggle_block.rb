module Jekyll
  class ToggleBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @title = text.strip
    end

    def render(context)
      content = super.strip
      <<~HTML
        <div class="toggle">
          <div class="toggle-header">#{@title}</div>
          <div class="toggle-content">
            #{Kramdown::Document.new(content).to_html}
          </div>
        </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('toggle', Jekyll::ToggleBlock)
