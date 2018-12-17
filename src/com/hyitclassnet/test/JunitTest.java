package com.hyitclassnet.test;

import java.util.UUID;

import org.junit.Test;

public class JunitTest {

	@Test
	public void getUUID(){
		System.out.println(UUID.randomUUID().toString());
	}
}
