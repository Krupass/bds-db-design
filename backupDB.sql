CREATE TABLE public.address (
    id_address integer NOT NULL,
    country character varying(45) NOT NULL,
    zip_code character varying(45) NOT NULL,
    city character varying(45) NOT NULL,
    street_name character varying(45) NOT NULL,
    house_number character varying(45) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

CREATE SEQUENCE public.address_id_address_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.address_id_address_seq OWNED BY public.address.id_address;

CREATE TABLE public.country (
    id_country integer NOT NULL,
    country_name character varying(45) NOT NULL,
    language character varying(45) NOT NULL,
    flag character varying(256) NOT  NULL,
    description character varying(256)
);


ALTER TABLE public.country OWNER TO postgres;

CREATE SEQUENCE public.country_id_country_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_country_seq OWNER TO postgres;

ALTER SEQUENCE public.country_id_country_seq OWNED BY public.country.id_country;

CREATE TABLE public.favourites (
    id_user integer NOT NULL,
    id_person integer NOT NULL
);


ALTER TABLE public.favourites OWNER TO postgres;

CREATE TABLE public.genre (
    id_title integer NOT NULL,
    id_genre_name integer NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

CREATE TABLE public.genre_name (
    id_genre_name integer NOT NULL,
    genre_name character varying(45) NOT NULL,
    description character varying(256)
);


ALTER TABLE public.genre_name OWNER TO postgres;

CREATE SEQUENCE public.genre_name_id_genre_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_name_id_genre_name_seq OWNER TO postgres;

ALTER SEQUENCE public.genre_name_id_genre_name_seq OWNED BY public.genre_name.id_genre_name;

CREATE TABLE public.person (
    id_person integer NOT NULL,
    id_address integer NOT NULL,
    first_name character varying(45) NOT NULL,
    surname character varying(45) NOT NULL,
    date_of_birth date NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

CREATE SEQUENCE public.person_id_person_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_person_seq OWNER TO postgres;

ALTER SEQUENCE public.person_id_person_seq OWNED BY public.person.id_person;

CREATE TABLE public.rating (
    id_user integer NOT NULL,
    id_title integer NOT NULL,
    rating integer NOT NULL,
    reason character varying(256)
);


ALTER TABLE public.rating OWNER TO postgres;

CREATE TABLE public.role (
    id_title integer NOT NULL,
    id_person integer NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

CREATE TABLE public.role_name (
    id_role integer NOT NULL,
    role_name character varying(45) NOT NULL,
    description character varying(256)
);


ALTER TABLE public.role_name OWNER TO postgres;

CREATE SEQUENCE public.role_name_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_name_id_role_seq OWNER TO postgres;

ALTER SEQUENCE public.role_name_id_role_seq OWNED BY public.role_name.id_role;

CREATE TABLE public.titles (
    id_title integer NOT NULL,
    id_type integer NOT NULL,
    id_country integer NOT NULL,
    name character varying(45) NOT NULL,
    year date NOT NULL,
    lenght integer NOT NULL,
    description character varying(256) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

CREATE SEQUENCE public.titles_id_title_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.titles_id_title_seq OWNER TO postgres;

ALTER SEQUENCE public.titles_id_title_seq OWNED BY public.titles.id_title;

CREATE TABLE public.type (
    id_type integer NOT NULL,
    type_name character varying(45) NOT NULL,
    description character varying(256)
);


ALTER TABLE public.type OWNER TO postgres;

CREATE SEQUENCE public.type_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_type_seq OWNER TO postgres;

ALTER SEQUENCE public.type_id_type_seq OWNED BY public.type.id_type;

CREATE TABLE public."user" (
    id_user integer NOT NULL,
    first_name character varying(45) NOT NULL,
    surname character varying(45) NOT NULL,
    nick character varying(45) NOT NULL,
    email character varying(70) NOT NULL,
    password character varying(70) NOT NULL,
    user_created TIMESTAMP(6) NOT NULL,
    id_address integer
);


ALTER TABLE public."user" OWNER TO postgres;

CREATE SEQUENCE public.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_user_seq OWNER TO postgres;

ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;

ALTER TABLE ONLY public.address ALTER COLUMN id_address SET DEFAULT nextval('public.address_id_address_seq'::regclass);

ALTER TABLE ONLY public.country ALTER COLUMN id_country SET DEFAULT nextval('public.country_id_country_seq'::regclass);

ALTER TABLE ONLY public.genre_name ALTER COLUMN id_genre_name SET DEFAULT nextval('public.genre_name_id_genre_name_seq'::regclass);

ALTER TABLE ONLY public.person ALTER COLUMN id_person SET DEFAULT nextval('public.person_id_person_seq'::regclass);

ALTER TABLE ONLY public.role_name ALTER COLUMN id_role SET DEFAULT nextval('public.role_name_id_role_seq'::regclass);

ALTER TABLE ONLY public.titles ALTER COLUMN id_title SET DEFAULT nextval('public.titles_id_title_seq'::regclass);

ALTER TABLE ONLY public.type ALTER COLUMN id_type SET DEFAULT nextval('public.type_id_type_seq'::regclass);

ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id_address);

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id_country);

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (id_user, id_person);

ALTER TABLE ONLY public.genre_name
    ADD CONSTRAINT genre_name_genre_name_key UNIQUE (genre_name);

ALTER TABLE ONLY public.genre_name
    ADD CONSTRAINT genre_name_pkey PRIMARY KEY (id_genre_name);

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id_title, id_genre_name);

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id_person);

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id_user, id_title);

ALTER TABLE ONLY public.role_name
    ADD CONSTRAINT role_name_pkey PRIMARY KEY (id_role);

ALTER TABLE ONLY public.role_name
    ADD CONSTRAINT role_name_role_name_key UNIQUE (role_name);

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_title, id_person, id_role);

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_id_title_key UNIQUE (id_title);

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (id_title, id_type);

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id_type);

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_type_name_key UNIQUE (type_name);

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_nick_key UNIQUE (nick);

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT fk_favourites_person1 FOREIGN KEY (id_person) REFERENCES public.person(id_person);

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT fk_favourites_user FOREIGN KEY (id_user) REFERENCES public."user"(id_user);

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT fk_genre_genre_name1 FOREIGN KEY (id_genre_name) REFERENCES public.genre_name(id_genre_name);

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT fk_genre_titles1 FOREIGN KEY (id_title) REFERENCES public.titles(id_title);

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fk_person_address1 FOREIGN KEY (id_address) REFERENCES public.address(id_address);

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT fk_rating_titles1 FOREIGN KEY (id_title) REFERENCES public.titles(id_title);

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT fk_rating_user1 FOREIGN KEY (id_user) REFERENCES public."user"(id_user);

ALTER TABLE ONLY public.role
    ADD CONSTRAINT fk_role_person1 FOREIGN KEY (id_person) REFERENCES public.person(id_person);

ALTER TABLE ONLY public.role
    ADD CONSTRAINT fk_role_role_name1 FOREIGN KEY (id_role) REFERENCES public.role_name(id_role);


ALTER TABLE ONLY public.role
    ADD CONSTRAINT fk_role_titles1 FOREIGN KEY (id_title) REFERENCES public.titles(id_title);

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT fk_titles_country1 FOREIGN KEY (id_country) REFERENCES public.country(id_country);

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT fk_titles_type1 FOREIGN KEY (id_type) REFERENCES public.type(id_type);

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT fk_user_address1 FOREIGN KEY (id_address) REFERENCES public.address(id_address);


