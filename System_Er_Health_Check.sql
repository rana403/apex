  
  /*GET QUANTITY OF A ITEM  DELEVERD TO INVENTORY*/
  SELECT INVORG_NAME_FROM_ID (RH.SHIP_TO_ORG_ID) INV_ORG,
  GET_PO_FROM_ID(RL.PO_HEADER_ID) PO ,  RH.RECEIPT_NUM, RL.ITEM_DESCRIPTION,RT.QUANTITY DELEVER_QUANTITY
  FROM RCV_SHIPMENT_HEADERS RH, RCV_SHIPMENT_LINES RL, RCV_TRANSACTIONS  RT
  WHERE RH.SHIPMENT_HEADER_ID = RL.SHIPMENT_HEADER_ID
  AND RL.SHIPMENT_HEADER_ID = RT.SHIPMENT_HEADER_ID
  AND RH.SHIPMENT_HEADER_ID = RT.SHIPMENT_HEADER_ID
  AND RL.SHIPMENT_LINE_ID = RT.SHIPMENT_LINE_ID
 AND RT.TRANSACTION_TYPE = 'DELIVER'
 AND RL.ITEM_DESCRIPTION= 'HEAVY MELTING SCRAP' 
 and GET_PO_FROM_ID(RL.PO_HEADER_ID) <> 0
 and  RH.SHIP_TO_ORG_ID = 166
 AND RT.CREATION_DATE BETWEEN '01-dec-2018' AND '31-dec-2018'
 
 --==================================================
 
 
/*XXKSRM Use Of Area Wise Consumption Report*/

