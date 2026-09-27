Alter table supply_chain_transit
ADD CONSTRAINT pk_transit_id PRIMARY KEY (record_id);

Alter table supply_chain_warehouse
ADD CONSTRAINT fk_chain_warehouse 
FOREIGN KEY (record_id) REFERENCES supply_chain_transit (record_id);

Alter table supply_chain_risk
ADD CONSTRAINT fk_chain_risk
FOREIGN KEY (record_id) REFERENCES supply_chain_transit (record_id);



-- Evaluating the impact of traffic level on shipping costs.
select traffic_level,
  count(record_id) as total_shipment,
  round(avg(shipping_cost_usd) :: NUMERIC,2) as avg_shipping_cost
  from supply_chain_transit
  group by traffic_level
  order by traffic_level desc;
-- output: Shipping costs remain relatively stable across all
-- traffic levels, averaging between 450 and 470 USD, with the 
-- highest shipment volumes heavily concentrated at traffic levels 0 and 9


-- assesing port congestion and weather severity across risk classification
SELECT 
    risk_class,
    COUNT(record_id) AS total_records,
    ROUND(AVG(port_cong)::NUMERIC, 2) AS avg_port_congestion,
    ROUND(AVG(weather_severity)::NUMERIC, 2) AS avg_weather_severity
FROM supply_chain_risk
GROUP BY risk_class
ORDER BY avg_port_congestion DESC;
-- While weather severity remains uniform across all categories (~0.50), 
-- high-risk shipments dominate the volume (23,944 records) and 
-- experience the peak average port congestion (6.99).


-- Query 3: Segmenting supplier reliability to measure inventory and lead time impacts
SELECT 
    CASE 
        WHEN supplier_reliability >= 0.8 THEN 'High Reliability'
        WHEN supplier_reliability >= 0.4 THEN 'Moderate Reliability'
        ELSE 'Low Reliability'
    END AS reliability_tier,
    COUNT(record_id) AS supplier_count,
    ROUND(AVG(inventory_level_units)::numeric, 2) AS avg_inventory,
    ROUND(AVG(lead_days)::numeric, 2) AS avg_lead_days
FROM supply_chain_warehouse
GROUP BY reliability_tier
ORDER BY avg_lead_days DESC;
-- Low-reliability suppliers dominate the supplier count (13,840)
-- and hold higher average inventory with longer lead times,
-- whereas high-reliability suppliers offer faster turnaround times.


-- Query 4: Multi-table join isolating high-risk shipments with above-average shipping costs
SELECT 
    t.record_id,
    t.shipping_cost_usd,
    t.traffic_level,
    w.supplier_reliability,
    w.lead_days,
    r.risk_class,
    r.port_cong
FROM supply_chain_transit t
JOIN supply_chain_warehouse w ON t.record_id = w.record_id
JOIN supply_chain_risk r ON t.record_id = r.record_id
WHERE r.risk_class = 'High Risk'
  AND t.shipping_cost_usd > (SELECT AVG(shipping_cost_usd) FROM supply_chain_transit)
ORDER BY t.shipping_cost_usd DESC
LIMIT 10;
-- Unified Outlier Identification: The joined dataset successfully isolates critical
-- operational outliers by mapping high-risk shipments to maximum shipping costs (around $1,000 USD) and 
-- severe port congestion.

-- Bottleneck Impact: Severe port congestion and high traffic levels directly correlate with extended 
-- lead times (exceeding 14 days) under high-risk classifications.
