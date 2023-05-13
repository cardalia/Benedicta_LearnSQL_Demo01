/* Learning SQL */

/* Dataset yang digunakan berisi transaksi dari tahun 2009 sampai dengan tahun 2012 dengan
jumlah raw data sebanyak 5500, termasuk di dalamnya order status yang terbagi menjadi
order finished, order returned dan order cancelled
Adapun dataset yang sudah diberikan dan akan digunakan pada project ini berisi data sebagai
berikut.
1. OrderID
2. Order Status
3. Customer
4. Order Date
5. Order Quantity
6. Sales
7. Discount %
8. Discount
9. Product Category
10. Product Sub-Category
Nama tabel yg akan digunakan pada project ini adalah dqlab_sales_store */

/* Buatlah query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years) */

SELECT YEAR(order_date) AS years, SUM(sales) AS sales, COUNT(order_quantity) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order_Finished'
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

/* Buatlah query dengan menggunakan SQL untuk mendapatkan total penjualan (sales) berdasarkan sub category dari produk (product_sub_category) pada tahun 2011 dan 2012 saja (years) */

SELECT YEAR(order_date) AS years, product_sub_category, SUM(sales) AS sales
FROM dqlab_sales_store
WHERE order_status = 'Order_Finished' AND YEAR(order_date) > '2010'
GROUP BY YEAR(order_date), product_sub_category
ORDER BY YEAR(order_date), sales DESC

/* Kemudian akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini.
Efektifitas dan efisiensi dari promosi yang dilakukan akan dianalisa berdasarkan Burn Rate yaitu dengan membandingkan total value promosi yang dikeluarkan terhadap total sales yang diperoleh.
DQLAB berharap bahwa burn rate tetap berada diangka maksimum 4.5%

Buatkan Derived Tables untuk menghitung total sales (sales) dan total discount (promotion_value) berdasarkan tahun (years) dan formulasikan persentase burn rate-nya (burn_rate_percentage) */

SELECT YEAR(order_date) AS years, SUM(sales) AS sales, SUM(discount_value) AS promotion_value, ROUND((SUM(discount_value)/SUM(sales))*100, 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY YEAR(order_date)
ORDER BY years

/* Melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan sebelumnya, tetapi ada kolom yang ditambahkan, yaitu: product_sub_category dan product_category */

SELECT YEAR(order_date) AS years, product_sub_category, product_category, SUM(sales) AS sales, SUM(discount_value) AS promotion_value, ROUND((SUM(discount_value)/SUM(sales))*100, 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY YEAR(order_date), product_sub_category, product_category
ORDER BY years, sales DESC

/* Ingin mengetahui jumlah customer (number_of_customer) yang bertransaksi setiap tahun dari 2009 sampai 2012 (years) */

SELECT YEAR(order_date) AS years, COUNT(DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished' AND YEAR(order_date) BETWEEN '2009' AND '2012'
GROUP BY YEAR(order_date)
ORDER BY years