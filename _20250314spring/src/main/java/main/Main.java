package main;

import java.io.IOException;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import config.AppCtx;
import spring.Client2;

public class Main {

	public static void main(String[] args) throws IOException {
		// 컨테이너 초기화
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);

		// 빈 객체를 구해서 사용
//		Client client = ctx.getBean(Client.class);
//		client.send();

		Client2 client = ctx.getBean(Client2.class);
		client.send();

		// 컨테이너 종료
		ctx.close();
	}

}