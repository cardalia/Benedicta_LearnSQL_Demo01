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
WHERE order_status = 'order_finished'
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

