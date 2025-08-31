# _plugins/execute_block.rb
module Jekyll
  class ExecuteBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      args = markup.strip.split(/\s+/)
      @language = args[0] || 'text'
      @open = args.include?('open')
    end

    def render(context)
      page = context.registers[:page]
      page['use_execute'] = true

      content = super.strip
      
      # 使用 --- 或 ~~~ 作為分隔符來分割代碼和輸出
      if content.include?('---')
        parts = content.split('---', 2)
      elsif content.include?('~~~')
        parts = content.split('~~~', 2)
      else
        # 如果沒有分隔符，整個內容都當作代碼
        parts = [content, '']
      end

      code_content = parts[0].strip
      output_content = parts[1].strip

      open_class = @open ? ' open' : ''

      <<~HTML
      <div class="execute-block#{open_class}">
        <div class="execute-header">
          <button class="execute-toggle" type="button">
            <span class="execute-arrow">▶</span>
            <span class="execute-label">執行結果</span>
          </button>
        </div>
        <div class="execute-code">
          <pre><code class="language-#{@language}">#{escape_html(code_content)}</code></pre>
        </div>
        <div class="execute-output">
          <div class="execute-output-label">輸出：</div>
          <pre><code>#{escape_html(output_content)}</code></pre>
        </div>
      </div>
      HTML
    end

    private

    def escape_html(text)
      text.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;')
    end
  end
end

Liquid::Template.register_tag('execute', Jekyll::ExecuteBlock)