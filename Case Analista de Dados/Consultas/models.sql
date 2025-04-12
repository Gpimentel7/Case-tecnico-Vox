CREATE SCHEMA IF NOT EXISTS analytics;

WITH rentals AS (
    SELECT customer_id, rental_date
    FROM public.rental
),
payments AS (
    SELECT customer_id, amount
    FROM public.payment
)
SELECT
    r.customer_id,
    MIN(r.rental_date) AS first_rental_date,
    SUM(p.amount) AS total_spent,
    CURRENT_DATE - MIN(r.rental_date) AS days_since_first_rental
FROM rentals r
JOIN payments p ON r.customer_id = p.customer_id
GROUP BY r.customer_id


SELECT
    f.film_id,
    f.title,
    DATE_TRUNC('month', r.rental_date) AS month,
    COUNT(*) AS rental_count
FROM public.rental r
JOIN public.inventory i ON r.inventory_id = i.inventory_id
JOIN public.film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title, month
ORDER BY month DESC, rental_count DESC

SELECT
    s.store_id,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_revenue
FROM public.store s
JOIN public.staff st ON s.store_id = st.store_id
JOIN public.rental r ON r.staff_id = st.staff_id
JOIN public.payment p ON p.rental_id = r.rental_id
GROUP BY s.store_id

