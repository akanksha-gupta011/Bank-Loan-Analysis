SELECT * FROM bank_loan_data

SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate), 4) *100 AS Average_Interest_Rate FROM bank_loan_data

SELECT ROUND(AVG(int_rate), 4) *100 AS MTD_Average_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate), 4) *100 AS PMTD_Average_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti), 4) *100 AS Average_DTI FROM bank_loan_data

SELECT ROUND(AVG(dti), 4) *100 AS MTD_Average_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti), 4) *100 AS PMTD_Average_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) *100)
	/
	COUNT (id) AS Good_loan_percentange
FROM bank_loan_data


SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) *100) /
	COUNT (id) AS bad_loan_percentange
FROM bank_loan_data

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT 
		loan_status,
		COUNT (id) AS Total_Loan_applications,
		SUM(total_payment) AS total_amount_received,
		SUM(loan_amount) AS Total_funded_amount,
		AVG(int_rate *100) AS interest_rate,
		AVG(dti *100) AS DTI
	FROM
		bank_loan_data
	GROUP BY
		loan_status

SELECT 
		loan_status,
		SUM(total_payment) AS MTD_total_amount_received,
		SUM(loan_amount) AS MTD_Total_funded_amount
FROM
	bank_loan_data
WHERE MONTH(issue_date)=12
GROUP BY
	loan_status

	
SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_received_amount
FROM
	bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC

SELECT
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_received_amount
FROM
	bank_loan_data
GROUP BY term
ORDER BY term

SELECT
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_received_amount
FROM
	bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC

SELECT
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_received_amount
FROM
	bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

SELECT
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_received_amount
FROM
	bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC




