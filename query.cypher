//This procedure generates a high-level schema visualization of your graph by inspecting all node labels, relationship types, and connected patterns. 
//It provides an automatic overview of your data model, helping you understand the structure of the entire database.
CALL apoc.meta.graph();


//This query retrieves the first ten product nodes from the database without applying any filters. 
//It’s typically used to quickly inspect sample product data or validate that the product label was imported correctly.
 MATCH (p:product) RETURN p LIMIT 10; 

//This query fetches sample product nodes along with their part_of relationship to their respective categories. 
//It’s used to quickly verify that products are correctly linked to categories and that the relationship structure is valid.
MATCH (p:product) - [rel:part_of]-> (c:category) RETURN p LIMIT 10; 

// This query retrieves all products that belong to the “Beverages” category by following the part_of relationship from each product to its category node. 
// It returns the product nodes, their category, and the connecting relationship for clear category-level visibility.
MATCH (p:product) - [rel:part_of]-> (c:category {categoryName:  "Beverages"}) RETURN p, rel, c; 


//This query finds all customers who purchased the product “Ipoh Coffee” and retrieves how many orders each customer placed for it. 
//It returns the company name, total order count, and the list of order IDs, sorted from highest to lowest activity.
MATCH (cust: customer)-[r1:purchased]-(o:order)- [r2:orders]->(p:product {productName: "Ipoh Coffee"})- [r3:part_of]-(c:category ) 
RETURN cust.companyName, count(o) as orderCount, collect(o.orderID) as orders 
ORDER BY orderCount DESC;


//This query retrieves all customers, orders, and products associated with the “Produce” category and identifies the suppliers providing those products.
//It returns the complete relationship path across customer → order → product → category → supplier for end-to-end visibility. 
MATCH (cust: customer)-[r1:purchased]-(o:order)- [r2:orders]->(p:product)-[r3:part_of]-(c:category {categoryName:"Produce"}), (p)-[r4:supplies]-(s:supplier) 
RETURN *;
