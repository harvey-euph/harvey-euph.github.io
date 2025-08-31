module Jekyll
  class ExecBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      # 這裡 markup 可以用來傳入額外參數，但根據需求，暫不使用（例如語言類型）
      @title = markup.strip.empty? ? '' : markup.strip  # 如果有 markup，可以用作 code 語言或其他，但需求中無
    end

    def render(context)
      # 取得整個區塊內容
      content = super.strip

      # 以 --- 分隔 code-to-exec 和 output-of-code
      parts = content.split('---', 2)
      code_to_exec = parts[0].strip
      output_of_code = parts.size > 1 ? parts[1].strip : ''

      # 假設 code 是 Markdown code block，轉換為 HTML（但需求是原生 ```，所以直接用 <pre><code>）
      # 如果需要 Markdown 轉換 output，可以用 converter，但需求中 output 可能是純文字或 code
      site = context.registers[:site]
      converter = site.find_converter_instance(Jekyll::Converters::Markdown)

      # 轉換 code 和 output（如果 output 是 Markdown）
      code_html = "<pre><code>#{code_to_exec}</code></pre>"  # 保持原生 code block 樣式
      output_html = converter.convert(output_of_code)  # 假設 output 可含 Markdown

      # 產生 HTML：預設 output 隱藏
      <<~HTML
      <div class="exec">
        #{code_html}
        <button class="exec-button">[&gt;]</button>
        <div class="exec-output" style="display: none;">
          #{output_html}
        </div>
      </div>
      HTML
    end
  end
end

Liquid::Template.register_tag('exec', Jekyll::ExecBlock)