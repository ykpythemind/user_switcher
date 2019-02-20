require 'erb'

module UserSwitcher::Middlewares
  class SwitcherInserter
    attr_reader :users, :login_url

    def initialize(app, config = {})
      @app = app

      @users = config[:users] || []
      @login_url = config[:login_url]
      @form_erb = config[:form_erb] || load_form_erb
    end

    def call(env)
      status, headers, body = @app.call(env)

      content_type = headers['Content-Type'].to_s
      redirect = 300 <= status.to_i && status.to_i < 400

      if content_type.strip.start_with?("text/html") && !redirect
        case body
        when ActionDispatch::Response, ActionDispatch::Response::RackBody
          body = body.body
        when Array
          body = body[0]
        end

        body = body.dup if body.frozen?
        new_body = insert_form(body)
        new_body = insert_style(new_body)
        headers['Content-Length'] &&= new_body.bytesize.to_s

        [status, headers, [new_body]]
      else
        [status, headers, body]
      end
    end

    private

    def insert_form(html)
      html.gsub %r{<body(.*?)>(.*)<\/body>}mi, '<body\1>' + form + '\2</body>'
    end

    def insert_style(html)
      html.sub %r{<head(.*?)>(.*)<\/head>}mi, '<head\1>\2' + style + '</head>'
    end

    def form
      @form ||= ERB.new(@form_erb).result(binding)
    end

    def style
      @style ||= File.read(File.expand_path('../views/style.html', __dir__))
    end

    def load_form_erb
      File.read(File.expand_path('../views/form.erb', __dir__))
    end
  end
end
