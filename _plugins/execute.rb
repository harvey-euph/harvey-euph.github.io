module Jekyll
  class ExecuteBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      args = markup.strip.split(/\s+/)
      @title = args.join(' ') # 右上可選標題
    end

    def render(context)
      site = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)
      content_html = converter.convert(super.strip)

      # 將內容分成兩段
      # 這裡簡單用標記分段，使用 "---fold---" 分上下
      parts = content_html.split(/---fold---/)
      top_html = parts[0]
      bottom_html = parts[1] || ''

      <<~HTML
      <div class="execute-block">
        <pre class="execute-top"><code>#{top_html}</code></pre>
        <div class="execute-toggle">
          <div class="execute-header">[>] #{@title}</div>
          <div class="execute-content">
            <pre><code>#{bottom_html}</code></pre>
          </div>
        </div>
      </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('execute', Jekyll::ExecuteBlock)
