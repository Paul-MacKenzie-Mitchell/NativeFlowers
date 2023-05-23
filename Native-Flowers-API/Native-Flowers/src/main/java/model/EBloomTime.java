package model;

public enum EBloomTime {
     APRIL("April", 4),
    MAY("May", 5),
    JUNE("June", 6),
    JULY("July", 7),
    AUGUST("August", 8),
    SEPTEMBER("September", 9),
    OCTOBER("October", 10);

     private final String monthName;
     private final int monthNum;

    EBloomTime(String monthName, int monthNum) {
        this.monthName = monthName;
        this.monthNum = monthNum;
    }

    public String getMonthName() {
        return monthName;
    }
}
