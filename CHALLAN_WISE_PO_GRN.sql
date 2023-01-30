--------> 

SELECT  SUBSTR(XX_GET_HR_OPERATING_UNIT(:P_OU_ID),5,200) ORG_HEADER_NAME,
   A.ORGANIZATION_ID,
   GET_ORG_CODE_FROM_ID(A.ORGANIZATION_ID) ORG_CODE,
PO_NO,
PO_HEADER_ID,
PO_APPROVED_DATE,
PO_PRICE PO_RELEASE_PRICE,
   RELEASE_NUMBER,
   RELEASE_DATE,
   VENDOR_ID, SUPPLIER, SUPPLIER_ADDRESS,
   RECEIPT_NO GRN_NUMBER,
    TRANS_DATE GRN_DATE,
   INVENTORY_ITEM_ID,ITEM_CODE, ITEM_DESC,UOM,
 CHALLAN_NUMBER_RT,CHALLAN_DATE,
  RECEIPT_QTY,ACCEPTED_QTY, DELIVER_QTY,RETURN_QTY,ACTUAL_DLV_QTY 
PO_QTY, PO_PRICE,  DELIVER_QTY*PO_PRICE RELEASE_AMOUNT, SHIPMENT_HEADER_ID,VEHICLE_NUMBER_RT,  TRANSACTION_TYPE
from WBI_INV_RCV_TRANSACTIONS_NTK A , ORG_ORGANIZATION_DEFINITIONS B
where 1=1
and A.ORGANIZATION_ID = B.ORGANIZATION_ID
--and A.ORGANIZATION_ID = NVL(:P_ORG_ID,A.ORGANIZATION_ID)
--and SHIPMENT_HEADER_ID =1051232 
and PO_HEADER_ID = NVL(:P_PO_NO,PO_HEADER_ID) --40009700
and B.OPERATING_UNIT = NVL(:P_OU_ID, B.OPERATING_UNIT)  
and CHALLAN_NUMBER_RT = NVL(:P_CHALLAN_NO, CHALLAN_NUMBER_RT)  
AND RECEIPT_NO = NVL(:P_GRN_NO, RECEIPT_NO)   
and TRANSACTION_TYPE IN ( 'DELIVER')  ------>  'RETURN TO VENDOR'
and TRANS_DATE between '01-JUN-2021' and '2-JUN-2021' 
and RETURN_QTY is not null
AND INVENTORY_ITEM_ID= NVL(:P_ITEM_ID,INVENTORY_ITEM_ID)
AND (:P_F_GRN_DT IS NULL OR TRUNC(TRANS_DATE) BETWEEN :P_F_GRN_DT AND :P_T_GRN_DT) 
AND VENDOR_ID = NVL(:P_VENDOR_ID,VENDOR_ID)
ORDER BY RECEIPT_NO ASC 


SELECT * FROM WSH_DELIVERY_DETAILS WHERE INVENTORY_ITEM_ID IN(
76,
102,
66,
118,
774910,
75,
787867,
77)


SELECT SUM(SHIPPED_QUANTITY) FROM WSH_DELIVERY_DETAILS WHERE INVENTORY_ITEM_ID IN(76,
102,
66,
118,
774910,
75,
787867,
77


select * from WSH_NEW_DELIVERIES

select *  from WBI_INV_RCV_TRANSACTIONS_NTK where SHIPMENT_HEADER_ID =1051232 and TRANSACTION_TYPE = 'DELIVER'  


select * from RCV_TRANSACTIONS where SHIPMENT_HEADER_ID = 1051232  and TRANSACTION_TYPE = 'DELIVER'  