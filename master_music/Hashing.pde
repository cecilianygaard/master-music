import java.security.*;

try {
  MessageDigest md = MessageDigest.getInstance("SHA-256"); 

  //Skal have et imput for når man skriver en test - ved ikke helt hvor den skal hentes fra (evt. noget signup?) Opretter her bare en string der hedder password.
  String password = "password";

  md.update(password.getBytes());    

  byte[] byteList = md.digest();

  StringBuffer hashedValueBuffer = new StringBuffer();
  for (byte b : byteList)hashedValueBuffer.append(hex(b)); 

 String passwordHashed = "+hashedValueBuffer.toString())";
}
