create database scm;
use scm;
select * from pallet_masked_fulldata;

#count, min, max avg and std values
select count(qty),
min(qty),
max(qty),
std(qty),
avg(whname),
avg(qty)
from pallet_masked_fulldata;

																				#first movement business decision

#mean of qty
SELECT AVG(qty) as mean_column
FROM pallet_masked_fulldata;

#median of qty
SELECT qty AS median_Column
FROM (
SELECT qty, ROW_NUMBER() OVER (ORDER BY qty) AS row_num,
COUNT(*) OVER () AS total_count
FROM pallet_masked_fulldata
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

#mode of qty
SELECT qty AS mode_Column
FROM (
SELECT qty, COUNT(*) AS frequency
FROM pallet_masked_fulldata
GROUP BY qty
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

#mode for whname
select whname as mode_whname
from(
select whname , count(*) as frequency
from pallet_masked_fulldata
group by whname 
order by frequency desc 
limit 1
) as subquery;

#mode for region
select region as mode_whname
from(
select region , count(*) as frequency
from pallet_masked_fulldata
group by region 
order by frequency desc 
limit 1
) as subquery;

#mode for city
select city as mode_whname
from(
select city , count(*) as frequency
from pallet_masked_fulldata
group by city 
order by frequency desc 
limit 1
) as subquery;


#mode for state
select state as mode_statename
from(
select state , count(*) as frequency
from pallet_masked_fulldata
group by state 
order by frequency desc 
limit 1
) as subquery;


																			#second movement business decision 
                                                                
# Standard Deviation for qty
SELECT STDDEV(qty) AS Column_stddev
FROM pallet_masked_fulldata;

# Standard Deviation for whname
SELECT STDDEV(whname) AS Column_whstddev
FROM pallet_masked_fulldata;

# Range of Years of qty:
SELECT MAX(QTY) - MIN(qty) AS Column_range
FROM pallet_masked_fulldata;

# Range of Years of whname:
select max(whname)-min(whname) as cloumn_whrange
from pallet_masked_fulldata;

# Variance of Performance of qty
SELECT VARIANCE(qty) AS performance_variance
FROM pallet_masked_fulldata;	

# Variance of Performance of whname
select variance(whname) as column_whvariance
from pallet_masked_fulldata;


																		#third movement business decision (skewness)
                                                            
                                                            
 SELECT
(
SUM(POWER(qty- (SELECT AVG(qty) FROM pallet_masked_fulldata), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(qty) FROM pallet_masked_fulldata), 3))
) AS skewness

FROM pallet_masked_fulldata;     

															
																		#fourth movement business decision(kurtosis)
														
														
SELECT
(
(SUM(POWER(qty- (SELECT AVG(qty) FROM pallet_masked_fulldata), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(qty) FROM pallet_masked_fulldata), 4))) - 3
) AS kurtosis
FROM pallet_masked_fulldata;

###################################################################################################################################################################################################
                                                          
																				#data preprocessing process
                                                            

#null values of qty
select count(*) as total_rows,
sum(case when qty is null then 1 else 0  end)as qty_missing
from pallet_masked_fulldata;

#outliers of qty
SELECT (qty-AVG(qty) Over())/(stddev(qty) Over()) as Zscore
from pallet_masked_fulldata;

SELECT * FROM
(SELECT
qty,
(qty-AVG(qty) Over())/stddev(qty) Over() as Zscore
FROM pallet_masked_fulldata) as z_table
WHERE Zscore >3 or Zscore < -3;

                          
# Drop duplicates
CREATE TABLE temp AS
SELECT DISTINCT * FROM pallet_masked_fulldata;
TRUNCATE TABLE pallet_masked_fulldata;
INSERT INTO pallet_masked_fulldata
SELECT * FROM temp_TABLE_NAME;
DROP TABLE temp_TABLE_Name;
SELECT COUNT(*) FROM pallet_masked_fulldata;

