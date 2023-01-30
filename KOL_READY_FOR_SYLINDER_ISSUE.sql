

SELECT *  FROM XX_CHALLAN_MO_TEMP WHERE  CHALLAN_DATE between '19-MAY-2022' and '21-MAY-2022'
--DELETE FROM XX_CHALLAN_MO_TEMP


-- FOR MAMUN BOS-----------
---- ALL CYLINDER DATA WITH TRANSACTION TYPE

SELECT B.TRANSACTION_TYPE_NAME, A.* From MTL_MATERIAL_TRANSACTIONS A, MTL_TRANSACTION_TYPES B
  where A.TRANSACTION_TYPE_ID = B.TRANSACTION_TYPE_ID
 -- AND A.TRANSACTION_TYPE_ID = 129
 and A.ATTRIBUTE3 is null
AND A.INVENTORY_ITEM_ID IN(428,
447,
448,
774911,
796661,
386,
787861,
76,
102,
66,
118,
774910,
796566,
806756,
75,
787867,
796568,
77,
796567,
796569)


SELECT CHALLAN_NO,CUSTOMER_NAME FROM XX_CHALLAN_MO_TEMP 
GROUP BY CHALLAN_NO,CUSTOMER_NAME
HAVING COUNT(CHALLAN_NO)>1



XXKSRM_KOL_CHLN_RCV_PENDING

XXKSRM Update Challan and RCV Process For KOL









-------  GET NEGATIVE QUANTITY FROM THIS QUERY SUMMARY=========================


SELECT ORGANIZATION_ID,CUSTOMER_NAME,CHALLAN_NO,TO_CHAR(CHALLAN_DATE,'DD-MON-RRRR HH12:MI:SS PM')  CHALLAN_DATE,CREATED_BY,
 SUM(NVL(CHALLAN_QTY,0)) CHALLAN_QTY,
 SUM(NVL(RECEIPT_QTY,0)) RECEIPT_QTY , 
 SUM(NVL(CHALLAN_QTY,0)) - SUM(NVL(RECEIPT_QTY,0)) PENDING_QTY 
 FROM XX_CHALLAN_MO_TEMP
 WHERE  1=1
 --and TRUNC(CHALLAN_DATE)  BETWEEN '01-SEP-2021' and   '31-DEC-2021' 
 --and  CHALLAN_NO='4211020064899'
 and NVL(CHALLAN_QTY,0) - NVL(RECEIPT_QTY,0) <> 0
  and NVL(CHALLAN_QTY,0) - NVL(RECEIPT_QTY,0) < 0
---  and  NVL(CHALLAN_QTY,0) >  NVL(RECEIPT_QTY,0) 
 --AND RECEIPT_QTY is null
 --AND CUSTOMER_NAME='KBIL Manufacturing Unit' 
 GROUP BY ORGANIZATION_ID,CUSTOMER_NAME ,CHALLAN_NO,CHALLAN_DATE,CREATED_BY 


--=================================================
-- FOR UPDATE  CYLINDER AFTER CONFIRMATION AND GETTING DATA FROM KOL
--==================================================

SELECT * FROM MTL_MATERIAL_TRANSACTIONS WHERE ATTRIBUTE3 is not null
and ORGANIZATION_ID = 173  --='4211020063799'
and INVENTORY_ITEM_ID =428



SELECT SUM(TRANSACTION_QUANTITY), SUM(PRIMARY_QUANTITY) FROM MTL_MATERIAL_TRANSACTIONS WHERE ATTRIBUTE3 is not null
and ORGANIZATION_ID = 173  --='4211020063799'
and INVENTORY_ITEM_ID =428 
AND TRANSACTION_TYPE_ID= 129
UNION ALL 
SELECT SUM(TRANSACTION_QUANTITY), SUM(PRIMARY_QUANTITY) FROM MTL_MATERIAL_TRANSACTIONS WHERE ATTRIBUTE3 is  null
and ORGANIZATION_ID = 173  --='4211020063799'
and INVENTORY_ITEM_ID =428  
AND TRANSACTION_TYPE_ID= 129



SELECT * FROM XX_CHALLAN_MO_TEMP WHERE CHALLAN_NO= '4211020082228'

SELECT * FROM XX_CHALLAN_MO_TEMP WHERE TRUNC(CHALLAN_DATE)  BETWEEN  '26-DEC-2021' and   '26-DEC-2021'    
 
 
 

SELECT * FROM MTL_MATERIAL_TRANSACTIONS WHERE TRANSACTION_ID = 12540425 

