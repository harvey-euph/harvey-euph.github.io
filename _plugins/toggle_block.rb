module Jekyll
  class ToggleBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      args = markup.strip.split(" ")
      @title = args[0] || ""
      @default_open = args.include?("open") # 如果有 "open" 參數
    end

    def render(context)
      page = context.registers[:page]
      page['use_toggle'] = true

      site = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      content_html = converter.convert(super.strip)

      <<~HTML
      <div class="toggle#{' open' if @default_open}">
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
