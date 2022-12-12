package gr.echaritou.dynamicpricingwebapp.org.deeplearning4j.examples.feedforward.regression;

import gr.echaritou.dynamicpricingwebapp.input.ShopInput;
import org.deeplearning4j.eval.RegressionEvaluation;

import java.io.IOException;
import java.util.List;

public class DynamicPricing {

    public static RegressionEvaluation[] run(String numberOfCustomers,
                                             String meanOfCustomers,
                                             String standardDeviationOfCustomers,
                                             String dataProducts,
                                             String dataOrders,
                                             String dataView,
                                             List<ShopInput> shopInputList,
                                             String NN1InputNodes,
                                             String NN1HiddenNodes,
                                             String NN1OutputNodes,
                                             String NN2InputNodes,
                                             String NN2HiddenNodes,
                                             String NN2OutputNodes) throws IOException, InterruptedException {

        String[] productArray = dataProducts.split("\\r?\\n");
        String[] orderArray = dataOrders.split("\\r?\\n");
        String[] viewArray = dataView.split("\\r?\\n");

        //marketplace	parameters
        int numbOfCustomers = Integer.parseInt(numberOfCustomers);
        float meanofCustomers = Float.parseFloat(meanOfCustomers);
        double stdevOfCustomers = Double.parseDouble(standardDeviationOfCustomers);
        int numberOfShops = shopInputList.size();
        int numberOfProducts = productArray.length;


        System.out.println("simulationMarketplace");
        //create	marketplace
        Marketplace simulationMarketplace = new Marketplace(numberOfShops, numberOfProducts, numbOfCustomers);
        //create	shops
        simulationMarketplace.createShops(shopInputList);
        //create products for every shop
        for (int k = 0; k < numberOfShops; k++) {
            simulationMarketplace.getShopList().get(k).createProducts(productArray);
            System.out.println("Products for shop [" + k + "]: Done");
        }

        //export data for NN1 in csv format
        simulationMarketplace.exportNN1DataCSV();
        simulationMarketplace.dataNormaliserCSV(10, 1);


        //Note: choose one of the following choices


        //Case 1:
        // #TODO this works only for first NN (NN1)
        //create random customers with random wtp (products already created)
        simulationMarketplace.createCustomers(numbOfCustomers, meanofCustomers, stdevOfCustomers);


        //Case 2:
        // #TODO this works for both NNs (NN1 and NN2)
        //create customers with personal profiles, taking into account orders from orders file
        simulationMarketplace.readOrders(orderArray);
        //read views and combine them with order information
        // #TODO this csv is missing
        simulationMarketplace.readViews(viewArray);


        //Case 3:
        // #TODO this should works for both NNs (NN1 and NN2) but csv missing
        //create customers with personal profiles, reading orders and views all-together
        // #TODO this csv is missing
        simulationMarketplace.readOrderViews();


        // #TODO 2 NN call are made here, lot of unused methods and variables

        System.out.println("NN1");

        //Create the NN1
//        int NN1numberOfInputNodes = 9;
//        int NN1numberOfHiddenNodes = 6;
//        int NN1numberOfOutputNodes = 1;

        int NN1numberOfInputNodes = Integer.parseInt(NN1InputNodes);
        int NN1numberOfHiddenNodes = Integer.parseInt(NN1HiddenNodes);
        int NN1numberOfOutputNodes = Integer.parseInt(NN1OutputNodes);

        NeuralNetwork neuralNetwork1 = new NeuralNetwork(NN1numberOfInputNodes, NN1numberOfHiddenNodes, NN1numberOfOutputNodes);
        neuralNetwork1.setWeights(NN1numberOfInputNodes, NN1numberOfHiddenNodes);
        neuralNetwork1.setWeights(NN1numberOfHiddenNodes, NN1numberOfOutputNodes);
        RegressionEvaluation regressionEvaluation1 = neuralNetwork1.trainAndEvaluateNN1();

        simulationMarketplace.setNeuralPrices();

        //export data for NN2 in csv format, now that neural prices are set
        simulationMarketplace.exportNN2DataCSV();
        simulationMarketplace.dataNormaliserCSV(7, 2);

        System.out.println("NN2");
        //Create the NN2
//        int NN2numberOfInputNodes = 6;
//        int NN2numberOfHiddenNodes = 6;
//        int NN2numberOfOutputNodes = 1;
        int NN2numberOfInputNodes = Integer.parseInt(NN2InputNodes);
        int NN2numberOfHiddenNodes = Integer.parseInt(NN2HiddenNodes);
        int NN2numberOfOutputNodes = Integer.parseInt(NN2OutputNodes);


        NeuralNetwork neuralNetwork2 = new NeuralNetwork(NN2numberOfInputNodes, NN2numberOfHiddenNodes, NN2numberOfOutputNodes);
        neuralNetwork2.setWeights(NN2numberOfInputNodes, NN2numberOfHiddenNodes);
        neuralNetwork2.setWeights(NN2numberOfInputNodes, NN2numberOfOutputNodes);
        RegressionEvaluation regressionEvaluation2 = neuralNetwork2.trainAndEvaluateNN2();

        return new RegressionEvaluation[]{regressionEvaluation1, regressionEvaluation2};


        // #TODO
        // 1) fix reading and writing csv
        // 2) clean code unused methods and variables
        // 3) create the missing csv (check the code that read the csv to find the columns)
        // 4) more debug/test to confirm the correctness of the result (good luck :P )
    }
}