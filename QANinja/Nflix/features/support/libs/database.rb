require "pg"

class Database
def delete_movie(title)
    connection = PG.connect(host: "192.168.99.100",port: "15432", dbname: "nflix", user: "postgres", password: "qaninja")
    connection.exec("DELETE from public.movies where title = '#{title}';")
end
end