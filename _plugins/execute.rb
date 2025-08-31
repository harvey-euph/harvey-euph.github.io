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
        <div class="execute-code-wrapper">
          <button class="execute-toggle" type="button" title="顯示/隱藏執行結果">
            <span class="execute-arrow">▶</span>
          </button>
          <pre><code class="language-#{@language}">#{escape_html(code_content)}<span class="execute-output">#{output_content.empty? ? '' : "\n\n#{escape_html(output_content)}"}</span></code></pre>
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