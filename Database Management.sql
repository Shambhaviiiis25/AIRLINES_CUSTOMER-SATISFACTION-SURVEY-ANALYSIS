use Airlines

select* from Airlines

-- Task 1: To get the total number of passengers in the dataset
select COUNT(id) AS Total_Passengers from dbo.Airlines

--Task 2: To find the number of male and female passengers.
select gender,COUNT(gender) AS Total
from Airlines
group by gender 

--Task 3: To find how many regular and non-regular customers there are.
SELECT Customer_Type, COUNT(*) AS Count 
FROM dbo.Airlines
group BY Customer_Type;


--Task 4:To analyze the average satisfaction with inflight Wi-Fi service by travel class.
SELECT Class, AVG(Inflight_wifi_service) AS AvgWifiSatisfaction
FROM Airlines
GROUP BY Class;

--Task 5: To find the number of passengers affected by delays(more than 60 mins)
select ID,gender,customer_type,Arrival_Delay_in_Minutes,Departure_Delay_in_Minutes
from Airlines
where Arrival_Delay_in_Minutes>60 and Departure_Delay_in_Minutes>60

--Task 6: To identify how many passengers rated the onboard service as 4 or higher.
select Age_Group,COUNT(age_group) As TOTAL
from Airlines
where on_board_service>=4
group by Age_Group

--Task 7: To find out the passengers who are dissatisfied with all the services(leass than 3)
select * from Airlines
where Departure_Arrival_time_convenient<3 AND
Ease_of_Online_booking<3 AND
Gate_location<3 AND
Food_and_drink<3 AND Seat_comfort<3 and Inflight_entertainment<3 and Leg_room_service<3
and Checkin_service<3 and Cleanliness<3 and Inflight_service <3 

--Task 8: To find out how many passengers rated all satisfaction factors as 4 or higher.
SELECT * FROM Airlines
WHERE 
Departure_Arrival_time_convenient >3 AND
Ease_of_Online_booking >3 AND
Gate_location >3 AND
Food_and_drink>3 AND 
Seat_comfort>3 and 
Inflight_entertainment>3 and 
Leg_room_service>3 and 
Checkin_service>3 and 
Cleanliness>3 and 
Inflight_service >3 and
Baggage_handling >3

--Task 9: Comparison of Average Satisfaction Between Travel Types
SELECT Type_Of_Travel, COUNT(satisfaction) AS SatisfiedCount
FROM Airlines
WHERE satisfaction = 'satisfied'
GROUP BY Type_Of_Travel;

--Task 10: Comparison of Average Satisfaction Between Travel Types
SELECT  
CASE  WHEN Flight_Distance < 500 THEN 'Short Haul'
       WHEN Flight_Distance BETWEEN 500 AND 1000 THEN 'Medium Haul'
       ELSE 'Long Haul' 
END AS DistanceRange,

SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) * 1.0 /  NULLIF(SUM(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN 1 ELSE 0 END), 0) AS SatisfactionRatio
FROM Airlines
GROUP BY 
    
CASE WHEN Flight_Distance < 500 THEN 'Short Haul'
      WHEN Flight_Distance BETWEEN 500 AND 1000 THEN 'Medium Haul'
      ELSE 'Long Haul' 
END
ORDER BY SatisfactionRatio DESC;



