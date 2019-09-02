package com.kh.runLearn.common.sms;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// Install the Java helper library from twilio.com/docs/libraries/java
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;


@RequestMapping(value = "SmsSender", method = RequestMethod.POST)
public class SmsSender {
	// Find your Account Sid and Auth Token at twilio.com/console
	public static final String ACCOUNT_SID = "AC21c41324ca2adfa4e2bc3defc22dd7ae";
	public static final String AUTH_TOKEN = "7cce4d0bdf247fd4332ef341800fe135";

	public static void main(String[] args) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		Message message = Message.creator(new PhoneNumber("+821046459876"), // to
				new PhoneNumber("+12563716554"), // from
				"Where's Wallace?, test, test").create();
		
		
		System.out.println(message.getSid());
		

		int random = (int)(Math.random() * 10000);
		while(random < 1000) {
			random = (int)(Math.random() * 10000);
			System.out.println(random);
		}
	}
}
