```sql
  
SELECT  Country,
	      Continent,
        Avg_solar_consumption
FROM energy.hydro_solar_transformed
WHERE Continent = 'Africa'
ORDER BY Avg_solar_consumption DESC;

```
