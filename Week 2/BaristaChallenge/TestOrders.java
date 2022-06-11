public class TestOrders {
    public static void main(String[] args) {
        Item item1 = new Item("Mocha", 4.25);
        Item item2 = new Item("Latte", 3.75);
        Item item3 = new Item("Cappucino", 3.55);
        Item item4 = new Item("Drip Coffee", 2.25);

        Order order1 = new Order();
        Order order2 = new Order();
        Order order3 = new Order("Jake");
        Order order4 = new Order("Angela");
        Order order5 = new Order("Terry");

        order1.addItem(item2);
        order1.addItem(item4);
        order2.addItem(item3);
        order2.addItem(item4);
        order3.addItem(item1);
        order3.addItem(item2);
        order4.addItem(item1);
        order4.addItem(item2);
        order4.addItem(item3);
        order5.addItem(item1);
        order5.addItem(item3);

        order1.display();
        System.out.println("-----------------");
        order2.display();
        System.out.println("-----------------");
        order3.display();
        System.out.println("-----------------");
        order4.display();
        System.out.println("-----------------");
        order5.display();

        order1.setOrderReady(true); 
        order2.setOrderReady(true);
        order3.setOrderReady(false);
        order4.setOrderReady(true);
        order5.setOrderReady(false);

        System.out.println(order1.getStatusMessage());
        System.out.println(order2.getStatusMessage());
        System.out.println(order3.getStatusMessage());
        System.out.println(order4.getStatusMessage());
        System.out.println(order5.getStatusMessage());

        System.out.println(order1.getOrderTotal());
        System.out.println(order2.getOrderTotal());
        System.out.println(order3.getOrderTotal());
        System.out.println(order4.getOrderTotal());
        System.out.println(order5.getOrderTotal());



    }
    
}
