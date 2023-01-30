PARTAGAS MARITIME LTD.

select  XX_GET_EMP_NAME_FROM_USER_ID (LAST_UPDATED_BY)    from AP_SUPPLIERS where VENDOR_NAME='S M ENGINEERING (AC SUPPLIER)'

SELECT * FROM PO_HEADERS_ALL  WHERE VENDOR_ID= 1345

select * from AP_SUPPLIER_SITES_ALL WHERE VENDOR_ID IN (429088,
429089,
429090,
594229,
594230)

select  (select  DISTINCT VENDOR_NAME from AP_SUPPLIERS WHERE VENDOR_ID=a.vendor_id) VENDOR_NAME,
a.VENDOR_ID,a.* from ap_invoices_ALL a  where vendor_id IN (234,
235,
50,
51,
521,
522,
698,
699,
700,
1031,
1032,
1033,
1034,
781,
782,
783,
1173,
1209,
7429,
440012,
451016,
451017,
514065,
514066,
629284)


SELECT * FROM AP_SUPPLIERS WHERE VENDOR_NAME LIKE  '%A K M Kamrul Islam, KG-4905%'

SELECT distinct VENDOR_TYPE_LOOKUP_CODE  FROM AP_SUPPLIERS WHERE VENDOR_ID= 5168

KG-4905 - 5168

select c.vendor_name ,C.SEGMENT1 Supplier_code, a.CREATION_DATE, A.ADDRESS_LINE1 ADDRESS,VENDOR_TYPE_LOOKUP_CODE VENDOR_TYPE, TO_CHAR(TRUNC(a.CREATION_DATE),'DD-MON-RRRR') CREATION_DATE,
--XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) CREATED_BY,
 a.ACCTS_PAY_CODE_COMBINATION_ID, a.PREPAY_CODE_COMBINATION_ID CODE_COMBINATION_ID ,b.SEGMENT1 LE,b.SEGMENT2 OU,b.CONCATENATED_SEGMENTS,
XX_GET_ACCT_FLEX_SEG_DESC(4, b.segment4) ACCOUNT_DESC, 
XX_GET_ACCT_FLEX_SEG_DESC(4, b.segment5) ACCOUNT_DESC
from AP_SUPPLIER_SITES_ALL a , GL_CODE_COMBINATIONs_KFV b, AP_SUPPLIERS c
 where 1=1
 and a.vendor_id= c.vendor_id
--and  b.CODE_COMBINATION_ID = a.ACCTS_PAY_CODE_COMBINATION_ID
and  b.CODE_COMBINATION_ID = a.PREPAY_CODE_COMBINATION_ID
--and a.vendor_id IN (569128)
--and XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) =  'Md. Sohel Hossain (KG-4079)'
--and A.CREATED_BY =1365 -- 1243 -- 1365
--AND VENDOR_NAME LIKE '%-IC%'
--AND b.SEGMENT1 =102
and VENDOR_TYPE_LOOKUP_CODE = 'FOREIGN SUPPLIER' -- 'LOCAL SUPPLIER' --'INTERCOMPANY', 'LOCAL SUPPLIER', 'FOREIGN SUPPLIER','EMPLOYEE'
--and  trunc(a.CREATION_DATE) between '7-JUL-2021' and '7-JUL-2021' 
--and C.VENDOR_NAME IN (
--'ABDUL WADUD (ENGINEER INCENTIVE)'   ,
--'MD.IBRAHIM KHALIL ULLAH (ENGINEER INCENTIVE)'   
--)
--ORDER BY SEGMENT1


SELECT * FROM GL_CODE_COMBINATIONs_KFV

 UNION ALL
 
select A.CREATED_BY, C.SEGMENT1,c.vendor_name , VENDOR_TYPE_LOOKUP_CODE, TO_CHAR(TRUNC(a.CREATION_DATE),'DD-MON-RRRR') CREATION_DATE,
 XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) CREATED_BY,
 a.ACCTS_PAY_CODE_COMBINATION_ID, a.PREPAY_CODE_COMBINATION_ID ,b.CONCATENATED_SEGMENTS,
XX_GET_ACCT_FLEX_SEG_DESC(4, b.segment4) ACCOUNT_DESC, 
XX_GET_ACCT_FLEX_SEG_DESC(4, b.segment4) ACCOUNT_DESC
from AP_SUPPLIER_SITES_ALL a , GL_CODE_COMBINATIONs_KFV b, AP_SUPPLIERS c
 where 1=1
 and a.vendor_id= c.vendor_id
and  b.CODE_COMBINATION_ID = a.ACCTS_PAY_CODE_COMBINATION_ID
--and  b.CODE_COMBINATION_ID = a.PREPAY_CODE_COMBINATION_ID
--and a.vendor_id IN (569128)
--and XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) =  'Md. Sohel Hossain (KG-4079)'
and A.CREATED_BY = 1243 -- 1365
and VENDOR_TYPE_LOOKUP_CODE = 'DRIVER'
--and  trunc(a.CREATION_DATE) between '13-MAR-2021' and '13-MAR-2021' 
  ORDER BY vendor_name
 
 
