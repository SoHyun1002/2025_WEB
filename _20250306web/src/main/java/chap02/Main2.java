package chap02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main2 {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx =
				new AnnotationConfigApplicationContext(AppContext1.class);
		
//		HelloWorld helloWorld = new HelloWorld(); 
//		helloWorld.print();		
		
		HelloWorld helloWorld = ctx.getBean(HelloWorld.class);
		HelloWorld helloWorld1 = ctx.getBean(HelloWorld.class);
		helloWorld.print();
		System.out.println(helloWorld == helloWorld1);
		
//		ctx.getBean(HelloWorld.class);
		ctx.close();
	}
}
