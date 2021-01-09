--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Ubuntu 13.1-1.pgdg20.10+1)
-- Dumped by pg_dump version 13.1 (Ubuntu 13.1-1.pgdg20.10+1)

-- Started on 2021-01-09 08:57:11 +06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16529)
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.area OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16537)
-- Name: area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.area ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.area_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 16539)
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.district (
    id integer NOT NULL,
    district_name text,
    area_id integer
);


ALTER TABLE public.district OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16552)
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.district ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 16574)
-- Name: poll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poll (
    chat_id bigint NOT NULL,
    district_id integer,
    station text,
    first_photo text,
    second_photo text,
    status integer DEFAULT 0
);


ALTER TABLE public.poll OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16554)
-- Name: polling_station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polling_station (
    id integer NOT NULL,
    station_info text,
    district_id integer
);


ALTER TABLE public.polling_station OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16567)
-- Name: polling_station_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.polling_station ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.polling_station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 16484)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    phone_number character varying(13),
    lang character varying(2),
    name character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16519)
-- Name: violation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.violation (
    id integer NOT NULL,
    date text,
    city text,
    name_victim text,
    info text,
    offender text,
    "position" text,
    photo text,
    chat_id bigint,
    status integer DEFAULT 0
);


ALTER TABLE public.violation OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16527)
-- Name: violation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.violation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.violation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3069 (class 0 OID 16529)
-- Dependencies: 203
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Алматы');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Астана');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Шымкент');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (4, 'Алматинская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (5, 'Акмолинская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (6, 'Туркестанская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (7, 'Актюбинская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (8, 'Атырауская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (9, 'Восточно-Казахстанская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (10, 'Жамбылская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (11, 'Западно-Казахстанская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (12, 'Карагандинская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (13, 'Костанайская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (14, 'Казылординская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (15, 'Мангистауская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (16, 'Павлодарская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (17, 'Северо-Казахстанская область');
INSERT INTO public.area (id, name) OVERRIDING SYSTEM VALUE VALUES (18, 'Вне Казахстана');


--
-- TOC entry 3071 (class 0 OID 16539)
-- Dependencies: 205
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Алатауский район (71 участок)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Алмалинский район (84 участка)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Ауэзовский район (100 участков)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Бостандыкский район (102 участка)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Жетысуский район (47 участков)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Медеуский район (68 участков)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Наурызбайский район (39 участков)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Турксибский район (66 участков)', 1);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Алматинский район (89 участков)', 2);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Есильский район (62 участка)', 2);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Сарыаркинский район (83 участка)', 2);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Байконырский район (49 участков)', 2);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Абайский район (92 участка)', 3);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (14, 'Аль-Фарабийский район (69 участков)', 3);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Енбекшинский район (83 участка)', 3);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Каратауский район (68 участков)', 3);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (17, 'Талдыкорган (58 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (18, 'Капчагай (33 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (19, 'Текели (18 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (20, 'Аксуский район (43 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Алакольский район (54 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Балхашский район (22 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (23, 'Енбекшиказахский район (112 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Ескельдинский район (34 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (25, 'Жамбылский район (76 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (26, 'Кегенский район (34 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (27, 'Кербулакский район (59 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (28, 'Коксуский район (37 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (29, 'Каратальский район (37 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (30, 'Карасайский район (101 участок)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (31, 'Панфиловский район (75 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (32, 'Райымбекский район (24 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (33, 'Саркандский район (33 участка)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (34, 'Талгарский район (81 участок)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (35, 'Уйгурский район (38 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (36, 'Илийский район (85 участков)', 4);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (37, 'Кокшетау (58 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (38, 'Степногорск (35 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (39, 'Аккольский район (32 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (40, 'Aршалинский район (34 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (41, 'Астраханский район (37 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (42, 'Атбасарский район (47 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (43, 'Буландынский район (37 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (44, 'Биржан сал (Енбекшильдерский) район (31 участок)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (45, 'Бурабайский район (64 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (46, 'Егиндыкольский район (14 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (47, 'Ерейментауский район (29 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (48, 'Есильский район (35 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (49, 'Жаксынский район (26 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (50, 'Жаркаинский район (24 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (51, 'Зерендинский район (70 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (52, 'Коргалжынский район (20 участков)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (53, 'Сандыктауский район (43 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (54, 'Целиноградский район (53 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (55, 'Шортандинский район (33 участка)', 5);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (56, 'Арысь (34 участка)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (57, 'Кентау (74 участка)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (58, 'Туркестан (50 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (59, 'БайдибекСКИЙ район (50 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (60, 'Жетисайский район (72 участка)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (61, 'Келесский район (58 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (62, 'Казыгуртский район (61 участОк)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (63, 'Мактааральский район (59 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (64, 'Ордабасынский район (49 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (65, 'Отрарский район (40 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (66, 'Сайрамский район (86 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (67, 'Сарыагашский район (79 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (68, 'Сузакский район (39 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (69, 'Толебийский район (67 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (70, 'Тюлькубасский район (60 участков)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (71, 'Шардаринский район (33 участка)', 6);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (72, 'Актобе (162 участка)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (73, 'Алгинский район (34 участка)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (74, 'Айтекебийский район (30 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (75, 'Байганинский район (24 участка)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (76, 'Каргалинский район (15 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (77, 'Хобдинский район (31 участок)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (78, 'Мартукский район (35 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (79, 'Мугалжарский район (46 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (80, 'Уилский район (24 участка)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (81, 'Темирский район (28 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (82, 'Хромтауский район (28 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (83, 'Шалкарский район (38 участков)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (84, 'Иргизский район (22 участка)', 7);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (85, 'Атырау (117 участков)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (86, 'Жылыойский район (24 участка)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (87, 'Индерский район (18 участков)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (88, 'Исатайский район (15 участков)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (89, 'Курмангазинский район (39 участков)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (90, 'Кызылкогинский район (22 участка)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (91, 'Макатский район (12 участков)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (92, 'Махамбетский район (18 участков)', 8);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (93, 'Усть-Каменогорск (120 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (94, 'Курчатов (4 участка)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (95, 'Риддер (30 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (96, 'Семей (148 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (97, 'Абайский район (13 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (98, 'Аягозский район (59 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (99, 'Бескарагайский район (35 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (100, 'Бородулихинский район (44 участка)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (101, 'Глубоковский район (46 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (102, 'Жарминский район (52 участка)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (103, 'Зайсанский район (37 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (104, 'Алтайский район (81 участок)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (105, 'Кокпектинский район (52 участка)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (106, 'Курчумский район (56 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (107, 'Катон-Карагайский район (48 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (108, 'Тарбагатайский район (55 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (109, 'Уланский район (47 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (110, 'Урджарский район (78 участков)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (111, 'Шемонаихинский район (33 участка)', 9);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (112, 'Тараз (125 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (113, 'Байзакский район (39 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (114, 'Жамбылский район (34 участка)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (115, 'Жуалынский район (39 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (116, 'Кордайский район (54 участка)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (117, 'Турар Рыскулов район (35 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (118, 'Меркенский район (41 участок)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (119, 'Мойынкумский район (26 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (120, 'Сарысуский район (25 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (121, 'Таласский район (30 участков)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (122, 'Шуский район (44 участка)', 10);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (123, 'Уральск (123 участка)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (124, 'Акжаикский район (47 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (125, 'Бокейординский район (24 участка)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (126, 'Бурлинский район (34 участка)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (127, 'Жангалинский район (24 участка)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (128, 'Жанибекский район (19 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (129, 'Байтерек район (55 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (130, 'Казталовский район (48 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (131, 'Каратобеский район (19 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (132, 'Сырымский район (29 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (133, 'Таскалинский район (22 участка)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (134, 'Теректинский район (42 участка)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (135, 'Чингирлауский район (19 участков)', 11);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (136, 'Караганда - казыбек би (97 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (137, 'караганда - октябрьский (82 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (138, 'Балхаш (34 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (139, 'Жезказган (33 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (140, 'Каражал (15 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (141, 'Приозерск (4 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (142, 'Сарань (20 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (143, 'Сатпаев (29 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (144, 'Темиртау (59 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (145, 'Шахтинск (34 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (146, 'Абайский район (42 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (147, 'Актогайский район (39 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (148, 'Бухар-Жырауский район (51 участок)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (149, 'Жанааркинский район (29 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (150, 'Каркаралинский район (49 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (151, 'Нуринский район (34 участка)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (152, 'Осакаровский район (41 участок)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (153, 'Улытауский район (30 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (154, 'Шетский район (56 участков)', 12);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (155, 'Костанай (87 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (156, 'Аркалык (30 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (157, 'Лисаковск (17 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (158, 'Рудный (49 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (159, 'Алтынсаринский район (25 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (160, 'Амангельдинский район (30 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (161, 'Аулиекольский район (43 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (162, 'Денисовский район (34 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (163, 'Джангельдинский район (24 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (164, 'Житикаринский район (32 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (165, 'Камыстинский район (16 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (166, 'Карабалыкский район (54 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (167, 'Карасуский район (40 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (168, 'Костанайский район (63 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (169, 'Мендыкаринский район (46 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (170, 'Наурзумский район (14 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (171, 'Сарыкольский район (33 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (172, 'Беимбет Майлин район (32 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (173, 'Узункольский район (41 участка)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (174, 'Федоровский район (37 участков)', 13);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (175, 'Кызылорда (120 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (176, 'Аральский район (55 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (177, 'Жалагашский район (26 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (178, 'Жанакорганский район (42 участка)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (179, 'Казалинский район (40 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (180, 'Кармакшинский район (35 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (181, 'Сырдарьинский район (18 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (182, 'Шиелийский район (40 участков)', 14);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (211, 'Магжан Жумабаев район (55 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (184, 'Актау (78 участков)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (185, 'Жанаозен (37 участков)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (186, 'Бейнеуский район (28 участков)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (187, 'Каракиянский район (16 участков)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (188, 'Мангистауский район (22 участка)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (189, 'Мунайлинский район (36 участков)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (190, 'Тупкараганский район (14 участков)', 15);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (191, 'Павлодар (138 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (192, 'Аксу (40 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (193, 'Экибастуз (65 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (194, 'Актогайский район (30 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (195, 'Баянаульский район (39 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (196, 'Железинский район (36 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (197, 'Иртышский район (27 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (198, 'Теренкол район (36 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (199, 'Аккулы район (26 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (201, 'Майский район (14 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (202, 'Павлодарский район (31 участок)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (203, 'Успенский район (23 участка)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (204, 'Щербактинский район (27 участков)', 16);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (205, 'Петропавловск (93 участка)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (206, 'Айыртауский район (66 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (207, 'Акжарский район (28 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (208, 'Аккайынский район (28 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (209, 'Есильский район (40 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (210, 'Жамбылский район (37 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (212, 'Кызылжарский район (63 участка)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (213, 'Мамлютский район (31 участок)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (214, 'Шал акын район (40 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (215, 'Тайыншинский район (65 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (216, 'Тимирязевский район (21 участок)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (217, 'Уалихановский район (29 участков)', 17);
INSERT INTO public.district (id, district_name, area_id) OVERRIDING SYSTEM VALUE VALUES (218, 'Габит Мусрепов район (55 участков)', 17);


--
-- TOC entry 3075 (class 0 OID 16574)
-- Dependencies: 209
-- Data for Name: poll; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3073 (class 0 OID 16554)
-- Dependencies: 207
-- Data for Name: polling_station; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (65, 'Территориальная избирательная комиссия Алатауского района
Адрес: город Алматы, микрорайон Шанырак-2, улица Жанкожа батыра,134. 
Коммунальное государственное учреждение «Общеобразовательная школа № 26»,телефон:271-87-90
Председатель – Сарсенбекова Пернеш Амирбековна, заместитель председателя –Ахметов Талгат Дуйсеналиевич, секретарь – Жексенбаева Алуа Сериковна, члены комиссии – Новик Наталья Павловна, Турсынбетова Алуа Акбергеновна, Сатанбаева Панар Молдахановна, Сейдахметова Жұлдыз Ерболқызы', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (66, 'Избирательный участок №1
Адрес: город Алматы, улица Усть-Каменогорская, 1
Коммунальное государственное учреждение «Общеобразовательная школа №14»
Председатель – Бакраева Гульмира Манарбековна,заместитель председателя– Логунец Гульнур Геннадьевна,  секретарь– Бакеева Бану Садвакасовна,члены комиссии- Корабаева Алтынай Казыхановна, Багнинова Анна Вячеславовна, Искакова Асель Зурабовна, Исабеков Рашид Даулетханович, Молдабаева Кулмария, Лобатенко Олег Степанович.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (67, 'Избирательный участок №2
Адрес: город Алматы, улица Таджикская, 5Б
Коммунальное государственное учреждение «Общеобразовательная школа №114»
Председатель – Жанпейсова Кульбадан Амриевна,  заместитель председателя – Акиева Аза Саварбековна,  секретарь – Умбеталиева Жамбы Абдрахмановна, члены комиссии -Ульянова Людмила Васильевна, Жабыкова Асель Сарсембековна, Матакбаева Бакытжамал Нугмановна, Баймухамбетова Айхан Абеновна, Матаева Гульмира Курмашевна, Сарыбаева Айдана Бейбутовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (68, 'Избирательный участок №3
Адрес: город Алматы, улица Таджикская, 5Б
Коммунальное государственное учреждение «Общеобразовательная школа №114»
Председатель –Жанбаева Улболсын Абдуллаевна,  заместитель председателя –Жамбулатова Сауле Абжановна,  секретарь –Жапарова Дамира Кенесовна,  члены комиссии –Болат Гулнур Болаткызы, Султанкулова Акмарал Окановна, Белых Евгения Александровна, Ысқақова Гүлнара Қожахметқызы, Полонкоева Халимат Макшарыповна, Айтбайқызы Бақыт.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (137, 'Территориальная избирательная комиссия Алмалинского района
Адрес: город Алматы, улица Шевченко, 97,тел. 292-28-20  
Акционерное общество «Казахская академия транспорта и коммуникаций имени Мухамеджана Тынышпаева» 
Состав избирательной комиссии: Председатель – Жусупов Бауржан Туремуратович, заместитель председателя – Абишева Гульнар Мукангалиевна, секретарь – Сартаева Жазира Амангельдиевна, члены комиссии –Иманбаева Сагынкуль Каденовна, Галиева Лязат Бауржановна, Есимбеков Канат Доскалиевич, Братенков Александр Иванович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (138, 'Избирательный участок № 38
Адрес: город Алматы, проспект Абая, 191
Филиал республиканского государственного предприятия  «НЦ «КПМС РК» Институт горного дела имени Динмухамеда Ахметулы Кунаева»
Председатель - Кожагельдиева Лязат Асылбековна, заместитель председателя - Жекпельдинова Венера Абдошевна,  секретарь - Текенова Айжан Турсыновна, члены комиссии - Аламанова Акмарал Сериковна, Усманов Рустам Валерьевич, Құдабек Қыдырбек Құдабекұлы, Куанышалиева Амина Елубаевна, Мусаев Тилек Бакирович, Шаяхмет Ислам Жұмағалиұлы, Алимолдаев Саян Ерболұлы, Нұрақыш Сауле Тоқтарбайқызы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (69, 'Избирательный участок №4
Адрес: город Алматы, улица Докучаева, 31А
Коммунальное государственное учреждение «Общеобразовательная школа №91»
Председатель – Завтурина Людмила Петровна,  заместитель председателя –Комарова Лариса Юрьевна, секретарь – Биримкулова Аксауле Сейсенбековна,  члены комиссии – Бейсенов Уласбек Баймурзаевич, Дарибаева Сауле Аскаровна, Асанова Адалят Ахмедовна, Юсупова Раногуль Турсунмагометовна, Булытбекова Диана Болатбекқызы, Коспамбетова Гулжан Шынжырбаевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (70, 'Избирательный участок №5
Адрес: город Алматы, улица Докучаева, 31А
Коммунальное государственное учреждение «Общеобразовательная школа №91»
Председатель – Абуова Шынар Богенбайкызы, заместитель председателя – Джанпеисова Гульвира Турсуновна, секретарь – Исламова Алиям Ахмедовна,  члены комиссии –Асанов Ришат Насирович, Якушева Елена Ивановна, Дубинкина Ольга Адамовна, Атамбекова Әзиза Нұрмаханбетқызы, Токтабаева Меруерт Талгатбековна,Тулеуова Индира Джумаковна,Нургожаева Гульназ Сериковна, Байкушикова Салтанат Кудайбергеновна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (71, 'Избирательный участок №6
Адрес: город Алматы, улица Ахрименко, 4
Коммунальное государственное учреждение «Общеобразовательная школа №82»
Председатель – Сейтова Асем Сайлаубековна, заместитель председателя – Адильгиреева Марина Эдуардовна, секретарь – Құттыбек Айсауле Нұрланқызы,  члены комиссии -Тунгатова Айгерим Асхатқызы, Анарбекова Несибели Эшимхановна,Исахан Ақұлпа Диханқызы, Абдикаримова Гульсим Умирзаковна, Друзина Ольга Анатольевна, Еспенбетова Гульбану Нурлыбаевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (72, 'Избирательный участок №7
Адрес: город Алматы, микрорайон Айгерим-1, улица Бенберина, 52
Коммунальное государственное учреждение «Общеобразовательная школа №149»
Председатель –Зейнуллаева Шырынкул, заместитель председателя –        Рысмендеева Гульнар Курманбековна, секретарь –Әбіжан Ақбота Нарынбекқызы, члены комиссии – Дархан Ақмарал Қайратқызы,Джумабаева Зауреш Аленовна, Утарбаева Айгуль Жумадиловна, Егизбаев Тлек, Далибаев Бакытбек Шералиевич, Молдабек Дәулет Спандиярұлы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (139, 'Избирательный участок № 39
Адрес: город Алматы, улица Туркебаева, 176
Коммунальное государственное учреждение «Общеобразовательная школа № 75 имени Шакарима Кудайбердыулы»
Председатель – Ашимбаева Жанат Канатовна, заместитель председателя – Азнакова Гульнара Ялкуновна, секретарь – Волковинская Елизавета Михайловна, члены комиссии –Шарипова Лилия Исхаковна, Алиев Валерий Григорьевич, Галиоллова Раушан Галлиолаевна, Ишанова Гозал Измахуновна, Хайруллаева Сандугаш Алибаевна, Сулейменова Саида Сметовна, Компанцева Наталья Сергеевна, Ерахметқызы Жайна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (172, 'Избирательный  участок № 72
Адрес: город Алматы,  улица Ауэзова, 36 
Коммунальное государственное учреждение «Общеобразовательная школа № 55»
Председатель – Айдарова Сауле Нариманшановна, заместитель председателя – Ахметова Райза Абылхаировна, секретарь– Тасылбаева Анар Казезовна, члены комиссии – Кусаинова Асемгуль Ануарбековна, Алибаев Азат Валиевич, Мамытканов Нурлан Кожанович, Васюков Владислав Анатольевич, Ермаханова Айгуль Амангельдиевна, Власенко Михаил Владимирович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (179, 'Избирательный  участок № 79
Адрес: город Алматы, улицы Муратбаева, 200 
Акционерное общество «Казахский университет международных отношений и мировых языков имени Абылай хана»
Председатель – Нургабылов Умирзак Шарапович, заместитель председателя – Тлеубаев Ерлан Куанышович, секретарь– Мадиева Дана Едилқызы, члены комиссии–Акшалова Гулжан Калашовна, Климова Людмила Владимировна, Турганова Шолпан Калмакамбетовна, Омарова Жанар Абыкановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (73, 'Избирательный участок №8 
Адрес: город Алматы, микрорайон Самгау, улица Кокорай, 66
Коммунальное государственное учреждение «Общеобразовательная школа №41»
Председатель – Доланбаева Ляззат Бекбосыновна, заместитель председателя –Буркитбаева Гулмира Жолдасбаевна, секретарь –Дулатова Дина Курмангазыевна, члены комиссии – Джунисова Умсынай Кидировна, Курманбеков Темірлан Алмазұлы,Мусина Кулянда Хаиржановна, Көбекова Гүлзәт Рахымқызы,Мангибаева Калия Исмайловна,Әбділда Рахима Сейтжанқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (74, 'Избирательный участок №9
Адрес: город Алматы, микрорайон Айгерим-1, улица Бенберина, 52
Коммунальное государственное учреждение «Общеобразовательная школа №149»
Председатель –Касымжанов Елдос Серикович, заместитель председателя –Ерманова Маргарита Тулегеновна, секретарь –Сихымбаева Жанаркул Иманалиевна, члены комиссии –Сыздыкбаева Акбопе Куванышкызы,Мухамедова Гульбану Самигулловна, Нурахметова Ельмира Адилжановна,Анарбаева Нурсулу Кожатаевна, Жонусов Мерхат Галимович, Тусенова Шолпан Койчибековна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (75, 'Избирательный участок №10
Адрес: город Алматы, проспект Рыскулова, 228. Воинская часть №7552
Границы: воинская часть №7552
Председатель –Айтметов Булат Серыкбаевич, заместитель председателя –Сыздыков Жанат Асхатулы, секретарь– Кайназарова Айман Абдашимовна, члены комиссии  –Куракбаев Серик Мухамедсапарович,Есенов Касен Болатович.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (76, 'Избирательный участок №11
Адрес: город Алматы, микрорайон Акбулак, улица Касыма Шарипова, 38
Коммунальное государственное учреждение «Общеобразовательная школа №154»
Председатель -Алмасбаева Каламкас Калиевна, заместитель председателя –Китапбаев Ермек Каитбаевич, секретарь – Мусабекова Макпал Жаныбековна, члены комиссии – Копабаева Мейркул Султанхановна, Рахманова Зелипям Сидиковна, Бұхарбаева Әлия Әбимоллақызы, Мукашева Лазат Ескалиевна, Есенкулова Асемгуль Болатхановна, Калдыбекова Айнур Ханафияновна, Нурпеисова Камшат Жанатовна, Журсимбаева Гаухар Сериковна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (140, 'Избирательный участок № 40
Адрес: город Алматы, улица Брусиловского, 134а/1
Государственное коммунальное казенное предприятие «Специализированная детская  юношеская школа Олимпийского резерва №2»
Председатель – Ергазиева Айгул Токкожаевна, заместитель председателя –Еришева Шайкул Торекуловна, секретарь – Турысбекова Насиба Джурабековна, члены комиссии – Дуйсенов Аблайхан Кенджаходжаұлы, Касьянов Александр Андреевич, Иманчалова Бейбитгул Алтынбековна, Аднанова Асель Аскаровна, Қуанбай Ерқанат Еркінбекұлы, Переберина Татьяна Николаевна, Амангос Ислам Асылбекович, Санбаева Балым Жалғасқызы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (173, 'Избирательный  участок № 73
Адрес: город Алматы, улица Байзакова, 130 
Коммунальное государственное учреждение «Школа-гимназия №136 имени Мыржакыпа Дулатова»
Председатель – Батырбаев Анас Рахманбердиевич, заместитель председателя – Әбдіраман Гүлназ Ыбырайқызы, секретарь– Жаужүрек Мақпал Саметқызы, члены комиссии– Баимбетова Индира Аринбаевна, Арли Салима Рамазановна, Мейрамбекова Назгуль Ержановна, Каримжиева Зейнура Бакытжановна, Сейдуллаев Бағдат Сәбитұлы, Карасаев Айдын Бескемпирович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (174, 'Избирательный  участок № 74
Адрес: город Алматы, улица Гоголя, 187  
Коммунальное государственное учреждение «Лицей № 24»
Председатель – Тунгишбаева Гулназ Облбековна, заместитель председателя – Касымова Гульмира Ахылбековна, секретарь– Алиева Маржан Докторхановна, члены комиссии–Курбанов Аркенджан Мажитович, Джарылкапова Сандугаш Есенбековна, Пазылбеков Меркебай Джумадиллович, Тлевжанова Гульзия Сатбалдиевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (77, 'Избирательный участок №12
Адрес: город Алматы, микрорайон Ожет, улица Ауэзова, 48
Коммунальное государственное учреждение «Общеобразовательная школа №156»
Председатель –Сармакова Алмагуль Куанышевна, заместитель председателя – Базарбаева Нурлыхан Еркиновна, секретарь –Биғожа Гүлзат Есболатқызы, члены комиссии – Салбенов Нурлан Жамагатович, Сайрабекова Шолпан Даулетхановна, Тоқтасынов Нұржан Ержанұлы, Добалакова Дина Чадановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (78, 'Избирательный участок №13
Адрес: город Алматы, микрорайон Ожет, улица Ауэзова, 48
Коммунальное государственное учреждение «Общеобразовательная школа №156»
Председатель – Темиргалиева Манар Бейдахметовна, заместитель председателя – Таипова Мунирям Имамовна, секретарь – Умурзакова Гаухар Турганбековна, члены комиссии –Иманкожаева Мәдина Сейсенқызы,Рамазанов Ақжол Нұрбақытұлы,Даутова Дилярам Садыккожаевна, Амрулаева Гульфиям Кайроллаевна, Сәдібекова Гулмира Сәпибекқызы, Абдирахманова Айгерим Калкозовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (79, 'Избирательный участок №14
Адрес: город Алматы, микрорайон Томирис, улица Центральная, 126
Коммунальное государственное учреждение «Филиал № 44 Централизованной библиотечной системы»
Председатель –– Раймкулова Мадина Канатбековна, заместитель председателя -Алтынбайұлы Думан,секретарь-Жылқайдар Гулжанат Жарылқасымқызы,   члены комиссии – Сабраева Салтанат Жакыпбаевна, Асамбеков Роман Шатырбекович, Ермекбаева Женискул Калабаевна, Сансызбаев Алмат Муратович, Байдильдаева Гулбану Нуркельдиевна, Сатыбалдинов Амантай Сериккалиевич.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (80, 'Избирательный участок №15
Адрес: город Алматы, микрорайон Шапагат, улица Биянху, 87
Коммунальное государственное учреждение «Общеобразовательная школа №150»
Председатель –Тохтахунова Гульмира Абдрахимовна, заместитель председателя – Ашимова Гулинур Генахуновна, секретарь – Айтмолдина Манар Кырыкбаевна, члены комиссии – Мансурова Венера Сауровна,  Талбаева Кулайман Бежимбаевна, Мансуров Абдурахим,Тогысбаева Асел Тезекбаевна, Нуртанова Гулистан Мейрбековна, Марупова Мариямбуви Ахметжановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (141, 'Избирательный  участок № 41
Адрес: город Алматы, улица Туркебаева, 176
Коммунальное государственное учреждение «Общеобразовательная школа № 75 имени Шакарима Кудайбердыулы»
Председатель – Тохтасунова Гульбаням Имтахуновна, заместитель председателя – Краюшкина Светлана Валерьевна, секретарь – Нетруненко Елена Александровна, члены комиссии –Полий Юлия Викторовна, Капесова Галия Турсыновна, Виденеева Елизавета Владимировна, Дуйсенова Гулзагира Казтаевна,Ушурбакиев Ашимжан Абдуллаевич, Жұмалиева Әсем Бейбітқызы, Гончаров Сергей Борисович, Абдуллаев Рафаил Искандерович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (175, 'Избирательный  участок № 75
Адрес: город Алматы, проспект Абая, 85/105 
Акционерное общество «Казахская академия спорта и туризма»
Председатель – Ибрагимов Асет Ербулович, заместитель председателя – Токарева Светлана Витальевна, секретарь– Тазабек Еркебұлан Нұрланұлы, члены комиссии–Карменов Кайрат Маутханович, Кощегулова Галия Салимовна, Гамаев Вадим Александрович, Тагаева Алия Нурлановна, Солтангельдина Куралай Доскеновна, Тулегенов Рыскелды.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (176, 'Избирательный  участок № 76
Адрес: город Алматы, проспект Абая, 91 
Акционерное общество «Казахстанский научно-исследовательский институт  онкологии и радиологии»
Председатель – Чингисова Жанна Казбековна, заместитель председателя – Канафьянова Куралай Газизовна, секретарь– Турсунова Гульмира Бахытовна, члены комиссии–Абдрахманов Рамиль Зуфарович, Мырзакулов Адилет Бауыржанулы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (177, 'Избирательный  участок № 77
Адрес: город Алматы, улица Масанчи, 92 
Товарищество с ограниченной ответственностью «ЖГМК»«Учебно-клинический центр»
Председатель – Аджигалиев Аскар Амангельдиевич, заместитель председателя – Ашенова Жанар Сергалимовна, секретарь– Алимбекова Перизат Сабазбековна, члены комиссии–Алимов Османжан Турдыевич, Нарынова Айман Мындыльдаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (81, 'Избирательный участок №16
Адрес: город Алматы, микрорайон Шапагат, улица Новая Садовая, 100А.Коммунальное государственное учреждение «Общеобразовательная школа №151»
Председатель –Медетбекова Забида Омаровна, заместитель председателя – Джампейсова Назира Сансызбаевна, секретарь –Абдуллаева Гульзада Кажигереевна, члены комиссии –  Бектурова Айгерим Булатовна, Жексенбаева Данара Сериковна, Таирова Гульнара Гожахметовна,Алаева Тұйғын Айсаровна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (82, 'Избирательный участок №17
Адрес: город Алматы, микрорайон Карасу, улица Черемушки, 1.
Коммунальное государственное учреждение «Общеобразовательная школа №164»
Председатель –Кусаинова Бахыткуль Алтаевна, заместитель председателя –Бейқұтұлы Дастан, секретарь –Хамзина Райхан Алимхановна,члены комиссии –Халметова Гульназим Теипжановна, Джангурбаева Индира Нарбайқызы,Әлібек Салтанат Асхатқызы, Алдекенова Индира Жунискановна, Зияда Айдана Нұрбақызы,Тагаева Алтыншаш Жакыпбековна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (83, 'Избирательный участок №18
Адрес: город Алматы, микрорайон Карасу, улица Заводская, 96
Коммунальное государственное учреждение «Общеобразовательная школа №160»
Председатель –Даулетова Гульнара Арыстановна, заместитель председателя –Байжуманова Света Омирзаковна, секретарь –Касенова Лилия Халеловна, члены комиссии -Мустафина Гульназ Абдимажитовна, Сапрыгин Роман Алексеевич, Смагулов Бауыржан Ахмеджанович, Пошимова Рима Ералхановна, Жаламанова Сауле Куанышевна, Оспанов Еламан Сембайұлы, Жумабекова Гульнара Сеиткамаловна,Джумабаева Ризагуль Агзамовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (84, 'Избирательный участок №19
Адрес: город Алматы, микрорайон Карасу, улица Шаяхметова, 17/8
Коммунальное государственное учреждение «Общеобразовательная школа №179»
Председатель – Муратбаев Ерлан Отанович, заместитель председателя –Шералиева Динара Эрнстовна, секретарь –АбдикееваАрайлым Дюсенбековна, члены комиссии -Узаков Айдын Кемелбаевич, Айтымбетова Гулжан Шубаевна,Жұмақын Назым Берікқызы, Бейспаев Ерлан Орузбаевич, Баизова Каламкас Каиртаевна, Есмаханова Айсулу Бимахановна, Агыбаева Айнур Асетовна, Ногайбаев Даурен Оразбаевич.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (142, 'Избирательный  участок № 42
Адрес: город Алматы,  улица Тлендиева, 35  
Коммунальное государственное учреждения «Общеобразовательная школа № 96»
Председатель – Бердигулова Бану Турысжановна, заместитель председателя – Бабажанова Роза Алимхановна, секретарь – Нагуманова Эльвира Зиятдиновна, члены комиссии –Сенина  Екатерина Владимировна, Амрекулова Шакен Шотаевна, Аубакирова Айдана Жакыпбеккызы, Усубалиева Айгуль Курмановна, Смагулова Гульмира Булатовна, Гончарова Елена Анатольевна, Балмагамбетов Еркебулан Жарилкасынович, Халикова Илюзя Мавлетзяновна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (143, 'Избирательный  участок № 43
Адрес: город Алматы, улица Брусиловского, 15   
Коммунальное государственное учреждение «Гимназия №34»
Председатель – Джаханов Рустам Иминжанович, заместитель председателя –Абдукаримова Гульшат Кенесовна, секретарь – Шнайдер Анастасия Геннадьевна, члены комиссии – Дагджи Татьяна Геннадьевна, Даулетова    Аида Сериковна, Ливенцова Татьяна Анатольевна, Қилыбаева Камила Амангеліқызы, Айткожина Сауле Сагынбаевна, Кадрахунов Алмас Ерланович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (144, 'Избирательный  участок № 44
Адрес: город Алматы, улица Тлендиева, 35
Коммунальное государственное учреждения «Общеобразовательная школа № 96»
Председатель – Борашева Зулфия Куттыбаевна, заместитель председателя – Рузанова Эльмира Серикбаевна, секретарь – Кенжекей Мөлдір Дәулетқызы, члены комиссии – Бекболаева  Клара Сейтнуровна,  Сламкулова  Гулжан Темирбековна,  Кошербаева Куралай Еркинбековна,  Демеубаев Марат Билимханович, Заманбекова Дилдаш Боженовна, Даутова Кенжеш Кадырхановна, Исламова Алина Бисенгалиевна, Ажгожина Лариса Гильясовна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (85, 'Избирательный участок №20
Адрес: город Алматы, микрорайон Шанырак-2, улица Жанкожа батыра,134 Коммунальное государственное учреждение «Общеобразовательная школа № 26»
Председатель – Сейтахметова Галя Акылбековна, заместитель председателя – Абілдаев Баұыржан Сүлейманұлы, секретарь – Ерманова Рысжан Наушабекқызы, члены комиссии – Касымова Рыскуль Наурызовна, Коптлеуова Бибигуль Хасеновна, Мешитбаева Эльмира Турсыновна, Абдрахманова Айжан Отаргазиновна, Курукбаева Айдана Шаметовна,Алимкадирова Гульбану Арыновна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (86, 'Избирательный участок №21
Адрес: город Алматы, микрорайон Шанырак-1, улица Утемисова, 109
Коммунальное государственное учреждение «Школа-лицей №169»
Председатель –Исимова Жанылсын Абикаировна, заместитель председателя – Маликова Акмарал Адилхановна, секретарь – Райжанова Айгерим Есиловна, члены комиссии – Абенова Акбота Акылбекқызы, Қасен Тұйғын Нұрғазықызы, Байгазина Асем Гериповна , Бакбергенова Жұлдыз Козыбековна, Иембердиева Бағила Тоқтарбайқызы,Сатыбалдиев Серик Токтарович.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (87, 'Избирательный участок №23
Адрес: город Алматы, микрорайон Улжан-1, улица Жалайыр, 48
Коммунальное государственное учреждение «Школа-гимназия №152»
Председатель –Абдикаримова Рима Сабржановна, заместитель председателя - Тажибаева Сымбат Тоқабайқызы, секретарь –Жакипова Арайлым Сериковна, члены комиссии -Амиралиева Айман Алиаскарқызы, Лебаева Асем Өміржанқызы, Максутбаев Гани Ерсанович, Тоқбай Маржан Қожамқұлқызы, Асанова Уржамал Бейсенбековна, Самат Аида Саматқызы .', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (88, 'Избирательный участок №24
Адрес: город Алматы, микрорайон Дархан, улица Алтай, 24/
Государственное коммунальное предприятие на праве хозяйственного ведения «Городская поликлиника № 25»
Председатель – Мазбаева Алия Муратовна, заместитель председателя – Бимендеев Ердос Алшынбекович, секретарь –Ниязова Рушангуль Махмутовна, члены комиссии –Адильбаева Куаныш Укетаевна, Наурызбаева Арайлым Бериковна, Дуйсебаева Эльмира Ахатовна, Менлибаева Жанна Ерсиновна, Бакилова Дарига Умаровна, Умуралиева Зоя Михайловна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (145, 'Избирательный  участок № 45
Адрес: город Алматы, улица Брусиловского, 15, 
Коммунальное государственное учреждение «Гимназия № 34»
Председатель – Некрасова Оксана Алексеевна, заместитель председателя – Усенко  Валентина Григорьевна, секретарь – Избасарова Анар Тимахановна, члены комиссии -Тимченко Иван Владимирович,  Абыханов Жарас Рабхатович, Смирнова Эльмира Хисматовна, Филиппова Елена Васильевна, Назарбаев Ерлан Токтарбекович, Ляпунова Ирина Константиновна, Темірбек Айнұр Ерланқызы, Арчакова Татьяна Александровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (178, 'Избирательный  участок № 78
Адрес: город Алматы, улица Амангельды, 88  
Республиканское государственное предприятие на праве хозяйственного ведения «Республиканский научно-практический центр психического здоровья»
Председатель – Оспанов Азамат Майлыбекович, заместитель председателя – Бахрамов Акмалжан Аманович, секретарь– Жабатаева Нургуль Заурбековна, члены комиссии– Аманова Алуа Акылбековна, Мұқади Аяулым Жамбылқызы', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (89, 'Избирательный участок №25
Адрес: город Алматы, микрорайон Шапагат, улица Новая Садовая, 100А
Коммунальное государственное учреждение «Общеобразовательная школа №151»
Председатель – Молдыбаева Гульшат Жаксылыковна, заместитель председателя – Зульярова Тамара Рахмидиновна, секретарь – Проводникова Светлана Ивановна, члены комиссии –Молдажанова Гуля Мейрамбаевна, Абирова Жибек Сапарбаевна, Розахун Ахчихан Розахуновна, Касымова Нигара Алимжановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (90, 'Избирательный участок №26
Адрес: город Алматы, улица Калининградская, 45
Товарищество с ограниченной ответственностью «Коммунальный автобусный парк № 3»
Председатель –Рахымжанова Айна Ауғанқызы, заместитель председателя – Ислямов Ришат Токтахунович, секретарь –Даулбаева Бахыткуль Уразалиевна, члены комиссии –Алибекова Карима Затеновна,  Боранбаев Амангелді Әшірәліұлы, Беспаева Галия Кумашевна, Бидайбаева Молдир Сабыровна, Мурзакаримов Бакытжан Кабиевич, Тастанбеков Кулмахан Жумабекович.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (91, 'Избирательный участок №27
Адрес: город Алматы, микрорайон Акбулак, улица Касыма Шарипова, 38
Коммунальное государственное учреждение «Общеобразовательная школа №154»
Председатель –Куралбекова Назира Арипбаевна, заместитель председателя – Талипова Эльмира Гайниддиновна, секретарь –Базарбаева Жазира Дилмуратовна, члены комиссии –Мусаева Айгуль Асановна, Ошурова Сауле Муратхановна, Кивирова Михрибану Махаметжановна, Қалмаханова Фариза Қалманқызы, Медеубаева Меруерт Канатовна,Бектас Кұралай Өтепқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (92, 'Избирательный участок №28
Адрес: город Алматы, микрорайон Зердели, 65
Коммунальное государственное учреждение «Общеобразовательная школа № 182»
Председатель – Нұргазы Асет, заместитель председателя – Аскарова Акмарал Аскарқызы, секретарь – Бескекилова Динара Мырзахановна, члены комиссии - Ахметова Гулбану Орманбековна, Кушалиева Гулмира Шабанбаевна, Утегулова Асел Нусипбаевна, Касымова Жазира Габидуллаевна, Габдуллина Айгуль Темиргалиевна, Турарова Айбарша Жаксылыковна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (146, 'Избирательный  участок № 46
Адрес: город Алматы, улицаТургута Озала, 45 
Коммунальное государственное учреждение «Общеобразовательная школа №167»
Председатель – Абеубекова Ботакоз Абеновна, заместитель председателя – Сулейменов Бердибек Бейсенович, секретарь– Масабекова Айжан Нуралбаевна, члены комиссии– Жусанбекова Сауле Биримкуловна, Алдакеева Анэль Дуйсенбаевна,Телемисова Фатима Абжапаровна, Дутбаева Назигуль Биляловна, Харова Джамиля Харсановна, Байтурсынова Айман Кабылбековна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (147, 'Избирательный участок № 47
Адрес: город Алматы, улица Тургута Озала, 30 
Коммунальное государственное учреждение «Общеобразовательная школа № 58»
Председатель – Утжанова Шынар Кенесбаевна, заместитель председателя – Махаев Жанибек Шаимкулович, секретарь–Багибаева Баглан Медельхановна, члены комиссии– Сарбалина Бакан Жумахановна, Байетова Асел Тузелбеккызы, Утемисов Әлібек Пердебайұлы, Тавакилова Нигара Сетивалдиевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (209, 'Избирательный участок № 109
Адрес: город Алматы, проспект Райымбека, 174
Государственное коммунальное казенное предприятие «Алматинский колледж моды и дизайна»
Председатель – Мнажов Жалгас Абаевич, заместитель председателя – Смаилова Акмарал Кабилбековна, секретарь– Кельдыбаева Айнура Маратовна, члены комиссии–Жетибаев Жанат Серикбаевич, Насонова Ирина Алексеевна, Мейрам Исламбек Болатұлы, Кулешова Валентина Олеговна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (210, 'Избирательный  участок № 110
Адрес: город Алматы, улица Курмангазы, 76, 
Коммунальное государственное учреждение «Гимназия №120 имени Мажита Бегалина»
Председатель – Бутабаева Кульжан Сексенбаевна, заместитель председателя – Джаксылыкова Ирина Николаевна, секретарь– Ким Антонина Трофимовна, члены комиссии – Мадышева Гульмира Тынышбековна, Абикешева Райхан Ризабековна, Кодеков Ауезбек Турсынович, Сыдыков Ануар Турсынович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (93, 'Избирательный участок №29
Адрес: город Алматы, микрорайон Кок-Кайнар, улица Мамбетова, 213.
Центр досуга «Атамура»
Председатель –Кушенов Габит Рахымбаевич, заместитель председателя – Пулатов Бахадур Исматович, секретарь –Абдрасулова Бакытгул Турдалиевна, члены комиссии -Тойгамбаева Акмарал Нуракыновна, Бактиярова Мария Есеновна, Ынтыкбаева Зульфия Мэлсовна, Ханафиева Салтанат Даулеткелдиқызы, Кульярова Биби-Гайша Гафиятовна, Касымова Ажар Николаевна, Бошенов Толеген Нурахынович, Атагозинова Гулмира Серикболовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (94, 'Избирательный участок №30
Адрес: город Алматы, микрорайон Шанырак-1, улица Утемисова, 109
Коммунальное государственное учреждение «Школа – лицей №169»
Председатель – БекеноваГульжан Мирзалиевна ,заместитель председателя – Бакитова Шаттык Бакитовна, секретарь – Әбілда Сәуле Махамбетқызы,                     члены комиссии - Нусипова Гаухар Байдалиевна, Бодаева Индира Алтынбековна, Киенбаева Майра Абдулгафаровна, Саметаева Жазира Досмаганбетовна, Нуркасымов Уалихан Ермекович, Байгазиева Молдир Куатбековна, Отарбаева Бакытгуль Еркинбековна, Мусилимова Динара Ерболатовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (95, 'Избирательный участок №31
Адрес: город Алматы, микрорайон Самгау, улица Кокорай, 14
Коммунальное государственное учреждение «Общеобразовательная школа №41»
Председатель – Дуйсембаева Бакыткуль Ракишовна, заместитель председателя – Есенова Бибихатша Кеншимбаевна, секретарь –Сүйіндік Ардақ Бақытжанқызы, члены комиссии – Кабдулкаримова Алмагуль Дуйсеновна , Макашева Баянкуль Жунусовна, Қорғанова Нұрсұлу Төрабекқызы,  Кандаулетова Кымбат Жаксыбаевна, Мұхаділова Аида Советқызы, Абдраманова Ляйля Сағындыккызы, Билибаева Жанат Болатаевна, Турсунбаева Кульзира Кудайбергеновна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (96, 'Избирательный участок №32
Адрес: город Алматы, микрорайон Айгерим-1, улица Бенберина, 52/1
Коммунальное государственное учреждение «Общеобразовательная школа №171»
Председатель –Логвиненко Светлана Федоровна, заместитель председателя – Солтанбекова Алия Алимбековна, секретарь – Маджара Венера Маратовна, члены комиссии – Нураханова Светлана Дмитриевна, Жаксыбекова Нурзия Таңатарқызы, Глухова Кристина Аркадьевна, Орманбеков Мади Нурымбаевич, 
Тымболов Дарын Оразбекович, Абдрешова Талшын Ерлановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (97, 'Избирательный участок № 33
Адрес: город Алматы, микрорайон Шанырак-2, улица Жанкожа батыра, 134.
Коммунальное государственное учреждение «Общеобразовательная школа № 26»
Председатель –Жуманова Алтынгул Алдибаевна, заместитель председателя – Умбетбаева Гулбахыт Ергешовна, секретарь –Мешитбаева Гульмира Турсуновна, члены комиссии – Рахметова Назгуль Касымхановна, Өскенбай Самал Рысбекқызы, Абдраманова Раушан Сагындыковна, Джолдасова Улбала Жумахановна, Батырханова Самал Куанышбаевна, Амантугелова Гулжанат Елтаевна, Баймухашова Шолпан Жакыпбаевна, Турысбекова Айжан Алдыархановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (148, 'Избирательный  участок № 48
Адрес: город Алматы, улицаТлендиева, 35
Коммунальное государственное казенное предприятие «Школа искусств»
Председатель – Гальберг Ирина Викторовна, заместитель председателя – Акбаева Данеш Жанысбаевна, секретарь – Сулейменова Зарима Абунакимовна, члены комиссии– Солодникова Татьяна Николаевна, Жиынбеков Уласкан Бостандыкович, Жанахметова Багадат Ашубасаровна, Гулиева Лейла Русланбековна, Тлеубердіқызы Ақеркем, Каржаубаева Марина Владимировна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (149, 'Избирательный  участок № 49
Адрес: город Алматы, улицаТуркебаева, 4       
Коммунальное государственное учреждение «Гимназия №62 имени Шона Смаханулы»
Председатель – Набидоллаева Мирамгул Набидоллаевна, заместитель председателя –Мойнакбаева Бахытсара Айдархановна, секретарь–Мусаева Айнұр Асановна, члены комиссии – Жуманова Зауре Сарсенбаевна, Нуралина Мнаура Есенгереевна, Рысменді Күлжан Өмірзаққызы, Сабитова Несипты Мурабаевна, Мезгильбаева Меиз Еркиновна, Сембаев Серик Даулетович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (98, 'Избирательный участок №34
Адрес: город Алматы, микрорайон Шанырак-2, улица Жанкожа батыра, 193А. 
Государственное коммунальное предприятие на праве хозяйственного ведения «Городская поликлиника №22»
Председатель – Мейрбаева Светлана Назарбаевна, заместитель председателя – Тулегенова Лайла Тураровна, секретарь – Мусиралиева Шолпан Кенжебековна, члены комиссии – Толегенова Асел Оразалиевна , Оразаханова Айгерим Кыргызжановна, Оспанбай Назкен Дәуітқызы, Матаева Шакизат Орынбасаровна, Сылдырбаева Лида Жумановна, Акылбаева Майнур Тыныштыкбаевна, Несипбекова Ултуар Нурумовна, Алияскарова Айгуль Базилбаевна', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (99, 'Избирательный участок №35
Адрес: город Алматы, микрорайон Ожет, улица Ауэзова, 48
Коммунальное государственное учреждение «Общеобразовательная школа     №156»
Председатель – Ахметова Гульнара Мамбетовна, заместитель председателя – Каюмова Гульнара Файдрахмановна, секретарь – Ботанова Айнур Шайсултановна, члены комиссии – Абиров Мурат Атиевич, Естаева Гульсумхан Садыковна, Наматова Арзигул Сетвалдиевна, Султанбаева Айгуль Несипбаевна, Умралиева Жанар Алимхановна,Әбілда Ақерке ақытқалиқызы, Асылова Айгерим Ерболатовна, Калиева Баян Мухамбеткалиевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (100, 'Избирательный участок №36
Адрес: город Алматы, микрорайон Аккент, 19
Коммунальное государственное учреждение «Общеобразовательная школа №181»
Председатель –  Сатаева Женискуль Имангалиевна, заместитель председателя – Алмагамбетова Патшагуль Онгарбаевна, секретарь –Аманқұл Қымбат Тресқызы, члены комиссии –Рыскельдинова Алма Омирсадыковна,Нургожаева Шолпан Текесбаевна,   Жыршыбаева Айткуль Курмановна,Кылышбаева Гульсын Касымхановна,Акдаулетов Асет Маратович, Мұхит Диас Нұржанұлы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (125, 'Избирательный участок №549
Адрес: город Алматы, микрорайон Ожет, улица Ауэзова, 48
Коммунальное государственное учреждение «Общеобразовательная школа №156»
Председатель –Ашимбаева Салтанат Сыдыкжановна, заместитель председателя – Халыкова Назерке Сеилхановна, секретарь – Курбаниязова Раиса Юсуповна, члены комиссии – Розибакиева Шадиям Шарипқызы, Акберлинова Маржан Маратовна, Чатеева Акжан Болатқызы, Тикей Ермек.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (126, 'Избирательный участок № 550
Адрес: город Алматы, микрорайон Саялы, улица Аккайнар, 7
Коммунальное государственное учреждение «Общеобразовательная школа № 180»
Председатель -Дәулетбек Ләззәт Байшымырқызы, заместитель председателя –Мұса Аяулым Бағданқызы, секретарь –Сәдібеков Қуан Сапибекұлы, члены комиссии –Джанпеисов Әмірлан Бауыржанұлы, Бердибеков Жандос Туткабаевич, Искакова Нагима Болатовна, Бектаева Молдир Базаралиевна,Килыбаева Айгуль Джапсарбаевна,Даулбаева Кумисай Оразовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (127, 'Избирательный участок №569
Адрес: город Алматы, микрорайон Нуркент, 12
Коммунальное государственное учреждение «Общеобразовательная школа №201»
Председатель - Байтасов Азамат Таттымбетович, заместитель председателя –Молдабаева Гульжан Маликпаевна , секретарь -Беристемова Нуржамал  Косымтаевна, члены комиссии -  Жумабаев Айбек Ахметгалиевич, Мырзабекова Нурсулу Ержановна,Шажабаева Жадыра Атыбаевна,Сыздықов Әлімжан Қалдыбайұлы,Әбдіқадір Әділет Нұрболатұлы ,Жампеисова Асем Ерлановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (150, 'Избирательный участок № 50
Адрес: город Алматы, улица Тургута Озала, 30 
Коммунальное государственное учреждение «Общеобразовательная школа № 58»
Председатель – Нурбаева Светлана Муратовна, заместитель председателя – Кудекова Салтанат Ерболатовна, секретарь– Сулейменова Раиля Азатовна, члены комиссии – Галиева Асель Азатовна, Дильмуханова Гулнара Умировна, Сакпанова Гульпия Какимовна, Оспанова Эльвира Адилбаевна, Талипова Зульфат РоманкулқызРРоманкулкызы, Рящикова Людмила Александровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (101, 'Избирательный участок №37
Адрес: город Алматы, микрорайон Акбулак, улица Суатколь, 41
Коммунальное государственное учреждение «Физико-математический лицей №178»
Председатель – Шадиев Кайратбек Хамзаханович, заместитель председателя – Утешова Мейрхан Куантаевна, секретарь – Есмолдаева Жанар Рыскулбековна, члены комиссии–Кутумов Берик Набиевич, Кәрібай Аида Бақытқызы, Несипханова Назира Ертисхановна, Танцарова Ажар Захарьяновна, Мундаев Еркебулан Смаилханович, Кубеев Токтар Маккамбаевич.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (102, 'Избирательный участок №482
Адрес: город Алматы, микрорайон Шанырак-1, улица Утемисова, 73
«Республиканская специализированная школа-интернат-колледж олимпийского резерва»
Председатель – Куншыбаев Токтасын Казиакпарович, заместитель председателя – Мананбаева Гаухар Есеновна, секретарь КасымбековаЗауре Асановна, члены комиссии – Кожамсеитова Рыскуль Бейсеркеевна, Есжан Ардақ Сеитқызы, Әбдіқалық Назерке Ерланқызы,Аргынова Гаухар Ахыновна, Искакова Гаухар Шарбахыновна, Камбарова Жадыра Рахымбаевна, Уразова Жанар Маратовна, Кошенова Салтанат Сайдрахмановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (103, 'Избирательный участок №483
Адрес: город Алматы, микрорайон Улжан-1, улица Жалайыр, 34
Государственное коммунальное предприятие на праве хозяйственного ведения «Городская поликлиника №23»
Председатель –Ашен Сауле Ахатқызы, заместитель председателя Жампозова Салтанат Жансеркеевна, секретарь –  Бисенова Назым Сисенбаевна, члены комиссии – Пиралиева Зульфия Сериковна, Бекешева Рауза Карасакбаевна. Курмангалиев Ерлан Майданович, Тулегенова Кулжан Оразбековна, Мамбеткерей Жасұлан Нұраханұлы, Алимгазиева Казына Тұрлықожаевна, Қапашов Бекболат Ақылбекұлы, Азербаева Гаухар Бекмуратовна', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (104, 'Избирательный участок №484 
Адрес: город Алматы, микрорайон Акбулак, улица Чуланова, 159.Государственное коммунальное предприятие «Центральный
государственный архив города Алматы»
Председатель –Наурызбай Гульжан Бисимбековна, заместитель председателя – Меркуленкова Инна Сергеевна, секретарь –Баймухырова Сайран Аскербековна, члены комиссии –Тойлыбай Әсел Нурланқызы, Саханова Асель Муеретовна, Джамантаева Раушан Бисимбековна , Құрамаев Нұрлыбек Абильбекұлы ,Сарсенбаева Гулжайна Нағашбайқызы,Байгамысова Шолпан Килимжановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (151, 'Избирательный  участок № 51
Адрес: город Алматы,  проспект Райымбека, 212/2 
Товарищество с ограниченной ответственностью «Бизнес парк на Райымбека»
Председатель – Ошакбаева Айгуль Кельгентаевна, заместитель председателя –– Омиршенова Карлыгаш Ануарбекқызы, секретарь– Сулейменова Ерке Сейсеналиевна, члены комиссии - Моисеев Анатолий Константинович, Тулегенова Рысгуль Сейдахметовна, Джуаспаев Аскар Кыдырбекович, Байсакалова Гульжан Панышпековна, Аманов Алмас Гайдарұлы, Жакипова Анаргуль Оралхановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (152, 'Избирательный  участок № 52
Адрес: город Алматы, улица Розыбакиева, 31в 
Коммунальное государственное учреждение «Общеобразовательная школа № 67»
Председатель – Демеуова Бейбитгуль Нурахметовна, заместитель председателя – Кабланбекова Гульмира Касымхановна, секретарь– Тұрсынғалиқызы Мөлдір, члены комиссии – Битанова Айна Женисовна, Омаров Мурат Турсынович, Сельтаева Шынара Бейсехановна, Нуранова Гаухар Багдатқызы, Шукенова Назым Утегенқызы, Кожабекова Альбина.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (105, 'Избирательный участок №485
Адрес: город Алматы, микрорайон Алгабас, улица Алдияр, 16
Коммунальное государственное учреждение «Общеобразовательная
школа №185»
Председатель –Кержикеева Данагуль Рысбаевна, заместитель председателя – Мамырова Эльмира Асыловна, секретарь –Қали Ақылбек Самарханұлы, члены комиссии – Назар Наргиза Ержанқызы, Жакан Юсуф Мауленұлы, Уталипова Аниям Турганжановна, Пірімқұл Марта Бөрібекқызы, Балтабаева Сымбат Алмасқызы, Касенова Алия Кайыпбековна, Нурпеисова Гульназ Акытовна, Курумбаева Карашаш Абдикеримовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (106, 'Избирательный участок №486
Адрес: город Алматы, микрорайон Теректи, улица Мектеп, 6 Б
Коммунальное государственное учреждение «Общеобразовательная школа №184»
Председатель -  Оразбек Құрбан Жұмаханұлы, заместитель председателя - Соловьева Валентина Петровна, секретарь -  Жолдасова Айғаным Арыстанбекқызы, члены комиссии - Баккараева Мансия Милтикбаевна, Досалинова Салтанат Рубаевна, Белгібайқызы Мадина, Түсіпбаева Гульида Абзельгожақызы,Боранбаева Кулаш Болатовна, Алимова Алима Улхожаевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (107, 'Избирательный участок № 487 
Адрес: город Алматы, микрорайон Рахат, улица Байжанова, 1Б.
Коммунальное государственное учреждение «Общеобразовательная школа № 196»
Председатель -Амангельдинова Жанат Бакиджановна, заместитель председателя - Молдахмет Гулжан Нұрғожақызы, секретарь - Омарова Нурбану Турсынгалиевна, члены комиссии - Бейсебекова Майраш Сеилхановна,  Шекербекова Раушан Думанқызы, Касенова Гульзия Абилгазиевна, Касенова Айнур Омаровна, Ибагалиева Гульнур Нурланхановна, Бабалыкова Зайра Махмутовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (108, 'Избирательный участок № 488
Адрес: город Алматы, микрорайон Боралдай, улица Саттаровой, 56.
Коммунальное государственное учреждение «Школа-гимназия № 39»               
Председатель –Қалабаева Әсемкул Темірбекқызы, заместитель председателя – Калибек, секретарь –  Санақбек Арайлым Әбдіманатқызы, члены комиссии –Желеуова Райхан Мәкенқызы, Утегенов Урал Жанабаевич, Азимбекова Анара Сериковна , Абдулгазиева Гулзия Нургалиевна, Саятқызы Айдана , Самсабаева Мадина Болатқызы', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (153, 'Избирательный  участок № 53
Адрес: город Алматы, улица Розыбакиева, 31в
Коммунальное государственное учреждение «Общеобразовательная  школа №67»
Председатель– Омарбекова Лэззат Диханбаевна, заместитель председателя – Казакпаев Сержан Капсолович, секретарь– Елеубаева Перийзат Жанузаккызы, члены комиссии–Көбекбай Нұрсезім Бақытқызы, Бекбаев Ермек Ахметбекович, Найзабекова Жаухар Сабитовна, Тулеуова Бота Сериковна, Кадырмышева Салтанат Нурмадиевна, Хен Ирина.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (154, 'Избирательный  участок № 54
Адрес: город Алматы, улица Шевченко, 202 
Государственное коммунальное казенное предприятие «Алматинский полиграфический колледж»
Председатель – Калиниченко Елена Дмитриевна, заместитель председателя – Карипова Сакия Адиевна, секретарь– Габдуллин Марат Маратович, члены комиссии– Умарбекова Дария Токеновна, Кулбекова Айнур Сакеновна, Макашева Сауле Сабиркановна, Имангалиева Гулсая Кошкинбаевна, Цой Елена Юрьевна, Ускенбаева Малика Муратовна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (109, 'Избирательный участок №524
Адрес: город Алматы, микрорайон Айгерим-1, улица Бенберина, 52
Коммунальное государственное учреждение «Общеобразовательная школа №149»
Председатель – Дуйсенбинова Улпан Даулетовна, заместитель председателя -Бейсембаева Гулнар Абдрахмановна, секретарь - Сагимбаева Салтанат Жакановна, члены комиссии –Акимбаева Агайша Салимжановна, Нусипкожаева Ботакоз Баратбековна, Тлеужанова Галия Есенбаевна, Асылқызы Сайрамкуль, Сеитова Жохарбуви Жунысовна, Талипова Гульмира Хусаиновна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (110, 'Избирательный участок № 533
Адрес: город Алматы, микрорайон Саялы, улица Аккайнар, 7 
Коммунальное государственное учреждение «Общеобразовательная школа № 180»
Председатель –Нұрланқызы Камила, заместитель председателя – Омуркулов Нурлан Даниевич, секретарь –Токтыбаева Алха Аманкельдиевна, члены комиссии – Манапов Даурен Азаматович, Оралханова Бибигуль Раушановна, Егемова Кыздыкой Байшыгаровна, Абдукадыр Шолпан Даулетқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (111, 'Избирательный участок № 525 
Адрес: город Алматы, микрорайон Айгерим-1, улица Бенберина, 52/1 
Коммунальное государственное учреждение «Общеобразовательная школа № 171»
Председатель – Садыкова Алия Сагындыковна, заместитель председателя – Чанкенова Гульнара Николаевна, секретарь – Оразбекова Лазат Нургалиевна, члены комиссии – Баймухамбетова Кулимжан Тюлегеновна, Маджара Сергей Николаевич,  Солтанбеков Алибек Тойбекович, Арипова Сурея Яяевна, Бектибаева Нуржамал Сопуховна, Трубакова Галина Николаевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (112, 'Избирательный участок №526
Адрес: город Алматы, микрорайон Теректи, улица Мектеп, 6 Б
Коммунальное государственное учреждение «Общеобразовательная школа №184»
Председатель - Омарова Жазира Кененовна, заместитель председателя - Адилбекова Алия Тастемировна, секретарь –Қалықова Бану Кенжебекқызы, члены комиссии –Ахметжанова Динара Ураловна, Досболова Бальнур   Отжановна, Джуманова Алия Белкожаевна, Касенова Айнур Шайхислямовна, Байболаева Айнұр Құдайбергенқызы, Стамбакиева Нурила Жумахановна, Тункаева Анар Ауелхановна, Туганбаева Карлыгаш Каратаевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (155, 'Избирательный  участок № 55
Адрес: город Алматы, улица Курмангазы, 150
Общежитие № 3 акционерного общества «Казахский университет международных отношений и мировых языков имени Абылай хана»
Председатель – Сержанов Бауыржан Ерланұлы, заместитель председателя – Дошыбеков Айдын Багдатович, секретарь– Утепбаева Мариямкуль Орынбековна, члены комиссии– Есенгалиева Батима Амиржановна, Брянцева Екатерина Викторовна, Наурызбаев Серик Калибекович, Ханаева Азиза Рахматуллаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (156, 'Избирательный  участок № 56
Адрес: город Алматы, улица Ауэзова, 66/5,
Республиканское государственное предприятие «Республиканская казахская специализированная музыкальная школа-интернат для одаренных детей имени Ахмета Жубанова»
Председатель – Динжанова Толганай Мухиденовна, заместитель председателя –Жакишева Гүлбараш Абжапбаровна,секретарь–Жартаева Гульзира Жиеналиевна, члены комиссии – Мельдеханова Хафиза Бахытқызы, Несипбаев Ерлан Шалхарович, Құрбанбаев Оралбек Үкібайұлы, Ануарбекова Раушан Абдуллаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (113, 'Избирательный участок № 527
Адрес: город Алматы, микрорайон Алгабас, улица Алдияра, 16
Коммунальное государственное учреждение «Общеобразовательная школа       № 185»
Председатель -Балтабаев Мурат Бекмухамедович, заместитель председателя - Туманшиева Фариза Қайратқызы, секретарь –Нургельдиева Билимбала Султангеримовна, члены комиссии -Мамырова Мадина Амантаевна, Конырбаев Маулен Жаканович, Аюпова Назым Алиятовна, Оразымбетова Меруерт Бейбитовна, Арепова Лаззат Дуйсенбаевна, Смаилова Жулдуз Елеусизовна, Абилдаев Дархан Акжолтаевич, Омарбаева Жазира Серікқалиқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (114, 'Избирательный участок №528
Адрес: город Алматы, микрорайон Алгабас, улица Алдияра, 16
Коммунальное государственное учреждение «Общеобразовательная школа №185»
Председатель -Тиналиева Гулбаран Акшабаевна, заместитель председателя -Құрманбек Назгул Бидайбекқызы, секретарь -Жомартова Асем Қасымғазыевна,  члены комиссии -Чалова Асем Жумановна, Екибаева Лаура Кошкарбаевна, Сатыкбаев Ерсаин Кызырович, Кисимисова Кульжахан Желдыбаевна, Аманбекова Эльдана Мадиярқызы, Сқабай Қайрат Мадиярұлы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (115, 'Избирательный участок № 529
Адрес: город Алматы, микрорайон Акбулак, улица Чуланова, 159. 
Государственное коммунальное предприятие «Центральный государственный архив города Алматы»
Председатель -Есжанова Гульжан Акаевна, заместитель председателя - Бектасова Лариса Буркитбаевна, секретарь –Макашбаева Фарида Канатбековна, члены комиссии - Кыдырбаева Дарига Батырхановна, Исаева Галия Демесиновна, Акай Саяра, Сыдыков Аскар Аблакатович, Сейтказиева Гульмира Нурдаулетовна, Жаканова Камшат Базарбаевна, Әділбек Айсұлу Қуанышқызы. Дюсупова Анара Кадылбековна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (116, 'Избирательный участок №530
Адрес: город Алматы, микрорайон Зерделі, 65
Коммунальное государственное учреждение  «Общеобразовательная школа  №182»
Председатель – Агадилова Улжалгас Беркалиевна, заместитель председателя – Менғали Нұргүл Тоқтасынқызы, секретарь – Хасанова Айгуль Садыргалиевна, члены комиссии –Толеуханова Акерке Нургалиевна, Кукенова Райгул Сундетовна, Джумасейтова Кенжекан Мустаковна, Ботаназарова Айнур Алтынбековна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (157, 'Избирательный  участок № 57
Адрес: город Алматы, улица Клочкова, 49  
Коммунальное государственное учреждение «Общеобразовательная школа № 135»
Председатель – Сейсебаева Эра Кенесовна, заместитель председателя – Хамитжанов Айбар Турсынович, секретарь– Апирова Бахыт Ещейевна, члены комиссии– Алшымбекова Жанат Сейдильдаевна, Базаркулов Ербол Сакенович, Бокатова Айнагул Самижановна, Жармуханова – Исаева Жания Манарбековна, Апирова Айгерим Мухаметовна, Ундибаев Даурен Кайратович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (158, 'Избирательный  участок № 58
Адрес: город Алматы, улица Радостовца, 38
Республиканское государственное учреждение «Гимназия №18»
Председатель – Сисенбердиева Асем Дюсенкуловна, заместитель председателя – Ходжабеков Ильяс Сабидуллаевич, секретарь– Абдикаримова Айгуль Жангабыловна,члены комиссии–Баяндина Ольга Сергеевна,Гаврюшенко Татьяна Александровна, Молдабеков Медет Галимович,Чакантаев Серик Толеуович,Мұхамеджан Айжан Бекжанқызы, Нурашев Дидар Айдарович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (117, 'Избирательный участок №531
Адрес: город Алматы, микрорайон Аккент, 19
Коммунальное государственное учреждение «Общеобразовательная школа №181»
Председатель - Муханбеталиева Толкын Бейсеновна, заместитель председателя -Сыдыкбекова Гульнар Шарипбаевна, секретарь -Алдаберді Мархабат Тәттібайқызы, члены комиссии - Момбекова Меруерт Кайратовна,   Азатова Бакытгуль Куандыковна,Мансуров Мундаш Мансурогли,Алмагамбетов Жаркинбек Абдимуслимович, Канаев Алмат Серикович, Сейлханова Макира.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (118, 'Избирательный участок №532
Адрес: город Алматы, микрорайон Карасу, улица Шаяхметова, 17/8
Коммунальное государственное учреждение «Общеобразовательная школа №179»
Председатель –Карбозова Айгуль Талеевна, заместитель председателя – Скакова Аида Алижановна, секретарь –  Муканова Жанар Мадылхановна, члены комиссии – Абдрахманова Рабигуль Рахмахуновна, Олжабаев Серик Усербаевич, Абдыкалыков Канат Асетович ,Жунусова Айгуль Тасболатовна,Бегманова Жамила Мейрмановна, Мустафинова Гаухар Советкызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (119, 'Избирательный участок № 534
Адрес: город Алматы, микрорайон Шанырак-2, улица Жанкожа батыра, 134. 
Коммунальное государственное учреждение «Общеобразовательная школа № 26»
Председатель –Нуртаев Жанторе Нуржауович, заместитель председателя – Муса Ләззат Тәнірбергенқызы, секретарь - Байбалақова Зейнегүл Қырғызбайқызы, члены комиссии – Серикбаева Фарида Махмудовна ,Кабылова Салтанат Тилеулескызы,Сиязбекова Шолпан Манарбаевна,Әбдірәсіл Айжан Алматқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (120, 'Избирательный участок №535
Адрес: город Алматы, микрорайон Шапагат, улица Биянху, 87                       
Коммунальное государственное учреждение «Общеобразовательная школа №150»
Председатель – Мухамметова Рехимбуви Мухамметовна, заместитель председателя – Маметова Гульпям Рустамовна, секретарь –Зунунова Гулистан Мухидинова, члены комиссии – Зиявдинов Имамдун Шавдунович, Ходжамбердиева Гульбахар Сетвалдиевна,  Лома Динара Жамаловна, Едильбаева Арайлым Акынгалиевна, Касымов Мурадил Абдурашитович, Коспаева Индира Торебаевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (159, 'Избирательный  участок № 59
Адрес: город Алматы, улица Жарокова, 18 
Коммунальное государственное учреждение «Общеобразовательная школа № 128 имени Мухтара Ауэзова»
Председатель – Тазабекова Нуржамила Айтбаевна, заместитель председателя – Ибрайымова Салтанат Указовна, секретарь– Қалдыбекова Гүлжазира Орынбасарқызы, члены комиссии–Олжаева Умит Турсункуловна, Досполова Сауле Амангельдиновна, Махамбетова Раушан Абуовна,Тюлеубекова Раушан Шаярияевна, Тиранова Махинур Камбуловна, Бубекбаев Жарас Нусипджанович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (160, 'Избирательный  участок № 60
Адрес: город Алматы, улица Туркебаева, 93 
Коммунальное государственное учреждение «Школа-гимназия № 144»
Председатель- Саламатова Алия Казбековна, заместитель председателя – Ибышева Мариям Акпаровна, секретарь– Канагатова Акмарал Иркенкожаевна, члены комиссии–Нусупбаева Асем Умырсериковна, Ким Яна Станиславовна, Әбу Абай Қосылбекұлы, Именов Ахмед Ахатович, Радивилова Ольга Перфильевна, Таипов Тахиржан Кенжемұлы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (121, 'Избирательный участок №545
Адрес: город Алматы, микрорайон Нуркент, 6
Коммунальное государственное казенное предприятие «Театр традиционного искусства «Алатау»
Председатель - Бекмухамедова Айгуль Мурзагалиевна, заместитель председателя - Шауменова Жанар Жамагатовна, секретарь -Қабдырова Шынар Асылтаевна, члены комиссии - Мусилимов Галымжан Турсыналиевич, Конырова Динара Амиржановна, Араев Айдын Болатович, Терликбаев Кайсар Айткожаевич, Смаилова Райхан Ермуханбетовна, Аманкулова Ботагоз Пашаровна, Талканбаева Зарина Канатовна, Токтасынова Назерке Ержанқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (122, 'Избирательный участок №546
Адрес: город Алматы, микрорайон Зердели, 371/3
Государственное коммунальное предприятие на праве хозяйственного ведения «Городская поликлиника №29»
Председатель –Пернебаева Индира Шарипбековна, заместитель председателя –Тлеукеева Жанар Бакытжановна, секретарь – Байсеитова Айсулу Торехановна, члены комиссии – Медведева Ирина Анатольевна, Жапақұлы Мали, Алтынбек Асель, Орынбаева Багдат Кабдашовна, Насыр Айгул Махмұдқызы,Мекешова Дарига Амангелдиевна', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (123, 'Избирательный участок №547
Адрес: город Алматы, микрорайон Дархан, улица Алтай, 20/2
Государственное казенное коммунальное предприятие  «Ясли – сад № 168»
Председатель –Алдекова Баян Садуевна, заместитель председателя –Айтыманова Ботакоз Базарбаевна, секретарь -Таштиева Айнагуль Аскеровна, члены комиссии -Мырзалиева Жансая Кенғесбайқызы, Жыланбаева Жупар Калихановна, Оразова Галина Хитмановна,Альжанова Шолпан Амзеевна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (124, 'Избирательный участок №548
Адрес: город Алматы, микрорайон Самгау, улица Кокорай, 66
Коммунальное государственное учреждение «Общеобразовательная школа №41»
Председатель –Есжанова Айжан Есиркеповна, заместитель председателя –Айнабекова Сауле Шариповна, секретарь – Сыикимбекова Гулден Мухамедкалиевна, члены комиссии – Салимбаева Тлеужан Бахмуровна, Бегарысова Айман Мукаметжановна, Байтокаева Улшат Шадматовна, Карбозова Роза Байбатыровна, Томанова Света Асылқызы, Ромаш Мария Ердәулетқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (161, 'Избирательный  участок № 61
Адрес: город Алматы, улица Карасай батыра 205
Коммунальное государственное учреждения «Гимназия № 79»
Председатель – Цай Раиса Андреевна, заместитель председателя – Диханбаева Жанаргул Алимбердиевна, секретарь– Кенжеева Асия Муратовна, члены комиссии– Плюснин Иван Владимирович, Голомолзина Юлия Сергеевна, Карпыкова Айдын Болатовна, Кузько Анна Владимировна, Икапов Данияр Саркытович, Хан Инга Аркадьевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (162, 'Избирательный  участок № 62
Адрес: город Алматы, улицаРадостовца, 38,
Коммунальное государственное учреждения «Гимназия № 18»
Председатель – Абзулина Зауреш Касымовна, заместитель председателя – Мамытханова Бану Сансызбаевна, секретарь– Тургунова Эльмира Туралиевна, члены комиссии–Касенова Аяулым Тұрсынқызы, Сейсеналинова Хадиша Мухтарбековна, Петров Александр Степанович, Жапаков Орынбасар.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (163, 'Избирательный  участок № 63
Адрес: город Алматы, улица Карасай батыра 205
Коммунальное государственное учреждения «Гимназия № 79»
Председатель – Каймакбаева Салтанат Сталикқызы, заместитель председателя –Абдыкалыкова Ольга Петровна, секретарь– Абдыкалымова Рухиям Нурмухаметовна, члены комиссии–Когай Ирина Владимировна, Ахмедов Исмаил Мырзабаевич, Когай Ирина Владимировна, Ахмедов Исмаил Мырзабаевич, Исаева Гульмира Сериковна, Чормакова Жания Болатовна, Ахметова Нургуль Базылбековна,Зубков Валерий Леонидович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (128, 'Избирательный участок №570
Адрес: город Алматы, микрорайон Нуркент, 12
Коммунальное государственное учреждение «Общеобразовательная школа №201»
Председатель – Шамова Арайлым Мәтжанқызы, заместитель председателя –Құнанбаева Арайлым Әсетқызы, секретарь -Есенова Диара Жылкышиевна, члены комиссии -Айтбек Шолпан Ермухаметқызы,Байсалбекова Жупар Макаджановна , Тульбаева Назира Эрнстовна,Сыдыққұл Индира Ернатқызы,Сейткулова Аннар Валкановна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (129, 'Избирательный участок № 571 
Адрес: город Алматы, микрорайон Саялы, улица Аккайнар, 7. 
Коммунальное государственное учреждение «Общеобразовательная школа № 180»
Председатель -Мустафина Арайлым Асхадовна, заместитель председателя -Мезибаева Айнур Асылгазиевна, секретарь -Бигалиева Акнур Амантаевна, члены комиссии - Басшыбаев Мамыт Бейбитович,Самылтырова Бакыт,Даулбаева Кумисай Оразовна,Тойгамбаев Нуракын Гинаядович,Турысбеков Аслан Аканович,Кудайбергенов Болат Серикказынович.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (130, 'Избирательный участок №572
Адрес: город Алматы, микрорайон Акбулак, улица Суатколь, 41.                   
Коммунальное государственное учреждение «Физико-математический лицей №178»
Председатель -Шажабаева Кульжан Сауытовна, заместитель председателя -Ахмеджанова Айжан Дарушовна, секретарь -Қанат Ақтолқын Қанатқызы, члены комиссии -Байғұмұрова Айгүл Айтқұрманқызы,Нурхамит Аяжан,СағиолдановТалант Бақытұлы,Абитаева Акгуль Бейсенхановна,Сафиева Галия Кинаятовна,Келденов Санат Кадирбаевич.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (131, 'Избирательный участок №573
Адрес: город Алматы, микрорайон Алгабас, улица Алдияра, 16.
Коммунальное государственное учреждение «Общеобразовательная школа №185»
Председатель - Исаханова Камшат Ашировна, заместитель председателя -Байсалбаев Мухит Сакенович, секретарь- Петрханова Таңшолпан Әділханқызы, члены комиссии -Жаканова Нургуль Бодаубековна,Байсеркеева Жанар Нургайповна,Койбекова Гуля Адамбаевна,Наурызбай Серікболсын Жексембайұлы,Сабденкулова Айнур Абуалиевна,Султангазиева Лазат Тохтаровна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (164, 'Избирательный  участок № 64
Адрес: город Алматы, улицаМанаса, 13
Республиканское государственное казённое предприятие «Алматинский музыкальный колледж  имени Пётра Ильича Чайковского»
Председатель – Нельдыбаева Бибигуль Нарымбековна, заместитель председателя – Нурсейтова Гулзира Айтбаевна, секретарь– Дайрабекова Ирина Булатовна, члены комиссии– Чистякова Тамара Александровна, Темиров Нурдан Мурзабаевич, Айхожаев Амиржан Рахимжанович, Сабирова Алмагуль Сериковна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (165, 'Избирательный  участок № 65
Адрес: город Алматы, улица Манаса, 13 
Республиканское государственное казённое предприятие «Алматинский музыкальный колледж  имени Пётра Ильича Чайковского»
Председатель – Хасангалиев Биржан Ескендирович, заместитель председателя – Рахымбаева Гульнар Базарбаевна, секретарь– Тайтеленова Ардақ Габдрахимовна, члены комиссии– Суюнтаева Майра Капташевна, Мусульманов  Назымбек Кадыржанович, Секеев Галымжан Куракбаевич, Шанбаев Есбол Жарылкасынович, Тулешев Жанбол Толеуович, Манашов Сабыржан Сейтахунович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (132, 'Избирательный участок № 574 
Адрес: город Алматы, микрорайон Зердели, 65
Коммунальное государственное учреждение «Общеобразовательная школа № 182»
Председатель – Сабирова Ардак Қуанышбековна, заместитель председателя -Сералы Асхат Далханбекұлы, секретарь -Алгазиева Лаззат Омирсериковна, члены комиссии -Курымбай Талшын Ерланқызы,Космаилова Лязат Геннадьевна,Беспаева Айнаш Токташбаевна,Сулейменова Айжан Адиловна,Оразбек Әсел Оразбекқызы, Калдынова Гульжан Бакешовна', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (133, 'Избирательный участок №587 
Адрес: город Алматы, микрорайон Саялы, улица Аккайнар, 7
Коммунальное государственное учреждение «Общеобразовательная школа № 180»
Председатель -Изимханова Жанат Оразбаевна, заместитель председателя – Майманов Дарын Беделович, секретарь – Момынқұлова Таңшолпан Жанатқызы, члены комиссии – Нургалыкова Аяна Бакытқызы,Камалбеков Аслан Талгатулы,Жәлелов Мағжан Жадырасынұлы,Исмаилова Дина Мухаметжановна,Юсупова Фарида Асымовна,Жабаева Сара Нурболатовна.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (134, 'Избирательный участок № 588 
Адрес: город Алматы, микрорайон Зердели, 65
Коммунальное государственное учреждение «Общеобразовательная школа № 182»
Председатель -Солтанбеков Әли Солтанбекұлы, заместитель председателя – Есенгелді Айдана Натанқызы, секретарь –  Қабылова Қымбат Чырбайқызы, члены комиссии – Ахметова Улбосын Абилкасимовна,Болатова Асель Бегайдаровна,Мамбетов Жансерик Шайзадаевич,Бекенов Роллан Омарқазыұлы,Абенова Айнур Алимжановна,Аусабаев Талгат Каниахметович', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (135, 'Избирательный участок № 589 
Адрес: город Алматы, микрорайон Боралдай, улица Саттаровой, 56. 
Коммунальное государственное учреждение «Школа-гимназия № 39»
Председатель -Бөбетаев Нұрберген Нұрбосынұлы, заместитель председателя-Жетписбаева Саида Еркиновна, секретарь-Усканбаева Динара Рахимгалиевна, члены комиссии – Туйебаева Елдана Медетбаевна, Бейсбекова Карлыгаш Самархановна, Кайнарбекова Айнур Бекжановна, Мейрамбекова Аяла Ержанқызы, Даулет Гулнур Атагелдиевна,Ақажанова Бақытжан Асқарқызы.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (166, 'Избирательный  участок № 66
Адрес: город Алматы, улица Байзакова, 238
Республиканское государственное предприятие «Республиканская школа-интернат для одаренных в спорте детей имени Каркена Ахметова»
Председатель – Смагулова Дамира Муратовна, заместитель председателя – Манапов Ержан Кырыкбаевич, секретарь– Кайрат Кундыз Кайратовна, члены комиссии– Мұсаева Салтанат Жайыққызы, Темирбаева Жанар Амангельдиевна, Айдосұлы Айбар, Шевчук Ирина Сергеевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (167, 'Избирательный  участок № 67
Адрес: город Алматы, улица Жарокова, 18  
Коммунальное государственное учреждение «Общеобразовательная школа № 128 имени Мухтара Ауэзова»
Председатель – Есдаулетова Жаннат Джумадиловна, заместитель председателя – Мәуленкұл Нағима Әметханқызы, секретарь– Досполова Сайра Амангельдиновна, члены комиссии– Сутбаева Маржан Ахатовна, Ынтыбаева Салтанат Сайлаухановна, Амунатова Зайнаб Рахмуддиновна, Байгалиева Толкын Амангельдиновна, Садыркулов Ержан Салкынбекович, Кайырбаева Алмагул Ахтаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (136, 'Избирательный участок № 590 
Адрес: город Алматы, микрорайон Зердели, 65
Коммунальное государственное учреждение «Общеобразовательная школа № 182»
Председатель -Нурабилова Гульбану, заместитель председателя – Нургали Майнур Аксубаевна, секретарь – Абдилдаева Акмарал Бекбергеновна, члены комиссии – Адешова Нурила Калдановна,Шайық Еркежан Нұрланқызы,Спанәлі Назерке Тәжібайқызы,Әбу Асыл Жаксылыкулы, Асан Султан Олжасұлы, Абукалиев Жаксылык Ргебекович.', 1);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (168, 'Избирательный  участок № 68
Адрес: город Алматы, улица Карасай батыра, 140
Авторская школа  Жании Аубакировой
Председатель – Даутбаев Асылбек Сагынбаевич, заместитель председателя – Каскабаева Перизат Рахметуллаевна, секретарь– Ветрова Елена Олеговна, члены комиссии– Аждарбекова Алия Болатбековна, Саналиев Нурлан Атакозыұлы, Каскенова Жанар Алтаевна, Смородина Людмила Константиновна, Шоинбай Жанар Жумагазыкызы, Жусипова Акмарал Оразбаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (169, 'Избирательный  участок № 69
Адрес: город Алматы, улицаБогенбай батыра, 260
Коммунальное государственное учреждение «Общеобразовательная школа № 124»
Председатель – Кокебаева Гулмира Сериккалиевна, заместитель председателя – Балгарбаева Гульшат Абатовна, секретарь–Қаныбек Алтынай Дауталықызы, члены комиссии–Келемеденов Ермек Кумарбекович, Бабаканов Ринат Турарбекович, Беримова Жаркынай Елубаевна, Манапбаева Жұлдыз Бекболатқызы, Коркембаева Айгуль Абдымажитовна, Мадиева Гульнара Баянжановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (170, 'Избирательный  участок № 70
Адрес: город Алматы, улица Карасай батыра, 157
Коммунальное государственное учреждение «Гимназия № 46»
Председатель – Шингисбекова Ардак Сеитовна, заместитель председателя –Петров Александр Анатольевич, секретарь–Тойшыбекова Назира Бахытжановна, члены комиссии–Стамбекова Аида Мустафаевна, Сатыбалдиева Акбота Жумадиловна, Кужахметов Ришат Шамильевич, Ахмеджан Аида Рахымжанкызы, Сычёв Родион Валерьевич, Нестерова Карина Марленовна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (171, 'Избирательный участок № 71
Адрес: город Алматы, улица Туркебаева, 93 
Коммунальное государственное учреждение «Школа-гимназия № 144»
Председатель – Берко Марина Васильевна, заместитель председателя – Даулетина Айжан Батырбековна, секретарь– Костюк Зиана Хасановна, члены комиссии– Аноятова Дилара Токтасыновна, Шахворостова Анна Владимировна, Алланиязова Жадра Куатовна, Таипова Наргиз Пархатовна, Мырзахметова Жанар Аскербаевна, Именов Азамат Ахатұлы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (180, 'Избирательный  участок № 80
Адрес: город Алматы, улица Курмангазы, 119 
Общежитие №1 акционерного общества «Казахского национального медицинского университета имениСанжара Джафаровича Асфендиярова»
Председатель – Нагасбекова Баян Сериккановна, заместитель председателя – Насырова Сахиба Таировна, секретарь– Садуакасова Гульмира Мырзабековна, члены комиссии–Рахмет Олжас Ахметулы, Сванбаева Гульжан Тезекбаевна, Изимова Гульнара Акимжановна, Жанаева Айгүл Дүйсенбайқызы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (181, 'Избирательный  участок № 81
Адрес: город Алматы, улица Карасай батыра, 157 
Коммунальное государственное учреждение «Гимназия № 46»
Председатель – Суюндикова Айнур Аманбаевна, заместитель председателя – Жангельдина Аида Избастыевна, секретарь – Кебирова Зинагуль Таировна, члены комиссии–Сакиева Сагыныш Жанатовна, Тулешова Каламхас Симаевна, Лебедева Виктория Юрьевна, Васильева Элина Борисовна, Мухаметжанова Ирина Евгеньевна, Жакишева Гульнар Мукановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (182, 'Избирательный  участок № 82
Адрес: город Алматы, улица Кабанбай батыра, 125/105а 
Коммунальное государственное учреждение «Школа-гимназия № 8»
Председатель – Мусатаева Виктория Назымовна, заместитель председателя – Петрыкина Евгения Валерьевна, секретарь–Ниемисто Светлана Анатольевна, члены комиссии– Темирбеков Назымхан Аппарханович, Мухаева Динара Тарасовна, Макишев Азат Замирұлы, Тагир Эльмира Амиржанкызы, Балакаева Татьяна Викторовна, Гордиенко Артём Александрович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (183, 'Избирательный  участок № 83
Адрес: город Алматы, улица Джамбула, 102
Государственное коммунальное казенное предприятие «Алматинский государственный колледж  транспорта и коммуникаций»
Председатель – Джайдаров Марат Ментаевич, заместитель председателя – Бойко Елена Анатольевна, секретарь– Ержанова Айдана Женісқызы, члены комиссии– Асылбекова Гульмира Джаксыбаевна, Намыс Ержан Намысулы, Темирбекова Раушан Бахытбековна, Имангалиев Думан Мырзагалиевич.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (184, 'Избирательный  участок № 84
Адрес:город Алматы, улица Шевченко, 97
Акционерное общество «Казахская академия транспорта и коммуникаций имени Мухамеджана Тынышпаева»
Председатель – Аширбаев Галымжан Кожахатович, заместитель председателя –Корабаев Елдос Нурланович, секретарь– Бугенова Лэля Аманжоловна, члены комиссии–Нугуманов Шындауыл Елмуратович, Глинкина Елена Александровна, Киштай Альбина Маликқызы, Жетписбаева Гаухар Талгатовна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (185, 'Избирательный  участок № 85
Адрес: город Алматы, улица ШариповаАди, 105-а
Коммунальное государственное учреждение «Школа-гимназия №8»
Председатель – Смагулова Ардак Рахимгалиевна, заместитель председателя – Ешпанова Альфия Кусайыновна, секретарь – Макишева Сымбат Замирқызы, члены комиссии– Сидорович Наталья Николаевна, Бөкіл Жанат Болатбайұлы, Гайса Айжамиля Гайсановна, Шаймухамбетова Майра Казкеновна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (186, 'Избирательный  участок № 86
Адрес: город Алматы, улица Масанчи,70, 
Коммунальное государственное учреждение «Гимназия №36 имени Болтирик Атыханулы»
Председатель – Серкешпаев Серик Касымгалиевич, заместитель председателя – Байбулова Мира Мекебаевна, секретарь– Накысбекова Гульзат Нояновна, члены комиссии– Сұлтанқұлов Алтынбек Мұрзатайұлы, Коробова Елена Валерьевна, Дюсебаева Анар Акановна, Тулеков Батырбек Жуманкулович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (187, 'Избирательный  участок № 87
Адрес: город Алматы, улица Байзакова, 130, 
Коммунальное государственное учреждение «Школа-гимназия №136 имени Мыржакып Дулатова»
Председатель – Жұманбек Нұргүл Рахметқызы, заместитель председателя – Тымбаева Анар Амиржановна, секретарь– Абдильдаева Карлыгаш Хакимовна, члены комиссии– Кабдырахман Ардақ, Садиркулова Гулима Салкинбековна, Аубакирова Галина Анатольевна, Султанова Гульнар Адилхановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (188, 'Избирательный  участок № 88
Адрес: город Алматы, улица Толе би, 109, 
Товарищество с ограниченной ответственностью «Евразийский технологический университет»
Председатель – Кешуов Сейткерим Муханович, заместитель председателя–Әбжаппарқызы Райханкүл, секретарь– Боханова Асем Жумабековна, члены комиссии– Нарынова Мариягуль Мухамеджановна, Букенбаева Гульнар Жумажановна, Савельева Виктория Вячеславовна, Райымбек Айгерім Әбутәліпқызы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (189, 'Избирательный  участок № 89
Адрес: город Алматы,  улица ШариповаАди, 53
Коммунальное государственное учреждение «Общеобразовательная школа № 95»
Председатель – Сатвалдинова Карлыгаш Аманжоловна, заместитель председателя – Таджикулова Сауле Турсункуловна, секретарь– Баратов Дильзат Азатұлы, члены комиссии– Калижарова Эльмира Ерсеновна, Леконцева Евгения Маратовна, Андриянова Светлана Владимировна, Имиров Адилжан Зипарович, Садовский Александр Николаевич, Жұмабек Жанғазы Жұмағазыұлы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (190, 'Избирательный  участок № 90
Адрес: город Алматы, улица Масанчи, 70 
Коммунальное государственное учреждение «Гимназия №36 имени Болтирик Атыханулы»
Председатель – Аксерикова Акмарал Магжановна, заместитель председателя – Толекова Гульнар Сансызбаевна, секретарь– Бейсенбекова Арайлым Қайратқызы, члены комиссии– Ашимбаев Гани Исламгожаевич, Касымбаев Медет Иманбекович, Лигай Жана Геннадиевна, Мырзагулова Жансулу Нурлановна, Оқас Аян Берікұлы, Өртқали Съезбек Мәдениетұлы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (191, 'Избирательный участок № 91
Адрес: город Алматы, улица Кабанбай батыра, 128
Коммунальное государственное учреждение «Гимназия №25 имени Ильяса Есенберлина»
Председатель – АманбайГазиза Абдықалыққызы, заместитель председателя – БукинаЕлена Леонидовна, секретарь– Әлімбек Гүлнұр Бейбүтқызы, члены комиссии– Аманкелдіұлы Айдос, Султанбаев Марат Есболатұлы, Умирзакова Салтанат Туймебаевна, Морозова Надежда Александровна, Мусабеков Марат Болатович, Оспанбаева Жанна Олжабаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (192, 'Избирательный  участок № 92
Адрес: город Алматы,  улицаКарасай батыра,70 
Следственный изолятор Департамента комитета национальной безопасности Республики Казахстан по городу Алматы
Председатель – Абишева Улжалгас Мухангалиева, заместитель председателя – Баймолдаева Алмагуль Мухтаровна, секретарь– Джу–Цзинь– Цзы Ирина Станиславовна, члены комиссии– Асқарұлы Абдулғафур, Калдыбаев Радмир Жамсапович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (193, 'Избирательный  участок № 93
Адрес: город Алматы, улица Толе би, 74/1  
Коммунальное государственное учреждение «Специализированный лицей №39 имени Султан-Ахмета Ходжикова»
Председатель – Досымбекова Меруерт Казакбаевна, заместитель председателя – Рахманманов Жарбол Муратович, секретарь– Дюсебаева Анар Акановна, члены комиссии –Темирхан Айгерим Аскаркызы, Мукашев Асет Сабитович, Ахметкалиев Алихан Женисбекович, Кадыков Ялкунжан Сауыржанович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (194, 'Избирательный  участок № 94
Адрес: город Алматы,  проспектСейфуллина, 492
Государственное коммунальное предприятие на праве хозяйственного ведения управления здравоохранения города Алматы «Городской родильный дом №1»
Председатель – Кондратьев Роман Иванович, заместитель председателя – Байдилдаева  Салтанат Болатбековна, секретарь– Жунусова Джамиля Ерлановна, члены комиссии– Манапова Айбала Бакдаулетовна, Бекжанов Даулет Серикович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (200, 'Избирательный  участок № 100
Адрес: город Алматы, улица Айтеке би,116,
Государственное коммунальное предприятие на праве хозяйственного ведения управления здравоохранения города Алматы «Городской ревматологический центр»
Председатель – Мусаева Назгуль Назаровна, заместитель председателя – Нурканов Алмас Аманжолович, секретарь– Ажмолдаева Улжалгас Мамановна, члены комиссии–Кудерина Айгерим Толеуовна, Мусакулова Алия Орынбасаровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (195, 'Избирательный  участок № 95
Адрес: г. Алматы, улица Шарипова Ади, 53 
Коммунальное государственное учреждение «Общеобразовательная школа № 95»
Председатель – Сабирова Айнур Жумагазиевна, заместитель председателя – Байбатчаева Акбулым Накеновна,секретарь– Сагындыкова Айгуль Жакыпбековна, члены комиссии–Елибаева Ляззат Махтапбергеновна, Ахметова Гульжан Егенбаевна, Аубакирова Индира Жаныбековна, Абдрахманова Мадина Мухтаржановна, Таттимбетов Омирлан Далбаевич, Бушакаев Ерлан Ержанұлы, Урынтаев Саят Даулетбаевич, Сансызбаева Зауреш Сейсеновна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (196, 'Избирательный участок № 96
Адрес: город Алматы, улица Казыбек би, 96 
Государственное коммунальное предприятие на праве хозяйственного ведения управления здравоохранения города Алматы «Городская больница скорой неотложной помощи»
Председатель – Алимбетов Багдат Куанышбекович, заместитель председателя – Айриян Милана Спартаковна, секретарь– Кошамбекова Алуа Нургазымовна, члены комиссии– Аманов Канат Насрадинович, Селеубаева Асел Мухтаровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (197, 'Избирательный  участок № 97
Адрес: город Алматы,  улицаТоле би, 93б  
Государственное коммунальное предприятие «Городской кардиологический центр» на праве хозяйственного ведения управления здравоохранения города Алматы
Председатель – Сурашев Нурсан Сеитович, заместитель председателя – Тугамбаев Арман Ермекович, секретарь– Акилбекова Гулнур Джандарбековна, члены комиссии– Гаитов Алимжан Аркенжанович, Токтарбаева Рабига Аскаровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (198, 'Избирательный  участок № 98
Адрес: город Алматы, улица Толе би, 95-а 
Акционерное общество "Казахский ордена "Знак Почета" научно-исследовательский институт глазных болезней"
Председатель – Масимгазиев Айдос Советович, заместитель председателя – Расулов Идрис Рашидович, секретарь– Манапқызы Гульнур, члены комиссии– Муханова Салтанат  Бауыржанқызы, Токтарбаева Асем Толегеновна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (199, 'Избирательный  участок № 99
Адрес: город Алматы, улица Айтеке би, 120 
Акционерное общество «Научно-исследовательский институт кардиологии и внутренних болезней»
Председатель – Мадалиев Курмангазы Нурмаганбетович, заместитель председателя – Катунцев Григорий Викторович, секретарь– Муканова Анастасия Викторовна, члены комиссии–Камбарова Женискул Ибрагимовна, Оспанбекова Асель Сейдалиевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (201, 'Избирательный  участок № 101
Адрес: город Алматы, улица Гоголя, 124  
Государственное коммунальное казенное предприятие «Алматинский экономический колледж»
Председатель – Камабекова  Динара Оразхановна, заместитель председателя – Бекбаев Дархан Балгабаевич, секретарь – Абдикалыкова Айгерим Нурахыновна, члены комиссии – Кокеев Нурлан Амантаевич, Аскарбеков Эрик Бирликович, Унтаев Жумагали Камбарович, Нургалиева Назгул Советовна, Жолдыбекова Мадина Оразхановна, Велахунов Данияр Кадирович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (202, 'Избирательный  участок № 102
Адрес: город Алматы, улица Гоголя, 114 
РГП на ПХВ «Казахский Государственный Женский Педагогический Университет»
Председатель – Салгараева Гульназ Ибрагимовна, заместитель председателя – Сарсенбаева Жанар Ганиевна, секретарь– Нұрқасым Айтолқын Бақытжанқызы –, члены комиссии–Берлібаев Ердәулет Тұрбекұлы, Суюндыкова Гулнур Сериккалиевна, Каскарауова Арай Досымбайқызы, Базаева Жұлдыз.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (203, 'Избирательный участок № 103
Адрес: город Алматы, улица ШариповаАди, 26/27
Коммунальное государственное учреждение «Общеобразовательная школа №16 имени ШариповаАди»
Председатель – Лянова Жадыра Каниятовна, заместитель председателя – Кайржанова Кымбат Мукатаевна, секретарь– Есмагамбетова Меруерт Жексенбаевна, члены комиссии–Молдабаева Камиля Сериковна, Айтказин Руслан Айтказыулы, Бабичева Наталья Михайловна, Жаксылыков Алмас Абзалович, Қапыш Маржан Мухаметжанқызы, Сейсембаева Асем Самархановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (204, 'Избирательный участок № 104
Адрес: город Алматы, улица ШариповаАди, 23
Коммунальное государственное учреждение «Общеобразовательная школа №16 имени ШариповаАди»
Председатель – Касенова Бекзат Ажихановна, заместитель председателя – Момынкулова Алтынгуль Зейнуллиевна, секретарь– Маханова Акбаян Куанышбаевна, члены комиссии– Ляпина Зинаида Вячеславовна, Мусагитова Толеугайша Айтказиновна, Нұрділдаев Нұржан Муратұлы, Елгезеков Марлен Абдуллаевич.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (205, 'Избирательный участок № 105
Адрес: город Алматы, улица Гоголя, 161
Республиканское государственное предприятие на праве хозяйственного ведения «Казахский государственный женский педагогический Университет»
Председатель – Несипбаев Алиби Сагимбекович, заместитель председателя – Абилова Гулмира Аскаровна, секретарь– Сейдикенова Самал Нукеновна, члены комиссии–Кабиденова Амина Муталовна, Малдыбаева Кульдар Ритаевна, Базалеев Максим Николаевич, Есенқабылова Ақерке Лесбекқызы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (206, 'Избирательный участок № 106
Адрес: город Алматы, улица Гоголя, 133
Коммунальное государственное учреждение «Гимназия № 15»
Председатель – Сулейменова Аида Асибековна, заместитель председателя – Қозметова Айдана Ертайқызы, секретарь– Шарғынова Сандуғаш Тоқтасынқызы, члены комиссии–Стебут Наталья Юрьевна, Атембаева Гульнар Айдашевна, Абишев Ералхан Алмаханович, Жайлаубек Айбар Бақытжанұлы, Спандияров Абилхайыр Абенович, Оспан Әйгерім Бақдаулетқызы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (207, 'Избирательный участок № 107
Адрес: город Алматы, улица Масанчи, 16,
Республиканское государственное учреждение «Воинская часть 5571» Национальной гвардии Республики Казахстан
Председатель – Есжанов Баянгали Абдуганиевич, заместитель председателя – Айманбетов Нияз Дидорбекович, секретарь– Фёдорова Лариса Михайловна, члены комиссии–Елғондиев Дәулет Бауыржанұлы, Калдыбаев Жамсап Женисбекович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (208, 'Избирательный участок № 108
Адрес: город Алматы, улица Гоголя, 133
Коммунальное государственное учреждение «Гимназия № 15»
Председатель – Нусупова Раушан Муратхановна, заместитель председателя – Кулжабаева Рымтай, секретарь– Базилова Гульшат Сайлаубаевна, члены комиссии – Познякова Марина Александровна, Шаму Әйгерім Бахытқызы, Буркитбаева Камажай Жумагалиевна, Алмабек Қарлығаш Қасымақынқызы, Кошжанова Гульшат Айдарбековна, Мазаков Максат Мадеткалиевич.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (211, 'Избирательный  участок № 111
Адрес: г. Алматы, ул. Панфилова, 127, 
Республиканское государственное учреждение «Казахская национальная академия искуства имени Темирбека Караевича Жургенова»
Председатель – ИскаковаЖуматай Казтаевна, заместитель председателя – Гридюшкина Нина Ивановна, секретарь– Крупская Татьяна Ивановна, члены комиссии–Воронов Александр Сергеевич, Абдурахмонов Рашид Нарзуллоевич, Джумабеков Ержан Фазылович, Борибаева Динара Даулетовна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (212, 'Избирательный  участок № 112
Адрес: город Алматы,  улицаПанфилова, 139
Акционерное общество «Центральная клиническая больница»
Председатель – Мединаев Бакыт Аманович, заместитель председателя – ПетроваСветлана Николаевна, секретарь– Аюпова Айгуль Айтбековна, члены комиссии –Абикенова Айман Жамбуловна, Шакиева Лариса Нурбапаевна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (213, 'Избирательный  участок № 113
Адрес: город Алматы, улица Толе би, 74/1
Коммунальное государственное учреждение «Специализированный лицей №39 имени Султан-Ахмета Ходжикова»
Председатель – Маликова Найла Токтамуратовна, заместитель председателя – Досымбекова Баян Казакбаевна, секретарь– Ахметова Анара Кенжебековна, члены комиссии– Бекмухаев Еркебулан Мухтарович, Сатыбалды Сәуле Артыққызы, Мукашева Асел Сабитовна, Кабирова Камиля Мухтаржановна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (214, 'Избирательный участок № 114
Адрес: город Алматы, улица Гоголя, 109,
«Библиотека им. А.П. Чехова»
Председатель – Ошанова Куралай Еренкаиповна, заместитель председателя – Касымова Минюра Сауытовна, секретарь– Ерданинова Динара Муратбековна, члены комиссии– Масадыкова Бибигул Малыбаевна, Думанов Николай Федорович, Мадиярова Аида Тлевлесовна, Жаров Талгат Кабиболлаевич, Беднова Светлана Константиновна, Наливаев Руслан Андреевич.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (215, 'Избирательный участок № 115
Адрес: г. Алматы, ул. Чайковского, 7
Коммунальное государственное учреждение«Алматинский колледж индустрии туризма и гостеприимства»
Председатель – Попович Надежда Николаевна, заместитель председателя – Мекебаева Назым Аблезовна, секретарь– Молдабекова Арайлым Омирбаевна, члены комиссии–Алимбеков Хамиткан Брянович, Байсалбаева Мерейлiм Коркемкызы, Аминева Вера Васильевна, Керімбеков Азат Сәбитұлы.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (216, 'Избирательный участок № 116
Адрес: город Алматы, улица Торекулова, 73
Государственное коммунальное предприятие на праве хозяйственного ведения управления здравоохранения города Алматы «Городской центр репродукции человека»
Председатель – Живолбаев Азамат Алдабергенович, заместитель председателя – Айдашева Динара Маликовна, секретарь– Нурлыбаева Ракат Дуйсембековна, члены комиссии –Селеубаев Мухтар Абатович, Кабанбаева Жаныл Аскаровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (217, 'Избирательный участок № 118
Адрес: город Алматы, улица Чайковского, 28 
Коммунальное государственное учреждение «Специализированная школа- лицей№90»
Председатель – Жасапбергенов Галиаскар Келгенбаевич, заместитель председателя – Мусапирова Алия Кенжеевна, секретарь– Жакупова Жанар Разаковна, члены комиссии–Кумпейсов Нурлан Асанович, Докучаев Андрей Александрович, Нарынбек Рауан Нарынбекұлы, Тулегенов Адил Беласарович.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (218, 'Избирательный участок № 119
Адрес: город Алматы, улица Желтоксан, 62,
Акционерное общество «Национальный научный центр хирургии имени Александра Николаевича Сызганова»
Председатель – Чорманов Алмат Турсынжанович, заместитель председателя – Бакмагамбетова Бибигуль Толегеновна, секретарь– Калужинова Татьяна Михайловна, члены комиссии– Селеубаев Нурсултан Мухтарович, Шокебаев Адиль Абаевич.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (219, 'Избирательный участок № 120
Адрес: город Алматы, проспект Абылай хана, 58а,
Акционерное общество «Институт КазНИПИ Энергопром»
Председатель – Иманбекова Жупар,  заместитель председателя – Токабаева Гульназ Кадырбаевна, секретарь–Батырова  Галина Насирхановна, члены комиссии–Сакаев Олжас Серікұлы, Мадимаров Дамир Назарбекович, Минджию Мариямбуби Искаковна, Калдыбаева Самал Берікқызы, Тасбаева Айнажан Алиакпаровна, Серикпаев Мелис Омиртаевич.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (220, 'Избирательный участок № 121
Адрес: город Алматы, улица Чайковского 28/53,
Коммунальное государственное учреждение «Специализированная школа- лицей № 90»
Председатель – Умешбаев Кульбай, заместитель председателя – Кожахметова Хорлан Капезовна, секретарь– Машкова Наталья Игоревна, члены комиссии–Сарчаянова Кунзат Акылбековна, Толегенов Мухтар Айтбаевич, Абилкаков  Нурлан Кабдилмаликович, Нарожная  Екатерина Федоровна.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (221, 'Избирательный участок № 122
Адрес: город Алматы, проспект Абылай хана, 20, 
Коммунальное государственное учреждение «Гимназия № 147»
Председатель – Макежанова Роза Ашимбековна, заместитель председателя – Бурибаева Арайлым Бердибековна, секретарь– Мухаметкаримова Ахмарал Сайлауовна, члены комиссии–Турсунов Батырбек Бекетұлы, Амраева Гульбахрам Ашимовна, Калибекова Айгерим,Мурунбаева Меруерт Исламгазиева.', 2);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (222, 'Избирательный участок №126 
Адрес: город Алматы, микрорайон Таугуль, 34
Общежитие акционерного общества «Университет Нархоз»
Председатель - Суйенбаева Гульмира Муханбаевна, заместитель председателя– Мырзабекова Нургуль Толысбековна, секретарь - Төлеген Еңлік Жабырбайқызы, члены комиссии - Рамазанова Анар Азатовна, Ахметова Айнур Сериковна, Разиева Баян Токтарбаевна , Касымов Жасулан Жанабекович.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (223, 'Территориальная избирательная комиссия Ауэзовского района
Адрес: город Алматы, микрорайон 8, 46, тел. 249-09-64
Коммунальное государственное учреждение «Общеобразовательная школа №116»
Председатель – Нуспекова Айгуль Лязатовна, заместитель председателя – Таран Елена Владимировна, секретарь - Кимадилова Жадыра Куатбековна, члены комиссии - Атабек Даурен Бекмаханұлы, Әліп Айбек Әбішұлы, Алексеева Любовь Яковлевна, Ахметжанова Сауле Губайдуллиновна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (224, 'Избирательный участок № 123 
Адрес: город Алматы, улица Сулейменова, 16 
Коммунальное государственное учреждение «Общеобразовательная школа №72» 
Председатель – Куатова Назгуль Касеновна, заместитель председателя - Едилова Алтынай Тулеевна, секретарь - Балмухамбетова Гулмира Кабулбековна, члены комиссии - Қарабаева Дина Бақтыбайқызы, Мырзалиева Нургуль Жанузаковна, Кыстаубаева Гульназ Даулетовна, Кикибаева Айжан Амангельдиевна, Оспанова Самал Сейтхановна, Қасенов Ғалымжан Дәуренұлы, Өзбекалиева Асыл Нурымжанқызы, Төлегенов Абылай Көпбергенұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (229, 'Избирательный участок № 128 
Адрес: город Алматы,  улица Рыскулбекова, 39-А
Товарищество с ограниченной ответственностью «Евразийская инновационная академия экономики и управления»
Председатель – Заитова Айнисям Тохтахуновна, заместитель председателя - Суханбердиева Эльзира Касымовна,  секретарь - Мазалова Светлана Сергеевна,  члены комиссии - Шайзаданова Кундыз Нурсилановна, Абдуллаев Руслан Акимович, Ергалиева Меруерт Еркеновна, Чернышова Оксана Юрьевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (230, 'Избирательный участок № 129 
Адрес: город Алматы,  микрорайон Таугуль-3, улица Шаймерденова, 21 
Коммунальное государственное учреждение «Гимназия Жаңа Ғасыр №175» 
Председатель – Манекеева Гаухар Бозжигитовна, заместитель председателя - Ракимгазиев  Улан Даулетказиевич,  секретарь - Каратаева Жазира Аяпбергеновна,  члены комиссии - Балхия Сымбат Хакимқызы, Салыкова Динара Токтарбаевна, Татыева Индира Копеева, Фатай Жайна Жасарқызы, Акжигитова Карлыгаш Жанабаевна Бижанова Салтанат Акжоловна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (225, 'Избирательный участок № 124 
Адрес: город Алматы, улица Сулейменова, 16
Коммунальное государственное учреждение «Общеобразовательная школа №72» 
Председатель – Сариева  Гулзира Молдабаевна, заместитель председателя– Закирова Сания Хабдулманатовна, секретарь - Сағындық Айжан Оралбекқызы,  члены комиссии - Балтабаева Ұлпан Айқожақызы, Полянский Николай Сергеевич, Ауезбаев Тимур Шымырбайұлы, Мирзагельдиева Айгул Кабланбековна, Нуркешова Фарида Махмутовна, Салыкжанова Маржан Абаевна, Батырханов  Ердаулет  Батырханович, Есбосынова Динара Сагиевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (226, 'Избирательный участок № 125
Адрес: город Алматы,  улица Черепанова, 14
Коммунальное государственное учреждение «Школа-гимназия № 139 имени Ахмета Байтурсынова» 
Председатель – Жумашева Газиза Карагуловна, заместитель председателя - Арзыбекова Даригул Жумашевна, секретарь-Несипбекова Улжан Бекмуханбетовна, члены комиссии - Амандыкова Ботагоз Абильмажиновна, Кудербаева Урик Тумаркановна, Жусупов Досан Хасанұлы, Ахметолдинова Меруерт Сансызбайқызы, Боранбай Ақерке Жаңабайқызы, Жакупова Кымбат Кадыровна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (227, 'Избирательный участок № 586
Адрес: город Алматы, улица Утеген батыра, 11А
Товарищество с ограниченной ответственностью Медицинский центр «ХАК»
Председатель – Садыков Алмас Умирханович, заместитель председателя – Райстанова Галия Отангалиевна, секретарь – Карташян Елена Ивановна, члены комиссии – Гладкова Любовь Николаевна, Раипов Қайрат Октябрьулы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (228, 'Избирательный участок № 127 
Адрес: город Алматы, микрорайон Таугуль, улица Вильнюсская, 29
Государственное коммунальное казенное предприятие «Алматинский государственный гуманитарно-педагогический колледж №2»
Председатель – Дуанабаева  Биби Чаимкуловна, заместитель председателя - Ержанова Айганым Сайлаужановна,  секретарь - Отельбаева Алмагуль Калиевна,  члены комиссии - Орынбаева  Эльмира Ережеповна, Арынтаева Замза Тасовна, Коргасбекова Баян Кошербаевна, Есіркеп Ақгүл Нұржанқызы, Жайлаубек Ақтілеу Ермуханұлы, Мамедов Ильгам Шахали оглы, Несипбеков Бекболат Болысханулы, Несипакынова Фарида Канатовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (231, 'Избирательный участок № 130 
Адрес: город Алматы,  улица Черепанова, 14 
Коммунальное государственное учреждение «Школа-гимназия № 139 имени Ахмета Байтурсынова» 
Председатель – Есимбекова Жанат Измухановна, заместитель председателя - Алдабергенова Улжан Абдукаримовна, секретарь - Мухамет Әмина Қойшыбекқызы, члены комиссии - Кенжебекова Рахия Анапияевна, Маханова Жанат Лахайбековна, Қабдылов Досжан Қалибекұлы,  Абилкасымова Шынар Нурмухаметовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (232, 'Избирательный участок № 131 
Адрес: город Алматы,  улица Токтабаева, 64 
Коммунальное государственное учреждение «Общеобразовательная школа №127» 
Председатель – Адилова Гульмира Сембековна, заместитель председателя - Шенгелбай Аида Айдынбекқызы,  секретарь - Кутубаева Куралай Ускатдиновна,  члены комиссии - Избасканова Бахыткуль Байбатыровна, Мустанова Назерке Жайлаукановна, Туяков Абылай Имашевич, Шамшаева Патима Жакиппаровна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (233, 'Избирательный участок № 132 
Адрес: город Алматы,  улица Жандосова, 65 
Государственное коммунальное казенное предприятие «Алматинский государственный колледж энергетики и электронных технологий»
Председатель – Магазов Ербол Джароллаевич, заместитель председателя - Байсакова Маржан Серикболовна,  секретарь - Молдагужина Динара Тимуровна,  члены комиссии - Қуаныш Айгерім Қажымұхан, Рахметжанова Гулмария Багашаровна, Сайлаубеков Куаныш Бейбитович , Сарқытбек Руслан Бауыржанұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (234, 'Избирательный участок №133 
Адрес: город Алматы,  улица Черепанова,  14 
Коммунальное государственное учреждение «Школа-гимназия № 139 имени Ахмета Байтурсынова» 
Председатель – Куатбеков Ерик Нургумарович, заместитель председателя - Калбергенова Анаргуль Елтаевна,  секретарь - Жусупова Жанаргул Алибековна,  члены комиссии - Беккул Данияр Бақдаулетұлы, Буранбаева Айнур Жанабаевна, Қадырбай Гулнұр Айдарқызы, Жусупова Факизат Уахитовна, Даулетова Зоя Абельтаевна, Какенова Жанна Сабырбекқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (235, 'Избирательный участок № 134 
Адрес: город Алматы, микрорайон Таугуль-3, улица Шаймерденова, 21
Коммунальное государственное учреждение «Гимназия Жаңа Ғасыр № 175» 
Председатель – Батырбекова Жаныл Сатаевна, заместитель председателя - Кокимбеков Нурбосын Нурдавлетович, секретарь - Ертасова Коркем Нурлыбековна,  члены комиссии - Чокубасова Жанат Макеновна, Карибжанова Лаззат Саметовна, Манекеева Шолпан Абдыкановна, Ешетова Балнур  Ильясқызы, Бозбаева Ұлжан Тұрлыбекқызы, Жұмағалиқызы Ұлболсын.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (236, 'Избирательный участок № 135 
Адрес: город Алматы, улица Жандосова, 204
Товарищество с ограниченной ответственностью «Демалыс-К» отель-санаторий «Altyn Kargaly»
Председатель – Белошапко Виктор Николаевич, заместитель председателя – Утельбаева Жамал Муратбеовна,  секретарь – Сыдыкова Айдана Хавидовна, члены комиссии - Каттаубаева Бахыткуль Аскаровна, Ниязова Айсұлу Пердебайқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (237, 'Избирательный участок № 136 
Адрес: город Алматы,  улица Саина,  184-Г
Акционерное общество «Пансионат Каргалы»
Председатель – Жакупов Нагашпай Рахметович, заместитель председателя - Кангалакова Айгуль Жумабаевна, секретарь – Кайруллаева Асель Рыскелдиевна, члены комиссии - Амангелдиева Ляззат Когановна, Рахымбеков Алмат Бокенович.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (238, 'Избирательный участок № 137 
Адрес: город Алматы,  микрорайон 9, 16 
Коммунальное государственное учреждение «Школа-гимназия № 5» 
Председатель – Суримбаев Бауыржан Нуржанович, заместитель председателя - Коробова Надежда Аликовна, секретарь - Бегалиева Патима Турмаганбетовна,  члены комиссии - Шарипов Турарбек Нурлыбекович, Турмаганбетов Бекболат Койшыбаевич, Утеуов Мейрам Бахытжанович, Глухова Татьяна Владимировна, Абильдаева Куралай Канатбековна, Бейсебаева Шынар Исатаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (239, 'Избирательный участок № 138 
Адрес: город Алматы,  микрорайон 9, 16 
Коммунальное государственное учреждение «Школа-гимназия № 5» 
Председатель – Жайлыбаева Ботагоз Утеповна, заместитель председателя - Азнабакиева Эльмира Усмановна,  секретарь - Жаубасова Сара Егимбаевна, члены комиссии - Каракабакова Мейрамгул Бегларбековна, Абдибекова Гульдана Сабыровна, Жарылгасымова Нелли Афанасьевна, Ултанбекова Зауре Тулеметқызы, Умарова Айнура Алымовна, Нурахметов Айтуган Шектыбаевич, Алиманов Анвар Максутович,  Баймуканова Минслу Сагингалиевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (240, 'Избирательный участок № 139 
Адрес: город Алматы,  улица Жандосова, 63
Государственное коммунальное казенное предприятие «Алматинский многопрофильный колледж»
Председатель – Раймбеков Қуат Оразбекович, заместитель председателя– Берикбаев Сырым Алпысбаевич, секретарь - Аяпбергенова Айнур Сериковна,  члены комиссии - Молдағожина Аяулым Тимурқызы, Кабулов Алдияр, Серикбосынова Айдана Нурлановна, Игнатов Сергей Анатольевич.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (241, 'Избирательный участок № 140 
Адрес: город Алматы,  микрорайон 10, 23-Г 
Коммунальное государственное учреждение «Школа-гимназия № 1» Управления образования города Алматы
Председатель – Джанзакова Динара Дюйсеновна, заместитель председателя - Юсупова Фарида Мухамедовна, секретарь - Толкынова Шынар Бакытовна, члены комиссии - Кусабекова Лаура Толендиевна, Нурбиева Раушан Джуанышовна, Хмаренкова Наталья Николаевна, Бөкенбай Диана Әмірбекқызы, Трофимова Наталья Александровна, Усенова Елена Сергеевна', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (242, 'Избирательный участок № 141
Адрес: город Алматы,  улица Жандосова, 55 
Акционерное общество «Университет Нархоз»
Председатель – Жакешова Арман Абдихановна, заместитель председателя -  Мукашев Кайрат Муратбекович,  секретарь - Рамазан Алтын Темиртасовна, члены комиссии - Текенов Агзам Узакович, Утегалиева Кенжегул Нусуповна, Ахметов Серик Сайлюбаевич, Шликенова Надежда Гарифулловна, Қырықбаева Асель Қуанышовна, Есболатова Асель Асхатовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (243, 'Избирательный участок № 142 
Адрес: город Алматы,  улица Жандосова, 55
Акционерное общество «Университет Нархоз»
Председатель – Касымбекова Разия Абдикеримовна, заместитель председателя - Божбанов Алихан Жаксыбекович,  секретарь – Байболатова Сымбат Аскарбековна,  члены комиссии – Батырхан Серік Кермақынұлы, Нургалиев Нурбек Нурсултанович, Айтахун Аяжан Сагатбековна, Бахыт Дархан.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (244, 'Избирательный участок № 143 
Адрес: город Алматы,  улица Жандосова, 53
Республиканское государственное учреждение «Военно-инженерный институт радиоэлектроники и связи»
Председатель – Умбетов Дархан Каблашович, заместитель председателя - Шаяхметов Ерлан Әлімхалиевич,  секретарь комиссии - Камбаева Айжамал Жалгасиновна,  члены комиссии - Жунусов Ержан Жетписбаевич, Щукарева Ольга Владимировна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (245, 'Избирательный участок № 144 
Адрес: город Алматы, улица Жандосова, 51
Товарищество с ограниченной ответственностью «Казахский научно-исследовательский институт животноводства и кормопроизводства».
Председатель – Ногайбаева Перуза Нурдиновна, заместитель председателя - Кузбаева Жанар Ергалиевна,  секретарь - Абдрахманова Жанар Камалқызы, члены комиссии – Байкутова Балауса Интымаққызы, Ибраимова Салтанат Османжановна, Омарова Айнагуль Азатовна, Киисимбаев Арман Адабиатович, Нурмаханова Шамшат Баянгалиевна, Санатпаева Асель Оспановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (262, 'Избирательный участок № 161 
Адрес: город Алматы, микрорайон 2, 59 
Коммунальное государственное учреждение «Общеобразовательная школа № 104» 
Председатель – Сыдыкжанова Ляйла Ускенбаевна, заместитель председателя - Мадаутова Зульфира Кайрбековна,  секретарь - Ускембаева Жанар Кадырхановна,  члены комиссии - Абанкулов Баккелди Шаяхметович, Сыдыкова Жибек Амантаевна, Отыншиева Зибаш Шариповна,  Ордабаева Жанар Дулатовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (246, 'Избирательный участок №145
Адрес: город Алматы, микрорайон 11, 36 
Коммунальное государственное учреждение «Школа-гимназия № 13» 
Председатель – Алауова Гульжан Агабековна, заместитель председателя - Еріш Жарқынай Оңалбекқызы,  секретарь - Кумарова Гульжанат Манарбековна, члены комиссии - Жумабаева Райхан Сайлаубаевна, Рахматуллаева Қалдыгүл Нурмаганбетовна, Балғожаева Гулнара Ашимовна, Назарбаева Нигара Файзуллақызы, Шындалы Рүстембек Насурлұлы, Амиров Мадияр Болтович, Құрманқұл Дәрия Маратқызы, Сериков Жомарт Медеуұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (247, 'Избирательный участок № 146 
Адрес: город Алматы,  микрорайон 11,  36
Коммунальное государственное учреждение «Школа-гимназия № 13» 
Председатель – Дуйсенбекова Нуржамал Есиркеповна, заместитель председателя - Амирова Толкын Нургазинова,  секретарь - Алимжанова Балжан Абайқызы, члены комиссии - Марышева Татьяна Ивановна, Ердембекова Жанаргуль Нурдыгалиевна, Каирбекова Меруерт Бериккановна, Байбосынова Мира Кауранбекқызы, Утегенов Абдужалил Еркебаевич, Ғалымзатқызы Шахназ, Еришов Жалил Шамилович, Манджу Маусалият Амангелдіқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (248, 'Избирательный участок № 147 
Адрес: город Алматы, микрорайон 8, 45
Коммунальное государственное учреждение «Школа-лицей № 119» 
Председатель – Шукурова Гульжан Ахметовна, заместитель председателя - Барахатова Фаина Еркиновна секретарь - Кенжебек Арайлым Ерболаткызы, члены комиссии - Ажакова Асель Абайбековна, Муканова Меруерт Багдатовна, Рахметова Гаухар Зиябековна, Әлімбекова Жанар Қайратқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (249, 'Избирательный участок № 148
Адрес: город Алматы, микрорайон 8, 46 
Коммунальное государственное учреждение «Общеобразовательная школа № 116» 
Председатель – Есбулаева Гульварсен Табалдаевна, заместитель председателя - Келимбетова Мария Джапаковна, секретарь - Биркелемова Айнагуль Толепбергенова,  члены комиссии - Балтагалиева Айерке Аскаровна , Амантай Назерке Ерланкызы,  Бакытова Меруерт Бакытовна, Шишабай Куаныш Ганиулы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (258, 'Избирательный участок № 157 
Адрес: город Алматы, микрорайон 5, 8Б 
Коммунальное государственное учреждение «Гимназия № 27» 
Председатель – Дериганова Светлана Михайловна, заместитель председателя - Харитонова Оксана Олеговна,  секретарь - Анкебаева Балерке Кайраткызы, члены комиссии - Мистюк Елена Васильевна, Пантилус Лариса Николаевна,, Жургембаева Ляззат Сериккуловна, Кажбиева Асем Толеужановна, Уразаева Райля Фароковна, Азизова Махинур Мухамедовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (259, 'Избирательный участок № 158 
Адрес: город Алматы, микрорайон 5, 8Б 
Коммунальное государственное учреждение «Гимназия № 27» 
Председатель – Усеинова Джанна Бакытбековна, заместитель председателя - Пятова Елена Викторовна,  секретарь - Касымбаева Шолпан Ернашевна, член комиссии - Крюкова Любовь Леонидовна, Партнова Оксана Сергеевна, Нұсқабаева Әйгерім Нұрланқызы, Сердюкова Оксана Алексеевна, Харитонова Татьяна Сергеевна, Маслакова Татьяна Павловна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (260, 'Избирательный участок № 159 
Адрес: город Алматы, микрорайон 5, 49А 
Коммунальное государственное учреждение «Школа-гимназия № 6» 
Председатель комиссии – Молдабаев Андрей Газизович, заместитель председателя комиссии - Арзиева Оксана Таинжановна секретарь - Досанова Роза Сауленбаевна,  члены комиссии - Магафирина Гульмира Зиядовна, Абдижапарова Гулсим Курманкуловна, Камалданова Нагима Белгожаевна, Исмаилова Гульмира Нурмухамедовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (261, 'Избирательный участок № 160 
Адрес: город Алматы,  микрорайон 2, 59
Коммунальное государственное учреждение «Общеобразовательная школа № 104» 
Председатель- Төреқұлов Талғар Талғатұлы, заместитель председателя - Мынжасаров Куанышбек Асангулович,  секретарь - Салимов Дастан Маликович,  члены комиссии - Боранкулова Манат Кенескызы, Балкибетова Эльвира Ергибековна, Рахметова Айман Куанышбаевна,  Касымбаева Роза Алимбаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (250, 'Избирательный участок № 149 
Адрес: город Алматы, микрорайон 8, 46
Коммунальное государственное учреждение «Общеобразовательная школа № 116» 
Председатель – Тойбазарова Ардак Долдановна, заместитель председателя - Бекмуратова Сауле Аманжоловна,  секретарь - Айдарбекова Фариза Жамалбековна,  члены комиссии - Комарова Анна Владимировна, Мадимарова Гульзат Ерденбековна, Гладкова Вера Александровна, Кудайбергенов Арман Адильевич, Жумабаев Ержан Муратович, Нұртаева Қымбат Серікқызы', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (251, 'Избирательный участок № 150 
Адрес: город Алматы, микрорайон 8, 45 
Коммунальное государственное учреждение «Школа-лицей № 119» 
Председатель – Адишева Замира Ускеновна, заместитель председателя - Жамантаева Гульнар Упиевна, секретарь - Курбанова Айнур Токтасуновна, члены комиссии - Серимова Жанар Есетовна, Бейсекбаева Айзат Кайратовна, Сеитова Гульгайша Аркиновна, Салыкжанова Бакытжан Абаевна, Касымова Гаухар Мелисовна, Абдуразакова Камила Ахтаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (252, 'Избирательный участок № 151 
Адрес: город Алматы,  микрорайон 12, 18
Коммунальное государственное учреждение «Общеобразовательная школа № 9» 
Председатель – Темрханова Улжан Хабдуалиева, заместитель председателя - Петухова Марина Владимировна,  секретарь - Жумагереева Ару Онгаровна, члены комиссии - Бондарцев Евгений Валерьевич, Лищенко Юрий Владимирович, Айбусынова Эльвира Асановна, Хангалдян Анжела Артёмовна, Рахимова Ляйля Турсуновна, Топорова Любовь Александровна, Петрова Екатерина Николаевна, Пивоварова Елена Александровна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (253, 'Избирательный участок № 152 
Адрес: город Алматы,  микрорайон 12, 18 
Коммунальное государственное учреждение «Общеобразовательная школа № 9» 
Председатель – Денгельбаева Самал Айткалиевна, заместитель председателя - Нольфина Марина Владимировна, секретарь - Байбалаева Бекзат Олжабаевна,  члены комиссии - Рахметуллаева Эльвира Ашимовна, Мусабеков Маутхан Амарханович, Чертко Елена Михайловна, Петухова Ольга Владимировна, Барлыбаева Дамели Хусаиновна, Бауэр Ольга Васильевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (254, 'Избирательный участок № 153
Адрес: город Алматы, микрорайон 6, 63 
Коммунальное государственное учреждение «Школа-гимназия № 86 имени Габита Мусрепова» 
Председатель – Мусаева Калдыкыз Айтжановна, заместитель председателя - Кожаева Карлыгаш Сагитовна,  секретарь - Бейсембаева Бибигуль Адигуловна,  члены комиссии – Сулейменов Бауржан Ниязалиевич, Байжиенов Роман Болатович, Жатенова Гульден Келденкызы, Махмутов Бакытжан Жанабекович, Зайтбеков Мұрат Шакарбекұлы, Сарбалина Гүлайым Елтаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (255, 'Избирательный участок № 154 
Адрес: город Алматы, микрорайон 6, 51
Коммунальное государственное учреждение «Школа-гимназия № 113» 
Председатель – Сюмбаева Гульжан Темирхановна, заместитель председателя - Литвиненко Татьяна Васильевна,  секретарь - Толендиева Айнур Айдоскызы, члены комиссии - Станишевская Ольга Михайловна, Данилов Андрей Юрьевич, Бокенбай Жасулан Амирбекулы, Байназаров Багдат Нарымбаевич, Асматуллаев Абдугали Абдувалиевич, Серикбаева Гульсая Кенжекараевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (256, 'Избирательный участок № 155 
Адрес: город Алматы, микрорайон 6, 51
Коммунальное государственное учреждение «Школа-гимназия № 113» 
Председатель – Иргебаева Рахима Абдикадировна, заместитель председателя - Куанышбаева Зульфия Жакановна, секретарь - Кенженова Айгерим Абдикаримовна,  члены комиссии - Кудайбергенова Нагима, Сюмбай Камилла Русланкызы, Ахметова Лена Кабыкеновна, Жаксылыкова Акмарал Есенгельдиевна, Абдуллаева Жадра Муратовна, Музафарова Виктория Викторовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (257, 'Избирательный участок № 156
Адрес: город Алматы, микрорайон 6, 63
Коммунальное государственное учреждение «Школа-гимназия № 86 имени Габита Мусрепова» 
Председатель – Жакыпбекова Салия Ныгметовна,  заместитель председателя - Абзолдаева Анеля Шакузовна,  секретарь - Жылкыбаева Назира Досымхановна, члены комиссии - Қайырлыев Ерсултан Қанышұлы, Кундакбаев Мухаммедкарим Сыдыкович, Жубанышева Баян Темирхановна, Тәжітаева Сәния Әлімжанқызы, Бидосова Акмарал Руслановна, Карабалаев Аслан Газиевич.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (263, 'Избирательный участок № 162 
Адрес: город Алматы, микрорайон 2, 54 
Коммунальное государственное предприятие на праве хозяйственного ведения «Детская городская клиническая больница №2» 
Председатель– Рабандияров Марат Рабандиярович, заместитель председателя - Алпысбаева Сауле Дуйсенбаевна,  секретарь - Исанкулова Айгерим Турдалиевна,  члены комиссии - Қуатбекова Сауле Базрбаевна, Құлжанқызы Айгерім.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (264, 'Избирательный участок № 163 
Адрес: город Алматы, микрорайон 5, 49А
Коммунальное государственное учреждение «Школа-гимназия № 6» 
Председатель – Буитов Айдар Булатович, заместитель председателя - Усенова Гузель Кахармановна, секретарь - Радостева Татьяна Павловна, члены комиссии - Суйлеменова Шолпан Ерсаиновна, Разиева Дилярам Сраждиновна, член комиссии -  Мұкатайқызы Гаухар, Хамраев Решат Розахунович, Афонин Владимир Анатольевич, Ибрагимова Дилнара Нурахметовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (265, 'Избирательный участок № 164
Адрес: город Алматы,  улица Жубанова, 1А 
Не бюджетное не коммерческое учреждение профессионального образования «Алматинский юридический колледж»
Председатель – Оразахынова Майгуль Батырхановна, заместитель председателя – Тойшыбекова Перизат Альмаханбетовна, секретарь – Смагулова Макпал Усеновна,  члены комиссии –Мұхамеди Дәурен Нұрайдарұлы, Сулеймен Галия Нарынбаевна, Нурлыбаев Дастан Хасенович, Нүсіпжанұлы Данияр, Акмамбетова Инабат, Мукашева Айдана Бейбітқыз, Чингисова Айгуль Нурболатовна, Оспанова Гулнар Турсынбаевна', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (266, 'Избирательный участок № 165 
Адрес: город Алматы, микрорайон Тастак-1, улица Фурката, 26А  Коммунальное государственное учреждение «Школа-гимназия № 130 имени Ильяса Жансугурова» 
Председатель – Каскирбаева Алия Хайроллиновна, заместитель председателя - Журымбаева Дина Абдылкасымовна,  секретарь - Ханаева Назира Рахматуллаевна,  члены комиссии - Косерова Нагашкуль Макеновна, Енкежикова Улдакан Нуржаубаевна, Алимбеков Жансерик Бауржанович, Хан Ирина Афанасьевна, Мауталиев Абзал Есімханұлы, Қанатқызы Айгерім.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (267, 'Избирательный участок № 166 
Адрес: город Алматы,  микрорайон Тастак-1, 1В
Государственное коммунальное казенное предприятие «Алматинский государственный политехнический колледж»
Председатель – Байбалакова Жанат Дангыловна, заместитель председателя - Тойчибекова Гульмира Рысбековна, секретарь - Токенова Динара Джумабаевна,  члены комиссии - Касенова Гульмира Сагаталиевна, Оспанова Гульнар Сагидолдаевна, Джурумбаева Жансая Лесбековна, Имангалиева Карлыгаш Жумахановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (268, 'Избирательный участок № 167
Адрес: город Алматы,  улица Жубанова, 1А
Не бюджетное не коммерческое учреждение профессионального образования «Алматинский юридический колледж»
Председатель – Ергазина Гульнар Жунусбековна, заместитель председателя - Калиева Аида Султановна,  секретарь - Шынгысова Айнур Куанышевна, члены комиссии - Жекибаева Алмагуль Нурлановна, Мусабаева Макпал Байжановна, Нагымбаева Галия Нагымбаевна, Сайлаубаева Баян Толеугазиевна, Носадченко Галина Сергеевна, Уйпалакова Гулдана Зарлыковна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (269, 'Избирательный участок № 168 
Адрес: город Алматы,  улица Толе би, 287А
Государственное коммунальное казенное предприятие «Алматинский колледж новых технологий»
Председатель – Басенов Даулет Болатович, заместитель председателя - Передерий Елена Аркадьевна,  секретарь - Ахметжанова Гаухар Мадиевна,  члены комиссии - Қонысбаев Талғар Кунтуғанұлы, Чанчикова Женисхан Толеуовна, Тиккельдиева Мадина Болатовна,  Деев Юрий Васильевич, Кельмурзанов Азамат Кульжебаевич,  Утеулиева Фарида Есеновна,  Шевцов Сергей Анатольевич, Аманкелды Жазира Аманкелдыкызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (270, 'Избирательный участок № 169
Адрес: город Алматы, улица Толе би, 303 
Товарищество с ограниченной ответственностью «Колледж имени Динмухамеда Кунаева»
Председатель – Булекбаева Райхан Чантовна, заместитель председателя - Султанов Ербол Амирсеитович,  секретарь - Ибраемжанов Сагынгали Аманович, члены комиссии - Кобенова Жанар Маженовна, Омерзакова Гаухар Жортуловна, Канабекова Багдагул Кошпановна,  Мукушева Гульнар Кызайбаевна', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (271, 'Избирательный участок № 170 
Адрес: город Алматы, улица Саина, 32
Государственное коммунальное казенное предприятие «Алматинский строительно-технический колледж»
Председатель – Есдаулетова Салтанат Болаткызы, заместитель председателя - Ахметова Кулжазира,  секретарь - Болатова Аяулым Болаткызы,  члены комиссии - Базаркызы Булсайран, Омаров Бериккан Сембайович, Сулейменова Сауле Назыловна,  Магауянова Назым Магауяновна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (272, 'Избирательный участок № 171 
Адрес: город Алматы,  улица Жубанова, 11 
Государственное коммунальное предприятие на праве хозяйственного ведения «Городской перинатальный центр» 
Председатель – Ербулатова Салтанат Тимурбековна, заместитель председателя - Кайранбаева Роза Шенгельбаевна, секретарь - Керимова Римма Киргизбаевна,  члены комиссии - Рахметова Тойдык Махсетовна, Толқынбек Ақмарал Жұмабекқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (273, 'Избирательный участок № 172 
Адрес: город Алматы,  улица Кабдолова, 28
Государственное коммунальное предприятие на праве хозяйственного ведения «Городской родильный дом № 5» 
Председатель – Мухамеджанова Жанар Амантаевна, заместитель председателя - Калдыбай  Балжан Амантаевна,  секретарь - Адамбаева Асем Сайлауовна, члены комиссии - Муканова Айгуль Иембергеновна, Зординова Роза Исмагулова.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (274, 'Избирательный участок № 173 
Адрес: город Алматы, улица Жубанова, 68А
Государственное коммунальное предприятие «Специализированная организация образования для детей с девиантным поведением» 
Председатель – Искаков Нуржан Жуманович, заместитель председателя - Бейсекенова Динара Румхановна,  секретарь - Кәдірбеков Мирас Қуанышұлы,  члены комиссии - Мансурова Маржан Абаевна,  Абуталиева Гульназ Болатовна, Умирбеков Ермахан Баянович, Тлеубердин Дархан Алтыбаевич, Таласбаева Асель Канатовна, Имамбаева Зульфия Кимадиевна, Еркасымова Ботагоз Амыркановна, Манкаев Дастан Миржанович.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (275, 'Избирательный участок № 174 
Адрес: город Алматы, микрорайон 1, 37Б
Коммунальное государственное учреждение «Гимназия № 111» 
Председатель – Медведева Ольга Егоровна, заместитель председателя - Скакова Галина Николаевна,  секретарь комиссии - Максутова Альмира Мусахановна,   члены комиссии – Несілжан Заңғар Жасұланұлы,  Арызханова Сандуғаш Баглановна, Сардарова Жадыра Альтаевна, Мамырова Алма Ашубасаровна, Белесов Әділхан Алматханұлы, Бокенбай Бекболат Еркінбекұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (276, 'Избирательный участок № 175 
Адрес: город Алматы,  микрорайон 1, 76А 
Коммунальное государственное учреждение «Общеобразовательная школа № 97» 
Председатель – Тажибаева Гульнара Баймуратовна, заместитель председателя - Олейник Наталья Ивановна,  секретарь - Калилаева Айгерим Булекбаевна, члены комиссии - Минакина Ольга Викторовна, Назаренко Ольга Сергеевна, Абуова Салтанат Тулегеновна, Самсыбекова Карлыгаш Амангельдиевна, Омаров Болатхан Анаятович, Жақсылыққызы Кәмшат, Жарманов Данияр Манатович, Досмайл Төлеген Шашбайұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (277, 'Избирательный участок № 176 
Адрес: город Алматы, улица Саина, 81А 
Филиал акционерного общества «Университет Нархоз»
Председатель – Торгаев Абиш Алипович, заместитель председателя - Мусапиров Ерболат Бакбергенович, секретарь - Азикенова Мира Токтаркановна, члены комиссии - Досыбаев Нуржан Жумадуллаевич,  Чепчебаева Жибек Абылкасымовна, Утемиров Асет Даутканович, Нурабаева Улжалгас Тохтарбековна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (278, 'Избирательный участок № 177 
Адрес: город Алматы, микрорайон 1, 37Б 
Коммунальное государственное учреждение «Гимназия № 111» 
Председатель – Матакова Умитжан Ашубасаровна, заместитель председателя - Сагимбекова Алтынай Алтеновна, секретарь - Шокенова Гульнара Аманкелдыевна,  члены комиссии - Кемелова Шырын Қуанышқызы,  Ашинова Самал Ахатовна, Бокаева Майра Акбаушановна, Джанатаев Темиржан Арибжанович, Ванчугова Алена Васильевна, Капаров Бахтияр Сейталыулы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (279, 'Избирательный участок № 178 
Адрес: город Алматы, микрорайон 3, 52
Коммунальное государственное учреждение «Общеобразовательная школа №122» 
Председатель  – Утеулинова Зауре Молдасадыковна, заместитель председателя - Байгараева Кулайра Баймбетовна,  секретарь - Ізбасар Майра,  члены комиссии - Кабылбекова Зауре Муслимовна,  Кемельханова Ляйла Султановна, Дегенбаева Гульбану Абуталиповна, Утемисова Жадыра Кориковна, Кусайнова Галия Набиевна, Байымбетова Жәудір Сәбитқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (280, 'Избирательный участок № 179 
Адрес: город Алматы, микрорайон 3, 52 
Коммунальное государственное учреждение «Общеобразовательная школа №122» 
Председатель  – Тастембекова Закида Акбергеновна, заместитель председателя - Молдабаева Эльмира Абдижапаровна, секретарь - Садырова Айнур Турсунбековна,  члены комиссии - Сейтимбетова Гулзат Дурмекбаевна,  Сальменова Жадыра Турдыматовна, Оразбай Биржан Думанулы, Байметова Алия Самахуновна, Ашимова Бакытжамал Турсунбековна, Бейсебеков Елдос Сейтнурович.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (281, 'Избирательный участок № 180 
Адрес: город Алматы, микрорайон 3, 52 
Коммунальное государственное учреждение «Общеобразовательная школа №122» 
Председатель – Смагулова Асемгул Дуйсеевна, заместитель председателя - Ахметова Гульжамал Сериковна,  секретарь - Сергазинова Акмарал Сергазиновна,  члены комиссии - Сайылханова Жанаргуль Туркменбаевна, Нургисанова Карлыгаш Наруызбаевна, Смағұлова Рахат Қасымқұлқызы, Алмабекова Арайлым Асылбекқызы, Отаева Гаухар Тулепбергеновна, Дюсембекова Бакит Отаншеновна, Конырбаева Салтанат Мусаевна, Ерманова Айман Темиргалиевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (282, 'Избирательный участок № 181 
Адрес: город Алматы, микрорайон Аксай-1, 26 
Коммунальное государственное учреждение «Общеобразовательная школа №133» 
Председатель – Адамов Нурлан Жумагазинович, заместитель председателя - Абдранова Меруерт Сагаткеримова, секретарь-Туркестанова Фариза Саматбекқызы, члены комиссии - Метербай Орынбасар Метербайұлы, Иманалиева Анар Мыктыбаевна, Умбетбаев Еркегали Белтаевич, Зейнбек Мадина Курбанқызы, Узакова Майгуль Токтасыновна, Балгабеков Нурлыбек Каримович.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (283, 'Избирательный участок № 182 
Адрес: город Алматы,  микрорайон Аксай-1, 26
Коммунальное государственное учреждение «Общеобразовательная школа №133» 
Председатель – Калымова Арайлым Балхашовна, заместитель председателя - Жаппасова Карлыгаш Каримовна,  секретарь - Оскенбаева Лайла Касымбековна, члены комиссии - Абдыгулова Галия Абдыкаимова,  Жиренбай Пернегуль Аширбековна, Таранова Жазира Витальевна, Рахымжанова Асем Амантаевна, Нурсеитов Құдайберген Серикбаевич, Азахунова Банум Алимжановна, Агимбетова Айгерим Кенжекуловна, Шаргынова Айгуль Ногаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (284, 'Избирательный участок № 183 
Адрес: город Алматы,  микрорайон Аксай-1, 26 
Коммунальное государственное учреждение «Общеобразовательная школа №133» 
Председатель – Иманалы Гульзат Меирхановна, заместитель председателя - Өміш Айнур Темірханқызы,  секретарь - Турмаганбетова Улболсын Дуйсеновна, члены комиссии - Жақсыбай Гүлбақыт Жақсыгелдіқызы, Даржанова Перделигул Курбановна, Асанова Рая Усербаевна, Сураншиева Малика Меирбековна, Смагулова Айнур Маратовна, Бостанова Эльвира Ганиевна, Аязбекова Жулдыз Бейсенбаевна, Шатунова Айжан Мухитайқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (285, 'Избирательный участок № 184 
Адрес: город Алматы, микрорайон Аксай-2, 69А
Коммунальное государственное учреждение «Общеобразовательная школа №121» 
Председатель– Бигалиева Салтанат Гадылшиевна, заместитель председателя - Омарханова Райхангуль Магауовна,  секретарь - Мукашева Макпал Сарсембаевна, члены комиссии - Аяпова Жаухар Туребаевна, Ахметжанова Рауза Ардаковна, Жангужинов Болат Акпанович, Курманбекова Назерке Жайыковна, Казаков Михаил Аркадьевич, Мурдасова Ольга Васильевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (286, 'Избирательный участок № 185 
Адрес: город Алматы,  микрорайон Аксай-2, 69А 
Коммунальное государственное учреждение «Общеобразовательная школа №121» 
Председатель – Ходжаева Толкын Саламатовна, заместитель председателя - Караджаева Елена Юрьевна,  секретарь - Юсупова Гульназ Нуридиновна, члены комиссии - Черных Екатерина Михайлова,  Богомолова Виктория Васильевна, Курманова Гульфия Амирбековна, Ларина Лилия Владимировна, Чокина Макпал Канатбековна, Саламатова Жұлдыз Талғатқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (287, 'Избирательный участок № 186 
Адрес: город Алматы,  микрорайон Аксай-2, 33
Коммунальное государственное учреждение «Общеобразовательная школа № 42»
Председатель– Карымбай Айсауле, заместитель председателя - Максутова Луйза Абильсейтовна,  секретарь - Курмантаева Раушан Маратовна, члены комиссии - Юсупова Зухра Хамитовна, Момбеков  Асан Шоканович, Қанатова Аялуым Нұржанқызы, Калгулова Динара Маратовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (288, 'Избирательный участок № 187 
Адрес: город Алматы, микрорайон Аксай-2, 33
Коммунальное государственное учреждение «Общеобразовательная школа № 42» 
Председатель – Тегимбаева Салтанат Мухитдиновна,  заместитель председателя - Касенова Гульмира Мухатаевна,  секретарь - Нұрсадық Жансая Бақытжанқызы, члены комиссии - Жанисбаева Нагима Бахытмажанова, Алимова Урзия Суннатуллаевна, Куримбаева Гульнар Сапарбаевна, Бапишева Инна Лукпановна, Адамбекова Айсулу Калиевна, Ибраимова Мадина Жанабаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (289, 'Избирательный участок № 188
Адрес: город Алматы,  микрорайон Аксай-3Б, 27
Коммунальное государственное учреждение «Специализированный лицей-интернат «Білім-Инновация» 
Председатель – Сулейменова Айгерим Касымкановна, заместитель председателя - Тышканбаева Айнагуль Жумагазиновна, секретарь - Бейсенова Гульнара Акылбаевна,  члены комиссии - Багаева Гульзат Алматаевна,  Ермекбаева Гаухар Ергешбаевна, Кожаева Сандугаш Сагитовна, Бутова Ольга Александровна, Жолдыбаева Жансая Ауезхановна, Садуахасов Канатбек Орынбасарович, Турсынбаева Айнаш Сыргабековна, Менешова Ирина Есмуханова.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (290, 'Избирательный участок № 189 
Адрес: город Алматы,  микрорайон Аксай-3А, 54
Коммунальное государственное учреждение «Школа-гимназия № 123 имени Кожа Ахмета Яссауи» 
Председатель – Джабулаев Максат Габдулманович, заместитель председателя - Ибрагимов Эльдар Анварович,  секретарь - Абизова Мөлдір Болатқызы, члены комиссии – Токтамуратова Айнур Айтказиевна,  Мадиярова Дильмира Темиргалиевна, Рашатова Марал Манасовна, Әлиева Мөлдір Жомартқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (291, 'Избирательный участок № 190 
Адрес: город Алматы,  микрорайон Аксай-3А, 54
Коммунальное государственное учреждение «Школа-гимназия № 123 имени Кожа Ахмета Яссауи» 
Председатель – Ашимбаева Багила Масимханқызы, заместитель председателя - Сейтбаев Бегалы Ахметалиевич,  секретарь - Жадраева Медине Ергалиевна, члены комиссии - Маликов Дастан Маликович, Байсалова Жаңылхан Мамекеновна, Ержанов Жандос Бакдаулетович, Мамытова Бакыт, Алипбаева Ханзада Базарбаевна, Мәкін Бекзат Озатұлы, Сапарханова Арайлым Оразқызы, Айқынбаев Әділбек Әбдіғаниұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (292, 'Избирательный участок № 191 
Адрес: город Алматы, микрорайон Аксай-3А, 54
Коммунальное государственное учреждение «Школа-гимназия № 123 имени Кожа Ахмета Яссауи» 
Председатель – Азербаева Айнаш Тлеугазновна, заместитель председателя - Мектепбаева Кырмызы Таттимбековна, секретарь - Сауданбекова Жалғас Бектасовна, члены комиссии - Джакаева Гульжазира Камалиевна, Сыйкимбекова Шолпан Мухаметкалиевна, Тлеугазина Дина Досжанқызы, Алимов Махабат Умбетжанович.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (293, 'Избирательный участок № 192 
Адрес: город Алматы, микрорайон Аксай-4, 107
Коммунальное государственное учреждение «Гимназия №132» 
Председатель – Раимбекова Алия Барманкуловна, заместитель председателя - Баймурзаева Шолпан Сейсебайқызы, секретарь - Маметалиева Гухарбанум Абдутжиновна, члены комиссии - Каримова Сабина Жанаткызы, Жұмағожа Жазира Нұртайқызы, Касенова Сауле Чекеновна, Ергибаева Жанна Хасановна, Угламова Шахсонам Абдхатовна,  Цой Марина Вадимовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (294, 'Избирательный участок № 193 
Адрес: город Алматы, микрорайон Аксай-4, 107
Коммунальное государственное учреждение «Гимназия № 132» 
Председатель – Мусапирова Бибинур Бакбергеновна, заместитель председателя - Роган Вера Борисовна, секретарь - Бөрі Балнұр Нұржаханқызы, члены комиссии - Зварич Нина Васильевна, Компанцева Ирина Александровна, Кандыбина Виктория Анатольевна, Катырбаева Михриниса Анваровна, Лукянченко Ирина Георгиевна, Харитонова Жаннета Сариевна, Шатько Ирина Сергеевна, Федюшина Алена Анатольевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (295, 'Избирательный участок № 194 
Адрес: город Алматы, микрорайон Аксай-4, 66
Коммунальное государственное учреждение «Школа-лицей № 126» 
Председатель – Оразалиева Толғанай Ауелхановна, заместитель председателя - Сейсенбаева Қарлығаш Рахимовна,  секретарь – Шыназ Сымбат Маратқызы, члены комиссии - Оңкайбекова Рысты Смажановна, Бахаева Шынар Аскаровна, Койшыгулов Нурлан Ерсултанович, Умарова Магрифа Сулейменовна, Абильдаева Эльмира Осимбековна, Өскенбаева Меруерт Ерсерікқызы, Сулейменова Гаухар Зинабытовна, Издибаева Гульмира Турганбековна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (296, 'Избирательный участок № 195 
Адрес: город Алматы, микрорайон Аксай-4, 66
Коммунальное государственное учреждение «Школа-лицей № 126» 
Председатель - Тулендиев Мырзахан Минайдарович, заместитель председателя - Джетпысбаева Шынар Муратовна, секретарь - Батырбекова Салтанат Серикказиевна, члены комиссии- Чукаев Тимур Бейсенкажиевич,  Тулебаева Анар Мустафаевна, Осанова Кенжегуль Кушембаевна, Батаев Бекжан Абдекеримұлы, Нуркайдарова Светлана Нуркайдаровна, Сураншиева Перизат Мейрхановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (297, 'Избирательный участок № 196 
Адрес: город Алматы,  микрорайон Аксай-5, 15 
Республиканское государственное казённое предприятие «Общежитие Аграрного университета»
Председатель – Бельгибаева Гульнара Айтбаевна, заместитель председателя - Абдыкалыкова Майгуль Еркасымовна, секретарь - Курбанова Карлыгаш Турдыковна, члены комиссии - Чаикова Динара Ишановна, Ахметова Улжалгас Салкынбековна, Томпай Үміт, Беспаева Гульжахан Токташбаевна, Шарапиева Анар Жолдыбаевна, Мелдеханова Назира Сарсенгаликызы, Исмагул Нурлыгуль Алибекқызы, Нусупова Сагыныш Каримбаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (304, 'Избирательный участок № 203 
Адрес: город Алматы, микрорайон Жетысу-1, 32А
Казахский университет путей сообщения
Председатель – Сериккулова Айлан Турехановна, заместитель председателя - Аканова Жазира Жанабаевна,  секретарь - Бексултанова Баян Омаркуловна, члены комиссии – Есетова Айгуль Алпамысовна,  Чингисова Куралай Адилжановна, Өмірғазынов Айдархан Абайұлы, Нұрланқызы Әлия, Абилдаева Шырайлым Ардаковна, Түкібай Асылзат Ахметқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (305, 'Избирательный участок № 204
Адрес: город Алматы, микрорайон Достык, улица Дастан, 27А 
Коммунальное госдарственное учреждение «Общеобразовательная школа №155» 
Председатель – Түкеева Нұржамал Бисенқызы, заместитель председателя - Каратаева Гульжан Муратовна,  секретарь - Нугманова Жадыра Багдолдаевна, члены комиссии – Рахимова Малика Мусажановна,  Бохорова Роза Александровна, Яхьярова Почунай Абдуллаевна,  Ниязова Гульбостан Курванжановна, Жакен Еділ Нурланұлы, Жәнібек Бақжан Рахметуллаұлы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (306, 'Избирательный участок № 205
Адрес: город Алматы, микрорайон Достык, улица Садвакасова, 27 Коммунальное государственное учреждение «Общеобразовательная школа №153» 
Председатель – Ушурова Сания Ахметовна,  заместитель председателя – Ашкаев Касымжан Агимжанович, секретарь - Турганова Назира Мухитдиновна, члены комиссии - Таирова Рахибям Тиливалдиевна, Сраждинова Рашида Рашининовна, Сидикова Ирина Абдулжановна Молотова Гульбахриям Сайдахметовна, Шаймарданова Саодат Якупжановна, Абдулманова Гульназ Абдуллаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (307, 'Избирательный участок № 206 
Адрес: город Алматы, микрорайон Достык, улица Садвакасова, 29 
Коммунальное государственное учреждение «Общеобразовательная школа
№ 155» 
Председатель – Надырова Нияра Бекировна, заместитель председателя - Багімбек Ләззат Әлімжанқызы,  секретарь - Окунева Татьяна Юрьевна, члены комиссии - Даутова Арзигуль Алымжановна,  Новикова Татьяна Владимировна, Амутова Мадина Абдрашитовна, Блалова Мукарам Турсуновна, Шолпанкулова Толкын Бактыбековна, Маметсопиева Адиля Дильшатовна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (298, 'Избирательный участок № 197 
Адрес: город Алматы, микрорайон Жетысу-2, 2
Коммунальное государственное учреждение «Общеобразовательная школа №117» 
Председатель – Адильбекова Ботакоз Жалеловна, заместитель председателя - Аменова Назаргуль Абдижомартовна,  секретарь  - Исмаилова Кульпану Омаровна, члены комиссии - Коршунова Евгения Анатольевна, Нургамза Руфат Жолдытолеуулы, Терезенова Гульжазира Жанибековна, Суюмбаева Елена Анатольевна, Досаева Асем Рашитовна, Нұгыманова Меруерт Нұрбақытқызы, Карашева Толкын Алимжанова, Молдадосова Гулмереке Жақыбекқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (299, 'Избирательный участок № 198 
Адрес: город Алматы,  микрорайон Жетысу-2, 8Б 
Коммунальное государственное учреждение «Общеобразовательная школа №141» 
Председатель– Умбетова Балжан Базархановна, заместитель председателя - Касбакова Бибикуль Айтбаевна, секретарь - Баймуқанова Жаннат Баймуқанқызы, члены комиссии - Оңғарбай Жандос Сейлханұлы, Еменақынова Шынарай Намазбаевна, Магажанова Мархабат Ержановна, Саржанова Жанат Ержановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (300, 'Избирательный участок № 199 
Адрес: город Алматы,  микрорайон Жетысу-2, 79
Коммунальное государственное учреждение «Центр адаптации и поддержки выпускников социальных учреждений «Жастар-үйі» 
Председатель – Иманбаева Гульмира Багыбековна, заместитель председателя - Ажибеков Дархан Сайранович,  секретарь - Беккаримова Жадыра Оразамбайқызы, члены комиссии - Таутенбаева Маржан Абдумажитовна, Шайкенова Лязат Шаймуратовна, Нұрғалиева Айсұлу Бахтығалиқызы, Шошимов Газиз Талгатович, Асанов Берик Оразханович, Шорабаева Анар Кенесбековна, Иваникова Диана Геннадиевна, Увалиев Бейсенкул Ермекбаевич.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (301, 'Избирательный участок № 200 
Адрес: город Алматы,  микрорайон Жетысу-1, 32А
Казахский университет путей сообщения
Председатель – Кашабаева Роза Ахметказиевна, заместитель председателя - Джумабекова Дарья Абдрахмановна,  секретарь - Карасай Самал Шалкарбайкызы, члены комиссии - Абланова-Муслимова Зарина Толубаевна, Жанат Сымбат Жанаткызы, Рахимжан Азимхан Рахимжанулы, Тезекбаева Балзия Адилжановна, Токсанбекова Алия Калдыбаевна, Кожаханова Салтанат Ермуратовна, Толеуов Нурлан Жолжаксович, Чукенова Эльвира Сериковна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (302, 'Избирательный участок № 201 
Адрес: город Алматы, микрорайон Достык, улица Садвакасова, 29 Коммунальное государственное учреждение «Общеобразовательная школа
№ 155» 
Председатель – Тапалова Саида Таировна, заместитель председателя - Анетбекова Айнур Турехановна,  секретарь - Хусаинова Акерке Султанмураткызы,
члены комиссии - Шулакаева Калима Ахамановна, Абдикаров Рахмятжан Нурахметович, Атаева Арайлым Арыстанбековна, Дюсюмбекова Клара Тюлегеновна, Хамидова Индира Аскаровна, Гужамбердиева Мунирам Таиржановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (303, 'Избирательный участок № 202 
Адрес: город Алматы,  микрорайон Жетысу-2,  2
Коммунальное государственное учреждение «Общеобразовательная школа
№ 117» 
Председатель – Сапарова Динара Джульбарсовна, заместитель председателя - Мамон Наталья Анатольевна,  секретарь - Дюсембаева Асель Жунусовна,
члены комиссии - Червинская Марина Владимировна,  Цапко Зоя Салиховна, Муталиев Ержан Бердешович, Буршакбаева Бану Сериккалиевна, Шарипова Елена Константиновна, Маханбетова Махаббат Нургельдиевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (308, 'Избирательный участок № 207
Адрес: город Алматы,  микрорайон Аксай-3Б, 27
Коммунальное государственное учреждение специализированный лицей-интернат «Білім-Инновация» 
Председатель – Тургамбаева Кулаш Рахановна, заместитель председателя - Аксамбиева Расима Мусабековна,  секретарь - Куттыбаева Жанар Маканбетовна, члены комиссии - Азизова Гульзабар Кутсуновна,  Иманкулова Мадина Еркиновна, Әліпбек Бағила Жарылқапқызы, Әбдрайм Гулдария Әбдраймқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (309, 'Избирательный участок № 208 
Адрес: город Алматы, микрорайон Мамыр-7, 8А 
Коммунальное государственное учреждение «Центр оказания специальных социальных услуг №3»
Председатель – Жақыпбай Мұратжан Тлегенұлы, заместитель председателя – Иргембаева Бакытгул Калмакбаевна,  секретарь - Дауренбаева Гулпан Бардауовна, члены комиссии - Измаилова Нина Афанасьевна,  Байшоинова Алтынгуль Калидолдакызы, Феллер Валентина Васильевна, Машаткулов Нияз Курбаналиевич, Маханова Айгуль Тахиркызы, Омиржанова Динара Бакбергеновна, Әлейбекова Айдана Асқарқызы, Даутова Рукиям Турсуновна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (310, 'Избирательный участок № 209 
Адрес: город Алматы, микрорайон Мамыр-1, 21 
Коммунальное государственное учреждение «Школа-лицей №173» 
Председатель – Серикбаев Бакытбек Рахимтаевич, заместитель председателя - Аубакирова Карлыгаш Майкеновна,  секретарь - Мұхат Анар Аманжолқызы, члены комиссии - Рысмагамбетова Ботагоз Жагылгасыновна, Бопышева Мейраш Жунисбековна, Тулегенов Жанат Мухлаивич, Приходько Вера Васильевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (311, 'Избирательный участок № 210 
Адрес: город Алматы,  микрорайон Мамыр-1, 21
Коммунальное государственное учреждение «Школа-лицей №173» 
Председатель – Байымбетова Ляйла Мухаметжановна, заместитель председателя - Кабдиева Гаухар Вильдановна, секретарь - Мынжасарова Арайлым Абаевна, члены комиссии - Бексултанов Нурмухамед, Нұрғасым Айсауле Ғалымжанқызы, Токшаринова Айгуль Ерсеновна, Дакибаева Самал Канатовна, Алтынбекова Бибигуль Алтынбековна, Ергазиева Макпал Сламжановна, Абаева Гульжан Мантаевна, Болат Алтынай Қанақызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (312, 'Избирательный участок № 211 
Адрес: город Алматы,  микрорайон Мамыр-1, 21
Коммунальное государственное учреждение «Школа-лицей №173» 
Председатель – Байгошкаров Жаксылык Зекенович, заместитель председателя - Иманбекова Тамара Мынжасаровна, секретарь комиссии - Балтаева Акгуль Ермековна, члены комиссии - Жапарова Жамал Бауыржановна,  Байменова Сауле Буркитбаевна, Нақсұлтан Ақерке Нақсұлтанқызы, Молдажанова Бибигуль Арангазиновна, Оразбаев Адилбек Оракович, Оспанбекова Багила Кенжегаливна, Касабаева Назипа Мукашевна, Уркимбаева Гульфия Токтасыновна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (313, 'Избирательный участок № 212 
Адрес: город Алматы, микрорайон Мамыр-7, 8А
Коммунальное государственное учреждение «Центр оказания специальных социальных услуг №3»
Председатель – Камалиев Мурат Оразбаевич, заместитель председателя - Чажабекова Алия Мукашевна,  секретарь - Қобландина Жазира Дәулетбекқызы, члены комиссии - Ибрагим Қарлыгаш Есиркепбейқызы, Органова Салтанат Туркменбаевна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (314, 'Избирательный участок № 213
Адрес: город Алматы,  микрорайон Мамыр, улица Степная, 8
Коммунальное государственное учреждение «Общеобразовательная школа № 158» 
Председатель – Сандыкбаева Гульнар Болатовна, заместитель председателя - Танкенова Умит Сатыбалдиновна,  секретарь - Кампышева Айнур Наметовна, члены комиссии - Абдуллаев Рамиз Ахмедович,  Ламаева Феруза Насыровна, Ажибаева Алиман Махмутовна, Умарова Нуржамал Тинишбаевна, Кабулова Сырга Ильясовна, Нұрмағанбетова Сымбат Зермұханбетқызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (315, 'Избирательный участок № 214 
Адрес: город Алматы, микрорайон Мамыр, улица Степная, 8
Коммунальное государственное учреждение «Общеобразовательная школа № 158» 
Председатель– Рсаева Асия Жангалиевна, заместитель председателя - Дауметова Индира Бельгибаевна,  секретарь - Омарова Дана Алшынбайқызы, члены комиссии - Туралиева Динара Айдарбековна, Мырзабекова Жазира Маратовна, Черикбаева Аяулы Сержановна, Жангалиев Тілеген Берикович, Бакиров Азиз Халилович, Берикканова Жанар Бакытжановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (316, 'Избирательный участок № 215
Адрес: город Алматы,  улица Мұстай Кәрім, 58
Не государственное учреждение «Казахская национальная гимназия «Fалым»
Председатель – Нурбекова Галия Рамазановна, заместитель председателя - Искендирова Гульнара Борибаевна,  секретарь - Пинчук Юлия Андреевна,
члены комиссии - Татимбекова Зейнекуль Байскановна,  Ермекбаева Айгерим Абызовна, Жатакбаева Баянгуль Нурсапировна, Нурлыбаева Гульнара Сактагановна, Жумадильдаева Кулзат Ибрагимовна, Садинова Мейрамкул Камысбаевна, Орынбаева Ауагуль Босыновна, Калибек Дина Сериковна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (317, 'Избирательный участок № 554 
Адрес: город Алматы,  микрорайон Мамыр-1, 21/1
Казахский университет путей сообщения
Председатель – Антонов Бауыржан Антонович, заместитель председателя -Мазимбаева Раушан Жуматаевна, секретарь - Нурекенова Айгерим Дуйсеновна, члены комиссии - Тумсабаев Курмет Болатович, Рахимбердиев Алибек Абдималикулы, Аубакирова Назира Курмангажыкызы,  Тоқсанбаева Дәрия Әбілғазықызы.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (318, 'Избирательный участок № 565 
Адрес: город Алматы,  микрорайон Достык, улица Садвакасова, 27 Коммунальное государственное учреждение «Общеобразовательная школа № 153» 
Председатель –Исаева Улман Адилбековна, заместитель председателя–Туйгунова Мехринисям Ялкуновна,  секретарь  - Ахметова Амина Рахметжановна, члены комиссии –Баудинов Абдурасул Низамутдинович, Сидикова Абдурешит Абдуваитович, Мирзалимова Мукаддас Юлдашевна, Рахимова Замира Маратовна, Изимова Хуршидям Умутжановна, Рагипова Фатима Кудусжановна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (319, 'Избирательный участок № 582
Адрес: город Алматы,  улица Толе би, 287 А
Государственное коммунальное казенное предприятие «Алматинский колледж новых технологий»
Председатель – Бахитова Бибигуль Кенесбаевна, заместитель председателя - Толендиева Махаббат Талгатовна, секретарь – Жашибаева Нургуль Советкалиевна,  члены комиссии - Ильясова Софья Утеповна, Тулепбергенова Нурбакча Омирбековна, Игиликова Назгуль Дюсембаевна, Жарылкасимова Алтынай Абдижапаровна,Копбосынова Динара Бакытбековна, Сейдахметова Гания Бекбергеновна.', 3);
INSERT INTO public.polling_station (id, station_info, district_id) OVERRIDING SYSTEM VALUE VALUES (320, 'Избирательный участок № 583 
Адрес: город Алматы, микрорайон Аксай-2, 69А
Коммунальное государственное учреждение «Общеобразовательная школа №121» 
Председатель – Панаева Марзия Чакратовна, заместитель председателя – Амдамова Равия Гапуровна, секретарь – Акимбаева Жадыра Кудайбергеновна, члены комиссии – Айдабосынова Айнаш Ерсинбаевна, Саламатова Дана Рабхатовна, Утепбергенова Назира Еркинбековна, Қанатбай Ұлпан Жандарханқызы.', 3);


--
-- TOC entry 3066 (class 0 OID 16484)
-- Dependencies: 200
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, phone_number, lang, name) VALUES (1808256, '+77026404042', 'ru', 'Эмиль');
INSERT INTO public.users (id, phone_number, lang, name) VALUES (450590502, NULL, 'ru', NULL);


--
-- TOC entry 3067 (class 0 OID 16519)
-- Dependencies: 201
-- Data for Name: violation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 204
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_id_seq', 18, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 206
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.district_id_seq', 218, true);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 208
-- Name: polling_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.polling_station_id_seq', 320, true);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 202
-- Name: violation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.violation_id_seq', 13, true);


--
-- TOC entry 2927 (class 2606 OID 16536)
-- Name: area Area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT "Area_pkey" PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 16546)
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 16581)
-- Name: poll poll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poll
    ADD CONSTRAINT poll_pkey PRIMARY KEY (chat_id);


--
-- TOC entry 2931 (class 2606 OID 16561)
-- Name: polling_station polling_station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polling_station
    ADD CONSTRAINT polling_station_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 16488)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 16526)
-- Name: violation violation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violation
    ADD CONSTRAINT violation_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 16547)
-- Name: district district_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.area(id);


--
-- TOC entry 2935 (class 2606 OID 16562)
-- Name: polling_station polling_station_district_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polling_station
    ADD CONSTRAINT polling_station_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.district(id);


-- Completed on 2021-01-09 08:57:11 +06

--
-- PostgreSQL database dump complete
--

