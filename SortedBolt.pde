class SortedBolt implements Comparator<LightBolt> 
{ 
    // Used for sorting in ascending order of 
    // roll number 
    public int compare(LightBolt a, LightBolt b) 
    { 
        return (int)(a.myxC - b.myyC); 
    } 
} 
