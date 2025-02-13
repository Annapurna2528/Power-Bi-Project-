select* from financial_loan

select count(id) as Total_Loan_Aplications from financial_loan

select count(id) as MTD_Total_Loan_Aplications from financial_loan
where MONTH(issue_date) = 12 and year(issue_date)=2021

select count(id) as PMTD_Total_Loan_Aplications from financial_loan
where MONTH(issue_date) = 11 and year(issue_date)=2021

Select sum(loan_amount)  as Total_Funded_Amount from financial_loan

Select sum(loan_amount)  as MTD_Total_Funded_Amount from financial_loan
where month (issue_date) = 12 and year(issue_date)=2021

Select sum(loan_amount)  as PMTD_Total_Funded_Amount from financial_loan
where month (issue_date) = 11 and year(issue_date)=2021

Select sum(total_payment)  as Total_Amount_Recived from financial_loan

Select sum(total_payment)  as MTD_Total_Amount_Recived from financial_loan
where month (issue_date) = 12 and year(issue_date)=2021

Select sum(total_payment)  as PMTD_Total_Amount_Recived from financial_loan
where month (issue_date) = 11 and year(issue_date)=2021


Select round(avg(int_rate)*100 ,3) as Avg_Intrest_Rate from financial_loan

Select round(avg(int_rate)*100 ,3) as MTD_Avg_Intrest_Rate from financial_loan
where month (issue_date) = 12 and year(issue_date)=2021

Select round(avg(int_rate)*100 ,3) as PMTD_Avg_Intrest_Rate from financial_loan
where month (issue_date) = 11 and year(issue_date)=2021

Select round(avg(dti)*100 ,3) as Avg_DTI from financial_loan

Select round(avg(dti)*100 ,3) as MTD_Avg_DTI from financial_loan
where month (issue_date) = 12 and year(issue_date)=2021

Select round(avg(dti)*100 ,3) as PMTD_Avg_DTI from financial_loan
where month (issue_date) = 11 and year(issue_date)=2021

Select loan_status from financial_loan

select 
    (count(case when loan_status = 'fully_paid' or loan_status = 'current' then id End)*100)
	/
	(count(id) )as Good_loan_percentage
	from financial_loan

	select count(id) as Good_Loan_Applications from financial_loan
	where loan_status='fully paid' or loan_status='current'

	select sum(loan_amount) as Good_Loan_Funded_amount from financial_loan
	where loan_status='fully paid' or loan_status='current'

	select sum(total_payment) as Good_Loan_amount_recived from financial_loan
	where loan_status='fully paid' or loan_status='current'

select 
    round((count(case when loan_status = 'charged off' then id End)*100)
	/
	(count(id) ),2) as Bad_loan_percentage
	from financial_loan

	select count(id) as Bad_Loan_Applications from financial_loan
	where loan_status='charged off'

	select sum(loan_amount) as Bad_Loan_Funded_amount from financial_loan
	where loan_status='charged off'

	select sum(total_payment) as Bad_Loan_Amount_Recived from financial_loan
	where loan_status='charged off'

	select
	loan_status,
	COUNT(id) as Total_Loan_Applications,
	sum(total_payment) as Total_Amount_Recived,
	sum(loan_amount) as Total_Funded_Amount,
	avg(int_rate) as Intrest_Rate,
	avg(dti *100) as DTI
	from financial_loan
	group by loan_status


	select
	loan_status,
	sum(total_payment) as MTD_Total_Amount_Recived,
	sum(loan_amount) as MTD_Total_Funded_Amount
	from financial_loan
	 where month(issue_date)=12
	 group by loan_status

	 select 
	 month (issue_date) as Month_Number,
	 datename(month, issue_date) as Month_Name,
	 count(id) as Total_Loan_Applications,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_Amount_Recived
	 from financial_loan
	 group by month (issue_date) , datename(month, issue_date)
	 order by month(issue_date) 

	 select 
	 address_state,
     count(id) as Total_Loan_Applications,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_Amount_Recived
	 from financial_loan
	 group by address_state
	 order by address_state

	 select 
	 term,
     count(id) as Total_Loan_Applications,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_Amount_Recived
	 from financial_loan
	 group by term
	 order by term

	 select 
	 emp_length,
     count(id) as Total_Loan_Applications,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_Amount_Recived
	 from financial_loan
	 group by emp_length
	 order by count(id)desc

	 select 
	 purpose,
     count(id) as Total_Loan_Applications,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_Amount_Recived
	 from financial_loan
	 group by purpose
	 order by count(id)desc

	 select 
	 home_ownership,
     count(id) as Total_Loan_Applications,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_Amount_Recived
	 from financial_loan
	 group by home_ownership
	 order by count(id)desc