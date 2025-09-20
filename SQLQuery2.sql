select * from bank_loan_data

select loan_status from bank_loan_data

--Good Loan Issued KPI's

--Good Loan Percentage
select 
     (count(case when loan_status = 'Fully Paid' or  loan_status = 'Current' then id end)*100)
     /
     count(id) as Good_Loan_Percentage
from bank_loan_data

--Good Loan Applications
select count(id) as Good_Loan_Applications from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Good Loan Received Amount
select sum(total_payment) as Good_Loan_Received_Amount from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Bad Loan Issued KPI's

--Bad Loan Percentage
select 
     (count(case when loan_status = 'Charged Off' then id end) *100.0)
     /
     count(id) as Bad_Loan_Percentage
from bank_loan_data

--Bad Loan Applications

select count(id) as Bad_Loan_Applications from bank_loan_data
where loan_status = 'Charged Off'

--Bad Loan Funded Amount
select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data
where loan_status = 'Charged Off'

--Bad Loan Received Amount
select sum(total_payment) as Good_Loan_Received_Amount from bank_loan_data
where loan_status = 'Charged Off' 

--Loan Status
select 
      loan_status,
      count(id) as Total_Loan_Applications,
      sum(total_payment) as Total_Amount_Received,
      sum(loan_amount) as Total_Funded_Amount,
      avg(int_rate * 100) as Interest_Rate,
      avg(dti * 100) as DTI
from
    bank_loan_data
group by
    loan_status

--Loan Status by Month to Date
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status



--Created By Bhanu Chauhan
