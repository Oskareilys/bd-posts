create  database blog_db;

create table users(
	id serial primary key,
	firstname varchar(50),
	lastname varchar(50),
	email varchar(50)
);

insert into users (firstname, lastname, email) values 
('Isabella', 'Laya', 'isalaya12@gmail.com'),
('Isacc', 'Laya', 'isaacllaya@gmail.com'),
('Reina', 'Salazar', 'oskareilys@gmail.com');

select * from users;

create table posts(
	id serial primary key,
	creator_id int references users(id),
	tittle varchar(50),
	text text
);

insert into posts (creator_id,tittle,text) values
(3,'¡JavaScript: Dominando el lenguaje de la web!', 'JS es el lenguaje más popular para el desarrollo web front-end, utilizado para crear animaciones, juegos, aplicaciones web y mucho más.'),
(3, '¿Por qué aprender JavaScript?','Esencial para el desarrollo web, Versátil, Relativamente fácil de aprender'),
(2, 'Ferrari: Un ícono de lujo y velocidad','Ferrari, el nombre que evoca pasión, exclusividad y la emoción de conducir un superdeportivo.'),
(1, '¿El mejor regalo para 15 años?','Aventuras emocionantes: Un viaje a un parque de atracciones, un curso de buceo o una excursión a la montaña. ¡Para las chicas que buscan adrenalina!'),
(1, 'Un viaje a París','El mejor momento para visitar París es durante la primavera (de marzo a mayo) o el otoño (de septiembre a noviembre) cuando el clima es templado y hay menos multitudes.')

select * from posts;

create table likes (
	id serial PRIMARY KEY, 
	users_id int references users(id),
	posts_id int references posts(id)
);

insert into likes (users_id,posts_id) values 
(1,3),
(2,1),
(2,2),
(3,4),
(3,2),
(3,5);

select * from likes;

--Trae todos los posts y la información del usuario del campo creator_id

select p.tittle,p."text", u.firstname || ' ' ||  u.lastname as creator_post, u.email from  posts p 
			inner join users u on p.creator_id = u.id;
			
--Trae todos los posts, con la información de los usuarios que les dieron like.

select p.tittle,p."text", u.firstname || ' ' ||  u.lastname as likes_post, u.email from  posts p 
			inner join likes l on p.id =  l.posts_id 
			inner join users u on l.users_id = u.id
			order by tittle asc;











