
/* This query retrieves all customers, orders, and products associated with the “Produce” category and identifies the suppliers providing those products.
It returns the complete relationship path across customer → order → product → category → supplier for end-to-end visibility. */

MATCH (cust: customer)-[r1:purchased]-(o:order)- [r2:orders]->(p:product)-[r3:part_of]-(c:category {categoryName:"Produce"}), (p)-[r4:supplies]-(s:supplier) RETURN *;


