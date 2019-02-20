require 'erb'

module UserSwitcher::Middlewares
  class SwitcherInserter
    def initialize(app, config = nil)
      @app = app
      # do something with config
    end

    def call(env)
      status, headers, response = @app.call(env)

      content_type = headers['Content-Type'].to_s
      redirect = 300 <= status.to_i && status.to_i < 400

      if content_type.strip.start_with?("text/html") && !redirect
        new_body = insert_form(response.body)
        headers['Content-Length'] &&= new_body.bytesize.to_s
        response = [new_body]
      end

      [status, headers, response]
    end

    def insert_form(html)
      html.gsub %r{<body>(.*)<\/body>}mi, '<body>' + form + '\1</body>'
    end

    def form
      ERB.new(File.read(File.expand_path("../form.erb", __dir__))).result(binding)
    end
  end
end
