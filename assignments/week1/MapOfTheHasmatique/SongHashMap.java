import java.util.HashMap;
import java.util.Set;;
public class SongHashMap {
    public static void main(String[] args) {
        HashMap<String, String> trackList = new HashMap<String, String>();
        trackList.put("100 Years", "When you only have a 100 years to live.");
        trackList.put("Devil in the Wishing Well", "I met Jane at the center of the earth.");
        trackList.put("Superman", "I can't stand to fly.");
        trackList.put("The Riddle", "Here's a riddle for ya.");

        Set<String> keys = trackList.keySet();
        for(String key : keys){
            System.out.println(key);
            System.out.println(trackList.get(key));
        }
    }
}
