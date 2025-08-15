module Jekyll
  class ToggleBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      args = markup.strip.split(/\s+/)
      @open = args.delete('open')
      @title = args.join(' ')
    end

    def render(context)
      page = context.registers[:page]
      page['use_toggle'] = true

      site = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      content_html = converter.convert(super.strip)

      open_class = @open ? ' open' : ''

      <<~HTML
      <div class="toggle#{open_class}">
        <div class="toggle-header">#{@title}</div>
        <div class="toggle-content">
          #{content_html}
        </div>
      </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('toggle', Jekyll::ToggleBlock)
