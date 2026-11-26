select * from telecom;

select customerID, churn_Flag
from telecom
where churn_Flag = 1;

-- OVERALL CHURN RATE sum(Churn_Flag) counts the number of customers who left because they have a value of 1, count(*) counts all customers and divinding by 100 gives a percentage.
select sum(Churn_Flag) * 100 / count(*) as Churn_Rate
from telecom;

-- OVERALL CHURN RATE IN TWO DECIMAL POINT
select Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom;
-- INSIGHT COMMENT, churn rate shows the telecommunication company is losing 26.58% of it's total customers, factors responsible for this should be investigated.


-- CHURN RATE PER CONTRACT TYPE, group by contract was used to group the churn_rate into the contract types available.
select contract, Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom
group by contract
order by Churn_Rate desc;
-- From the churn rate per contract type, month to month had the highest churn rate which may ne due to lack of customer's committment


-- Churn rate amongst tenure group
select Tenure_Group, count(*) as No_of_Customers, Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom
group by Tenure_Group
order by Churn_Rate desc;
-- the 0-12 tenure group had the most churn rate, it also corelates with the churn rate amongst the month to month contract type churning.


-- Internet service with the highest churn rate.
select InternetService, Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom
group by InternetService
order by Churn_Rate desc;
-- Customers using the Fiber optic internet service had the highest churn rate, further investigations should be made to know the cause of churning. (is it a lack of internet service with an area or malfunction of tools) 


-- Churn rate per payment method
select PaymentMethod, count(*) as No_of_Customers, sum(Churn_Flag), Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom
group by PaymentMethod
order by Churn_Rate desc;
-- The Electronic check payment method had the highest churn rate, further investigations should be made as to why (process maybe too long or extra charges)


-- Average monthly charge of churned vs retained customers
select Churn_Flag, count(*) as No_of_Customers, sum(Churn_Flag), Round (avg(MonthlyCharges), 2) as Avg_Monthly_Charges
from telecom
group by Churn_Flag;
-- churned customers tend to pay more monthly charges on a average compared to non churned customers.


-- Revenue lost to churned customer (where churn_flag = 1 specifically calculate monthly charges of churned customers)
SELECT 
    Churn_Flag, ROUND(SUM(MonthlyCharges), 2) AS Churn_Rate
FROM
    telecom
WHERE
    Churn_Flag = 1
GROUP BY Churn_Flag;
-- 139130.85 (30%) of monthly revenue was lost due to churned customers 


-- Revenue of both Churned and Retained customers (Group by to catergorize)
select Churn_Flag, Round (sum(MonthlyCharges), 2) as Churn_Rate
from telecom
group by Churn_Flag;


-- Total of monthly revenue 
select Round (sum(MonthlyCharges), 2)
from telecom;


-- Churn rate for customers with tech support
select TechSupport, count(*) as No_of_Customers, sum(Churn_Flag), Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom
group by TechSupport
order by Churn_Rate desc;
-- Customers without tech support churned more, this may have worsen their experience with the telecom's internet service
-- Yes, Customers with tech support churned less.

-- Churn rate for customers with Online security
select OnlineSecurity, Round (sum(Churn_Flag) * 100 / count(*), 2) as Churn_Rate
from telecom
group by OnlineSecurity
order by Churn_Rate desc;
-- Customer without Online security churned more, this may have worsen their experience with the telecom's internet service
-- Yes, Customers with Online Security churned less.

Select count(*)
from telecom;