class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL
        result = db.execute(sql, id)[0]
        if (id, name, type = result)
            self.new(id: id, name: name, type: type, db: db)
        end
    end
end