SELECT * FROM MTL_MATERIAL_TRANSACTIONS WHERE ATTRIBUTE3='4211020063799'


SELECT * FROM   XX_CHALLAN_MO_TEMP  WHERE CHALLAN_NO='4211020063799'

--UPDATE MTL_MATERIAL_TRANSACTIONS 
--SET CREATION_DATE = TO_DATE('1/10/2022 06:18:34 PM', 'MM/DD/YYYY HH12:MI:SS PM'), 
--TRANSACTION_DATE = TO_DATE('1/10/2022 06:18:34 PM', 'MM/DD/YYYY HH12:MI:SS PM')
--WHERE TRANSACTION_ID = 12760083
--AND ORGANIZATION_ID = 173




SELECT * FROM   XX_CHALLAN_MO_TEMP 

 SELECT CUSTOMER_NAME, SUM(CHALLAN_QTY) CHALLAN_QTY, SUM(RECEIPT_QTY) RECEIPT_QTY , SUM(CHALLAN_QTY) - SUM(RECEIPT_QTY) PENDING_QTY FROM   XX_CHALLAN_MO_TEMP
 WHERE 1=1
 GROUP BY CUSTOMER_NAME
  -- WHERE CUSTOMER_NAME = 'KWSBL Manufacturing Unit'



