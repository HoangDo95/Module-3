use ss03_b2_quan_ly_bh;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, o_date, o_tolal_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_name, p.p_name 
from customer c
join `order` o on c.c_id = o.c_id
join order_detail od on od.o_id = o.o_id
join product p on p.p_id = od.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.*, count(o.o_id) as mua_hang
from customer c 
left join `order` o on c.c_id = o.c_id
group by o.o_id having mua_hang = 0;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn

select o.o_id, o.o_date, sum(p.p_price * od.od_qty) as tong_tien
from product p
join order_detail od on od.p_id = p.p_id
join `order` o on o.o_id = od.o_id
group by o_id; 
