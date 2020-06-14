from db.sql import SQLDataSource

def MySQLMovieDBTest():
    
    dataSource = SQLDataSource("localhost","root","","recomtest")
    interaction = dataSource.createMatrix("movies","users","ratings","user_id","movie_id","rating")

    print(interaction.shape)
    print(interaction)
