# Customers and Products Analysis Using SQL

## Project Overview

In this project, we analyzed customer and product data to provide insights that can guide restocking decisions, marketing strategies, and customer acquisition spending. Our analysis revealed that vintage cars and motorcycles are the priority for restocking due to their frequent sales and high performance. Specific products like the 1968 Ford Mustang, 1911 Ford Town Car, and 1928 Mercedes-Benz SSK were identified as top performers.

We also identified our top five VIP customers and the five least-engaged customers. VIP customers, such as Diego Freyre from Madrid and Susan Nelson from San Rafael, generate significant profits for our store. In contrast, least-engaged customers like Mary Young from Glendale and Leslie Taylor from Brickhaven have much lower contributions. Understanding these customer segments allows us to tailor our marketing and communication strategies effectively. Additionally, we calculated the lifetime value (LTV) of an average customer to be approximately $39,039.59, which can help us determine how much to invest in acquiring new customers based on predicted future profits.

## Analysis Details

### Products to Restock

Based on our sales data, the following products should be prioritized for restocking:

- 1968 Ford Mustang (Classic Cars)
- 1911 Ford Town Car (Vintage Cars)
- 1928 Mercedes-Benz SSK (Vintage Cars)
- 1960 BSA Gold Star DBD34 (Motorcycles)
- 1997 BMW F650 ST (Motorcycles)
- 1928 Ford Phaeton Deluxe (Vintage Cars)
- 2002 Yamaha YZR M1 (Motorcycles)
- The Mayflower (Ships)
- F/A 18 Hornet 1/72 (Planes)
- Pont Yacht (Ships)

### VIP Customers

Our top five VIP customers are:

| Contact Last Name | Contact First Name | City        | Country  | Profit     |
|-------------------|--------------------|-------------|----------|------------|
| Freyre            | Diego              | Madrid      | Spain    | 326519.66  |
| Nelson            | Susan              | San Rafael  | USA      | 236769.39  |
| Young             | Jeff               | NYC         | USA      | 72370.09   |
| Ferguson          | Peter              | Melbourne   | Australia| 70311.07   |
| Labrune           | Janine             | Nantes      | France   | 60875.30   |

### Least-Engaged Customers

Our top five least-engaged customers are:

| Contact Last Name | Contact First Name | City        | Country  | Profit     |
|-------------------|--------------------|-------------|----------|------------|
| Young             | Mary               | Glendale    | USA      | 2610.87    |
| Taylor            | Leslie             | Brickhaven  | USA      | 6586.02    |
| Ricotti           | Franco             | Milan       | Italy    | 9532.93    |
| Schmitt           | Carine             | Nantes      | France   | 10063.80   |
| Smith             | Thomas             | London      | UK       | 10868.04   |

### Customer Lifetime Value (LTV)

The average lifetime value (LTV) of our customers is calculated to be approximately $39,039.59. This metric helps us understand how much profit an average customer generates during their lifetime with our store, allowing us to make informed decisions about marketing and customer acquisition.

## Conclusion

This project involved a comprehensive analysis of customer and product data using SQL to answer key business questions. Our first task was to identify products that require more or less stock. By analyzing sales performance, we found that vintage cars and motorcycles are the most profitable and should be prioritized for restocking. Products like the 1968 Ford Mustang and the 1911 Ford Town Car topped the list of high-performance items.

Next, we focused on customer behavior to inform our marketing strategies. We used SQL queries to identify the top five VIP customers, who bring in the highest profits, and the top five least-engaged customers. This segmentation helps us understand who our most valuable customers are and who may need more engagement. We then calculated the average lifetime value (LTV) of our customers, which is crucial for making informed decisions about customer acquisition costs. By knowing that an average customer generates a profit of $39,039.59 over their lifetime, we can better plan our budget for attracting new customers and predict future revenues. This data-driven approach provides a solid foundation for strategic decision-making in inventory management, marketing, and customer acquisition.

