    -- 找出已付款屬於用戶的品項
       
        SELECT * FROM `classic_orders` co 
            JOIN `cart` c 
            ON co.`member_id`= c.`cart_member_id`
            WHERE c.`cart_status`='3' 
            AND co.`member_id`=1

    -- memberid 為variable


    -- SELECT `product_id`, `product_category`,`classic_product`
    -- FROM `classic_orders` co 
    -- JOIN `cart` c 
    -- ON co.`member_id`= c.`cart_member_id`
    -- JOIN `classic_product` cp
    -- ON co.`product_id` = cp.`c_product_id` 
    -- WHERE c.`cart_status`='3' 
    -- AND co.`member_id`=1;
    
    SELECT `c_product_name`, `c_product_img_path`
    FROM `classic_product` cp
    JOIN `classic_orders` co 
    ON cp.`c_product_id` = co.`product_id`
    JOIN `cart` c 
    ON co.`member_id`= c.`cart_member_id`
    WHERE c.`cart_status`='3'    
    AND co.`member_id`=1 AND cp.`c_product_category` != 'bx' 
    -- --------------------------------------------------

    
    SELECT `share_title`, `share_img`
    FROM `share_item` s
    WHERE s.`share_order_category`='co' AND s.`share_status` = 0
    AND s.`member_id`=1 
    