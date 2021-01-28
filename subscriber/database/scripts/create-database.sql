CREATE TABLE public.user (
	id serial NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(150) NOT NULL,
	email varchar(254) NOT NULL,
	city varchar(200) NOT NULL,
	CONSTRAINT user_pkey PRIMARY KEY (id)
);
