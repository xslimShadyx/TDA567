import java.io.*;
class DatesImprove {

    /* Precondition: month is between 1 and 12, inclusive */
    /* Postcondition: returns the number of days in the given month */

    public static int daysInMonth(int month){
        if ((month == 9) || (month == 4) || (month == 6) || (month == 11)) {
            return 30;
        }else if (month == 2) return 28;
        else return 31;

    }
    //Checks that input month is a valid month.
    private static int tryParseMonthInput (int input){
        if (input < 1 || input > 12){
            throw new IllegalArgumentException(Integer.toString(input));
        }else return input;
    }
    //Checks that input days are valid for the month it is paired with.
    private static int tryParseDayInput (int input, int month) {
        if (input < 1 || input > 31) {
            throw new IllegalArgumentException(Integer.toString(input));
        }
        if (month == 2 && input > 28) {
            throw new IllegalArgumentException(Integer.toString(input));
        }
        boolean unvalidDay30 = ((month == 9) || (month == 4) || (month == 6) || (month == 11))
                && input > 30;
        if (unvalidDay30) {
            throw new IllegalArgumentException(Integer.toString(input));
        }
        return input;
    }



    public static void main (String[] args){
        int someDay, someMonth;
        int laterDay, laterMonth;
        int someDayInYear = 0;
        int laterDayInYear = 0;
        someMonth = tryParseMonthInput(Integer.parseInt(args[1]));
        laterMonth = tryParseMonthInput(Integer.parseInt(args[3]));

        someDay = tryParseDayInput(Integer.parseInt(args[0]), someMonth);
        laterDay = tryParseDayInput(Integer.parseInt(args[2]), laterMonth);


        /* Used to record what day in the year the first day  */
        /* of someMonth and laterMonth are. */
        for (int aMonth = 1; aMonth<someMonth; aMonth++){
            someDayInYear += daysInMonth(aMonth);
        }

        for (int aMonth = 1;aMonth<laterMonth; aMonth++){
            laterDayInYear += daysInMonth(aMonth);
        }

        int daysBetween = 0;

        System.out.println("The difference in days between " +
                someDay + "/" + someMonth + " and " +
                laterDay + "/" + laterMonth + " is: ");
        daysBetween = laterDayInYear - someDayInYear;
        daysBetween = daysBetween + laterDay - someDay;
        System.out.print(Math.abs(daysBetween));

    }
}