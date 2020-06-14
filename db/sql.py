import mysql.connector as connector 
from mysql.connector import Error
import json 
import numpy as np
from tqdm import tqdm 


""" Creating User-Item matrix from sql database """
class SQLDataSource():

    """
    Constructor
    @Params
    datasource : mysql database uri,
    user       : db username,
    password   : db password,
    database   : database name
    """
    def __init__(self,datasource,user,password,database):
        
        self.source   = datasource
        self.database = database
        self.user     = user 
        self.password = password
        
        #create a connection object
        self.conn     = self._connect()

    def _connect(self):
        print("Connecting to Database ...") 
        try:
            conn = connector.connect(host=self.source,
                                 user=self.user,
                                 password=self.password,
                                 database=self.database)
            cursor = conn.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("Connected to database: ", record[0])

            return conn     
        except Error as e:
            print("Connection failed : ",e)

    
    """ 
        function to create user-item matrix for collaborative filtering
        @Params
        item_table : Table name which is to be recommended
        user_table : Table name to which item is recommended
        interaction_table : Table which defines the interaction between user and items
        user_id_field : the field in interaction table which defines the user
        item_id_field : the field in interaction table which defined the item
        interaction_filed : the field which defines interacion value

        @rtype:
        nd-array representing user-item interactions 
    """
    def createMatrix(self,item_table,user_table,interaction_table,user_id_field,item_id_field,interaction_field):

        cursor = self.conn.cursor()
        #get total users
        cursor.execute("SELECT COUNT(*) FROM {}".format(user_table))
        userCount       = cursor.fetchall()[0][0] 

        cursor.execute("SELECT COUNT(*) FROM {}".format(item_table))
        itemCount       = cursor.fetchall()[0][0]

        print("Users : ",userCount,"\nItems : ",itemCount)

        interaction = np.zeros((userCount,itemCount))

        #extract user-item interactions
        cursor.execute("SELECT {},{},{} FROM {}".format(user_id_field,item_id_field,interaction_field,interaction_table))
        rows = cursor.fetchall()
        print("Creating matrix")
        for row in tqdm(rows):

            user_id = row[0]
            item_id = row[1]
            value   = row[2]

            interaction[user_id-1][item_id-1] = value

        return interaction

            




