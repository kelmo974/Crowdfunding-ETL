-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT DISTINCT cf_id, backers_count
FROM campaign
-- WHERE outcome = 'live'
-- ORDER BY backers_count DESC;
WHERE outcome = 'live'
ORDER BY backers_count desc; 





-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT DISTINCT bk.cf_id, cat.backers_count
FROM backers as bk
JOIN campaign as cat
ON cat.cf_id = bk.cf_id
ORDER BY cat.backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT DISTINCT bk.cf_id, bk.first_name, bk.last_name, bk.email,
(cat.goal - cat.pledged) AS "Remaining Goal Amount"
INTO goal_amount_remainder
FROM backers as bk
JOIN campaign AS cat
ON cat.cf_id = bk.cf_id
WHERE cat.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;



-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bk.cf_id, bk.first_name, bk.last_name, bk.email, 
cat.company_name, cat.description, cat.end_date, (cat.goal - cat.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as bk
JOIN campaign AS cat
ON cat.cf_id = bk.cf_id
WHERE cat.outcome = 'live'
ORDER BY bk.email DESC;



-- Check the table


