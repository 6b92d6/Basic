package cn.dafran.server.untils;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Classname JwtTokenUtil
 * @Author 6b92d6
 * @Description JwtToken工具类
 */

@Component
public class JwtTokenUtil {
    //密钥签名
    private static final String CLAIM_KEY_USERNAME  ="sub";
    //创建时间
    private static final String CLAIM_KEY_CREATED="creted";
    //加解密使用的密钥
    @Value("${jwt.secret}")
    private String secret;
    //失效时间
    @Value("${jwt.expiration}")
    private Long expiration;

    /**
     * 根据用户信息生成token(对外)
     * @param userDetails
     * @return
     */
    public String generateToken(UserDetails userDetails){
        Map<String,Object> claims = new HashMap<>();
        //放入登录用户名
        claims.put(CLAIM_KEY_USERNAME,userDetails.getUsername());
        //放入Token创建时间
        claims.put(CLAIM_KEY_CREATED,new Date());
        return generateToken(claims);
    }

    /**
     * 从token中获取登录用户名(对外)
     * @param token
     * @return
     */
    public String getUserNameFromToken(String token) {
        String username;
        try {
            Claims claims = getClaimsFromToken(token);
            username = claims.getSubject();
        } catch (Exception e) {
            username = null;
        }
        return username;
    }

    /**
     * (对外)验证token是否有效
     *      1.Token是否过期
     *      2.荷载中的 username 和 UserDetails中的 username 是否一致
     * @param token
     * @param userDetails
     * @return
     */
    public boolean validateToken(String token, UserDetails userDetails) {
        String username = getUserNameFromToken(token);
        return username.equals(userDetails.getUsername()) && !isTokenExpired(token);
    }

    /**
     * (对外)判断token是否被刷新,过期会被刷新
     *      判断Token中失效时间，如果过期就可以被刷新，没过期就不能刷新
     * @param token
     * @return
     */
    public boolean canRefresh(String token) {
        return !isTokenExpired(token);
    }

    /**
     * (对外)刷新token
     *      更改Token的失效时间为当前时间,然后重新生成Token
     * @param token
     * @return
     */
    public String refreshToken(String token) {
        Claims claims = getClaimsFromToken(token);
        claims.put(CLAIM_KEY_CREATED,new Date());
        return generateToken(claims);
    }

    /**
     * 判断token是否失效,
     *     token的失效时间是否在当前时间之前,那么就失效
     * @param token
     * @return
     */
    private boolean isTokenExpired(String token) {
        Date expireDate = getExpiredDateFromToken(token);
        return expireDate.before(new Date());
    }

    /**
     * 从token中获取过期时间
     * @param token
     * @return
     */
    private Date getExpiredDateFromToken(String token) {
        Claims claims = getClaimsFromToken(token);
        return claims.getExpiration();
    }

    /**
     * 从token中获取荷载
     * @param token
     * @return
     */
    private Claims getClaimsFromToken(String token) {
        Claims claims = null;
        try {
            claims = Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return claims;
    }

    /**
     * 根据荷载生成 JWT token
     * @param claims
     * @return
     */
    private String generateToken(Map<String, Object> claims){
        return Jwts.builder()
                .setClaims(claims)
                //设置失效时间
                .setExpiration(generateExpirationDate())
                //设置签名
                .signWith(SignatureAlgorithm.HS512,secret)
                .compact();
    }

    /**
     * 生成token失效时间
     * @return
     */
    private Date generateExpirationDate() {
        return new Date(System.currentTimeMillis() + expiration * 1000);
    }
}
