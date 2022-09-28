package com.revature.P2API.auth;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.apache.logging.log4j.LogManager;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;

import io.jsonwebtoken.Claims;

public class TestJwtHandler {

//	 private static final Logger logger = (Logger) LogManager.getLogger();

	    /*
	        Create a simple JWT, decode it, and assert the claims
	     */
	    @Test
	    public void createAndDecodeJWT() {

	        String jwtId = "SOMEID1234";
	        String jwtIssuer = "JWT Demo";
	        String jwtSubject = "Andrew";
	        int jwtTimeToLive = 800000;

	        String jwt = JwtHandler.createJwt(
	                jwtId, // claim = jti
	                jwtIssuer, // claim = iss
	                jwtSubject, // claim = sub
	                jwtTimeToLive // used to calculate expiration (claim = exp)
	        );
	        
	        System.out.print("jwt = \"" + jwt.toString() + "\"");

	        Claims claims = JwtHandler.decodeJWT(jwt);

	        System.out.print("claims = " + claims.toString());

	        assertEquals(jwtId, claims.getId());
	        assertEquals(jwtIssuer, claims.getIssuer());
	        assertEquals(jwtSubject, claims.getSubject());

	    }
}
