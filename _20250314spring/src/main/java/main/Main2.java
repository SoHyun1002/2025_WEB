package main;

import chap07.ExeTimeCalculator;
import chap07.ImpeCalculator;

public class Main2 {
	
	public static void main(String[] args) {
		ExeTimeCalculator e1 = new ExeTimeCalculator(new ImpeCalculator());
		System.out.println(e1.factorial(5));

		ExeTimeCalculator e2 = new ExeTimeCalculator(new ImpeCalculator());
		System.out.println(e2.factorial(5));
	}
}
