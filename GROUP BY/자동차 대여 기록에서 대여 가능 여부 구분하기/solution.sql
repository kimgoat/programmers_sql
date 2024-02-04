SELECT CAR_ID, '대여 가능' as AVAILABILITY
FROM
(
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    GROUP BY CAR_ID
    MINUS
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE '2022-10-16' between TO_CHAR(START_DATE, 'YYYY-MM-DD') 
                            and TO_CHAR(END_DATE, 'YYYY-MM-DD')
    ORDER BY CAR_ID desc
)

UNION ALL

SELECT 
CAR_ID, '대여중' as AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE '2022-10-16' between TO_CHAR(START_DATE, 'YYYY-MM-DD') 
                        and TO_CHAR(END_DATE, 'YYYY-MM-DD')
ORDER BY CAR_ID desc