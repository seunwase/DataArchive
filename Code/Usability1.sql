Using the created view table to enquire the country that uses hydro consumption the most.

```sql

SELECT * FROM energy.hydro_solar_transformed
ORDER BY Avg_hydro_consumption DESC;

```
