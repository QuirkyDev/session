CREATE TABLE IF NOT EXISTS user (
    id int not null AUTO_INCREMENT,
    voornaam varchar(50) not null,
    familienaam varchar(50) not null,
    email varchar(100) not null,
    primary key (id)
);

insert into user (voornaam, familienaam, email)
values ('Joeri', 'Verlooy', 'joeri.verlooy@thomasmore.be');