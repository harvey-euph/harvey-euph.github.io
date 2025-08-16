module Jekyll
  class ToggleBlock < Liquid::Block
    def initialize(tag_name, title, tokens)
      super
      @title_raw = title.strip
    end

    def render(context)
      page = context.registers[:page]
      page['use_toggle'] = true

      site = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      content = super.strip
      content_html = converter.convert(content)

      left_text = ""
      right_text = ""
      is_open = false

      scanner = @title_raw.scan(/(:[<>o])\s*([^:]+)?/)

      if scanner.empty?
        # 沒有任何 tag → 全部當成左側
        left_text = @title_raw
      else
        scanner.each do |tag, text|
          case tag
          when ":<"
            left_text = text.to_s.strip
          when ":>"
            right_text = text.to_s.strip
          when ":o"
            is_open = true
          end
        end
      end

      header_html = <<~HTML
        <div class="toggle-header">
          <span class="toggle-left">#{left_text}</span>
          <span class="toggle-right">#{right_text}</span>
        </div>
      HTML

      <<~HTML
      <div class="toggle#{is_open ? " open" : ""}">
        #{header_html}
        <div class="toggle-content">
          #{content_html}
        </div>
      </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('toggle', Jekyll::ToggleBlock)