SELECT OPERATING_UNIT_ID,OU_NAME, OU_ADD,IO_NAME,COUNT(MO_NUMBER),
--DEPARTMENT,
--TRANSACTION_TYPE_NAME,ITEM_CODE,ITEM_DESC,UOM,SUM(ISSUE_QTY) ISSUE_QTY,SUM(MO_QTY) MO_QUANTITY,
--ITEM_TYPE,ITEM_GROUP,ITEM_SUB_GROUP,USER_NAME,DEPT_USER,MO_NUMBER,MO_DATE,REFERENCE REMARKS,PDATE_FROM,PDATE_TO,
XX_GET_USE_AREA (USE_OF_AREA) USE_OFAREA,
SUM(ISSUE_QTY*ITEM_COST) AMOUNT
--ITEM_COST,  
--SUM(ISSUE_QTY)*XX_GET_LIST_PRICE (ITEM_ID)AMOUNT
FROM 
(
SELECT
WIOD.OPERATING_UNIT_ID,
WIOD.OPERATING_UNIT_NAME OU_NAME,
WIOD.INV_ORG_ADDRESS OU_ADD,
WIOD.INV_ORGANIZATION_ID,
WIOD.INV_ORGANIZATION_CODE,
WIOD.INVENTORY_ORGANIZATION_NAME IO_NAME,
 MTRL.TRANSACTION_TYPE_NAME,
--(SELECT DISTINCT ATTRIBUTE5 FROM MTL_TXN_REQUEST_LINES_V WHERE REQUEST_NUMBER=MTRL.REQUEST_NUMBER AND  ATTRIBUTE5 IS NOT NULL) DEPARTMENT,
(SELECT DISTINCT ATTRIBUTE5 FROM MTL_TXN_REQUEST_LINES_V WHERE REQUEST_NUMBER=MTRL.REQUEST_NUMBER and (ATTRIBUTE5=:P_DEPT or :P_DEPT is null) AND  ATTRIBUTE5 IS NOT NULL) DEPARTMENT,
---ATTRIBUTE5 DEPT,
---(SELECT DISTINCT  USE_AREA FROM XXKSRM_INV_USE_AREA_V WHERE USE_AREA_ID= MTRL.ATTRIBUTE2 AND OU_ID=(SELECT OPERATING_UNIT_ID FROM WBI_INV_ORG_DETAIL WHERE INV_ORGANIZATION_ID=MTRL.ORGANIZATION_ID)) USE_OF_AREA,
--(SELECT DISTINCT  USE_AREA FROM XXKSRM_INV_USE_AREA_V WHERE USE_AREA_ID= MTRL.ATTRIBUTE2 ) USE_OF_AREA,
---MTRL.ATTRIBUTE2 USE_OF_AREA,
WXMD.ITEM_CODE,
WXMD.ITEM_DESC,
MTRL.UOM_CODE UOM,
MTRL.QUANTITY_DELIVERED ISSUE_QTY,
MTRL.QUANTITY MO_QTY,
 NVL(xx_inv_pkg.GET_MFG_ORG_ITEM_COST(MTRL.ORGANIZATION_ID,WXMD.ITEM_ID, MTRL.CREATION_DATE),XX_GET_LIST_PRICE (WXMD.ITEM_ID)) ITEM_COST,
WXMD.ITEM_TYPE,
WXMD.ITEM_GROUP,
WXMD.ITEM_SUB_GROUP,
XX_INV_PKG.XXGET_ENAME (TO_CHAR (:P_USER)) USER_NAME,
XXGET_ENAME_WITH_KG(MTRL.CREATED_BY)   DEPT_USER, 
MTRL.REFERENCE REFERENCE,
MTRL.REQUEST_NUMBER MO_NUMBER,
MTRL.CREATION_DATE MO_DATE,
MTRL.ATTRIBUTE2 USE_OF_AREA,
:P_TRANSACTION_DATE_FROM PDATE_FROM,
:P_TRANSACTION_DATE_TO  PDATE_TO
FROM 
MTL_TXN_REQUEST_LINES_V  MTRL,
WBI_XXKBGITEM_MT_D WXMD,
WBI_INV_ORG_DETAIL WIOD
WHERE 
 WXMD.ORGANIZATION_ID=MTRL.ORGANIZATION_ID
AND WXMD.INVENTORY_ITEM_ID=MTRL.INVENTORY_ITEM_ID
AND WIOD.INV_ORGANIZATION_ID=WXMD.ORGANIZATION_ID
AND WIOD.INV_ORGANIZATION_ID=MTRL.ORGANIZATION_ID 
AND REQUEST_NUMBER  LIKE '%-%'
AND MTRL.QUANTITY_DELIVERED IS NOT NULL
AND MTRL.ORGANIZATION_ID=:P_ORGANIZATION_ID
AND WXMD.ITEM_CODE=NVL(:P_ITEM_CODE,WXMD.ITEM_CODE)
AND WXMD.ITEM_TYPE=NVL(:P_ITEM_TYPE,WXMD.ITEM_TYPE)
AND WXMD.ITEM_GROUP=NVL(:P_ITEM_GROUP,WXMD.ITEM_GROUP)
AND WXMD.ITEM_SUB_GROUP=NVL(:P_ITEM_SUB_GROUP,WXMD.ITEM_SUB_GROUP)
)
WHERE 
DEPARTMENT IS NOT NULL
and OPERATING_UNIT_ID = NVL(:P_OU,OPERATING_UNIT_ID )
  AND (XX_GET_USE_AREA (USE_OF_AREA) =:P_U_AREA OR :P_U_AREA IS NULL)
--and department = NVL(:P_DEPT,department)
AND MO_DATE BETWEEN NVL(:P_TRANSACTION_DATE_FROM, MO_DATE)   AND NVL(:P_TRANSACTION_DATE_TO,MO_DATE) 
AND (:P_TRANSACTION_DATE_FROM IS null OR MO_DATE BETWEEN :P_TRANSACTION_DATE_FROM  AND :P_TRANSACTION_DATE_TO)
AND  MO_NUMBER = NVL(:P_MO_NUMBER, MO_NUMBER)
GROUP BY  OPERATING_UNIT_ID,OU_NAME, OU_ADD,IO_NAME,USE_OF_AREA
--OPERATING_UNIT_ID,OU_NAME, OU_ADD,IO_NAME,DEPARTMENT,USE_OF_AREA,ITEM_CODE,ITEM_DESC,UOM,ITEM_TYPE,ITEM_GROUP,ITEM_SUB_GROUP,
--USER_NAME,PDATE_FROM,PDATE_TO,DEPT_USER,MO_NUMBER,MO_DATE,REFERENCE, MO_NUMBER,INV_ORGANIZATION_ID,INV_ORGANIZATION_CODE,TRANSACTION_TYPE_NAME,ITEM_COST
--ORDER BY MO_NUMBER   --- MO-KSM-0077231

