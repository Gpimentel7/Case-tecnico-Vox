SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(p.amount) AS total_revenue
FROM 
    payment p
JOIN 
    customer c ON p.customer_id = c.customer_id
WHERE 
    p.payment_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY 
    c.customer_id, customer_name
ORDER BY 
    total_revenue DESC
LIMIT 5;



SELECT MAX(payment_date) AS ultima_data_pagamento FROM payment;

SELECT 
    cat.name AS category,
    AVG(DATE_PART('day', r.return_date - r.rental_date)) AS avg_rental_days
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category cat ON fc.category_id = cat.category_id
WHERE 
    r.return_date IS NOT NULL
GROUP BY 
    cat.name
ORDER BY 
    avg_rental_days DESC;


SELECT 
    ci.city,
    COUNT(r.rental_id) AS rental_count
FROM 
    rental r
JOIN 
    customer c ON r.customer_id = c.customer_id
JOIN 
    address a ON c.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
GROUP BY 
    ci.city
ORDER BY 
    rental_count DESC
LIMIT 3;


SELECT 
    s.store_id,
    ROUND(SUM(p.amount) / COUNT(DISTINCT r.rental_id), 2) AS average_ticket
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    store s ON i.store_id = s.store_id
GROUP BY 
    s.store_id
ORDER BY 
    average_ticket DESC;


SELECT 
    DATE_TRUNC('month', p.payment_date) AS month,
    ROUND(SUM(p.amount), 2) AS total_revenue
FROM 
    payment p
WHERE 
    p.payment_date >= CURRENT_DATE - INTERVAL '24 months'
GROUP BY 
    month
ORDER BY 
    month;
