--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-08 15:50:56 UTC

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

--
-- TOC entry 3030 (class 1262 OID 17228)
-- Name: FoodServices; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE "FoodServices" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "FoodServices" OWNER TO admin;

\connect "FoodServices"

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
-- TOC entry 200 (class 1259 OID 17229)
-- Name: ta_outlet; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ta_outlet (
    outletid character varying NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    country character varying NOT NULL,
    phone character varying NOT NULL,
    reviews bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ta_outlet OWNER TO admin;

--
-- TOC entry 202 (class 1259 OID 17264)
-- Name: ta_reviews; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ta_reviews (
    "user" character varying NOT NULL,
    outletid character varying NOT NULL,
    review character varying NOT NULL,
    rate bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ta_reviews OWNER TO admin;

--
-- TOC entry 201 (class 1259 OID 17254)
-- Name: ta_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ta_user (
    "user" character varying NOT NULL,
    likes bigint DEFAULT 0,
    reviews bigint DEFAULT 0,
    address character varying NOT NULL
);


ALTER TABLE public.ta_user OWNER TO admin;

--
-- TOC entry 204 (class 1259 OID 17311)
-- Name: ub_menu; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ub_menu (
    outletid character varying NOT NULL,
    name character varying NOT NULL,
    brand character varying NOT NULL,
    price double precision NOT NULL,
    volume character varying NOT NULL
);


ALTER TABLE public.ub_menu OWNER TO admin;

--
-- TOC entry 203 (class 1259 OID 17308)
-- Name: ub_outlet; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.ub_outlet (
    outletid character varying NOT NULL,
    country character varying NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    reviews bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ub_outlet OWNER TO admin;

--
-- TOC entry 205 (class 1259 OID 17368)
-- Name: vw_outlets; Type: VIEW; Schema: public; Owner: admin
--

CREATE VIEW public.vw_outlets AS
 SELECT ta.outletid,
    ta.name,
    ta.address,
    ta.country,
    ta.phone,
    ta.reviews,
    'tripadvisor'::text AS source
   FROM public.ta_outlet ta
UNION ALL
 SELECT ub.outletid,
    ub.name,
    ub.address,
    ub.country,
    ''::character varying AS phone,
    ub.reviews,
    'ubereats'::text AS source
   FROM public.ub_outlet ub;


ALTER TABLE public.vw_outlets OWNER TO admin;

--
-- TOC entry 3020 (class 0 OID 17229)
-- Dependencies: 200
-- Data for Name: ta_outlet; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ta_outlet (outletid, name, address, country, phone, reviews) FROM stdin;
https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	OZONE	No.1 Austin Road West | International Commerce Centre,, Hong Kong, China	China	+852 2263 2270	3970
https://www.tripadvisor.com/Restaurant_Review-g294217-d1745792-Reviews-Tim_Ho_Wan_the_Dim_Sum_Specialists-Hong_Kong.html	Tim Ho Wan, the Dim-Sum Specialists	Shop 72, G/F, Olympian City 2, 18 Hoi Ting Road, Tai Kok Tsui | Olympian City Mall, Hong Kong, China	China	+852 2332 2896	3188
https://www.tripadvisor.com/Restaurant_Review-g294217-d779644-Reviews-Aqua_Roma_Aqua_Tokyo_Aqua_Spirit-Hong_Kong.html	Aqua Roma, Aqua Tokyo & Aqua Spirit	29/F & 30/F, 1 Peking Road, Tsim Sha Tsui, Hong Kong, China	China	+852 3427 2288	3039
https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	One Dim Sum Chinese Restaurant	G/F 209A-209B Tung Choi Street | Prince Edward, Hong Kong, China	China	+852 2789 2280	2686
https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Din Tai Fung (Yee Wo Branch)	No.68 Yee Wo Street, Causeway Bay, Hong Kong, China	China	+852 3160 8998	2092
https://www.tripadvisor.com/Restaurant_Review-g294217-d1367659-Reviews-Hutong-Hong_Kong.html	Hutong	1 Peking Road, Tsim Sha Tsui | 28/f, Hong Kong, China	China	+852 3428 8342	1846
https://www.tripadvisor.com/Restaurant_Review-g294217-d2422144-Reviews-Tim_Ho_Wan_Central-Hong_Kong.html	Tim Ho Wan (Central)	Shop 12A, Hong Kong Station Podium Level 1, IFC Mall , Central, Hong Kong, China	China	+852 2332 3078	1742
https://www.tripadvisor.com/Restaurant_Review-g294217-d776832-Reviews-Australia_Dairy_Company-Hong_Kong.html	Australia Dairy Company	G/F, 47-49 Parkes Street, Jordan, Hong Kong, China	China	+852 2730 1356	1728
https://www.tripadvisor.com/Restaurant_Review-g294217-d5400408-Reviews-Din_Tai_Fung_Silvercord-Hong_Kong.html	Din Tai Fung (Silvercord)	3/F, Silvercord, No.30 Canton Road, Tsim Sha Tsui, Kowloon, Hong Kong, China	China	+852 2730 6928	1660
https://www.tripadvisor.com/Restaurant_Review-g294217-d785057-Reviews-Yung_Kee_Restaurant-Hong_Kong.html	Yung Kee Restaurant	32-40 Wellington Street | Central, Hong Kong, China	China	+852 2522 1624	1659
https://www.tripadvisor.com/Restaurant_Review-g294217-d878088-Reviews-The_Lobby_at_the_Peninsula_Hong_Kong-Hong_Kong.html	The Lobby at the Peninsula Hong Kong	Salisbury Road, Hong Kong, China	China	+852 2696 6772	1616
https://www.tripadvisor.com/Restaurant_Review-g294217-d1207531-Reviews-Jumbo_Kingdom_Floating_Restaurant-Hong_Kong.html	Jumbo Kingdom Floating Restaurant	Shum Wan Pier Dr | Wong Chuk Hang, Hong Kong, China	China	+852 2553 9111	1574
https://www.tripadvisor.com/Restaurant_Review-g294217-d1811943-Reviews-Cafe_Gray_Deluxe-Hong_Kong.html	Cafe Gray Deluxe	L49 The Upper House, Pacific Place, No.88 Queensway, Admiralty, Hong Kong, China	China	+852 3968 1106	1512
https://www.tripadvisor.com/Restaurant_Review-g294217-d799966-Reviews-Bubba_Gump_Shrimp_Co-Hong_Kong.html	Bubba Gump Shrimp Co.	Shop 304 & 305, Level 3, The Peak Tower, 128 Peak Road, Hong Kong, China	China	+852 2849 2867	1380
https://www.tripadvisor.com/Restaurant_Review-g294217-d2399904-Reviews-Tin_Lung_Heen-Hong_Kong.html	Tin Lung Heen	1 Austin Road West | 102/F, The Ritz-Carlton, International Commerce Centre, Hong Kong, China	China	+852 2263 2270	1380
https://www.tripadvisor.com/Restaurant_Review-g294217-d3749262-Reviews-Tim_Ho_Wan_Sham_Shui_Po-Hong_Kong.html	Tim Ho Wan Sham Shui Po	G/F, 9-11 Fuk Wing Street, Hong Kong, China	China	+852 2788 1226	1350
https://www.tripadvisor.com/Restaurant_Review-g294217-d798091-Reviews-City_Hall_Maxim_s_Palace-Hong_Kong.html	City Hall Maxim's Palace	2/F, Low Block, City Hall, Central, Hong Kong, China	China	+852 2521 1303	1296
https://www.tripadvisor.com/Restaurant_Review-g294217-d943734-Reviews-Spring_Deer-Hong_Kong.html	Spring Deer	2/F, 42 Mody Road, Tsim Sha Tsui, Hong Kong, China	China	+852 2366 4012	1281
https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	Mott 32	Basement, Standard Chartered Bank Building, No.4-4A Des Voeux Road Central, Central, Hong Kong, China	China	+852 2885 8688	1253
https://www.tripadvisor.com/Restaurant_Review-g294217-d2161545-Reviews-Tosca_di_Angelo-Hong_Kong.html	Tosca di Angelo	1 Austin Road West | International Commerce Centre,, Hong Kong, China	China	+852 2263 2270	1230
https://www.tripadvisor.com/Restaurant_Review-g294217-d2166297-Reviews-The_Lounge_Bar-Hong_Kong.html	The Lounge & Bar	1 Austin Road West | International Commerce Centre, Hong Kong, China	China	+852 2263 2270	1165
https://www.tripadvisor.com/Restaurant_Review-g294217-d8353573-Reviews-Scarlett_Cafe_Wine_Bar-Hong_Kong.html	Scarlett Cafe & Wine Bar	G/F, 2 Austin Avenue, Tsim Sha Tsui, Kowloon, Hong Kong, China	China	+852 3565 6513	1101
https://www.tripadvisor.com/Restaurant_Review-g294217-d1892540-Reviews-Wooloomooloo_Steakhouse_Wan_Chai-Hong_Kong.html	Wooloomooloo Steakhouse (Wan Chai)	31/F & Rooftop The Hennessy, 256 Hennessy Road, Wan Chai, Hong Kong, China	China	+852 2893 6960	1098
https://www.tripadvisor.com/Restaurant_Review-g294217-d1024986-Reviews-NOBU_InterContinental_Hong_Kong-Hong_Kong.html	NOBU (InterContinental Hong Kong)	18 Salisbury Road | InterContinental Hong Kong, Hong Kong, China	China	+852 2313 2323	1055
https://www.tripadvisor.com/Restaurant_Review-g294217-d940224-Reviews-Felix-Hong_Kong.html	Felix	The Peninsula Hotel, Salisbury Road, | Tsim Sha Tsui, Hong Kong, China	China	+852 2696 6778	1054
https://www.tripadvisor.com/Restaurant_Review-g294217-d6758068-Reviews-Ho_Lee_Fook-Hong_Kong.html	Ho Lee Fook	G/F, No.1-5 Elgin Street, SoHo, Hong Kong, China	China	+852 2810 0860	1033
https://www.tripadvisor.com/Restaurant_Review-g294217-d841139-Reviews-Zuma-Hong_Kong.html	Zuma	15 Queen's Road | Landmark Atrium - Level 5 & 6, Hong Kong, China	China	+852 3657 6388	1031
https://www.tripadvisor.com/Restaurant_Review-g294217-d939504-Reviews-Amber-Hong_Kong.html	Amber	No.15 Queen's Road Central | 7/F, The Landmark Mandarin Oriental, Hong Kong, China	China	+852 2132-0066	1025
https://www.tripadvisor.com/Restaurant_Review-g294217-d7808139-Reviews-Braza_Churrascaria_Brazilian_Steakhouse-Hong_Kong.html	Braza Churrascaria Brazilian Steakhouse	3/F, Grand Progress Building, No.15-16 Lan Kwai Fong, Central, Hong Kong, China	China	+852 2890 9268	1023
https://www.tripadvisor.com/Restaurant_Review-g294217-d3749223-Reviews-Yat_Lok_Restaurant-Hong_Kong.html	Yat Lok Restaurant	G/F, 34-38 Stanley Street, Hong Kong, China	China	+852 2524 3882	997
https://www.tripadvisor.com/Restaurant_Review-g294217-d6894266-Reviews-Kam_s_Roast_Goose-Hong_Kong.html	Kam's Roast Goose	No.226 Hennessy Road, Wan Chai | G/F, Po Wah Commercial Centre, Hong Kong, China	China	+852 5408 7740	994
https://www.tripadvisor.com/Restaurant_Review-g294217-d1062729-Reviews-Lung_King_Heen-Hong_Kong.html	Lung King Heen	8 Finance Street, Central | Podium 4, Four Seasons Hotel Hong Kong,, Hong Kong, China	China	+852 3196 8888	972
https://www.tripadvisor.com/Restaurant_Review-g294217-d1527741-Reviews-Lin_Heung_Tea_House-Hong_Kong.html	Lin Heung Tea House	G/F 160-164 Wellington Street, Central, Hong Kong, China	China	+852 2544 4556	939
https://www.tripadvisor.com/Restaurant_Review-g294217-d2534180-Reviews-Dim_Sum_Square-Hong_Kong.html	Dim Sum Square	88 Jervois Street, Sheung wan, Hong Kong, China	China	+852 2851 8088	938
https://www.tripadvisor.com/Restaurant_Review-g294217-d919498-Reviews-Mak_s_Noodle_Mak_Un_Kee-Hong_Kong.html	Mak's Noodle (Mak Un Kee)	77 Wellington St., Central, Hong Kong, China	China	+852 2854 3810	929
https://www.tripadvisor.com/Restaurant_Review-g294217-d3171948-Reviews-DimDimSum_Dim_Sum_Specialty_Store_Wan_Chai-Hong_Kong.html	DimDimSum Dim Sum Specialty Store (Wan Chai)	7 Tin Lok Lane, Causeway Bay, Wan Chai, Hong Kong, China	China	+852 2891 7677	919
https://www.tripadvisor.com/Restaurant_Review-g294217-d795044-Reviews-Kau_Kee_Restaurant-Hong_Kong.html	Kau Kee Restaurant	G/F., 21 Gough Street, Mid-Level, Central, Hong Kong, China	China	+852 2815 0123	911
https://www.tripadvisor.com/Restaurant_Review-g294217-d799832-Reviews-Kam_Wah_Cafe-Hong_Kong.html	Kam Wah Cafe	47 Bute Street, Mongkok, Hong Kong, China	China	+852 2392 6830	911
https://www.tripadvisor.com/Restaurant_Review-g294217-d786130-Reviews-The_Sweet_Dynasty_Tsim_Sha_Tsui-Hong_Kong.html	The Sweet Dynasty (Tsim Sha Tsui)	Shop A, Hong Kong Pacific Centre, 28 Hankow Road, Tsim Sha Tsu, Hong Kong, China	China	+852 2199 7799	910
https://www.tripadvisor.com/Restaurant_Review-g294217-d7050211-Reviews-Bread_Street_Kitchen-Hong_Kong.html	Bread Street Kitchen	No.118 Peak Road | Shop G02, G/F, The Peak Galleria, Hong Kong, China	China	+852 2350 3888	901
https://www.tripadvisor.com/Restaurant_Review-g294217-d799899-Reviews-Tai_Cheong_Bakery-Hong_Kong.html	Tai Cheong Bakery	35 Lydhurst Terrace, Central, Hong Kong, China	China	+852 2544 3475	900
https://www.tripadvisor.com/Restaurant_Review-g294217-d1052864-Reviews-Sevva-Hong_Kong.html	Sevva	25/F, Prince's Building, 10 Chater Road, Central, Hong Kong, China	China	+852 2537 1388	899
https://www.tripadvisor.com/Restaurant_Review-g294217-d6739503-Reviews-Ding_Dim_1968-Hong_Kong.html	Ding Dim 1968	59 Wyndham Street, Central | G/f, Hong Kong, China	China	+852 2326 1968	892
https://www.tripadvisor.com/Restaurant_Review-g294217-d10089430-Reviews-Capo-Hong_Kong.html	Capo	Shop 4C-D, Tower 1, PL/F., China Hong Kong City, Hong Kong, China	China	+852 2523 9009	889
https://www.tripadvisor.com/Restaurant_Review-g294217-d2514791-Reviews-The_Market-Hong_Kong.html	The Market	Level 2, Hotel ICON, 17 Science Museum Road, Tsim Sha Tsui East | Tsim Sha Tsui East, Kowloon,, Hong Kong, China	China	+852 3400 1388	879
https://www.tripadvisor.com/Restaurant_Review-g294217-d1755975-Reviews-Tsui_Wah_Restaurant_Pak_Hoi_Street_Shop-Hong_Kong.html	Tsui Wah Restaurant (Pak Hoi Street Shop)	G/F-1/F, 17-19 Pak Hoi St., Yau Ma Te, Hong Kong, China	China	+852 2780 8328	876
https://www.tripadvisor.com/Restaurant_Review-g294217-d912108-Reviews-Caprice_Central-Hong_Kong.html	Caprice (Central)	6F, Four Seasons Hotel, Central | Four Seasons Hotel Hong Kong, Hong Kong, China	China	+852 3196 8860	876
https://www.tripadvisor.com/Restaurant_Review-g294217-d816324-Reviews-Crystal_Jade_La_Mian_Xiao_Long_Bao_Gateway_Arcade-Hong_Kong.html	Crystal Jade La Mian Xiao Long Bao (Gateway Arcade)	Shop 3328, Level 3, Gateway Arcade, Harbour City, 3-27 Canton Road, Tsim Sha Tsui, Kowloon, Hong Kong, China	China	+852 2622 2699	829
https://www.tripadvisor.com/Restaurant_Review-g294217-d844402-Reviews-Morton_s_The_Steakhouse-Hong_Kong.html	Morton's - The Steakhouse	4th Floor, The Sheraton Hotel & Towers, No.20 Nathan Road, Tsim Sha Tsui | 20 Nathan Road, Kowloon, Hong Kong, China	China	+852 2732 2343	826
https://www.tripadvisor.com/Restaurant_Review-g294217-d2390123-Reviews-Above_and_Beyond-Hong_Kong.html	Above and Beyond	Level 28, Hotel ICON, 17 Science Museum Road, Tsim Sha Tsui East, Hong Kong, China	China	+852 3400 1318	816
https://www.tripadvisor.com/Restaurant_Review-g294217-d809453-Reviews-L_Atelier_de_Joel_Robuchon-Hong_Kong.html	L'Atelier de Joel Robuchon	15 Queen's Road Central, Hong Kong, China	China	+852 2166 9000	805
https://www.tripadvisor.com/Restaurant_Review-g294217-d7289468-Reviews-Pirata-Hong_Kong.html	Pirata	30/F, No. 239 Hennessy Road | Wan Chai, Hong Kong Wan Chai, China	China	+852 5485 5329	787
https://www.tripadvisor.com/Restaurant_Review-g294217-d3309467-Reviews-DimDimSum_Dim_Sum_Specialty_Store_Mong_Kok-Hong_Kong.html	DimDimSum Dim Sum Specialty Store (Mong Kok)	112 Tung Choi Street, Hong Kong 000000, China	China	+852 2309 2300	783
https://www.tripadvisor.com/Restaurant_Review-g294217-d788642-Reviews-The_Peak_Lookout-Hong_Kong.html	The Peak Lookout	121 Peak Road, The Peak, Hong Kong, China	China	+852 2849 1000	782
https://www.tripadvisor.com/Restaurant_Review-g294217-d1320779-Reviews-Hard_Rock_Cafe_Hong_Kong-Hong_Kong.html	Hard Rock Cafe Hong Kong	LG/F LKF Tower, 55 D'Aguilar Street, Lan Kwai Fong | Central, Hong Kong 00000, China	China	+852 2111 3777	774
https://www.tripadvisor.com/Restaurant_Review-g294217-d1100137-Reviews-Spasso_Italian_Bar_Restaurant-Hong_Kong.html	Spasso Italian Bar & Restaurant	G5-8, 12-17, Empire Centre, No.68 Mody Road, Tsim Sha Tsui East, Kowloon, Hong Kong, China	China	+852 2730 8027	763
https://www.tripadvisor.com/Restaurant_Review-g294217-d1094369-Reviews-Tsim_Chai_Kee_Noodle_Wellington_Street-Hong_Kong.html	Tsim Chai Kee Noodle Wellington Street	98 Wellington Street. Central, Hong Kong, China	China	+852 2850 6471	762
https://www.tripadvisor.com/Restaurant_Review-g294217-d798374-Reviews-Tsui_Wah_Restaurant-Hong_Kong.html	Tsui Wah Restaurant	15-19 Wellington St, Central, Hong Kong, China	China	+852 2525 6338	760
https://www.tripadvisor.com/Restaurant_Review-g294217-d799250-Reviews-Bombay_Dreams-Hong_Kong.html	Bombay Dreams	77 Wyndham Street, Hong Kong, China	China	+852 2971 0001	743
https://www.tripadvisor.com/Restaurant_Review-g294217-d786786-Reviews-Isola_Bar_Grill-Hong_Kong.html	Isola Bar & Grill	Shop 2075, 2/F, IFC, 8 Finance Street, Central District | Shop 2075, Podium 2, ifc mall, Hong Kong, China	China	+852 2383 8765	739
https://www.tripadvisor.com/Restaurant_Review-g294217-d941989-Reviews-Mandarin_Grill_Bar_at_Mandarin_Oriental_Hong_Kong-Hong_Kong.html	Mandarin Grill + Bar at Mandarin Oriental, Hong Kong	5 Connaught Road Central | 5 Connaught Road Central, Hong Kong 000000, China	China	+852 2825 4004	731
https://www.tripadvisor.com/Restaurant_Review-g294217-d1196158-Reviews-Hui_Lau_Shan-Hong_Kong.html	Hui Lau Shan	Jordan road, Hong Kong, China	China	+852 2377 9766	719
https://www.tripadvisor.com/Restaurant_Review-g294217-d1089734-Reviews-Under_the_Bridge_Spicy_Crab-Hong_Kong.html	Under the Bridge Spicy Crab	405 Lockhart Road, Wan Chai, Hong Kong, China	China	+852 2573 7698	708
https://www.tripadvisor.com/Restaurant_Review-g294217-d2276403-Reviews-Bistecca_Italian_Steak_House-Hong_Kong.html	Bistecca Italian Steak House	2nd Floor, Grand Progress Building,15-16 Lan Kwai Fong, Hong Kong, China	China	+852 2525 1308	697
https://www.tripadvisor.com/Restaurant_Review-g294217-d1546043-Reviews-Luk_Yu_Tea_House-Hong_Kong.html	Luk Yu Tea House	No.24-26 Stanley Street, Central, Hong Kong, China	China	+852 2523 5464	693
https://www.tripadvisor.com/Restaurant_Review-g294217-d2017430-Reviews-Peking_Garden_Tsim_Sha_Tsui-Hong_Kong.html	Peking Garden (Tsim Sha Tsui)	3/F, Star House, Tsimshatsui, Kowloon, Hong Kong, China	China	+852 2735 8211	691
https://www.tripadvisor.com/Restaurant_Review-g294217-d927163-Reviews-Yan_Toh_Heen_InterContinental_Hong_Kong-Hong_Kong.html	Yan Toh Heen (InterContinental Hong Kong)	18 Salisbury Road, Tsim Sha Tsui | InterContinental Hong Kong,, Hong Kong, China	China	+852 2313 2323	678
https://www.tripadvisor.com/Restaurant_Review-g294217-d1955748-Reviews-Wooloomooloo_Prime_Tsim_Sha_Tsui-Hong_Kong.html	Wooloomooloo Prime (Tsim Sha Tsui)	Level 21, The ONE, No.100 Nathan Road, Tsim Sha Tsui, Kowloon, Hong Kong, China	China	+852 2870 0087	671
https://www.tripadvisor.com/Restaurant_Review-g294217-d1799916-Reviews-Kitchen_W_Hotel_Hong_Kong-Hong_Kong.html	Kitchen (W Hotel Hong Kong)	1 Austin Road West,Kowloon | 6/F, W Hong Kong, Hong Kong, China	China	+852 3717 2299	666
https://www.tripadvisor.com/Restaurant_Review-g294217-d2437900-Reviews-DimDimSum_Dim_Sum_Specialty_Store_Jordan-Hong_Kong.html	DimDimSum Dim Sum Specialty Store (Jordan)	26-28 Man Wui St, Jordan, Kowloon | Austin Station Exit A, Hong Kong, China	China	+852 2771 7766	662
https://www.tripadvisor.com/Restaurant_Review-g294217-d6951944-Reviews-Jamie_s_Italian-Hong_Kong.html	Jamie's Italian	2/F, Soundwill Plaza II- Midtown, No.1 Tang Lung Street, Causeway Bay, Hong Kong, China	China	+852 3958 2222	660
https://www.tripadvisor.com/Restaurant_Review-g294217-d2017661-Reviews-Lin_Heung_Kui-Hong_Kong.html	Lin Heung Kui	2-3/F, No.46-50 Des Voeux Road West, Sheung Wan, Hong Kong, China	China	+852 2156 9328	656
https://www.tripadvisor.com/Restaurant_Review-g294217-d938999-Reviews-Peking_Garden_Restaurant_Alexandra_House-Hong_Kong.html	Peking Garden Restaurant (Alexandra House)	16-20 Chater Road | Shop B1, Basement 1, Alexandra House, Hong Kong, China	China	+852 2526 6456	653
https://www.tripadvisor.com/Restaurant_Review-g294217-d2433070-Reviews-Tango_Argentinian_Steak_House-Hong_Kong.html	Tango Argentinian Steak House	1st Floor, Carfield Building, 77 Wyndham Street,Central, Hong Kong, China	China	+852 2525 5808	649
https://www.tripadvisor.com/Restaurant_Review-g294217-d1792423-Reviews-Man_Wah-Hong_Kong.html	Man Wah	5 Connaught Road Central | 5 Connaught Road Central, Hong Kong 000000, China	China	+852 2825 4003	647
https://www.tripadvisor.com/Restaurant_Review-g294217-d1482758-Reviews-Lobby_Lounge_InterContinental_Hong_Kong-Hong_Kong.html	Lobby Lounge (InterContinental Hong Kong)	18 Salisbury Road, Tsim Sha Tsui | InterContinental Hong Kong, Hong Kong, China	China	+852 2313 2323	637
https://www.tripadvisor.com/Restaurant_Review-g294217-d800834-Reviews-Mak_Man_Kee_Noodle_Shop-Hong_Kong.html	Mak Man Kee Noodle Shop	51 Parkes Street, Yaumatei, Hong Kong, China	China	+852 2736 5561	637
https://www.tripadvisor.com/Restaurant_Review-g294217-d1094822-Reviews-Ming_Court_Cordis_Hong_Kong-Hong_Kong.html	Ming Court (Cordis, Hong Kong)	6/F, Cordis, Hong Kong at Langham Place | 555 Shanghai Street, Mongkok, Kowloon, Hong Kong, China	China	+852 3552 3028	625
https://www.tripadvisor.com/Restaurant_Review-g294217-d1098376-Reviews-The_Pawn-Hong_Kong.html	The Pawn	62 Johnston Road, Wan Chai, Hong Kong, China	China	+852 2866 3444	618
https://www.tripadvisor.com/Restaurant_Review-g294217-d793034-Reviews-Harbourside_Restaurant-Hong_Kong.html	Harbourside Restaurant	18 Salisbury Road | InterContinental HongKong, Hong Kong, China	China	+852 2313 2323	601
https://www.tripadvisor.com/Restaurant_Review-g294217-d1952785-Reviews-Delaney_s_Kowloon_Irish_Bar-Hong_Kong.html	Delaney's Kowloon Irish Bar	No.77 Peking Road | Tsim Sha Tsui, Hong Kong, China	China	+852 2301 3980	576
https://www.tripadvisor.com/Restaurant_Review-g294217-d3602180-Reviews-22_Ships-Hong_Kong.html	22 Ships	No.22 Ship Street, Wan Chai, Hong Kong, China	China	+852 2555 0722	572
https://www.tripadvisor.com/Restaurant_Review-g294217-d1027723-Reviews-Clipper_Lounge-Hong_Kong.html	Clipper Lounge	5 Connaught Road Central | 5 Connaught Road Central, Hong Kong 000000, China	China	+852 2825 4007	570
https://www.tripadvisor.com/Restaurant_Review-g294217-d11621345-Reviews-Tim_Ho_Wan-Hong_Kong.html	Tim Ho Wan	2-8 Wharf Road, Seaview Building, North Point | Shop B, C, & D, G/F, Hong Kong, China	China	+852 2979 5608	562
https://www.tripadvisor.com/Restaurant_Review-g294217-d799819-Reviews-Nathan_Congee_And_Noodle-Hong_Kong.html	Nathan Congee And Noodle	11 Sai Kung Street,, Jordan, Hong Kong, China	China	+852 2771 4285	553
https://www.tripadvisor.com/Restaurant_Review-g294217-d2165749-Reviews-AL_MOLO_RISTORANTE_ITALIANO_Michael_White-Hong_Kong.html	AL MOLO RISTORANTE ITALIANO - Michael White	Shop G63, G/F, Ocean Terminal, Harbour City, 3-27 Canton Road, Tsim Sha Tsui, Kowloon, Hong Kong, China	China	+852 2730 7900	550
https://www.tripadvisor.com/Restaurant_Review-g294217-d2719190-Reviews-Sang_Kee_Congee_Shop-Hong_Kong.html	Sang Kee Congee Shop	Ground Floor, 7 - 9 Butt Street, Sheung Wan, Hong Kong, China	China	+852 2541 1099	523
https://www.tripadvisor.com/Restaurant_Review-g294217-d2423554-Reviews-8_1_2_Otto_e_Mezzo_Bombana-Hong_Kong.html	8 1/2 Otto e Mezzo Bombana	202 Alexandra, 18 House Chater Rd.Central, Hong Kong, China	China	+852 2537 8859	519
https://www.tripadvisor.com/Restaurant_Review-g294217-d6420711-Reviews-Little_Bao-Hong_Kong.html	Little Bao	G/F 66 Staunton Street, Central, Hong Kong, China	China	+852 2194 0202	504
https://www.tripadvisor.com/Restaurant_Review-g294217-d4928934-Reviews-Canton_s_Dim_Sum_Expert_Tsim_Sha_Tsui-Hong_Kong.html	Canton's Dim Sum Expert - Tsim Sha Tsui	No.11 Humphreys Avenue | B/F, Tsim Sha Tsui, Hong Kong 999077, China	China	+852 2332 7122	500
https://www.tripadvisor.com/Restaurant_Review-g294217-d3600498-Reviews-Cafe_103-Hong_Kong.html	Cafe 103	1 Austin Road West | International Commerce Centre,, Hong Kong 852, China	China	+852 2263 2270	499
https://www.tripadvisor.com/Restaurant_Review-g294217-d799972-Reviews-Gaylord_Indian_Restaurant-Hong_Kong.html	Gaylord Indian Restaurant	5/F, Prince Tower, 12A Peking Road, Tsim Sha Tsui, Kowloon, Hong Kong 999077, China	China	+852 2376 1001	496
https://www.tripadvisor.com/Restaurant_Review-g294217-d1023200-Reviews-T_ang_Court_The_Langham_Hong_Kong-Hong_Kong.html	T'ang Court - The Langham, Hong Kong	No.8 Peking Road | Tsim Sha Tsui, Hong Kong, China	China	+852 2132 7898	496
https://www.tripadvisor.com/Restaurant_Review-g294217-d1880782-Reviews-Carpaccio_Pasta_Pizza_Vino-Hong_Kong.html	Carpaccio Pasta Pizza Vino	Shop 307, 3rd Floor, iSQUARE, No.63 Nathan Road, Tsim Sha Tsui, Hong Kong, China	China	+852 2328 5202	491
https://www.tripadvisor.com/Restaurant_Review-g294217-d4361851-Reviews-Motorino_SoHo-Hong_Kong.html	Motorino SoHo	G/F, 14 Shelley Street, Central | 15 Ship Street, Wan Chai, Hong Kong, China	China	+852 2801 6881	491
https://www.tripadvisor.com/Restaurant_Review-g294217-d1776480-Reviews-BLT_Steak_Ocean_Terminal-Hong_Kong.html	BLT Steak (Ocean Terminal)	Shop G62, G/F, Ocean Terminal, Harbour City, 3-27 Canton Road, Tsim Sha Tsui, Kowloon, Hong Kong 2730 3508, China	China	+852 2730 3508	490
https://www.tripadvisor.com/Restaurant_Review-g294217-d793088-Reviews-Bo_Innovation-Hong_Kong.html	Bo Innovation	Shop 13, 2/F J Residence; 60 Johnston Road,Wan Chai | (Lift entrance at top of Ship Street), Hong Kong, China	China	+852 2850 8371	484
https://www.tripadvisor.com/Restaurant_Review-g294217-d1811458-Reviews-Ho_Hung_Kee-Hong_Kong.html	Ho Hung Kee	12th Floor, Hysan Place, 500 Hennessy Road, Causeway Bay, Hong Kong, China	China	+852 2577 6558	476
https://www.tripadvisor.com/Restaurant_Review-g294217-d779820-Reviews-Lan_Fong_Yuen_Central-Hong_Kong.html	Lan Fong Yuen(Central)	G/F2 Gage Street Central, Hong Kong, China	China	+852 2544 3895	475
https://www.tripadvisor.com/Restaurant_Review-g294217-d3927685-Reviews-Tai_Ping_Koon_Restaurant_Mau_Lam_Street-Hong_Kong.html	Tai Ping Koon Restaurant (Mau Lam Street)	G/F, 19-21 Mau Lam Street, Yau Ma Tei, Kowloon, Jordan, Hong Kong, China	China	+852 2384 3385	469
\.


--
-- TOC entry 3022 (class 0 OID 17264)
-- Dependencies: 202
-- Data for Name: ta_reviews; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ta_reviews ("user", outletid, review, rate) FROM stdin;
bobwK5197LB	https://www.tripadvisor.com/Restaurant_Review-g294217-d10089430-Reviews-Capo-Hong_Kong.html	Visited Capo with a business colleague.  Due to shipping issues, none of the Italian beer was available.  The wine was affordably priced; that being said, it was only available by the bottle.  Not that kind of evening.  Started with the Bruschetta.  The toppings were fresh...More	3
Brittaperry	https://www.tripadvisor.com/Restaurant_Review-g294217-d788642-Reviews-The_Peak_Lookout-Hong_Kong.html	Food was nice but overpriced. Service could be better but it wasn't terrible. You won't have a bad time here but if you're looking for value for money, maybe skip this place. :)	3
clementc516	https://www.tripadvisor.com/Restaurant_Review-g294217-d2161545-Reviews-Tosca_di_Angelo-Hong_Kong.html	I have luck to have lunch on April 8th with friendly and professional service were provided by Francesco (manager of Tosca) & Ms. Erica, they gave good introduction of food and communicated with client more comfortable!\nRegarding to the food served as fine dining by...More	5
Celio K	https://www.tripadvisor.com/Restaurant_Review-g294217-d2433070-Reviews-Tango_Argentinian_Steak_House-Hong_Kong.html	First the empanadas were a good starter. The rump steak was made the way I like it and asked for. The service was friendly and professional. Nice casual atmosphere.	4
ChoyN3	https://www.tripadvisor.com/Restaurant_Review-g294217-d2399904-Reviews-Tin_Lung_Heen-Hong_Kong.html	Nice service and good environment!!!\nLove the amazing food and enjoy the high quality service!!!!!!Highly recommend!!!!!!!!More	5
Joseph-in-NYC	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	During a recent stay at the hotel, we stopped in for a drink at Ozone before dinner at Tosca.  Not sure what the fuss is all about, I found the decor to be cheezy, the music cheezier and the crowd w/sticks of Velveeta oozing out...More	1
rkim511	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	I've been hearing about this place non-stop from food blogs and friends so I finally had a chance to check it out and the verdict? So so. The decor was beautiful and the service was top notch. The bathroom decor is my second favorite in...More	4
Anastasia9992015	https://www.tripadvisor.com/Restaurant_Review-g294217-d1024986-Reviews-NOBU_InterContinental_Hong_Kong-Hong_Kong.html	Приятный ресторан с красивым видом. Освещение темное, видимо, чтобы весь взгляд был на залив. Из-за расположения трех ресторанов достаточно шумно....More	5
S4213YDkevinc	https://www.tripadvisor.com/Restaurant_Review-g294217-d3602180-Reviews-22_Ships-Hong_Kong.html	Delicious tapas with a wide variety of flavours. Found it a bit over crowded and staff will tell you where to sit.	4
ken_stearns	https://www.tripadvisor.com/Restaurant_Review-g294217-d2276403-Reviews-Bistecca_Italian_Steak_House-Hong_Kong.html	Best steaks in HK, maybe in Asia. If you love steak then this is the place. They take their beef seriously.  You can see what’s available. Order you exact piece. Chat w the chef. He can tell u about each cut. They always some crazy...More	5
ausdolly2014	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	Expensive but worth a look.  Dress smart casual.  Can order food.  Arrive early for a seat for the great view	5
Dan A	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	Our group booked a private table for an after-work (business) cocktail reception and were blown away by the views from the 118th floor's windows as well as the outdoor lounge area.  The waitress taking care of our group was wonderful, and drink options were plentiful....More	4
Megan S	https://www.tripadvisor.com/Restaurant_Review-g294217-d912108-Reviews-Caprice_Central-Hong_Kong.html	Just had the best Mid-Autumn Festival dinner with family at Caprice! The food was gorgeous as always, fresh and of fine quality. I was particularly impressed by the professional and thoughtful service there. The staff knows their stuff well and gave us detailed introduction of...More	5
zubux	https://www.tripadvisor.com/Restaurant_Review-g294217-d799250-Reviews-Bombay_Dreams-Hong_Kong.html	We had a great meal with several colleagues.  The food was very tasty and the naan was awesome!  Great service and great food!	5
sampetrus24	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	New York ambiance. the food is excellent but seriously overpriced. It is worth to visit though. can be a good spot for a romantic dinner if you wanna go for chinese food	4
Reisefuchs61	https://www.tripadvisor.com/Restaurant_Review-g294217-d1052864-Reviews-Sevva-Hong_Kong.html	Tolle Bar auf dem Dach des Princes Buildings, geniale Location für einen Cocktail mit überwältigender Aussicht auf die Wolkenkratzer, den...More	5
ChrisCarter1978	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	Hence the 4. I really did enjoy the food. Shame about the lackluster service. I know I'm in HongKong/ China but a restaurant this refined should have servers that speak impeccable English with confidence. Everyone seemed nervous and contrived. Other than that, I would definitely...More	4
NeilPurdy	https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	First night in HK and we pick One Dim Sum from the huge list of places to eat. There was a queue outside when we arrived but our names were taken and only waited a few minutes. Ordered so much but the best was the...More	5
1foodielove	https://www.tripadvisor.com/Restaurant_Review-g294217-d1792423-Reviews-Man_Wah-Hong_Kong.html	We went here to celebrate a big occasion and were looking forward to it so much after hearing great things. We were really disappointed. The main problem was the service. I know it's is a bug-bare of mine but it really annoys me when front...More	3
cutiedoggy13	https://www.tripadvisor.com/Restaurant_Review-g294217-d2165749-Reviews-AL_MOLO_RISTORANTE_ITALIANO_Michael_White-Hong_Kong.html	Our group of 6 tried this restaurant out on recommendation by 1 friend. The salad buffet was really excellent with many choices and high quality of greens. The mushroom soup was ok. There were also parma ham and a few selection of cold cuts with...More	4
skidogs	https://www.tripadvisor.com/Restaurant_Review-g294217-d1024986-Reviews-NOBU_InterContinental_Hong_Kong-Hong_Kong.html	We’ve eaten at other Nobu restaurants in US, London, Bahamas and this one is not nearly as good.  It was quite disappointing because we’ve always enjoyed our Nobu meals but this one let us down.More	3
BJRACT	https://www.tripadvisor.com/Restaurant_Review-g294217-d788642-Reviews-The_Peak_Lookout-Hong_Kong.html	Go early - crowds swell later in the mornings. If it's a good day with less than normal pollution you will get a great view.	4
Dreamer726639	https://www.tripadvisor.com/Restaurant_Review-g294217-d8353573-Reviews-Scarlett_Cafe_Wine_Bar-Hong_Kong.html	This dinner is really good.It’s the greatest restaurant l have ever eaten in Hon Kong.\nEspecially the services,Kath and Eric did a really great job! I would visit here for many times!	5
ChicagoFamily60614	https://www.tripadvisor.com/Restaurant_Review-g294217-d1482758-Reviews-Lobby_Lounge_InterContinental_Hong_Kong-Hong_Kong.html	The InterContinental Lobby's two story glass vista on Victoria Harbor merits a leisurely lunch and time to fully drink it in.  From the extensive wine list to the gracious list of nibbles, this is a consistent crowd-pleasing location.	5
Gordo	https://www.tripadvisor.com/Restaurant_Review-g294217-d2390123-Reviews-Above_and_Beyond-Hong_Kong.html	We had the good fortune to stay at the Hotel Icon during our stay in Hong Kong, and we really enjoyed eating at Above and Beyond for breakfast and dinner.  Great food, with absolutely wonderful service.More	5
Danny L	https://www.tripadvisor.com/Restaurant_Review-g294217-d927163-Reviews-Yan_Toh_Heen_InterContinental_Hong_Kong-Hong_Kong.html	Tha dinner is very comfortable and my family really enjoy it....\nExcellent service by the team, the manager Stephen, Ryan, Sofia, Joe and Kelvin....they all worked in details, not much disturbing and served you with unnoticeable...\nNothing to say and be sure will be back...More	5
pondie68	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	We decided to book a table for our last night. We shouldn't have bothered. Dirty tables, terrible service and to be honest there were better views back at our hotel (Harbour Grand). Save yourself sons money and go somewhere else!!!!	1
IndonesianDream	https://www.tripadvisor.com/Restaurant_Review-g294217-d2433070-Reviews-Tango_Argentinian_Steak_House-Hong_Kong.html	If you feel like going carnivorous you must try this place. In picture is a 400 gram ribeye. Tender and Delicious!!\n\nThe ambiance and service is great. I'd love to go there again someday.	5
Cupcake_8932	https://www.tripadvisor.com/Restaurant_Review-g294217-d1880782-Reviews-Carpaccio_Pasta_Pizza_Vino-Hong_Kong.html	Had a great dinner with friends. Food was amazing really anything from starters to dessert tasted great. Service was very friendly and attentive. To top it all off they have the best coffee (Segafredo) in HK. \nDefiantly a place to check out when in the...More	5
Josephb8585	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	located on the top of the Ritz Carlton HK. The crowd was mixed with tourists and locals. Drinks were very good and uniquely presented.More	4
daddywarbucks1	https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Restaurant is easy to find and close to the train station.  The food was excellent and we loved everything we tried.  Even our baby loved the food!   Service was fantastic, host was very gracious, and they were quick to assist.  Will definitely go there on...More	5
zzhuizi92	https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Taste is similar to branches in Singapore. Soup dumplings, aka 小笼包, actually taste better in Singapore, and we were quite disappointed that 蟹黄小笼包 was not served that day. To be fair, 牛肉面 tasted better in Hong Kong though.	4
Taglio87	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	Great place to celebrate an important birthday. Excellent food. Great atmosphere,  friendly staff . Best signature dish : apple wood pecking duck. \nJust one remark, I have been asked during my reservation if this was a special occasion, and I have highlighted that was a...More	4
mikemoulds	https://www.tripadvisor.com/Restaurant_Review-g294217-d2514791-Reviews-The_Market-Hong_Kong.html	Went as a group of 8 and had an excellent Sunday Lunch buffet. The food is excellent, fresh shellfish, roast meats, lovely salad bar. \nProbably best value meal we had in HK in our 5 days there. Especially when you have the unlimited beer or...More	5
jensman58	https://www.tripadvisor.com/Restaurant_Review-g294217-d1024986-Reviews-NOBU_InterContinental_Hong_Kong-Hong_Kong.html	Sehr leckere Sushi, auch die Suppen sind köstlich. Der Service ist sehr nett und zuvorkommend. Wir waren am letzen Tag...More	4
Sandie02	https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	Most amazing dim sum we had in our two nights in Hong kong.  The food was of the highest quality for the lowest price.. this is our new favorite restaurant.  Allow time in your budget to wait for a table.  They will give you a...More	5
DannyB70	https://www.tripadvisor.com/Restaurant_Review-g294217-d1952785-Reviews-Delaney_s_Kowloon_Irish_Bar-Hong_Kong.html	We stopped off at Delaney's for a few afternoon drinks and were happy we did.\n\nThe drinks were cold and refreshing, the service was friendly and the location was great..\n\nRecommended!	4
sonnyboy11	https://www.tripadvisor.com/Restaurant_Review-g294217-d927163-Reviews-Yan_Toh_Heen_InterContinental_Hong_Kong-Hong_Kong.html	Very good food with excellent service. Reserved a Peking Duck in advance. It was good. Felt like the standouts though were Bird’s Nest soup and an amazing mushroom appetizer. Great view of the harbor too. Recommended.More	5
GrahamL-S	https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Perenially popular location, no booking, turn up, queue (not for long) and take a seat. Great buzz, good quality quickly served food. What more do you need?	4
LoB911	https://www.tripadvisor.com/Restaurant_Review-g294217-d939504-Reviews-Amber-Hong_Kong.html	I had seen many great reviews and also saw that it had Michelin stars, so I had to go and try!\nThe dining experience was amazing and unique! Especially with the French fusion with Asian cuisine.\nWould love to visit again...along with family and friends!	4
stefanobY1151RR	https://www.tripadvisor.com/Restaurant_Review-g294217-d8353573-Reviews-Scarlett_Cafe_Wine_Bar-Hong_Kong.html	After 3 days in Hong Kong i need a different dinner and reading trip Advisor opinions i found this lovely place runned by 2 french guys. Great cheese selection\nReally professional and we had really good time.	4
Vonikazou	https://www.tripadvisor.com/Restaurant_Review-g294217-d939504-Reviews-Amber-Hong_Kong.html	I Loved  the chinaware and the risk taken in every dish that were presented at our table.\nI would have loved to meet the chef but sadly he never came out.\nThe service was very attentive and friendly.\nThe Sommelier howerer didn't shared his passion...More	4
hyunkkk	https://www.tripadvisor.com/Restaurant_Review-g294217-d1052864-Reviews-Sevva-Hong_Kong.html	야외바에서 바라보는 야경이 최고입니다...More	5
Antony S	https://www.tripadvisor.com/Restaurant_Review-g294217-d2161545-Reviews-Tosca_di_Angelo-Hong_Kong.html	I took my son here for his birthday. Though he's only a teenager the waiters looked after him extremely well. The food was excellent, the view exceptional, and I love all the little details that were remembered by the staff and that extra bit of...More	5
mc_nac	https://www.tripadvisor.com/Restaurant_Review-g294217-d1952785-Reviews-Delaney_s_Kowloon_Irish_Bar-Hong_Kong.html	За гинессом, килкени, картофельным пюре, морковкой и тушеной бараниной сюда. Обслуживание дружелюбное, публика выпивающая. Типичный ирландский паб.  К сожалению ничего...More	4
TranFamilyNorway	https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Din Tai Fung is hyped and chaotic. Always people waiting and staff too stressed to give you a decent and good service. We were a party of 8 and ordered lots of food. Waiters were so stressed that they did not smile nor present the...More	3
114sandyr	https://www.tripadvisor.com/Restaurant_Review-g294217-d2166297-Reviews-The_Lounge_Bar-Hong_Kong.html	Forgot when they started the weekday dinner promotion. \n\nI have been here for drinks and afternoon tea more than 10 times. It is really popular place and to ensure a table please book in advance. \n\nAbout the weekday dinner, unlimited side dish with 1 main...More	5
kaytaro	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	香港で、香港を感じないレストラン。ロンドンのハッカサンを思い出す空間でした。料理はどれも納得のお味。予約時にオープンキッ...More	5
695maxm	https://www.tripadvisor.com/Restaurant_Review-g294217-d786786-Reviews-Isola_Bar_Grill-Hong_Kong.html	From start right until finish, from the entrance, to the music to the view to the service- absolutely stunning.\n\nYet again another night out with my boyfriend, our evening started by being seated right in the middle of the restaurant, after a request to move...More	4
Cat122011	https://www.tripadvisor.com/Restaurant_Review-g294217-d1052864-Reviews-Sevva-Hong_Kong.html	Mucho pijerio. Se ve la ciudad iluminada, al lado del Bank of China. Ideal para unas copas y ver el...More	5
silvak2013	https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	My first time to try different dim sum and it was a great experience. When we got there, there is already a long line of people despite of the rain. \n\nWaiting time is reasonable as people there is eat and go. Price is good value...More	5
Effie2019	https://www.tripadvisor.com/Restaurant_Review-g294217-d1027723-Reviews-Clipper_Lounge-Hong_Kong.html	They offer 3 types of oysters and are very fresh.  There are lobsters, crabs, prawns and abalones.  The cooked dishes, both Western and Asian, are also delicious.  \nWhat impressed me most is the service.  The staff always manage to smile!  They are very professional, friendly...More	5
Selma2014	https://www.tripadvisor.com/Restaurant_Review-g294217-d1052864-Reviews-Sevva-Hong_Kong.html	WORSt  food in hong kong,  very awful and unpleasent waiters, very very expensive, very expensive for nothing....don't go there it's a swindle...it was my worst experience in hong kong....	1
Anncici	https://www.tripadvisor.com/Restaurant_Review-g294217-d2390123-Reviews-Above_and_Beyond-Hong_Kong.html	這次的目的是為了一嚐中式afternoo...More	5
Safemach	https://www.tripadvisor.com/Restaurant_Review-g294217-d941989-Reviews-Mandarin_Grill_Bar_at_Mandarin_Oriental_Hong_Kong-Hong_Kong.html	Excellent service. 2 points of surprise, first the bread served was far from interesting, just a mini white mushy loaf with nothing interesting about it. And the lack of choice - take the set menu or else. I had been hoping for a nice juicy...More	4
Liupkiu	https://www.tripadvisor.com/Restaurant_Review-g294217-d7808139-Reviews-Braza_Churrascaria_Brazilian_Steakhouse-Hong_Kong.html	For less than 200HKD(lunch), you can eat as much meat as you want. The beef was very tender, and the pork ribs were my absolute favourite(even though I usually don't like ribs).\nWide selection of food at the salad bar: the pumpkin salad and the...More	5
MuneerH	https://www.tripadvisor.com/Restaurant_Review-g294217-d2276403-Reviews-Bistecca_Italian_Steak_House-Hong_Kong.html	I've had better steaks and paid less, even in Hong Kong.\n\nGood ambience & service.\n\nLoved the bone marrow but the quality of the steaks were just average.\n\nFor the price you pay, you would expect more.	3
redmini7	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	Living in HK, this is one place nearly all visitors like to visit given the amazing outlook it has over Hong Kong and Kowloon as it's over 1500ft above sea level and perched on the peninsula of Kowloon.  On my last visit we took 6...More	3
zed1313	https://www.tripadvisor.com/Restaurant_Review-g294217-d1792423-Reviews-Man_Wah-Hong_Kong.html	While staying at the hotel we dined here to celebrate our anniversary. It was National Day in Hong Kong and we were accommodated at a fabulous window table from which we watched the fireworks. Andy Au, the restaurant manager, was so helpful with advice about...More	5
Umberto M	https://www.tripadvisor.com/Restaurant_Review-g294217-d786786-Reviews-Isola_Bar_Grill-Hong_Kong.html	Nulla da dire sul posto. Il panorama su Hong Kong di sera è davvero bello. Anche il mangiare è curato...More	4
broy7	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	One of the best places to see the HK skyline. Drinks are ridiculously expensive, as expected for a place that offers this kind of views. Worth going for one drink and enjoying the view but tons of better bars in HK.More	4
vtc950	https://www.tripadvisor.com/Restaurant_Review-g294217-d799250-Reviews-Bombay_Dreams-Hong_Kong.html	Always a safe choice, especially if you're going with a group. Nice environment, friendly staff, delicious foods. There's a reason why it's been around for ages! Wide selection of all sorts of Tikka, tandoori, Naan, roti, everything.More	4
ldunnreier	https://www.tripadvisor.com/Restaurant_Review-g294217-d1952785-Reviews-Delaney_s_Kowloon_Irish_Bar-Hong_Kong.html	I was so excited to see this restaurant listed as we planned our trip to Hong Kong! I was just in Ireland in June, and I was truly anticipating a great break from the standard Chinese fare we've been living with in Henan. Delaney's didn't...More	4
Andrea A	https://www.tripadvisor.com/Restaurant_Review-g294217-d1880782-Reviews-Carpaccio_Pasta_Pizza_Vino-Hong_Kong.html	The thing I appreciate the most about the experience at Carpaccio has been the great service. The owner is ready to help you with menu suggesting what to order according to your taste. \n\nI only tried pizza and, as italian, I must say it has...More	4
WeeRobbo_12	https://www.tripadvisor.com/Restaurant_Review-g294217-d1811943-Reviews-Cafe_Gray_Deluxe-Hong_Kong.html	Delicious lunch in a superb setting where you are not sitting on top of the next table..  Excellent, friendly service.  A bit pricey - over HK$1,100 for a set lunch for two, with no alcohol, just water and coffee. Worth it for that special occasion,...More	5
HeyJu2014	https://www.tripadvisor.com/Restaurant_Review-g294217-d2161545-Reviews-Tosca_di_Angelo-Hong_Kong.html	W had a great meal and evening in Tosca last Friday night. Food was great. We were particularly impressed by one of the staff there, called Addis for his thorough understanding of the cuisines and clear explanation of the dishes we ordered. Moreover, his heart-touching...More	5
Tongil	https://www.tripadvisor.com/Restaurant_Review-g294217-d1952785-Reviews-Delaney_s_Kowloon_Irish_Bar-Hong_Kong.html	On holidays in Hong Kong and my hubby wanted to watch the football back home. \nHe searched and found this little gem .\nJean welcomed us into the bar as if we were locals \nA great atmosphere and great food \nWe would highly recommend this...More	5
Richansa	https://www.tripadvisor.com/Restaurant_Review-g294217-d788642-Reviews-The_Peak_Lookout-Hong_Kong.html	This is undoubtedly fairly expensive but it is a lovely old building with a beautiful garden area with some great views and you are at the peak in Hong Kong so what do you expect. It's quiet calm and relaxed and a different world from...More	4
Greg Q	https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	One if the best Yum Cha's in Hong Kong. This is a chain of stores, but all maintain a high standard. Ask for an English menu , and tick the order forms with the quantity you want. Pork buns & Shrimp dumplings & dim Sims...More	5
Julien G	https://www.tripadvisor.com/Restaurant_Review-g294217-d10089430-Reviews-Capo-Hong_Kong.html	So we came to Capo for lunch on a wednesday afternoon. Not crowded, awesome background music and genuine Italian feeling from the start.\n\nWe ordered their Signature cold cuts with Burrata and OMG ! so goooooood ! Paired with a light italian beer and some...More	5
jonasr727	https://www.tripadvisor.com/Restaurant_Review-g294217-d2165749-Reviews-AL_MOLO_RISTORANTE_ITALIANO_Michael_White-Hong_Kong.html	I went here because it was recommended by my hotel. It’s an Italian restaurant, but not European standard at all. I had a flavorless, basic overpriced pasta. The service and view was good though. Just next to a shopping center so also convenient if you...More	3
thegreatchris	https://www.tripadvisor.com/Restaurant_Review-g294217-d1024986-Reviews-NOBU_InterContinental_Hong_Kong-Hong_Kong.html	Great food, great ambience, though a bit pricey. It was a memorable meal, thank goodness someone else was paying!	5
cj0823	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	Peking duck (ordered in advance) just melts in your mouth. Second course of fried rice had a great crunchy texture. Signature cod was wonderfully smoky and crispy. Service was attentive and professional. Would recommend to friends, would visit again.	5
Rosscodad	https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	If you are looking for a Dim Sum meal, definitely go here. Food was fab! Very popular place and casual. Reasonable priced and easy to order. Our teenagers loved it!	5
tjjones425	https://www.tripadvisor.com/Restaurant_Review-g294217-d2166297-Reviews-The_Lounge_Bar-Hong_Kong.html	The staff and service is amazing. They will take care of your every need and they go above and beyond.More	5
scottng15	https://www.tripadvisor.com/Restaurant_Review-g294217-d1880782-Reviews-Carpaccio_Pasta_Pizza_Vino-Hong_Kong.html	Once again Trip Advisor played a blinder in helping me to find a great place to eat in an area I am not familiar with. You would not 'happen across' this place by chance; it is on the third floor of a shopping mall so...More	5
mysticpenguin	https://www.tripadvisor.com/Restaurant_Review-g294217-d2540306-Reviews-One_Dim_Sum_Chinese_Restaurant-Hong_Kong.html	Everything was excellent. Long line all day especially during peak meal hours but if you go very early or very late the wait is not bad. Can also do take out. If you can't read Chinese compare and double check because I apparently I chose...More	5
sarahmc69	https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Best dim sum we have had in HK. We ate here twice in 3 days. Both times the food was delicious and the staff are very pleasant which can be hard to find in HK.	5
Dan L	https://www.tripadvisor.com/Restaurant_Review-g294217-d2399904-Reviews-Tin_Lung_Heen-Hong_Kong.html	It definitely serves the best Cantonese cuisines in Hong Kong. Barbecue pork and scallop with black truffle are highly recommended.  \n\nThe private dining room is spacious and had great ambiance.The amazing view from the 101th floor is a bonus indeed.\n\nGreat attentive service! From the...More	5
snowee b	https://www.tripadvisor.com/Restaurant_Review-g294217-d6579151-Reviews-Mott_32-Hong_Kong.html	Love the interiors. We got a table in the semi-private room where there are only a few tables and the walls have those chinese brushes on display. The other tables arrived later so for a time we got the whole area to ourselves kinda like...More	4
TorbenA956	https://www.tripadvisor.com/Restaurant_Review-g294217-d2198231-Reviews-OZONE-Hong_Kong.html	The view is amazing and the very good reason to go here. But you pay for it. 240 HK dollar (AFAIR) for a GT. Well, well. On the other hand, you don't pay for the elevator.\n\nAs I wasn't surprised by the prices, I was...More	3
mrstsh	https://www.tripadvisor.com/Restaurant_Review-g294217-d927163-Reviews-Yan_Toh_Heen_InterContinental_Hong_Kong-Hong_Kong.html	Yan Toh Heen has always been one of my top 3 favourite Chinese restaurants in Hong Kong. The food is very delicious and has never disappointed me. I particularly like its premiere set lunch as I can enjoy signature dim sums, double boiled fish maw...More	5
TravelsinTranslation	https://www.tripadvisor.com/Restaurant_Review-g294217-d2706744-Reviews-Din_Tai_Fung_Yee_Wo_Branch-Hong_Kong.html	Din Tai Fung continually impresses us with their high quality xiao long bao, and other speciality dishes. Highly recommend!	5
tmp025	https://www.tripadvisor.com/Restaurant_Review-g294217-d938999-Reviews-Peking_Garden_Restaurant_Alexandra_House-Hong_Kong.html	I had high expectations of this place and although the food was nice enough I would not visit again as it was really expensive, slightly too posh for me and did lack atmosphere, the food was nice enough but just different and the service was...More	3
jayniferb	https://www.tripadvisor.com/Restaurant_Review-g294217-d8353573-Reviews-Scarlett_Cafe_Wine_Bar-Hong_Kong.html	The food is excellent, I love the vibe of the place, the staff are very friendly and accommodating, shout to Melinda, Chef Jason and Lisa. 🙌\n\nIf your looking for a place to dine with a sumptous food and excellent vibe? You guys should check...More	5
Luke A	https://www.tripadvisor.com/Restaurant_Review-g294217-d2399904-Reviews-Tin_Lung_Heen-Hong_Kong.html	I usually dine in the Italian restaurant in The Ritz Carlton, which is one of my favorite ever, but this time I brought some friends from Europe to experience the cantonese cuisine. I have been surprised from the beginning til the end of the meal....More	5
\.


--
-- TOC entry 3021 (class 0 OID 17254)
-- Dependencies: 201
-- Data for Name: ta_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ta_user ("user", likes, reviews, address) FROM stdin;
Anastasia9992015	68	149	Vladivostok, Russia
rkim511	136	142	Kuala Lumpur, Malaysia
Anncici	32	468	nan
cutiedoggy13	229	337	Hong Kong
Dan L	779	2588	Bunbury, Australia
114sandyr	55	137	Hong Kong, China
Andrea A	64	214	nan
cj0823	7	18	nan
Dan A	26	45	Denver, Colorado
hyunkkk	22	345	South Korea
ken_stearns	55	108	Bangkok, Thailand
Safemach	128	245	Shanghai
Julien G	26	39	Phuket, Thailand
bobwK5197LB	17	37	nan
Dreamer726639	3	1	Hong Kong, China
stefanobY1151RR	35	113	Brooklyn, New York
jayniferb	1	1	Hong Kong, China
Joseph-in-NYC	28	32	New York City, New York
mikemoulds	184	216	Beverley, United Kingdom
tjjones425	6	6	San Jose, California
Josephb8585	40	93	Sunny Isles Beach, Florida
Antony S	5	19	Hong Kong, China
mrstsh	10	31	hk
HeyJu2014	2	1	Hong Kong, China
Luke A	5	10	New York City, New York
clementc516	2	7	Hong Kong, China
zed1313	82	186	United Kingdom
1foodielove	21	21	Side, Turkey
Liupkiu	2	2	nan
ldunnreier	17	42	Jacksonville, Florida
thegreatchris	16	34	Munich, Germany
WeeRobbo_12	6	10	Hong Kong, China
MuneerH	57	68	Dhaka City, Bangladesh
broy7	50	220	Mississauga
ChoyN3	3	1	nan
Vonikazou	5	10	Hong Kong, China
LoB911	5	5	nan
Danny L	2	3	nan
sonnyboy11	3	6	Los Angeles
Megan S	3	1	nan
scottng15	89	173	Nottingham
Cupcake_8932	1	4	Hong Kong, China
Effie2019	1	5	nan
ChicagoFamily60614	14	21	Chicago, Illinois
zubux	6	51	Franklin, Tennessee
IndonesianDream	2	26	Jakarta, Indonesia
Celio K	15	34	Hod Hasharon, Israel
vtc950	23	99	Hong Kong, China
TorbenA956	104	215	Hellerup, Denmark
ausdolly2014	11	37	Perth, Australia
TravelsinTranslation	37	53	Chicago, Illinois
redmini7	20	55	Hong Kong, China
pondie68	20	29	Richmond, United Kingdom
GrahamL-S	160	477	Bath, United Kingdom
Rosscodad	15	67	Northamptonshire, United Kingdom
Sandie02	97	237	Shenzhen, China
Greg Q	9	35	nan
NeilPurdy	11	8	Dublin, Ireland
mysticpenguin	1	3	Belgium
silvak2013	19	28	nan
TranFamilyNorway	229	379	Oslo, Norway
daddywarbucks1	20	16	nan
zzhuizi92	2	7	Singapore, Singapore
sarahmc69	21	84	London, United Kingdom
Gordo	172	199	Elmhurst, Illinois
skidogs	5	37	Arizona
jensman58	25	28	Cologne
Selma2014	4	5	Sousse, Tunisia
snowee b	23	31	manila
Taglio87	20	22	Sardinia, Italy
sampetrus24	2	7	Hong Kong, China
ChrisCarter1978	12	27	Boston, Massachusetts
kaytaro	86	95	osaka
S4213YDkevinc	2	11	Guangzhou, China
Tongil	31	37	Sydney
DannyB70	280	469	England, United Kingdom
mc_nac	47	99	Woluwe-Saint-Lambert, Belgium
tmp025	33	58	Manchester, United Kingdom
Cat122011	52	170	Hamburg, Germany
Reisefuchs61	18	96	Heinsberg, Germany
695maxm	4	5	Hong Kong, China
Umberto M	31	28	Reggio Emilia, Italy
jonasr727	35	92	Zurich, Switzerland
Richansa	12	14	Wallingford, United Kingdom
Brittaperry	3	8	Singapore, Singapore
BJRACT	186	270	Washington DC, District of Columbia
\.


--
-- TOC entry 3024 (class 0 OID 17311)
-- Dependencies: 204
-- Data for Name: ub_menu; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ub_menu (outletid, name, brand, price, volume) FROM stdin;
49902879992629236407831306704091856908	Fuze Tea sparkling	Fuze Tea	1.95	250
49902879992629236407831306704091856908	Fernandes red grape	Fernandes	1.95	330
49902879992629236407831306704091856908	Fernandes cherry bouquet	Fernandes	1.95	330
49902879992629236407831306704091856908	Sprite fles	Sprite	3.95	1500
49902879992629236407831306704091856908	Red Bull	Red Bull	3.49	250
49902879992629236407831306704091856908	Fanta	Fanta	1.95	330
49902879992629236407831306704091856908	Coca-Cola	Coca-Cola	1.95	330
283294963221695236170763356367199286448	Heineken 25cl	Heineken	3.5	250
283294963221695236170763356367199286448	Chaudfontaine blauw 50cl mineraal water	Chaudfontaine	2.5	500
283294963221695236170763356367199286448	Chaudfontaine rood 50cl mineraal water	Chaudfontaine	2.5	500
283294963221695236170763356367199286448	Heineken 0.0 25cl	Heineken	3.5	250
283294963221695236170763356367199286448	Coca Cola 33cl	Coca-Cola	2.5	330
327257783106451358954447114691995086169	Lipton ice tea peach	Lipton	2.6	500
327257783106451358954447114691995086169	Pepsi	Pepsi	2.6	500
327257783106451358954447114691995086169	Pepsi flesje (500ml) & Lays zakje chips (27,5g)	Pepsi	3.5	500
327257783106451358954447114691995086169	Sourcy water 	Sourcy	2.6	500
314032653973337478450144404494058558532	Coca-Cola light 	Coca-Cola	2	unknown
321365545283542343578744113965592435892	Coca-Cola light	Coca-Cola	3	unknown
321365545283542343578744113965592435892	Coca-Cola	Coca-Cola	3	unknown
127048456998651170056736953480857736328	EARTH Water sparkling	Earth Water	3	unknown
127048456998651170056736953480857736328	Lipton ice tea green	Lipton	3	unknown
127048456998651170056736953480857736328	Coca-Cola zero 	Coca-Cola	3	unknown
165997420050571885484241233202539084755	AA Drink 	Aa Drink	2	unknown
165997420050571885484241233202539084755	Heineken 	Heineken	2	330
165997420050571885484241233202539084755	Coca-Cola	Coca-Cola	2	unknown
33417390446481492604604940052101658935	6 pack bier	Grolsch	11.5	500
33417390446481492604604940052101658935	6 pack bier	Heineken	11.5	500
33417390446481492604604940052101658935	Fuze tea green tea	Fuze Tea	2.7	unknown
33417390446481492604604940052101658935	Red bull	Red Bull	3	unknown
33417390446481492604604940052101658935	Coca-Cola fles 1,75 l	Coca-Cola	4	1750
33417390446481492604604940052101658935	Coca Cola	Coca-Cola	2.25	unknown
47002041566522905200636609827711769647	Coca-Cola light 	Coca-Cola	2	unknown
47002041566522905200636609827711769647	Red Bull 	Red Bull	2.5	unknown
47002041566522905200636609827711769647	Fanta 	Fanta	2	unknown
47002041566522905200636609827711769647	Fles Coca-Cola 	Coca-Cola	3.75	unknown
91943224646241056385634118768695280437	Amstel bier 24 blikjes 0.33 l 	Amstel	40	330
91943224646241056385634118768695280437	Amstel bier 1 blikje 0.50 l 	Amstel	3	500
91943224646241056385634118768695280437	Amstel bier 24 blikjes 0.50 l	Amstel	65	500
91943224646241056385634118768695280437	Amstel bier 6 blikjes 0.33 l 	Amstel	12	330
91943224646241056385634118768695280437	Fanta Exotic 	Fanta	1.5	unknown
91943224646241056385634118768695280437	Aa Drink 	Aa Drink	1.5	unknown
91943224646241056385634118768695280437	Bacardi Cola 	Bacardi	3	unknown
91943224646241056385634118768695280437	Heineken 1 blikje 0.50 l 	Heineken	3	500
91943224646241056385634118768695280437	Heineken 1 flesje 0.25 l 	Heineken	2.5	250
91943224646241056385634118768695280437	Heineken 48 blikjes 0.50 l 	Heineken	85.99	500
91943224646241056385634118768695280437	Heineken 6 flesjes 0.25 l	Heineken	15	250
91943224646241056385634118768695280437	Heineken 6-pack, 6 blikjes 0.33 l 	Heineken	12	330
91943224646241056385634118768695280437	Heineken 24 blikjes 0.50 l 	Heineken	65	500
91943224646241056385634118768695280437	Fanta 1.5 liter 	Fanta	3.5	1500
252651641282346579703164237318735593936	Coca Cola Light	Coca-Cola	1.75	unknown
252651641282346579703164237318735593936	AA Drink	Aa Drink	1.75	unknown
252651641282346579703164237318735593936	Fanta	Fanta	1.75	unknown
63562601146806588372772564799565949887	Lipton ice tea lemon	Lipton	2	unknown
63562601146806588372772564799565949887	Fernandes cherry bouquet	Fernandes	2	330
63562601146806588372772564799565949887	Fanta exotic	Fanta	2	330
63562601146806588372772564799565949887	AA Drink	Aa Drink	2	unknown
63562601146806588372772564799565949887	7 Up	7Up	2	unknown
63562601146806588372772564799565949887	Coca-Cola	Coca-Cola	2	330
297652528638499107975531520877353140589	Fuze Tea ice tea	Fuze Tea	2	unknown
297652528638499107975531520877353140589	Sprite 	Sprite	2	unknown
297652528638499107975531520877353140589	Red Bull	Red Bull	2.5	unknown
297652528638499107975531520877353140589	Coca-Cola	Coca-Cola	2	unknown
54510679703893206233253810796548733693	Charitea - mate ijsthee	ChariTea	3.25	unknown
190196191040961587160782732334856784888	146. Lipton ice tea peach	Lipton	1.75	unknown
190196191040961587160782732334856784888	141. Sprite regular	Sprite	1.75	unknown
190196191040961587160782732334856784888	143. Red Bull sugar free	Red Bull	2	unknown
190196191040961587160782732334856784888	139. Coca-Cola regular	Coca-Cola	1.75	unknown
147604685768551105643067051820075670330	Sprite	Sprite	4	330
49902879992629236407831306704091856908	Fuze Tea green tea	Fuze Tea	1.95	250
49902879992629236407831306704091856908	Chaudfontaine	Chaudfontaine	1.95	500
49902879992629236407831306704091856908	Fernandes green punch	Fernandes	1.95	330
49902879992629236407831306704091856908	Sprite	Sprite	1.95	330
49902879992629236407831306704091856908	Fanta fles	Fanta	3.95	1500
49902879992629236407831306704091856908	Coca-Cola regular fles	Coca-Cola	3.95	1500
49902879992629236407831306704091856908	Coca-Cola zero	Coca-Cola	1.95	330
283294963221695236170763356367199286448	Two Chefs 33cl Funky Falcon	Two Chef's Brewing	5	330
283294963221695236170763356367199286448	Brouwerij 't IJ 33cl	Brouwerij 't IJ	5	330
283294963221695236170763356367199286448	Sprite 33cl	Sprite	2.5	330
283294963221695236170763356367199286448	Fanta orange 33cl	Fanta	2.5	330
283294963221695236170763356367199286448	Coca Cola Zero 33cl	Coca-Cola	2.5	330
327257783106451358954447114691995086169	Lipton ice tea green	Lipton	2.6	500
327257783106451358954447114691995086169	Pepsi max	Pepsi	2.6	500
327257783106451358954447114691995086169	7 Up	7Up	2.6	500
327257783106451358954447114691995086169	Sourcy rood	Sourcy	2.6	unknown
314032653973337478450144404494058558532	Fanta	Fanta	2	unknown
321365545283542343578744113965592435892	Lipton ice tea green	Lipton	3	unknown
127048456998651170056736953480857736328	EARTH Water still	Earth Water	3	unknown
127048456998651170056736953480857736328	Coca-Cola light 	Coca-Cola	3	unknown
127048456998651170056736953480857736328	Coca-Cola regular 	Coca-Cola	3	unknown
165997420050571885484241233202539084755	Coca-Cola light	Coca-Cola	2	unknown
165997420050571885484241233202539084755	Red Bull 	Red Bull	3	unknown
165997420050571885484241233202539084755	Fanta	Fanta	2	unknown
165997420050571885484241233202539084755	Coca-Cola zero	Coca-Cola	2	unknown
33417390446481492604604940052101658935	Bier	Grolsch	2.25	500
33417390446481492604604940052101658935	Bier	Heineken	2.25	500
33417390446481492604604940052101658935	AA drink flesje	Aa Drink	2.25	unknown
33417390446481492604604940052101658935	Fanta blik	Fanta	2.25	unknown
33417390446481492604604940052101658935	Coca Cola 0,5 l	Coca-Cola	2.75	500
47002041566522905200636609827711769647	Fles Coca-Cola light 	Coca-Cola	3.75	unknown
47002041566522905200636609827711769647	Sprite 	Sprite	2	unknown
47002041566522905200636609827711769647	Fles fanta 	Fanta	3.75	unknown
47002041566522905200636609827711769647	Coca-Cola 	Coca-Cola	2	unknown
91943224646241056385634118768695280437	Amstel bier 1 blikje 0.33 l	Amstel	2.3	330
91943224646241056385634118768695280437	Amstel bier 6 blikjes 0.50 l 	Amstel	17	500
91943224646241056385634118768695280437	Amstel bier 48 blikjes 0.50 l 	Amstel	81.99	500
91943224646241056385634118768695280437	Amstel bier 48 blikjes 0.33 l 	Amstel	78	330
91943224646241056385634118768695280437	Coca-Cola Light 	Coca-Cola	1.5	unknown
91943224646241056385634118768695280437	Sprite 	Sprite	1.5	unknown
91943224646241056385634118768695280437	Red Bull 	Red Bull	2.5	unknown
91943224646241056385634118768695280437	Heineken 24 blikjes 0.33 l 	Heineken	40	330
91943224646241056385634118768695280437	Heineken 1 blikje 0.33 l 	Heineken	2.3	330
91943224646241056385634118768695280437	Heineken 6 blikjes 0.50 l 	Heineken	17	500
91943224646241056385634118768695280437	Heineken 24 flesjes 0.25 l 	Heineken	50	250
91943224646241056385634118768695280437	Heineken 48 blikjes 0.33 l 	Heineken	78	330
91943224646241056385634118768695280437	Heineken 12 flesjes 0.25 l	Heineken	27	250
91943224646241056385634118768695280437	Fanta 	Fanta	1.5	unknown
91943224646241056385634118768695280437	Coca-Cola	Coca-Cola	1.5	unknown
252651641282346579703164237318735593936	Sprite	Sprite	1.75	unknown
252651641282346579703164237318735593936	Red Bull	Red Bull	2.5	unknown
252651641282346579703164237318735593936	Coca Cola	Coca-Cola	1.75	unknown
63562601146806588372772564799565949887	Fanta cassis	Fanta	2	unknown
63562601146806588372772564799565949887	Fernandes green punch	Fernandes	2	330
63562601146806588372772564799565949887	lipton ice tea green	Lipton	2	unknown
63562601146806588372772564799565949887	Red Bull	Red Bull	2.5	unknown
63562601146806588372772564799565949887	Fanta orange	Fanta	2	330
63562601146806588372772564799565949887	Coca-Cola zero sugar	Coca-Cola	2	330
297652528638499107975531520877353140589	Chaudfontaine still	Chaudfontaine	2	unknown
297652528638499107975531520877353140589	AA drink 	Aa Drink	2	unknown
297652528638499107975531520877353140589	Fanta	Fanta	2	unknown
297652528638499107975531520877353140589	Coca-Cola zero 	Coca-Cola	2	unknown
190196191040961587160782732334856784888	139a. Coca-Cola light	Coca-Cola	1.75	unknown
190196191040961587160782732334856784888	145. Lipton ice tea green	Lipton	1.75	unknown
190196191040961587160782732334856784888	142. Red Bull	Red Bull	2	unknown
190196191040961587160782732334856784888	144. Lipton ice tea sparkling	Lipton	1.75	440
147604685768551105643067051820075670330	Heineken	Heineken	4	330
147604685768551105643067051820075670330	Fanta	Fanta	4	330
147604685768551105643067051820075670330	Coca Cola	Coca-Cola	4	330
35881379350896673743352998569627830528	Grolsch	Grolsch	2.5	330
35881379350896673743352998569627830528	Fanta Orange	Fanta	2	330
35881379350896673743352998569627830528	Coca Cola	Coca-Cola	2	330
35881379350896673743352998569627830528	Coca Cola zero	Coca-Cola	2	330
67256766394334269099759147717171913478	Orangina	Orangina	2	unknown
67256766394334269099759147717171913478	Nestea peach	Nestea	2.5	unknown
67256766394334269099759147717171913478	Appelsientje	Appelsientje	2.5	unknown
67256766394334269099759147717171913478	 Dr. pepper	Dr Pepper	2	unknown
67256766394334269099759147717171913478	Fanta cassis	Fanta	2.5	unknown
67256766394334269099759147717171913478	Sprite blik	Sprite	2	unknown
67256766394334269099759147717171913478	AA Drink	Aa Drink	2	unknown
67256766394334269099759147717171913478	Red Bull	Red Bull	2.5	unknown
67256766394334269099759147717171913478	7Up 0.5L fles	7Up	2.5	500
67256766394334269099759147717171913478	Fanta 0.5L fles	Fanta	2.5	500
67256766394334269099759147717171913478	Fanta blik	Fanta	2	unknown
67256766394334269099759147717171913478	Coca-Cola 0.5L fles	Coca-Cola	2.5	500
67256766394334269099759147717171913478	Coca-Cola blik	Coca-Cola	2	unknown
67256766394334269099759147717171913478	Coca-Cola zero blik	Coca-Cola	2	unknown
174781837695277235773315022668535172434	Magners	Magners	5.5	unknown
174781837695277235773315022668535172434	Schweppes Ginger Ale	Schweppes	3.5	unknown
174781837695277235773315022668535172434	Somersby Blackberry	Somersby	5.5	unknown
174781837695277235773315022668535172434	Somersby Apple	Somersby	5.5	unknown
174781837695277235773315022668535172434	Bottle of Gordon's Pink Gin 1 Liter	Gordon's	65	1000
174781837695277235773315022668535172434	Aperol Spritz	Aperol	10	unknown
174781837695277235773315022668535172434	Smirnoff Ice	Smirnoff	5.5	unknown
174781837695277235773315022668535172434	Negroni	Martini	11.5	unknown
174781837695277235773315022668535172434	Red Martini	Martini	5	unknown
174781837695277235773315022668535172434	Jägermeister	Jägermeister	4	unknown
174781837695277235773315022668535172434	Fanta Cassis	Fanta	0	unknown
174781837695277235773315022668535172434	Bottle of Smirnoff Vodka 1 Liter	Smirnoff	60	1000
174781837695277235773315022668535172434	Sex on the Beach	Malibu	10	unknown
174781837695277235773315022668535172434	Bottle of Gordon's dry Gin 1 Liter	Gordon's	60	1000
174781837695277235773315022668535172434	Alcohol Free Mojito	Sprite	6.5	unknown
174781837695277235773315022668535172434	Sprite 	Sprite	0	unknown
174781837695277235773315022668535172434	Red Bull Sugar Free	Red Bull	4.5	unknown
174781837695277235773315022668535172434	Agwa Blaster	Red Bull	10	unknown
174781837695277235773315022668535172434	Red Bull	Red Bull	4.5	unknown
174781837695277235773315022668535172434	Mojito Red Bull	Red Bull	10	unknown
174781837695277235773315022668535172434	Bottle of Jack Daniels 1 Liter	Jack Daniel's	80	1000
174781837695277235773315022668535172434	Orgazm	Cointreau	10	unknown
174781837695277235773315022668535172434	Orgazm	Baileys	10	unknown
174781837695277235773315022668535172434	Bottle of Bacardi Rum 1 Liter	Bacardi	60	1000
174781837695277235773315022668535172434	Fanta Orange	Fanta	0	unknown
174781837695277235773315022668535172434	Coca Cola	Coca-Cola	0	unknown
174781837695277235773315022668535172434	Long Island	Coca-Cola	16.5	unknown
174781837695277235773315022668535172434	Cuba Libre 	Coca-Cola	10	unknown
174781837695277235773315022668535172434	Coca Cola Zero	Coca-Cola	0	unknown
\.


--
-- TOC entry 3023 (class 0 OID 17308)
-- Dependencies: 203
-- Data for Name: ub_outlet; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.ub_outlet (outletid, country, name, address, reviews) FROM stdin;
133789486375935476627406684831438871941	NL	De IJsmaker Witte de Withstraat	Witte De Withstraat 7a, 3012	17
49902879992629236407831306704091856908	NL	Dominos	Kamperfoelieweg 40, 1032 HP Amsterdam, Netherlands	52
283294963221695236170763356367199286448	NL	Sea Palace Restaurant	Oosterdokskade 8, 1011 AE Amsterdam, Netherlands	145
327257783106451358954447114691995086169	NL	Subway	Vrijstraat 23, 5611 AT Eindhoven, Netherlands	63
314032653973337478450144404494058558532	NL	Sushi De Luxe	Cinemadreef 236, 1325 ER Almere, Netherlands	15
321365545283542343578744113965592435892	NL	THE BAB	Camperstraat 36, 1091 AG Amsterdam, Netherlands	200
127048456998651170056736953480857736328	NL	Fresh2U	Sweder van Zuylenweg 4 Utrecht	13
165997420050571885484241233202539084755	NL	Mac el Aziz Grillroom	Goudse Rijweg 48 Rotterdam	22
33417390446481492604604940052101658935	NL	Hapsalon Kapsalon	Lange Smeestraat 26 Utrecht	15
47002041566522905200636609827711769647	NL	Roti Boer	Ondiep-Zuidzijde 2, 3551 BW Utrecht, Netherlands	31
91943224646241056385634118768695280437	NL	Cafetaria & Pizzeria Straatweg	Amsterdamsestraatweg 118, 3513 AL Utrecht, Netherlands	18
252651641282346579703164237318735593936	NL	Ambala Tandoori	Vierambachtsstraat 147A, 3022 AL Rotterdam, Netherlands	47
63562601146806588372772564799565949887	NL	Burger company	Veldhovenring 2 Tilburg	48
297652528638499107975531520877353140589	NL	Op Saj	Steenweg 1, 3511 JK Utrecht, Netherlands	14
54510679703893206233253810796548733693	NL	SLA	Kruisweg 68B, 2011 LE Haarlem, Netherlands	36
190196191040961587160782732334856784888	NL	China Catering Eindhoven	Jan Heynslaan 149, 5622 KL Eindhoven, Netherlands	10
147604685768551105643067051820075670330	NL	La Zoccola del Pacioccone	Nieuwe Nieuwstraat 22HS, 1012 NH Amsterdam, Netherlands	88
35881379350896673743352998569627830528	NL	Van Speyk	Spuistraat 3a, 1012 SP Amsterdam, Netherlands	22
67256766394334269099759147717171913478	NL	Favorite Chicken & Ribs	Oudezijds Voorburgwal 64, 1012 GE Amsterdam, Netherlands	28
174781837695277235773315022668535172434	NL	Famous Burger	Nieuwezijds Voorburgwal 87, 1012 RE Amsterdam, Netherlands	14
\.


--
-- TOC entry 2879 (class 2606 OID 17276)
-- Name: ta_outlet ta_outlet_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_outlet
    ADD CONSTRAINT ta_outlet_pk PRIMARY KEY (outletid);


--
-- TOC entry 2881 (class 2606 OID 17261)
-- Name: ta_user ta_user_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_user
    ADD CONSTRAINT ta_user_pk PRIMARY KEY ("user");


--
-- TOC entry 2885 (class 2606 OID 17388)
-- Name: ub_menu ub_menu_un; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ub_menu
    ADD CONSTRAINT ub_menu_un UNIQUE (outletid, name, brand, price, volume);


--
-- TOC entry 2883 (class 2606 OID 17318)
-- Name: ub_outlet ub_outlet_pk; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ub_outlet
    ADD CONSTRAINT ub_outlet_pk PRIMARY KEY (outletid);


--
-- TOC entry 2886 (class 2606 OID 17282)
-- Name: ta_reviews ta_outlet_outlet; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_reviews
    ADD CONSTRAINT ta_outlet_outlet FOREIGN KEY (outletid) REFERENCES public.ta_outlet(outletid);


--
-- TOC entry 2887 (class 2606 OID 17287)
-- Name: ta_reviews ta_reviews_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ta_reviews
    ADD CONSTRAINT ta_reviews_fk FOREIGN KEY ("user") REFERENCES public.ta_user("user");


--
-- TOC entry 2888 (class 2606 OID 17331)
-- Name: ub_menu ub_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.ub_menu
    ADD CONSTRAINT ub_menu_fk FOREIGN KEY (outletid) REFERENCES public.ub_outlet(outletid);


-- Completed on 2021-08-08 15:50:56 UTC

--
-- PostgreSQL database dump complete
--

