package cn.dafran.server;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @Classname BasicTest
 * @Author 6b92d6
 * @Description
 */
public class BasicTest {

    @Test
    public void one() {
        BCryptPasswordEncoder encode = new BCryptPasswordEncoder();
        System.out.println(encode.encode("123"));
    }
}
