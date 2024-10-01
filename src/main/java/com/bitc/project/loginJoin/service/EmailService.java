package com.bitc.project.loginJoin.service;

import org.springframework.stereotype.Service;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

    // 4자리 난수 생성
    public String generateVerificationCode() {
        Random random = new Random();
        int code = 1000 + random.nextInt(9000);
        return String.valueOf(code);
    }

    // 이메일 발송(회원가입시 본인인증용)
    public void sendVerificationEmail(String recipientEmail, String code) throws Exception {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress("jiyeonkim0528@gmail.com")); // 발신 이메일 주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
        message.setSubject("[센텀베토벤피아노스튜디오] 본인인증을 위한 인증코드가 발송되었습니다");
        message.setText("안녕하세요! 센텀베토벤 피아노스튜디오입니다.\n아래 인증코드를 확인해 주세요.\n\n\n인증코드 : [" + code + "]");
        
        System.out.println("발송할 이메일 주소: " + recipientEmail);
        System.out.println("발송된 인증 코드: " + code);

        // SMTP 서버 정보 입력 (Gmail SMTP 사용)
        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com", "jiyeonkim0528@gmail.com", "nthh qgzi ztfp tcyq"); 
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
    
    // 비밀번호 찾기 
}