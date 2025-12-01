create database ola;
use ola;
create table ola (
Date text,	
Time text,	
Booking_ID text,	
Booking_Status text,	
Customer_ID	text,
Vehicle_Type text,	
Pickup_Location text,	
Drop_Location text,	
V_TAT bigint,	
C_TAT bigint,	
Canceled_Rides_by_Customer text,	
Canceled_Rides_by_Driver text,	
Incomplete_Rides text,	
Incomplete_Rides_Reason text,	
Booking_Value int,	
Payment_Method text,	
Ride_Distance int,	
Driver_Ratings bigint,	
Customer_Rating	text,
Vehicle_Images text
);
set global local_infile = on;
load data local infile 'C:/Users/Gulbaaz/Downloads/Analytics/Ola.csv'
into table ola
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

select * from ola;

-- 1. Retrieve all successful bookings
select * 
from ola
where booking_status = 'success';

-- 2. Find the average ride distance for each vehicle type
select Vehicle_type, avg(Ride_Distance)
from ola
group by Vehicle_type;

-- 3. Get the total number of cancelled rides by customers
select count(*)
from ola
where Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides
select Customer_ID, count(*) as Total_rides
from ola
group by Customer_ID
order by count(*) desc
limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues
select count(*) 
from ola
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
select max(Driver_Ratings), min(Driver_Ratings)
from ola
where Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI
select * 
from ola
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type
select Vehicle_Type, round(avg(Customer_Rating),2) as Rating
from ola
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully
select sum(Booking_Value)
from ola
where Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason
select Booking_ID, Incomplete_Rides_Reason
from ola
where Incomplete_Rides = 'Yes';

