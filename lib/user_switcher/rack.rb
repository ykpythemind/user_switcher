module UserSwitcher
  class SwitcherInserter
    def initialize(app, config = nil)
      @app = app
      # do something with config
    end

    def call(env)
      status, headers, body = @app.call(env)

      content_type = headers['Content-Type'].to_s
      redirect = 300 <= status.to_i && status.to_i < 400

      if content_type.strip.start_with?("text/html") && !redirect
        new_body = ''
        body.each do |b|
          begin
            new_body << insert_form(b)
          rescue => e
            $stderr.write %Q|Failed to insert dev marks: #{e.message}\n  #{e.backtrace.join("  \n")}|
          end
        end
        body.close if body.respond_to?(:close)
        headers['Content-Length'] &&= new_body.bytesize.to_s
        body = [new_body]
      end

      [status, headers, body]
    end

    def insert_form(body)
      body.gsub %r{<body>(.*)<\/body>}mi, '<body>something\1</body>'
    end
  end
end
