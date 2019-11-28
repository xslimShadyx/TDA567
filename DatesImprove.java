public static int daysInMounth(int month){
	if (month >=1 && month <= 12 ){
		if((month==9)||(month==4)||(month==6)||(month==11)){
			return 30;
		}else if(mounth==2){
			return 28;
		}else{
			return 31;
		}
		}else{
			return null;
		}
}