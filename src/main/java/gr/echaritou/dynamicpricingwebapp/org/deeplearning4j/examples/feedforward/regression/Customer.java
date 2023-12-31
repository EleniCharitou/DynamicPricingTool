package gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Customer {

    //specific customer profile, 5 characteristics
    //private	double	recency;
    //private	double	frequency;
    //private	double	monetary;
    //private	double	totalProductViewsEngagement;
    //private	double	totalTimeSpentEngagement;
    private final List<Order> orderList = new ArrayList<Order>();
    /*ListIterator<Order> iter = orderList.listIterator();*/
    //variables	for	1st	NN
    private double[] wtpArray;
    //variables	for	2nd	NN
    private String customerId;

    private final List<Product> productList = new ArrayList<Product>();

    public double[] getWtpArray() {
        return wtpArray;
    }

    public void setWtpArray(double[] wtpArray) {
        this.wtpArray = wtpArray;
    }

    public List<Product> getProductList() {
        return productList;
    }

    //Constructors
    Customer() {
    }

    Customer(int numberOfProducts) {
        double[] wtpArray = new double[numberOfProducts];
    }

    Customer(double[] wtpArray) {
        this.wtpArray = wtpArray;
    }

    Customer(String customerId) {
        this.customerId = customerId;
    }


    // Getters
    public double[] getWtp() {
        return wtpArray;
    }

    // Setters
    public void setWtp(double[] newWtp) {
        this.wtpArray = newWtp;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String newCustomerId) {
        this.customerId = newCustomerId;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void addOrder(Order order) {
        orderList.add(order);
    }

    public void sortOrders() {
        Collections.sort(orderList, new Comparator<Order>() {
            public int compare(Order o1, Order o2) {
                return o1.getDatePurchasedDateFormat().compareTo(o2.getDatePurchasedDateFormat());
            }
        });
    }

    public double calculateRecency(int orderIndex) {    //in days
        if (orderIndex > 0) {
            LocalDateTime lastOrder = orderList.get(orderIndex).getDatePurchasedDateFormat();
            LocalDateTime previousOrder = orderList.get(orderIndex - 1).getDatePurchasedDateFormat();
            double recency = (Duration.between(previousOrder, lastOrder).toDays());

            return recency;
        } else if (orderIndex == 0) {
            LocalDateTime lastOrder = orderList.get(orderIndex).getDatePurchasedDateFormat();
            //if it is customer's first order it is supposed that his previous order was a year ago
            LocalDateTime previousOrder = orderList.get(orderIndex).getDatePurchasedDateFormat().minusYears(1);
            double recency = (Duration.between(previousOrder, lastOrder).toDays());

            return recency;
        }
        return -1;
    }


    public double calculateFrequency(int orderIndex) {   //by using days  
        double orderIndexDouble = orderIndex;
        if (orderIndex > 0) {
            LocalDateTime lastOrder = orderList.get(orderIndex).getDatePurchasedDateFormat();
            LocalDateTime firstOrder = orderList.get(0).getDatePurchasedDateFormat();
            double frequency = (((orderIndexDouble + 1.0) * 1000000) / (Duration.between(firstOrder, lastOrder).toMillis())); //to avoid infinity as a result
            return frequency;
        } else if (orderIndex == 0) {
            LocalDateTime lastOrder = orderList.get(orderIndex).getDatePurchasedDateFormat();
            //if it is customer's first order it is supposed that his previous order was a year ago
            LocalDateTime previousOrder = orderList.get(orderIndex).getDatePurchasedDateFormat().minusYears(1);
            double frequency = ((2.0 * 100) / (Duration.between(previousOrder, lastOrder).toDays()));
            return frequency;
        }
        return -1;
    }


    public double calculateMonetary(int orderIndex) {
        double monetary = 0;
        for (int i = 0; i <= orderIndex; i++) {
            monetary = monetary + orderList.get(i).getOrderTotal();
        }
        return monetary;
    }


    public boolean sortView(String dateViewed) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateViewedDateFormat = LocalDateTime.parse(dateViewed, formatter);

        for (int i = 0; i < this.getOrderList().size(); i++) {
            if (dateViewedDateFormat.isBefore(this.getOrderList().get(i).getDatePurchasedDateFormat()) || dateViewedDateFormat.isEqual(this.getOrderList().get(i).getDatePurchasedDateFormat())) {
                //page view
                this.getOrderList().get(i).addPageView();
                //timespent
                this.getOrderList().get(i).handleTimeSpent(dateViewedDateFormat);
                return true;
            }
        }
        return false;
    }
}
