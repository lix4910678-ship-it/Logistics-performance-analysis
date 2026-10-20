SELECT
    c.carrier_name,
    COUNT(*) AS delivered_orders,
    ROUND(AVG(o.shipping_cost), 2) AS avg_cost_usd,
    ROUND(
        AVG(
            CASE WHEN o.delivered_date <= o.promised_date
                 THEN 1.0 ELSE 0.0 END
        ),
        4
    ) AS on_time_rate,
    ROUND(
        AVG(
            JULIANDAY(o.delivered_date)
            - JULIANDAY(o.ship_date)
        ),
        2
    ) AS avg_delivery_days
FROM orders AS o
JOIN carriers AS c
    ON o.carrier_id = c.carrier_id
WHERE o.delivered_date IS NOT NULL
GROUP BY c.carrier_id, c.carrier_name
ORDER BY c.carrier_name;