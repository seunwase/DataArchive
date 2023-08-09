```sql
SELECT 
		    hydropower_consumption_dim.Entity AS Country,
        hydropower_consumption_dim.Continent,
        hydropower_consumption_dim.Currency,
        hydropower_consumption_dim.`Average Population`,
        hydropower_consumption_dim.`Landmass km2`,
		    solar_energy_consumption.`Code` AS Country_code,
        avg(hydropower_consumption_dim.`Electricity from hydro (TWh)`) AS Avg_hydro_consumption,
        avg(solar_energy_consumption.`Electricity from solar (TWh)`) AS Avg_solar_consumption
FROM energy.hydropower_consumption_dim
	LEFT JOIN solar_energy_consumption
    ON hydropower_consumption_dim.`Entity` = solar_energy_consumption.`Entity`
	AND hydropower_consumption_dim.`Year` = solar_energy_consumption.`Year`
    GROUP BY hydropower_consumption_dim.Entity, solar_energy_consumption.`code`, hydropower_consumption_dim.Continent,  hydropower_consumption_dim.Currency,  hydropower_consumption_dim.`Average Population`, hydropower_consumption_dim.`Landmass km2`;

```
