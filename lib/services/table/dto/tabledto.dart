import 'dart:async';

class TableDTO {
  final TableInfoDTO table;
  final List<OrderDTO> orders;

  TableDTO({required this.table, required this.orders});

  factory TableDTO.fromJson(Map<String, dynamic> json) {
    return TableDTO(
      table: TableInfoDTO.fromJson(json['table']),
      orders: (json['orders'] as List<dynamic>?)
              ?.map((order) => OrderDTO.fromJson(order))
              .toList() ??
          [],
    );
  }
}

class TableInfoDTO {
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

  factory TableInfoDTO.fromJson(Map<String, dynamic> json) {
    return TableInfoDTO(
      token: json['token'],
      id: json['id'],
      openTime: json['openTime'],
      tableCustomers: (json['tableCustomers'] as List<dynamic>?)
              ?.map((customer) => Customer.fromJson(customer))
              .toList() ??
          [],
      status: json['status'],
      reponsableWaiter: json['reponsableWaiter'],
    );
  }
}

class OrderDTO {
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

  factory OrderDTO.fromJson(Map<String, dynamic> json) {
    return OrderDTO(
      id: json['id'],
      menuItem: MenuItem.fromJson(json['menuItem']),
      customers: (json['customers'] as List<dynamic>?)
              ?.map((customer) => Customer.fromJson(customer))
              .toList() ??
          [],
      status: json['status'],
      orderedTime: json['orderedTime'],
      deliveredTime: json['deliveredTime'],
    );
  }
}

class Customer {
  final int id;
  final String name;

  Customer({required this.id, required this.name});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
    );
  }
}

class MenuItem {
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

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }
}
