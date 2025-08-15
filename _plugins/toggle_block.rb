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

      site = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      # 先取得 block 內容
      content = super.strip

      # 渲染為 HTML（支援 Markdown 語法）
      content_html = converter.convert(content)

      <<~HTML
      <div class="toggle">
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
