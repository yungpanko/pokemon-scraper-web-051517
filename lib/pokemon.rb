require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name)
    @name = name
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    new_poke = Pokemon.new(poke_info[1])
    new_poke.id = poke_info[0]
    new_poke.type = poke_info[2]
    new_poke
  end

end
