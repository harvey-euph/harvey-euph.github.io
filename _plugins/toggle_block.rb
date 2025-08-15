module Jekyll
  class ToggleBlock < Liquid::Block
    def initialize(tag_name, title, tokens)
      super
      @title = title.strip
    end

    def render(context)
      # 自動啟用 toggle CSS/JS
      page = context.registers[:page]
      page['use_toggle'] = true

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