--Query 1
/*Query to find all batches with their Status completed or closed*/  
--BATCH_STATUS = 2 (WIP-Work In Process)--BATCH_STATUS = 1 (Pending)
--BATCH_STATUS = 3 (Completed--BATCH_STATUS = 4 (Closed)
--BATCH_STATUS = -1 (Cancelled)
------------
select *
from GME_BATCH_HEADER 
where --batch_id in ()
--BATCH_NO=2831 and 
ORGANIZATION_ID=173
and to_char(ACTUAL_START_DATE,'MM-YYYY')='12-2021'
--AND BATCH_STATUS=1
--AND BATCH_STATUS=2
--and BATCH_STATUS=3
--AND BATCH_STATUS=4



SELECT SUM(TRANSACTION_QUANTITY) TRANSACTION_QUANTITY , SUM(PRIMARY_QUANTITY) PRIMARY_QUANTITY FROM MTL_MATERIAL_TRANSACTIONS WHERE ATTRIBUTE3= '4181010001600' and ORGANIZATION_ID= 173

SELECT SUM(TRANSACTION_QUANTITY) TRANSACTION_QUANTITY , SUM(PRIMARY_QUANTITY) PRIMARY_QUANTITY FROM MTL_MATERIAL_TRANSACTIONS WHERE  ORGANIZATION_ID= 173 and INVENTORY_ITEM_ID= 428


SELECT * FROM MTL_MATERIAL_TRANSACTIONS WHERE  ORGANIZATION_ID= 173 and INVENTORY_ITEM_ID= 428
and TRANSACTION_QUANTITY =0


12501767---> Ei transaction ID er qty silo 5


SELECT * FROM MTL_MATERIAL_TRANSACTIONS WHERE ATTRIBUTE3= '4211020038749' and ORGANIZATION_ID= 173

SELECT * FROM MTL_MATERIAL_TRANSACTIONS WHERE INVENTORY_ITEM_ID= 75

SELECT SUM(A.TRANSACTION_QUANTITY),TRANSACTION_TYPE_NAME
--(SELECT TRANSACTION_TYPE_NAME FROM  MTL_TRANSACTION_TYPES B  WHERE A.TRANSACTION_TYPE_ID = B.TRANSACTION_TYPE_ID ) TRANSACTION_TYPE
  FROM MTL_MATERIAL_TRANSACTIONS A,  MTL_TRANSACTION_TYPES B
   WHERE INVENTORY_ITEM_ID= 75
GROUP BY TRANSACTION_TYPE_NAME

FILLED OXYGEN CYLINDER (8.8 M3)

SELECT * FROM MTL_TRANSACTION_TYPES WHERE TRANSACTION_TYPE_ID = 75

 select DISTINCT* from MTL_SYSTEM_ITEMS_B where DESCRIPTION LIKE  '%CYLINDER%'  

 select DISTINCT DESCRIPTION  from MTL_SYSTEM_ITEMS_B where DESCRIPTION LIKE  '%CYLINDER%'  AND ORGANIZATION_ID = 173



-- 1. ALL KOL CUSTOMER
--================

SELECT 
DISTINCT CUSTOMER_NAME
--DISTINCT ITEM_DESCRIPTION  
FROM XX_ONT_CHALLAN_NO_KOL_V WHERE ORG_ID= 106 and ITEM_DESCRIPTION like '%CYLINDER%'

-- 1. ALL KOL ITEMS
--================

SELECT 
--DISTINCT CUSTOMER_NAME
DISTINCT ITEM_DESCRIPTION  
FROM XX_ONT_CHALLAN_AND_ITEM_KOL_V WHERE ORG_ID= 106 and ITEM_DESCRIPTION like '%CYLINDER%'

XX_ONT_CHALLAN_AND_ITEM_KOL_V


-- 2. TO GET PENDING QUANTITY (which is not received yet)
--===================================

SELECT * FROM   XX_CHALLAN_MO_TEMP 
WHERE   1=1
--AND CUSTOMER_NAME =  'KSL Manufacturing Unit' 
 and  RECEIPT_QTY > CHALLAN_QTY AND INVENTORY_ITEM_ID = 75
 
UNION ALL
SELECT * FROM   XX_CHALLAN_MO_TEMP 
WHERE   1=1
--AND CUSTOMER_NAME =  'KSL Manufacturing Unit'  
and  RECEIPT_QTY IS NULL AND INVENTORY_ITEM_ID = 75



SELECT SUM(CHALLAN_QTY) CHALLAN_QTY , SUM(RECEIPT_QTY) RECEIPT_QTY FROM   XX_CHALLAN_MO_TEMP 
WHERE   1=1
AND CUSTOMER_NAME =  'KWSBL Manufacturing Unit' 
 and  RECEIPT_QTY < CHALLAN_QTY AND INVENTORY_ITEM_ID = 75
 
UNION ALL

SELECT SUM(CHALLAN_QTY) CHALLAN_QTY , SUM(RECEIPT_QTY) RECEIPT_QTY  FROM   XX_CHALLAN_MO_TEMP 
WHERE   1=1
AND CUSTOMER_NAME =  'KWSBL Manufacturing Unit'  
and  RECEIPT_QTY IS NULL AND INVENTORY_ITEM_ID = 75


-- 3. CUSTOMER WISE PENDING_SUMMARY
--================================

--================================

SELECT ORGANIZATION_ID,CUSTOMER_NAME,
 SUM(NVL(CHALLAN_QTY,0)) CHALLAN_QTY,
 SUM(NVL(RECEIPT_QTY,0)) RECEIPT_QTY , 
 SUM(NVL(CHALLAN_QTY,0)) - SUM(NVL(RECEIPT_QTY,0)) PENDING_QTY 
 FROM XX_CHALLAN_MO_TEMP
 WHERE  1=1
 --and TRUNC(CHALLAN_DATE)  BETWEEN '01-SEP-2018' and   '31-AUG-2021'
 --and  CHALLAN_NO='4211020051091' 
 and NVL(CHALLAN_QTY,0) - NVL(RECEIPT_QTY,0) <> 0
 --AND RECEIPT_QTY is not null
 --AND CUSTOMER_NAME =  'KSL Manufacturing Unit' 
  --AND CUSTOMER_NAME LIKE  '%WALTON HI-TECH INDUSTRIES LIMITED'% 
 GROUP BY ORGANIZATION_ID,CUSTOMER_NAME 
 



-- 4. XXKSRM Customer Wise Empty Cylinder Recieve Details
--========================================
SELECT 
 ORGANIZATION_ID, (SELECT OPERATING_UNIT_NAME FROM WBI_INV_ORG_DETAIL WHERE INV_ORGANIZATION_ID=ORGANIZATION_ID) COMPANY_NAME,
TRANSACTION_ID,
MMT.ATTRIBUTE_CATEGORY,MMT.CREATION_DATE,XX_GET_EMP_NAME_FROM_USER_ID (MMT.CREATED_BY) CREATED_BY,MTT.TRANSACTION_TYPE_NAME,
INVENTORY_ITEM_ID,
XX_INV_PKG.XXGET_ITEM_CODE(INVENTORY_ITEM_ID) ITEM_CODE,
MY_PACKAGE.XXGET_ITEM_DESCRIPTION(INVENTORY_ITEM_ID) ITEM_DESCRIPTION,
(SELECT DISTINCT CUSTOMER_NAME  FROM XX_CHALLAN_MO_TEMP WHERE CUSTOMER_ID=MMT.ATTRIBUTE10 ) CUSTOMER_NAME ,
MMT.ATTRIBUTE3 CHALLAN_NO,
NVL((SELECT SUM(CHALLAN_QTY)  FROM XX_CHALLAN_MO_TEMP WHERE CUSTOMER_ID=MMT.ATTRIBUTE10 AND TO_CHAR(CHALLAN_NO) = MMT.ATTRIBUTE3),0) CHALLAN_QTY ,
NVL(TRANSACTION_QUANTITY,0) TRANSACTION_QUANTITY ,
NVL((SELECT SUM(CHALLAN_QTY)  FROM XX_CHALLAN_MO_TEMP WHERE CUSTOMER_ID=MMT.ATTRIBUTE10 AND TO_CHAR(CHALLAN_NO) = MMT.ATTRIBUTE3) - TRANSACTION_QUANTITY,0)  PENDING_QUANTITY,
 ORGANIZATION_ID,GET_ORG_CODE_FROM_ID(ORGANIZATION_ID) INV_ORG_CODE,GET_ORG_NAME_FROM_ID(ORGANIZATION_ID) INV_ORG_NAME,
  MMT.TRANSACTION_TYPE_ID,TRANSACTION_UOM,MMT.TRANSACTION_DATE,MMT.ATTRIBUTE10 CUSTOMER_ID ,
  :P_RECEIVE_DATE_FROM P_DATE_FROM,:P_RECEIVE_DATE_TO
FROM MTL_MATERIAL_TRANSACTIONS MMT, MTL_TRANSACTION_TYPES MTT
WHERE MMT.TRANSACTION_TYPE_ID= MTT.TRANSACTION_TYPE_ID
--and TRUNC(MMT.CREATION_DATE) BETWEEN '9-JUN-2021' AND '9-JUN-2021' 
AND MMT.ATTRIBUTE_CATEGORY = 'Empty Cylinder Receive'
 AND ORGANIZATION_ID='173'        ----
AND MMT.ATTRIBUTE3 =NVL(:P_CHALLAN_NO,MMT.ATTRIBUTE3) 
AND ORGANIZATION_ID = NVL(:P_ORG_ID,ORGANIZATION_ID)
AND MMT.ATTRIBUTE10 = NVL(:P_CUSTOMER,MMT.ATTRIBUTE10)  
--AND MMT.ATTRIBUTE3 = '4181010011294' 
AND MMT.ATTRIBUTE3 IN (
'4211020066001',
'4211020065971',
'4211020065999',
'4211020067764'
)
 --and TRUNC(CHALLAN_DATE)  BETWEEN '01-SEP-2018' and   '31-AUG-2021'
 -- AND (SELECT DISTINCT CUSTOMER_NAME  FROM XX_CHALLAN_MO_TEMP WHERE CUSTOMER_ID=MMT.ATTRIBUTE10 ) ='KBIL Manufacturing Unit' 
AND TRUNC(TO_DATE(TRANSACTION_DATE)) BETWEEN NVL(:P_RECEIVE_DATE_FROM,TRUNC(TO_DATE(TRANSACTION_DATE)))  AND NVL(:P_RECEIVE_DATE_TO,TRUNC(TO_DATE(TRANSACTION_DATE)))
ORDER BY MMT.ATTRIBUTE3






 
-- 4. UPDATE  CHALLAN DFF :  KBIL Manufacturing Unit
--=====================

--UPDATE  MTL_MATERIAL_TRANSACTIONS 
--SET Attribute3= NULL     -- CHALLAN NO
----TRANSACTION_QUANTITY = 0,
----PRIMARY_QUANTITY=0,
--WHERE TRANSACTION_ID  IN (1224030, 779864,867557,1060555,1114428,1060530,839557,1009530,1044285,
--1044283,1009519,1229529,1413559,
--1413660,
--1439962,
--1044274)
--
----=================================================================

SELECT * FROM  MTL_MATERIAL_TRANSACTIONS WHERE TRANSACTION_ID = 867557


--
--UPDATE  MTL_MATERIAL_TRANSACTIONS 
--SET 
--Attribute3= NULL     -- CHALLAN NO 4181010001600
----TRANSACTION_QUANTITY =5,
----PRIMARY_QUANTITY=5
--WHERE TRANSACTION_ID  IN (840204,707666,870034,
--840203,
--1009538,
--1044275,
--1044283,
--1044285,
--1009518,
--1060533,
--1229529
--)
--and ORGANIZATION_ID = 173

--========================================
-- CUSTOMER: KSL Manufacturing Unit

UPDATE  MTL_MATERIAL_TRANSACTIONS 
SET 
Attribute3= NULL     -- CHALLAN NO 4181010001600
--TRANSACTION_QUANTITY =5,
--PRIMARY_QUANTITY=5
WHERE TRANSACTION_ID  IN (
8197090,
8197089,
874584,
874585,
1044282,
1917507,
1957294,
10805373
)
and ORGANIZATION_ID = 173

