CREATE TABLE tags(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	tag_name VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW());
    INSERT INTO tags(tag_name) 
    VALUES ('sunset'), ('photography'), ('sunrise'), ('landscape'), ('food'), ('foodie'), 
    ('delicious'), ('beauty'), ('stunning'), ('dreamy'), ('lol'), ('happy'), ('fun'), ('style'), 
    ('hair'), ('fashion'), ('party'), ('concert'), ('drunk'), ('beach'), ('smile');

