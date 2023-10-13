package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptionService {
	
	public String encryptMD5(String input) {
        StringBuilder sb = new StringBuilder();
        try {
            // Tạo đối tượng MessageDigest với thuật toán MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Mã hóa dữ liệu đầu vào
            byte[] hashedBytes = md.digest(input.getBytes());

            // Chuyển đổi dữ liệu đã mã hóa thành chuỗi hex
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
}
