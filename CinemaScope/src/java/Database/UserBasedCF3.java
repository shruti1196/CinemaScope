/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.util.*;
import java.util.Map.Entry;
import com.mongodb.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bugs
 */
public class UserBasedCF3 {

    static HashMap<String, HashMap<String, Float>> trainingdataset = new HashMap<String, HashMap<String, Float>>();
    static HashMap<String, HashMap<String, Float>> testdataset = new HashMap<String, HashMap<String, Float>>();
    static Set<String> items = new HashSet<String>();
    static Set<String> users = new HashSet<String>();
    static Scanner sc = new Scanner(System.in);
    static HashMap<String, Float> testrating = new HashMap<>();
    static HashMap<String, Float> correlation = new HashMap<String, Float>();
    static HashMap<String, Float> mean_rating_train_set = new HashMap<String, Float>();
    static float mean_rating_test = 0;
    static HashMap<String, Float> prediction = new HashMap<String, Float>();

    static void printall() {
        Iterator testentries = testrating.entrySet().iterator();
        while (testentries.hasNext()) {
            Entry row = (Entry) testentries.next();
            //System.out.println("item: " + row.getKey() + " rating: " + row.getValue());
        }
    }

    static void prediction(String itemidtarget) {
        float x1 = 0, x2 = 0;

        Iterator entries = trainingdataset.entrySet().iterator();
        while (entries.hasNext()) {
            Map.Entry row11 = (Map.Entry) entries.next();
            String userid = (String) row11.getKey();
            HashMap<String, Float> helper = (HashMap) row11.getValue();
            if (helper.containsKey(itemidtarget) == true) {
                x1 += (helper.get(itemidtarget) - mean_rating_train_set.get(userid)) * (correlation.get(userid));
                x2 += correlation.get(userid);
            }
        }
        float pre = 0;
        if (x2 == 0) {
            pre = mean_rating_test;
        } else {
            pre = (x1 / x2) + mean_rating_test;
        }
        prediction.put(itemidtarget, pre);
        System.out.println("prediction for item " + itemidtarget + " : " + pre);
    }

    static void mean_test_rating() {
        int count = 0;
        float sum = 0;
        Iterator testratingiter = testrating.entrySet().iterator();
        while (testratingiter.hasNext()) {
            Entry testentry = (Entry) testratingiter.next();
            if ((Float) testentry.getValue() != (float) (-1)) {
                count++;
                sum += (Float) testentry.getValue();
            }
        }
        mean_rating_test = sum / count;
    }

    static void findcorrelation() {
        Iterator testratingiter = testrating.entrySet().iterator();
        while (testratingiter.hasNext()) {
            Entry testentry = (Entry) testratingiter.next();
            if ((Float) testentry.getValue() == (float) (-1)) {
                String itemidtarget = (String) testentry.getKey();
                mean_test_rating();
                Iterator trainingiter1 = trainingdataset.entrySet().iterator();
                while (trainingiter1.hasNext()) {
                    Entry trainentry1 = (Entry) trainingiter1.next();
                    String userid = (String) trainentry1.getKey();
                    HashMap<String, Float> trainentryval = ((HashMap) trainentry1.getValue());
                    Iterator trainingiter2 = trainentryval.entrySet().iterator();
                    int count = 0;
                    float sum = 0;
                    while (trainingiter2.hasNext()) {
                        Entry trainentry2 = (Entry) trainingiter2.next();
                        if ((Float) trainentry2.getValue() != (float) (-1) && testrating.get((String) trainentry2.getKey()) != (float) (-1)) {
                            count++;
                            sum += (Float) trainentry2.getValue();
                        }
                    }
                    float mean_train_rating = sum / count;
                    mean_rating_train_set.put(userid, mean_train_rating);

                    float x1 = 0, x2 = 0, x3 = 0;
                    trainingiter2 = trainentryval.entrySet().iterator();
                    while (trainingiter2.hasNext()) {
                        Entry trainentry2 = (Entry) trainingiter2.next();
                        if ((Float) trainentry2.getValue() != (float) (-1) && testrating.get((String) trainentry2.getKey()) != (float) (-1)) {
                            x1 += ((Float) trainentry2.getValue() - mean_train_rating) * (testrating.get((String) trainentry2.getKey()) - mean_rating_test);
                            x2 += Math.pow((Float) trainentry2.getValue(), 2);
                            x3 += Math.pow(testrating.get((String) trainentry2.getKey()), 2);
                        }
                    }
                    //System.out.println("x1: " + x1);
                    //System.out.println("x2: " + x2);
                    //System.out.println("x3: " + x3);
                    float cor = 0;
                    if (x2 == 0 || x3 == 0) {
                        cor = 0;
                    } else {
                        cor = x1 / ((float) (Math.sqrt(x2 * x3)));
                    }
                    //System.out.println("Correlation between " + userid + " : " + cor);
                    correlation.put(userid, cor);
                }
                prediction(itemidtarget);
            }
        }
    }

    public HashMap<String, Float> function(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);
            String CurrentUser = (String) session.getAttribute("name");
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            DB db = mongoClient.getDB("CinemaScope");
            DBCollection coll = db.getCollection("Ratings");
            DBCursor cursor = coll.find();
            int cnt = coll.find().count();
            System.out.println(cnt);
            while (cursor.hasNext()) {
                BasicDBObject obj = (BasicDBObject) cursor.next();

                String s1 = (String) obj.get("user id").toString();
                String s2 = (String) obj.get("item id").toString();
                String s3 = (String) obj.get("rating").toString();

                Float r = Float.parseFloat(s3);

                users.add(s1);
                items.add(s2);

                if (trainingdataset.containsKey(s1) == false) {
                    HashMap<String, Float> m = new HashMap<>();
                    m.put(s2, r);
                    trainingdataset.put(s1, m);
                } else {
                    trainingdataset.get(s1).put(s2, r);
                }
            }

            System.out.println(users.size());
            System.out.println(items.size());

            BasicDBObject obj = new BasicDBObject();
            long CurrentUserId;
            if (CurrentUser.contains("User")) {
                String x = CurrentUser.substring(CurrentUser.indexOf(' ') + 1);
                CurrentUserId = Long.parseLong(x);
                obj.put("user id", CurrentUserId);
            } else {
                obj.put("user id", CurrentUser);
            }

            Iterator iter = items.iterator();
            while (iter.hasNext()) {

                DBCursor c2 = coll.find(obj);
                String item = (String) iter.next();

                int flag = 0;
                while (c2.hasNext()) {

                    DBObject o = c2.next();
                    String dbitem = (String) o.get("item id").toString();

                    if (dbitem.equals(item)) {
                        String rating = (String) o.get("rating").toString();
                        Float r = Float.parseFloat(rating);
                        testrating.put(item, r);
                        flag = 1;
                    }
                    if (flag == 0) {
                        testrating.put(item, (float) (-1));
                    }
                }

            }

            //printall();
            findcorrelation();
            //printall();
            

        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        return testrating;
    }    
        
    public HashMap<String, Float> function2()
    {
        return prediction;
    }
}