--===============================================================================

/*GET ITEMS WCHICH PRICE  IS 1 TAKA AND HAVE NOT PURCHASE*/

SELECT * FROM MTL_SYSTEM_ITEMS_B WHERE  LIST_PRICE_PER_UNIT  >1 AND ORGANIZATION_ID = 0 --and DESCRIPTION = 'WD 40, 277 ML (RUST REMOVER)' -- 



--===============================================================================

/*  XXKSRM Use Of Area Wise Consumption Report(Summary)  */ 

select    APPS.XXGET_OU_NAME_FROM_ID( ZZ.OPERATING_UNIT) OU,
XXGET_ORG_NAME(YY.ORGANIZATION_ID) ORG_NAME ,
 COUNT (XX.REQUEST_NUMBER) TOT_MO , 
 SUM( QUANTITY_DELIVERED * XX_GET_LIST_PRICE (INVENTORY_ITEM_ID)) TOT_VAL , 
  XX_GET_USE_AREA (XX.ATTRIBUTE2),
  XX_INV_PKG.XXGET_ENAME (TO_CHAR (:P_USER)) USER_NAME ,
   xx.ATTRIBUTE5
     --   (SELECT DISTINCT ATTRIBUTE5 FROM MTL_TXN_REQUEST_LINES_V WHERE REQUEST_NUMBER=XX.REQUEST_NUMBER and (ATTRIBUTE5=:P_DEPT or :P_DEPT is null) AND  ATTRIBUTE5 IS NOT NULL) DEPARTMENT
 FROM MTL_TXN_REQUEST_HEADERS_V YY, MTL_TXN_REQUEST_LINES_V XX, ORG_ORGANIZATION_DEFINITIONS ZZ 
WHERE 
YY.HEADER_ID = XX.HEADER_ID
         AND YY.ORGANIZATION_ID = ZZ.ORGANIZATION_ID
         AND XX.MOVE_ORDER_TYPE_NAME = 'Requisition' 
         AND XX.QUANTITY_DELIVERED <> 0
           AND (ZZ.OPERATING_UNIT =  :P_OU OR :P_OU IS NULL)
            AND (XX.ORGANIZATION_ID = :P_ORG OR :P_ORG IS NULL)
        -- and XX.CREATION_DATE between '01-jul-2019' and '10-jul-2019' 
          AND ( XX.CREATION_DATE  BETWEEN :P_FROM_DATE AND :P_TO_DATE OR :P_FROM_DATE IS NULL OR :P_TO_DATE IS NULL)
         AND (XX_GET_USE_AREA (XX.ATTRIBUTE2) = :P_U_AREA OR :P_U_AREA IS NULL)
         and ( XX.INVENTORY_ITEM_ID=:P_ITEM OR :P_ITEM IS NULL)
         and   xx.ATTRIBUTE5 = NVL(:P_DEPT,   xx.ATTRIBUTE5)
         GROUP BY  APPS.XXGET_OU_NAME_FROM_ID( ZZ.OPERATING_UNIT) ,
        XXGET_ORG_NAME(YY.ORGANIZATION_ID),
        XX_GET_USE_AREA (XX.ATTRIBUTE2), xx.ATTRIBUTE5        
               
          
          
          
          
          
          
INV_USR_ACC_TRANS_OTHERS
          

 
 
 
 
 
 