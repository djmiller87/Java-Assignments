import java.util.ArrayList;


// Here we're creating a new data type called Order
class Order {
    
    // MEMBER VARIABLES
    private String name; // default value of null
    private boolean ready; // default value false
    private ArrayList<Item> items = new ArrayList<Item>(); // defaults to null
    
    // CONSTRUCTOR
    // No arguments, sets name to "Guest", initializes items as an empty list.
    public Order(){
        name = "Guest";
        ready = false;
    }    
    // OVERLOADED CONSTRUCTOR
    // Takes a name as an argument, sets name to this custom name.
    // Initializes items as an empty list.
    public Order(String name){
        this.name = name;
        ready = false;
    }
    
    // ORDER METHODS
    	// Most of your code will go here, 
    	// so implement the getters and setters first!
    public void addItem(Item item){
        items.add(item);
    }

    public String getStatusMessage(){
        if(ready == true){
            return (this.name + ", your order is ready");
        }
        else{
            return "Thank you for waiting. Your Order will be ready soon.";
        }
    }

    public Double getOrderTotal(){
        double sum = 0.00;
        for( Item i : this.items){
            sum = i.getItemPrice() + sum;
        }
        return sum;
    }

    public void display(){
        System.out.println("Customer Name:" + this.name);
        for(Item i : this.items){
            System.out.println(i.getItemName() + "-" + i.getItemPrice());
        }
        System.out.println("Total: $" + getOrderTotal());
    }
    
    // GETTERS & SETTERS
    public void setOrderName(String name){
        this.name = name;
    }
    public String getOrderName(){
        return name;
    }
    public void setOrderReady(boolean ready){
        this.ready = ready;
    }
    public boolean getOrderReady(){
        return ready;
    }
    public void setOrderItems(ArrayList<Item> items){
        this.items = items;
    }
    public ArrayList<Item> getOrderItems(){
        return items;
    }
    
}

