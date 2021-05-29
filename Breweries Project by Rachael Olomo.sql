-------- Section A; Profit Analysis ----------
-- Solution 1 --
select * from internationalbreweries.pabod
select distinct years from internationalbreweries.pabod
select distinct brands from internationalbreweries.pabod

--- total rofit of the breweries ---
select sum(profit) as total_profit from internationalbreweries.pabod

---- total profit for the anglophone -----
select sum(profit) as Total_Profit from internationalbreweries.pabod
where countries in('Nigeria','Ghana')

---- total profit for the francophone ----
select sum(profit) as Total_Profit from internationalbreweries.pabod
where countries not in('Nigeria', 'Ghana')

-- Solution 2 --
select case when countries in ('Nigeria', 'Ghana') then 'anglophone' else 'francophone' end as territories,
sum(profit) as total_profit from internationalbreweries.pabod
where years in (2017, 2018, 2019)
Group by territories

-- also from the queries for the anglophone and francophone countries, 
-- it is clear that more profit was generated from the francophone speaking countries.

-- Solution 3 --
select countries, sum(profit) as Highest_Profit from internationalbreweries.pabod
where years = 2019
group by countries
order by 2 desc 
limit 1

-- Solution 4 --
select years, sum(profit) as Highest_Profit from internationalbreweries.pabod
group by years
order by 2 desc
limit 1

-- Solution 5 --
select months, years, min(profit) as Least_Profit from internationalbreweries.pabod
group by (months, years)
order by 3 asc
limit 1

-- Solution 6 --
select min(profit) as Minimum_Profit from internationalbreweries.pabod
where years = 2018 and months = 'December'

-- Solution 7 --
select sum(profit) as Total_Profit from internationalbreweries.pabod
where years = 2019

select months, round(sum(profit)/30020250 * 100, 2) as Percentage_Profit from internationalbreweries.pabod
where years = 2019
group by 1
	
-- Solution 8 --
select brands, sum(profit) as highest_profit from internationalbreweries.pabod
where countries = 'Senegal'
group by brands
order by 2 desc
limit 1

---- Section B; Brand Analysis ----
-- Solution 1 --
select brands, sum(quantity) as total_consumption from internationalbreweries.pabod
where years between 2018 and 2019 and countries in('Togo','Benin','Senegal')
group by brands
order by 2 desc
limit 3

-- Solution 2 --
select brands, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries = 'Ghana'
group by brands
order by 2 desc
limit 2

-- Solution 3 --
select brands, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries = 'Nigeria' and brands not in('beta malt', 'grand malt')
group by brands
order by 2 desc

-- Solution 4 --
select brands, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries in('Ghana','Nigeria') and years in(2018,2019) and brands in('beta malt', 'grand malt')
group by brands

-- Solution 5 --
select brands, sum(quantity) as total_sales from internationalbreweries.pabod
where countries = 'Nigeria' and years = 2019 
group by brands
order by 2 desc
limit 1

-- Solution 6 --
select brands, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries = 'Nigeria' and region = 'southsouth'
group by brands
order by 2 desc
limit 1

-- Solution 7 --
select brands, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries = 'Nigeria' and brands not in('beta malt', 'grand malt')
group by brands
order by 2 desc

-- Solution 8 --
select region, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries = 'Nigeria' and brands = 'budweiser' 
group by region

-- Solution 9 --
select region, sum(quantity) as total_consumption from internationalbreweries.pabod
where countries = 'Nigeria' and brands = 'budweiser' and years = 2019
group by region

---- Section C; Countries Analysis ----
-- Solution 1 --
select countries, sum(quantity) as total_consumption from internationalbreweries.pabod
where brands not in('beta malt', 'grand malt')
group by countries
order by 2 desc
limit 1

-- Solution 2 --
select sales_rep, sum(quantity) as highest_sales from internationalbreweries.pabod
where brands = 'budweiser' and countries = 'Senegal'
group by sales_rep
order by 2 desc
limit 1

-- Solution 3 --
select countries, sum(profit) as highest_profit from internationalbreweries.pabod
where months in('October', 'November', 'December') and years = 2019
group by countries
order by 2 desc
limit 1

