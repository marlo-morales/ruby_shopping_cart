# Ruby Task

The fictional website www.great-fashion.com is an online store with the following products available for purchase:

|Product Code|Name|Price|
|---|---|---|
|001| Red Scarf| £9.25
|002| Silver cufflinks| £45.00
|003| Silk Dress| £19.95

The marketing team want to offer promotions as an incentive for customers to purchase these items.

When spending over £60, the customer gets 10% off their purchase
When purchasing 2 or more of the Red Scarf, its price is reduced to £8.50.

The check-out system can scan items in any order, and because promotions will change, it needs to be flexible regarding promotional rules.

The interface to the checkout looks like this (shown in Ruby):

```
co = Checkout.new(promotional_rules)
co.scan(order)
co.scan(order)
price = co.total
```

Implement a simple checkout system that fulfills these requirements and the interface shown above.

Example Test Data
---------
```
Basket: 001, 002, 003
Total price expected: £66.78

Basket: 001, 003, 001
Total price expected: £36.95

Basket: 001, 002, 001, 003
Total price expected: £73.76
```

Models
---------
**Product**
* contains the details about the product with the following attributes: `code`, `name`, `price`
* see example product table above

**Order**
* same as the basket with the following attributes: `product`, `quantity`
* see example test data above 

**PromotionalRule**
* contains the details about the promotional rules with the following attributes:
  - `type` can have a value: _"quantity_equal_or_over"_ or _"total_over"_ (or you can add your own like _"free_shipping"_)
  - `for_all_orders` expects a boolean value
  - `rule_details` should contain the details you will be using for a specific promotional rule
* for rule type _"quantity_equal_or_over"_ - the details are `quantity_product_code`, `quantity_max`, `quantity_fixed_price`
* for rule type _"total_over"_ - the details are `total_max_price`, `total_percent_discount`

