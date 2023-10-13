package util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailService {
	private static final String FROM = "trandinhhieugenz@gmail.com";
	private static final String PASSWORD = "pvrk zjex wqia aedf";
	private static final String NAME = "Sparkling Stones";
	
	public void send(String to, String subject, String msg) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo Session với thông tin tài khoản gửi email
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PASSWORD);
            }
        });

        try {
            // Tạo đối tượng MimeMessage
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM, NAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            String encodedSubject = MimeUtility.encodeText(subject, "UTF-8", "B");
            message.setSubject(encodedSubject);
            message.setContent(msg, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}