select  c.vendor_name ,TO_CHAR(TRUNC(a.CREATION_DATE),'DD-MON-RRRR') CREATION_DATE, a.ACCTS_PAY_CODE_COMBINATION_ID, a.PREPAY_CODE_COMBINATION_ID ,b.CONCATENATED_SEGMENTS,
XX_GET_ACCT_FLEX_SEG_DESC(4, b.segment4) ACCOUNT_DESC, 
XX_GET_ACCT_FLEX_SEG_DESC(4, b.segment4) ACCOUNT_DESC,
 XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) CREATED_BY
from AP_SUPPLIER_SITES_ALL a , GL_CODE_COMBINATIONs_KFV b, AP_SUPPLIERS c
 where 1=1
 and a.vendor_id= c.vendor_id
and  b.CODE_COMBINATION_ID = a.ACCTS_PAY_CODE_COMBINATION_ID
--and  b.CODE_COMBINATION_ID = a.PREPAY_CODE_COMBINATION_ID
 and a.vendor_id IN (524086) 
 ORDER BY vendor_name
 
select * from GL_CODE_COMBINATIONs_KFV where CONCATENATED_SEGMENTS = '102.03.0000.2030105.001.0000.000.000.000.000'

select * from GL_CODE_COMBINATIONs_KFV where CONCATENATED_SEGMENTS  = '102.03.0000.4030104.001.0000.000.000.000.000'

select XX_GET_ACCT_FLEX_SEG_DESC(4,26357 ) from dual -- GL_CODE_COMBINATIONS


--PO IS CREATED OR NOT AGAINST THIS SUPPLIER
SELECT * FROM PO_HEADERS_ALL WHERE VENDOR_ID = (SELECT VENDOR_ID FROM AP_SUPPLIERS WHERE SEGMENT1= 3130)



--INVOICE IS CREATED OR NOT AGAINST THIS SUPPLIER
SELECT * FROM AP_INVOICES_ALL WHERE VENDOR_ID = (SELECT VENDOR_ID FROM AP_SUPPLIERS WHERE SEGMENT1=3130) -- 6569) --5457) 


SELECT XX_AP_PKG.GET_VENDOR_NAME (VENDOR_ID) FROM AP_INVOICES_ALL WHERE VENDOR_ID = (SELECT VENDOR_ID FROM AP_SUPPLIERS WHERE SEGMENT1=3130) 







--SUPPLIER CREATED BY
 SELECT A.VENDOR_NAME , A.SEGMENT1 SUPPLIER_CODE,
 XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) CREATED_BY, 
  TO_CHAR(A.CREATION_DATE) CREATION_DATE, 
  TO_CHAR(A.LAST_UPDATE_DATE) LAST_UPDATE_DATE ,
  A.VENDOR_TYPE_LOOKUP_CODE 
  FROM AP_SUPPLIERS A
  WHERE 1=1
  and  A.SEGMENT1 IN (
5168
  ) --6570 --6570 -- 5454   -- CREATED_BY = 1243 --segment1= 6111
 -- and VENDOR_NAME = 'AD ASIA'
  
  
  
 -- SELECT  VENDOR_ID, VENDOR_NAME, SEGMENT1,TO_CHAR(CREATION_DATE),XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) CREATED_BY  FROM AP_SUPPLIERS A  WHERE  CREATED_BY =1269
  
select * from ap_suppliers  -- where attribute10 is not null --= 6330
  
  
  
--SUPPLIER CREATED BY WITH SITE ADDRESS
 
  SELECT B.ORG_ID, A.VENDOR_ID , A.VENDOR_NAME , A.SEGMENT1 SUPPLIER_CODE , B.ADDRESS_LINE1 ADDRESS,
  XX_GET_EMP_NAME_FROM_USER_ID (A.CREATED_BY) CREATED_BY, 
  TO_CHAR(A.CREATION_DATE) CREATION_DATE, 
  TO_CHAR(A.LAST_UPDATE_DATE) LAST_UPDATE_DATE ,
  A.VENDOR_TYPE_LOOKUP_CODE 
  FROM AP_SUPPLIERS A , AP_SUPPLIER_SITES_ALL B
  WHERE 1=1
  AND A.VENDOR_ID= B.VENDOR_ID
  AND A.SEGMENT1 IN(6309)
  

4913    MABUL ALAM (CONTRACTOR)
6309    MOHAMMAD MABUL ALAM CONTRACTOR





 --WHO CREATE SUPPLIER
 
MOHIN MD. SHAMSUL AREFIN    KG-3223  USER ID = 1365

