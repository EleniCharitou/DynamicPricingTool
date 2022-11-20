package gr.echaritou.dynamicpricingwebapp.input;

public class ShopInput {
    private String numberOfShops;
    private String deliveryCost;
    private String deliveryTime;
    private String deliveryMethod;
    private String paymentMethod;
    private String sellerReviews;
    private String sellerReputation;
    private String avgProfitDiff;

    public String getNumberOfShops() {
        return numberOfShops;
    }

    public void setNumberOfShops(String numberOfShops) {
        this.numberOfShops = numberOfShops;
    }

    public String getDeliveryCost() {
        return deliveryCost;
    }

    public void setDeliveryCost(String deliveryCost) {
        this.deliveryCost = deliveryCost;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getSellerReviews() {
        return sellerReviews;
    }

    public void setSellerReviews(String sellerReviews) {
        this.sellerReviews = sellerReviews;
    }

    public String getSellerReputation() {
        return sellerReputation;
    }

    public void setSellerReputation(String sellerReputation) {
        this.sellerReputation = sellerReputation;
    }

    public String getAvgProfitDiff() {
        return avgProfitDiff;
    }

    public void setAvgProfitDiff(String avgProfitDiff) {
        this.avgProfitDiff = avgProfitDiff;
    }
}
