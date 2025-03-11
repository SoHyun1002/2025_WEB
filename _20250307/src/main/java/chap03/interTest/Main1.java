package chap03.interTest;

public class Main1 {

	public static void main(String[] args) {
//		ImplInterF a1 = new ImplInterF();
//		a1.method();

//		InterF i1 = new InterF() {
//
//			@Override
//			public void method() {
//				System.out.println("method1");
//				
//			}
//			
//		};

		InterF i1 =
				(x1, s1) -> {
					return x1 + ", " + s1;
				};
		System.out.println(i1.method(100, "홍길동"));
	}
}