NASIR UDDIN AHAMED   KG-4078 , USER ID =  1277

MD. SOHEL HOSSAIN  KG-4079  ,   USER ID= 1243


  SELECT * FROM PER_ALL_PEOPLE_F WHERE LAST_NAME LIKE INITCAP( '%Nasir%') AND FIRST_NAME LIKE 'KG-407%' --FIRST_NAME = 'KG-4079'
  
  SELECT * FROM FND_USER USR WHERE USER_NAME = 'KG-3223'


XX_AP_PKG

  
  
  /*
  CREATE OR REPLACE FUNCTION APPS.XX_GET_EMP_NAME_FROM_USER_ID (P_USER_ID IN NUMBER)
      RETURN VARCHAR2
   IS
      V_RESULT   VARCHAR2 (128);

      CURSOR P_CURSOR
      IS
         SELECT NVL (
                --      DECODE (EMP.FIRST_NAME, NULL, NULL, EMP.FIRST_NAME)
                   DECODE (EMP.MIDDLE_NAMES, NULL, NULL, ' ' || EMP.MIDDLE_NAMES)
                   || DECODE (EMP.LAST_NAME, NULL, NULL, ' ' || EMP.LAST_NAME)
                   ||' ('||DECODE (EMP.FIRST_NAME, NULL, NULL, EMP.FIRST_NAME)||')',
                   USER_NAME)
           FROM FND_USER USR, PER_ALL_PEOPLE_F EMP
          WHERE     USR.EMPLOYEE_ID = EMP.PERSON_ID(+)
                AND EMP.EFFECTIVE_END_DATE(+) > SYSDATE
                AND USR.USER_ID = P_USER_ID;
   BEGIN
      OPEN P_CURSOR;

      FETCH P_CURSOR INTO V_RESULT;

      CLOSE P_CURSOR;

      RETURN V_RESULT;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN NULL;
   END;
/

  */
  
    select * from  AP_SUPPLIERS where  SEGMENT1 =1406
    
  select *  from  AP_SUPPLIER_SITES_ALL B WHERE VENDOR_ID= 569128
  
  select ACCTS_PAY_CODE_COMBINATION_ID, PREPAY_CODE_COMBINATION_ID  from  AP_SUPPLIER_SITES_ALL B WHERE VENDOR_ID= 569128
  
  select * from GL_CODE_COMBINATIONS 
 
--8,181

-- GET ALL LOCAL and Service Provider SUPPLIERS 
SELECT B.ORG_ID,
SUBSTR(XX_GET_HR_OPERATING_UNIT(B.ORG_ID),5) OU_NAME  ,
A.VENDOR_ID,
 A.VENDOR_NAME ,A.SEGMENT1 SUPPLIER_CODE,A.VENDOR_TYPE_LOOKUP_CODE SUPPLIER_TYPE, 
  B.ADDRESS_LINE1 ADDRESS, A.ATTRIBUTE12 M,
  A.ATTRIBUTE5 "Contact Person Name" ,A.ATTRIBUTE7 "Contact Person Phone", A.ATTRIBUTE8 "Contact Person eMail",  A.ATTRIBUTE2 EMAIL, A.ATTRIBUTE7 Mobile,
A.ATTRIBUTE10 TIN_NUMBER, A.ATTRIBUTE9 BIN_NUMBER
FROM AP_SUPPLIERS A , AP_SUPPLIER_SITES_ALL B
  WHERE 1=1
  AND A.VENDOR_ID= B.VENDOR_ID
  --and   B.ORG_ID = NVL(:P_OU_NAME, B.ORG_ID) 
    --and A.VENDOR_TYPE_LOOKUP_CODE = NVL(:P_SUPPLIER_TYPE, A.VENDOR_TYPE_LOOKUP_CODE) 
 -- and A.VENDOR_ID = NVL(:P_SUPPLIER_NAME, A.VENDOR_ID)
 -- and A.SEGMENT1=6796
 AND ORG_ID IN (104,
81)
  and  A.END_DATE_ACTIVE is null
  AND A.VENDOR_TYPE_LOOKUP_CODE IN ('SERVICE PROVIDER', 'LOCAL SUPPLIER')
  --and A.SEGMENT1 =1406
  order by A.VENDOR_NAME
--  and B.ORG_ID not in (111,
--112,
--113,
--114,
--115,
--116,
--117,
--118)
 --AND A.SEGMENT1 IN(5330)
 
 
select * from AP_SUPPLIERS where ATTRIBUTE7 is not null


select * from  AP_SUPPLIER_SITES_ALL B where B.ATTRIBUTE7 is not null



select * from HR_OPERATING_UNITS where organization_id not in (111,
112,
113,
114,
115,
116,
117,
118)

select SUBSTR(XX_GET_HR_OPERATING_UNIT(81),5)  from dual