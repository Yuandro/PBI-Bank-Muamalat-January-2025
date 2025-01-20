SELECT
    ord.`Date` AS order_date,
    ca.CategoryName AS category_name,
    prod.ProdName AS product_name,
    prod.Price AS product_price,
    ord.Quantity AS order_qty,
    ROUND((prod.Price * ord.Quantity),2) as total_sales,
    SPLIT(cus.CustomerEmail, '#')[OFFSET(0)] AS cust_email,
    cus.CustomerCity AS cust_city,
    cus.CustomerState AS cust_state
FROM
    `muamalat-bi-analyst1.muamalat_bi_analyst.orders` AS ord
JOIN 
    `muamalat-bi-analyst1.muamalat_bi_analyst.customers` AS cus
    ON ord.CustomerID = cus.CustomerID
JOIN
    `muamalat-bi-analyst1.muamalat_bi_analyst.products` AS prod
    ON prod.ProdNumber = ord.ProdNumber
JOIN
    `muamalat-bi-analyst1.muamalat_bi_analyst.product_category`AS ca
    ON ca.CategoryID = prod.Category
ORDER BY
    order_date;
