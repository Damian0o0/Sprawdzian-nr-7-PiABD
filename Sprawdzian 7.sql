--zad1
--zsumuj liczbę mieszkańców miast i pogrupuj je według kodu państwa od (d-k)  
--obok cyfry ma pojawić sie napis "liczba mieszkańców"
 select * from city;

select cast(sum(population) as varchar) +' liczba mieszkancow' as populacja_miast ,country from city where population is not null group by country order by country;
---------------------------------------------------------------------
--zad2
--Podaj liczbę państw na kontynencie Azja (Asia). 
--Wynik w postaci: Asia oraz liczba państw. Dopisz słowo "państw" do wyniku na końcu.

select * from encompasses;

select 'Azja - ' + cast(count(country) as varchar) + ' państw'
as liczba from encompasses where continent='asia';

-------------------------------------------------------------------------------
--zad3
--Wyświetl ile jezior jest w Albanii. Wyświetl kod kraju oraz liczbę jezior 
--(wynik w postaci: AL 3 jeziora).Dopisz słowo "AL" na poczatkui na  "jeziora" na końcu.

select COUNT(*) as 'liczba jezior' from lake where name like 'Albania';

--------------------------------------------------------------------------------
--zad4
--Podaj kody państwa i sumę ludności w miastach.
--Wynik w postaci:kod panstwa oraz suma populacji w miastach. Dopisz słowo "z miast" do wyniku sumowania  na końcu a do kodu panstwa " kod państwa".

select * from city;


-----------------------------------------------------------------------------------
--zad5
--policz ile jest  państw w afryce, obok liczby ma pojawić sie słowo państw

select * from encompasses;

select 'Afryka - ' + cast(count(country) as varchar) + ' państw'
as liczba from encompasses where continent='africa';
-------------------------------------------------------------------------------
--Zad6
--Wyświetl miasta ich populację, kraj oraz kod państwa tylko tych państw w których państwo ma ludność
--pomiędzy 40 mln a 80 mln mieszkańców  oraz kod państwa jest zz akresu od D-L pomin brak danych dla ludności miasta
--Dopisz słowa(o) ' ludności'  do wyniku na  końcu  .

select * from city;
select * from country;

select city.name, city.Population, country.Code from city join country on country.Code=city.Country
where city.Population is not null and country.Population between 40000000 and 80000000 and country.code like'[d-l]%' ;


select city.name, cast(city.Population as varchar) + ' ludności' as liczba, country.Code from city join country on country.Code=city.Country
where city.Population is not null and country.Population between 40000000 and 80000000 and country.code like'[d-l]%'
---------------------------------------------------------------------------------------
--Zad7
--Wyświetl nazwy wszystkich krajów zaczynających się na literę B , stolice tych państw
--oraz nazwy kontynentów na których te państwa znajdują się.
--Dopisz słowa(o) 'państwa na B - ' do wyniku na  początku  .
select * from country;
select * from encompasses;

select 'państwa na B - ' +country.name, country.Capital, encompasses.Continent from country join encompasses on country.code=encompasses.country
where country.name like 'B%' order by encompasses.Continent;


-------------------------------------------------------------------
--Zad8
--Wyświetl nazwy wszystkich krajów z Ameryki wraz z ich stolicami
--Dopisz słowa(o)  'Ameryka - ' do wyniku na  początku  .
select * from country;
select * from encompasses;


--------------------------------------------------------------------
--Zad9
--policz wszystkie kraje , które uzyskały niepodległośc po roku 1990
 --Dopisz słowa(o)  'Liczba krajów obchodzacyh dzien niepodległości w listopadzie - ' do wyniku na  początku  .
select * from country
select * from politics


----------------------------------------------------------------------
--Zad10
--znajdź wszystkie państwa  ktorych dochód narodowy (GDP) jest powyżej 1 bln dolarów
--Dopisz słowa(o)  '$' do wyniku na  koncu .
select * from economy;
select * from country;


select country.name, cast(economy.GDP as varchar) + ' $'as 'money' from economy join country on country.code=economy.country where economy.GDP > 1000000;

-------------------------------------------------------------------------
--zad11
--zlicz ile jest kontynetów  
--obok cyfry ma pojawić sie napis "Kontynentów"
 select * from continent; 

 select cast(count(continent.Name) as varchar) + ' Kontynentow' from continent;

--------------------------------------------------------------------------
--zad12
--zlicz ile krajów uzywa jezyka niemieckiegi i francuskiego pogrupuj je wg nazwy
--obok cyfry ma pojawić sie napis "  niemiecki i francuski "
 select * from language;  

 select cast(count(language.Name)as varchar) + '  niemiecki i francuski ' from language where name like 'German' or name like 'French' group by name;
 
 -----------------------------------------------------------------------------
