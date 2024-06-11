import 'dart:async';

class TableDTO{
  final TableInfoDTO table;
  final List<OrderDTO> orders;

  TableDTO({ required this.table, required this. orders,});

}

class TableInfoDTO{
  final String token;
  final int id;
  final String openTime;
  final List<Customer> tableCustomers;
  final int status;
  final String reponsableWaiter;

  TableInfoDTO({
    required this.token,
    required this.id,
    required this.openTime,
    required this.tableCustomers,
    required this.status,
    required this.reponsableWaiter,
  });
}

class OrderDTO{
  final int id;
  final MenuItem menuItem;
  final List<Customer> customers;
  final int status;
  final String orderedTime;
  final String deliveredTime;

  OrderDTO({
    required this.id,
    required this.menuItem,
    required this.customers,
    required this.status,
    required this.orderedTime,
    required this.deliveredTime,
  });
}

class Customer{
  final int id;
  final String name;

  Customer({ 
    required this.id,
    required this.name,
  });
}

class MenuItem{
  final int id;
  final String name;
  final double price;
  final String description;

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
}