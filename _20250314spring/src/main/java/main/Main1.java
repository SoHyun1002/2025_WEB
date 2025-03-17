package main;

import chap07.ReCalculator;
import chap07.ImpeCalculator;

public class Main1 {
	public static void main(String[] args) {
		ImpeCalculator a1 = new ImpeCalculator();
		System.out.println((a1.factorial(5)));
		
		long start = System.nanoTime();
		ReCalculator a2 = new ReCalculator();
		long end = System.nanoTime();
		System.out.println("ImpeCalculator " + 5 + "! " + (end - start));
		System.out.println((a2.factorial(5)));
	}
}
