select * from bank_loan_data

-- Total Loan Application
select count(id) as Total_Loan_Application 
from bank_loan_data;

--Month to date Loan Application
select count(id) as MTD_Total_Loan_Application from bank_loan_data
where MONTH(issue_date) = 12 

--Previous Month to date Loan Application
select count(id) as PMTD_Total_Loan_Application from bank_loan_data
where MONTH(issue_date) = 11

--(MTD-PMTD)/PMTD to calculate month on month application percentage

--Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data

--Month to Date Total Funded Amount
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 12 

--Previous Month to Date Total Funded Amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data
where month(issue_date) = 11 

--Total Amount Received 
select sum(total_payment) as Total_Amount_Received from bank_loan_data

--Month to Date Total Amount Received
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where MONTH(issue_date) = 12

--Month to Previous Date Total Amount Received
select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan_data
where MONTH(issue_date) = 11

--Average Interest Rate
select round(avg(int_rate) , 4)  * 100 as Avg_Interest_Rate from bank_loan_data

--Month to Date Average Interest Rate
select round(avg(int_rate) , 4)  * 100 as MTD_Avg_Interest_Rate from bank_loan_data
where month(issue_date) = 12 

--Previous Month to Date Average Interest Rate
select avg(int_rate) * 100 as PMTD_Avg_Interest_Rate from bank_loan_data
where month(issue_date) = 11

--Average Debt-to-Income Ratio (DTI)
select round(avg(dti) , 4) * 100 as Avg_DTI from bank_loan_data

--Month to Date Average Debt-to-Income Ratio (DTI)
select round(avg(dti) , 4) *100 as MTD_Avg_DTI from bank_loan_data
where month(issue_date) = 12

--Previous Month to Date Average Debt-to-Income Ratio (DTI)
select round(avg(dti) , 4) * 100 as PMTD_Avg_DTI from bank_loan_data
where month(issue_date) = 11



--Created By Bhanu Chauhan