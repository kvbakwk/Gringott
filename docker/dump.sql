create table public.user (
    id serial primary key,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null
);

insert into public.user (name, email, password) values ('kuba', 'kuba@gmail.com', 'kuba205');
insert into public.user (name, email, password) values ('ola', 'ola@gmail.com', 'kuba205');
insert into public.user (name, email, password) values ('iza', 'iza@gmail.com', 'kuba205');

create table public.wallet (
    id serial primary key,
    user_id integer not null,
    name varchar(255),
    balance numeric(10, 2) not null,
    cash boolean not null,
    foreign key (user_id) references public.user(id)
);

insert into public.wallet (user_id, balance, cash) values (1, 10, true);
insert into public.wallet (user_id, name, balance, cash) values (1, 'mBank', 100, false);
insert into public.wallet (user_id, name, balance, cash) values (1, 'iPKO', 0, false);

create table public.super_category (
    id serial primary key,
    name varchar(255) not null
);

insert into public.super_category (name) values ('osobiste');
insert into public.super_category (name) values ('codzienne');
insert into public.super_category (name) values ('domowe');
insert into public.super_category (name) values ('płatności');
insert into public.super_category (name) values ('rozrywka');
insert into public.super_category (name) values ('oszczędności');
insert into public.super_category (name) values ('dzieci');
insert into public.super_category (name) values ('transport');
insert into public.super_category (name) values ('wpływy');
insert into public.super_category (name) values ('inne');

create table public.category (
    id serial primary key,
    name varchar(255) not null,
    super_category_id integer not null,
    foreign key (super_category_id) references public.super_category(id)
);

insert into public.category (name, super_category_id) values ('rozwój', 1);
insert into public.category (name, super_category_id) values ('elektronika', 1);
insert into public.category (name, super_category_id) values ('multimedia', 1);
insert into public.category (name, super_category_id) values ('odzież i obuwie', 1);
insert into public.category (name, super_category_id) values ('prezenty i wsparcie', 1);
insert into public.category (name, super_category_id) values ('zdrowie i uroda', 1);
insert into public.category (name, super_category_id) values ('inne', 1);

insert into public.category (name, super_category_id) values ('jedzenie poza domem', 2);
insert into public.category (name, super_category_id) values ('zwierzęta', 2);
insert into public.category (name, super_category_id) values ('żywność i chemia domowa', 2);
insert into public.category (name, super_category_id) values ('inne', 2);

insert into public.category (name, super_category_id) values ('wyposażenie', 3);
insert into public.category (name, super_category_id) values ('remont', 3);
insert into public.category (name, super_category_id) values ('ubezpieczenie', 3);
insert into public.category (name, super_category_id) values ('usługi', 3);
insert into public.category (name, super_category_id) values ('inne', 3);

insert into public.category (name, super_category_id) values ('czynsz', 4);
insert into public.category (name, super_category_id) values ('woda i kanalizacja', 4);
insert into public.category (name, super_category_id) values ('gaz', 4);
insert into public.category (name, super_category_id) values ('prąd', 4);
insert into public.category (name, super_category_id) values ('ogrzewanie', 4);
insert into public.category (name, super_category_id) values ('telewizja', 4);
insert into public.category (name, super_category_id) values ('internet', 4);
insert into public.category (name, super_category_id) values ('telefon', 4);
insert into public.category (name, super_category_id) values ('opłaty', 4);
insert into public.category (name, super_category_id) values ('podatki', 4);
insert into public.category (name, super_category_id) values ('raty', 4);
insert into public.category (name, super_category_id) values ('ubezpieczenia', 4);
insert into public.category (name, super_category_id) values ('inne', 4);

insert into public.category (name, super_category_id) values ('podróż', 5);
insert into public.category (name, super_category_id) values ('wyjazd', 5);
insert into public.category (name, super_category_id) values ('sport', 5);
insert into public.category (name, super_category_id) values ('hobby', 5);
insert into public.category (name, super_category_id) values ('wyjście', 5);
insert into public.category (name, super_category_id) values ('wydarzenie', 5);
insert into public.category (name, super_category_id) values ('inne', 5);

insert into public.category (name, super_category_id) values ('fundusz', 6);
insert into public.category (name, super_category_id) values ('giełda', 6);
insert into public.category (name, super_category_id) values ('lokata', 6);
insert into public.category (name, super_category_id) values ('zakład', 6);
insert into public.category (name, super_category_id) values ('inne', 6);

insert into public.category (name, super_category_id) values ('zabawki', 7);
insert into public.category (name, super_category_id) values ('przedszkole', 7);
insert into public.category (name, super_category_id) values ('szkoła', 7);
insert into public.category (name, super_category_id) values ('zajęcia', 7);
insert into public.category (name, super_category_id) values ('inne', 7);

insert into public.category (name, super_category_id) values ('paliwo', 8);
insert into public.category (name, super_category_id) values ('parking', 8);
insert into public.category (name, super_category_id) values ('przejazd', 8);
insert into public.category (name, super_category_id) values ('serwis', 8);
insert into public.category (name, super_category_id) values ('sprzątanie', 8);
insert into public.category (name, super_category_id) values ('ubezpieczenie', 8);
insert into public.category (name, super_category_id) values ('inne', 8);

insert into public.category (name, super_category_id) values ('premia', 9);
insert into public.category (name, super_category_id) values ('wynagrodzenie', 9);
insert into public.category (name, super_category_id) values ('kredyt', 9);
insert into public.category (name, super_category_id) values ('kieszonkowe', 9);
insert into public.category (name, super_category_id) values ('inne', 9);

create table public.transaction (
    id serial primary key,
    description varchar(255),
    income boolean not null,
    amount numeric(10, 2) not null,
    date timestamp not null,
    important boolean not null,
    wallet_id integer not null,
    category_id integer not null,
    foreign key (wallet_id) references public.wallet(id),
    foreign key (category_id) references public.category(id)
);

insert into public.transaction (description, income, amount, date, important, wallet_id, category_id) values ('kieszonkowe', true, 10, '2023-01-01 12:00:00', true, 1, 57);
insert into public.transaction (description, income, amount, date, important, wallet_id, category_id) values ('kieszonkowe', true, 100, '2023-01-01 12:00:00', true, 2, 57);

create table public.future_transaction (
    id serial primary key,
    income boolean not null,
    amount numeric(10, 2) not null,
    date timestamp,
    wallet_id integer not null,
    category_id integer not null,
    foreign key (wallet_id) references public.wallet(id),
    foreign key (category_id) references public.category(id)
);

create table public.product (
    id serial primary key,
    name varchar(255) not null,
    price integer not null
);

create table public.shop (
    id serial primary key,
    name varchar(255) not null,
    price integer not null
);