#count duplicates					
SELECT dates,custname,city,region,state,productcode,transactiontype,qty,whname, COUNT(*) as duplicate_count
FROM pallet_masked_fulldata
GROUP BY dates,custname,city,region,state,productcode,transactiontype,qty,whname
HAVING COUNT(*) > 1 ;                     
            
#missing values
select * from pallet_masked_fulldata where 
qty is null or custname is null or state is null or productcode is null or region is null or city is null or transactiontype is null or WHName is null;
  
  ################################################################################################################################################################################################
																				#after data preprocessing 
                          
#count, min, max avg and std values
select count(qty),
min(qty),
max(qty),
std(qty),
avg(whname),
avg(qty)
from pallet_masked_fulldata;

																				#first movement business decision

#mean of qty
SELECT AVG(qty) as mean_column
FROM pallet_masked_fulldata;

#median of qty
SELECT qty AS median_Column
FROM (
SELECT qty, ROW_NUMBER() OVER (ORDER BY qty) AS row_num,
COUNT(*) OVER () AS total_count
FROM pallet_masked_fulldata
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

#mode of qty
SELECT qty AS mode_Column
FROM (
SELECT qty, COUNT(*) AS frequency
FROM pallet_masked_fulldata
GROUP BY qty
ORDER BY frequency DESC
LIMIT 1
) AS subquery;

#mode for whname
select whname as mode_whname
from(
select whname , count(*) as frequency
from pallet_masked_fulldata
group by whname 
order by frequency desc 
limit 1
) as subquery;

#mode for region
select region as mode_whname
from(
select region , count(*) as frequency
from pallet_masked_fulldata
group by region 
order by frequency desc 
limit 1
) as subquery;

#mode for city
select city as mode_whname
from(
select city , count(*) as frequency
from pallet_masked_fulldata
group by city 
order by frequency desc 
limit 1
) as subquery;


#mode for state
select state as mode_statename
from(
select state , count(*) as frequency
from pallet_masked_fulldata
group by state 
order by frequency desc 
limit 1
) as subquery;


																			#second movement business decision 
                                                                
# Standard Deviation for qty
SELECT STDDEV(qty) AS Column_stddev
FROM pallet_masked_fulldata;

# Standard Deviation for whname
SELECT STDDEV(whname) AS Column_whstddev
FROM pallet_masked_fulldata;

# Range of Years of qty:
SELECT MAX(QTY) - MIN(qty) AS Column_range
FROM pallet_masked_fulldata;

# Range of Years of whname:
select max(whname)-min(whname) as cloumn_whrange
from pallet_masked_fulldata;

# Variance of Performance of qty
SELECT VARIANCE(qty) AS performance_variance
FROM pallet_masked_fulldata;	

# Variance of Performance of whname
select variance(whname) as column_whvariance
from pallet_masked_fulldata;


																		#third movement business decision (skewness)
                                                            
                                                            
 SELECT
(
SUM(POWER(qty- (SELECT AVG(qty) FROM pallet_masked_fulldata), 3)) /
(COUNT(*) * POWER((SELECT STDDEV(qty) FROM pallet_masked_fulldata), 3))
) AS skewness

FROM pallet_masked_fulldata;     

															
																		#fourth movement business decision(kurtosis)
														
														
SELECT
(
(SUM(POWER(qty- (SELECT AVG(qty) FROM pallet_masked_fulldata), 4)) /
(COUNT(*) * POWER((SELECT STDDEV(qty) FROM pallet_masked_fulldata), 4))) - 3
) AS kurtosis
FROM pallet_masked_fulldata;                          
                          
                          
select count(date)	from pallet_masked_fulldata;
select count(qty)	from pallet_masked_fulldata;
select count(custname)	from pallet_masked_fulldata;
select count(date)	from pallet_masked_fulldata;
select count(date)	from pallet_masked_fulldata;
select count(date)	from pallet_masked_fulldata;

                          
                          
                          
                                    