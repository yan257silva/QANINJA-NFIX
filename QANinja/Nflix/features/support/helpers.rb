

module Helpers
    def get_token
        timeout = Capybara.default_max_wait_time

        timeout.times do
            js_script = 'return window.localStorage.getItem("default_auth_token");'
            @token = page.execute_script(js_script)
            sleep 1
        end
        @token
    end
end