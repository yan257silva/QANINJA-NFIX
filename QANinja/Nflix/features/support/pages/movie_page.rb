class MoviePage
    include Capybara::DSL

    def add
        find(".nc-simple-add").click
    end

    def upload(file)

        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file) #Dir.pwd é para visualizar todos os arquivos da pasta principal, que é a Nflix

        cover_file = cover_file.tr("/" , "\\") if OS.windows? #Isso serve para alterar o tipo de busca que vai ser feita, então esta alerando o tipo de barra, a barra normal / só serve para pcs mac ou linux, quando usa o Windows, precisamos alterar para a \\

        Capybara.ignore_hidden_elements = false
        attach_file("upcover" , cover_file)
        Capybara.ignore_hidden_elements = true
    end
    
    def add_cast(cast)

        actor = find(".input-new-tag")
        cast.each do |a|
        actor.set a 
        actor.send_keys :tab
        end
    end

    def alert
        find(".alert").text
    end

    def select_status(status)

      # combobox - customizado com ul e lís
      find("input[placeholder=Status]").click
      find(".el-select-dropdown__item", text: status).click

    end

    def create(movie)
        find("input[name=title]").set movie["title"]

        select_status(movie["status"]) unless movie["status"].empty?

        find("input[name=year]").set movie["year"]
        find("input[name=release_date]").set movie["release_date"]

        add_cast(movie["cast"])

        find("textarea[name=overview]").set movie["overview"]

        upload(movie["cover"]) unless movie["cover"].empty?

        find("#create-movie").click
    
        sleep 10
    end
    def movie_tr(movie)
        find("table tbody tr" , text: movie['title'])
    end
end 