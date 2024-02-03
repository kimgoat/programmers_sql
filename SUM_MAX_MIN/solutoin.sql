-- use subquery
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) as PRICE FROM FOOD_PRODUCT)

-- use max(column_name) KEEP(DENSE_RANK FIRST ORDER BY column_name DESC) FROM table_name : max
-- min(column_name) KEEP(DENSE_RANK LAST ORDER BY column_name DESC) FROM table_name : min
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) KEEP(DENSE_RANK FIRST ORDER BY PRICE DESC) 
               FROM FOOD_PRODUCT)