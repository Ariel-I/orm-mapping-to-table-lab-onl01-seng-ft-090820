class Student

  attr_accessor :name, :grade
  attr_reader :id 
  
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id 
  end 

  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        age INTEGER
        )
        SQL
    DB[:conn].execute(sql) 
  end
  
  def save
    sql = <<-SQL
      INSERT INTO students (name, age) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.album)
 
  end
  
end




  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]