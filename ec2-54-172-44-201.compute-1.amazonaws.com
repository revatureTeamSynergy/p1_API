PK  ��=U              META-INF/MANIFEST.MF��  �M��LK-.�K-*��ϳR0�3���� PK��      PK
    �9U.�̉       com/.DS_Store   Bud1           	                                                           t u r eIloc                                                                                                                                                                                                                                                                                                                                                                                                                                           r e v a t u r eIlocblob      A   .������      r e v a t u r ebwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    r e v a t u r evSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9U��NH       com/revature/.DS_Store   Bud1           	                                                           IIlocblob                                                                                                                                                                                                                                                                                                                                                                                                                                             P 1 A P IIlocblob      A   .������      P 1 A P Ibwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{16, 421}, {920, 436}}	#/;R_klmno�                            �    P 1 A P IvSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    L�=U�ƍV�  �  )   com/revature/P2API/P2ApiApplication.class����   4 -  #com/revature/P2API/P2ApiApplication  Iorg/springframework/boot/web/servlet/support/SpringBootServletInitializer <init> ()V Code
  	   LineNumberTable LocalVariableTable this %Lcom/revature/P2API/P2ApiApplication; main ([Ljava/lang/String;)V
    *org/springframework/boot/SpringApplication   run b(Ljava/lang/Class;[Ljava/lang/String;)Lorg/springframework/context/ConfigurableApplicationContext; args [Ljava/lang/String; MethodParameters restTemplate h(Lorg/springframework/boot/web/client/RestTemplateBuilder;)Lorg/springframework/web/client/RestTemplate; RuntimeVisibleAnnotations -Lorg/springframework/context/annotation/Bean;
     7org/springframework/boot/web/client/RestTemplateBuilder ! " build /()Lorg/springframework/web/client/RestTemplate; builder 9Lorg/springframework/boot/web/client/RestTemplateBuilder; passwordEncoder @()Lorg/springframework/security/crypto/password/PasswordEncoder; ( @org/springframework/security/crypto/bcrypt/BCryptPasswordEncoder
 ' 	 
SourceFile P2ApiApplication.java >Lorg/springframework/boot/autoconfigure/SpringBootApplication; !               /     *� �    
                    	       6     *� W�    
   
                                         9     +� �    
                       # $      #     % &             2     � 'Y� )�    
                     *    +      ,  PK
    ٕ=U���  �  (   com/revature/P2API/P2ApiApplication.javapackage com.revature.P2API;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication

public class P2ApiApplication extends SpringBootServletInitializer{
	
	
	public static void main(String[] args) {
		SpringApplication.run(P2ApiApplication.class, args);
	}
	
	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}
	
	 @Bean
	    PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	
	
	
	

}
PK
    L�=U9!�7�  �  3   com/revature/P2API/controller/LoginController.class����   4 5  -com/revature/P2API/controller/LoginController  java/lang/Object loginService )Lcom/revature/P2API/service/LoginService; <init> ,(Lcom/revature/P2API/service/LoginService;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	     LineNumberTable LocalVariableTable this /Lcom/revature/P2API/controller/LoginController; MethodParameters login B(Lcom/revature/P2API/models/User;)Lcom/revature/P2API/models/User; 5Lorg/springframework/web/bind/annotation/PostMapping; "RuntimeVisibleParameterAnnotations 5Lorg/springframework/web/bind/annotation/RequestBody;	    java/lang/System    out Ljava/io/PrintStream;
 " $ # 'com/revature/P2API/service/LoginService  
 & ( ' java/io/PrintStream ) * println (Ljava/lang/Object;)V user  Lcom/revature/P2API/models/User; 
SourceFile LoginController.java 8Lorg/springframework/web/bind/annotation/RestController; 8Lorg/springframework/web/bind/annotation/RequestMapping; value /login 5Lorg/springframework/web/bind/annotation/CrossOrigin; * !                	     
      F     
*� *+� �              	         
       
               	                   O     � *� +� !� %*� +� !�       
                      + ,      +    -    . 	     /   0  1[ s 2 3  1[ s 4PK
    * <U{#��  �  2   com/revature/P2API/controller/LoginController.javapackage com.revature.P2API.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P2API.models.User;
import com.revature.P2API.service.LoginService;

@RestController
@RequestMapping("/login")
@CrossOrigin("*")
public class LoginController {
	
	private LoginService loginService;
	
	@Autowired
	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}
	
	@PostMapping()
	public User login(@RequestBody User user) {
		System.out.println(loginService.login(user));
		return loginService.login(user);

	}
	

}PK
    L�=U�ϴ�    2   com/revature/P2API/controller/UserController.class����   4 �  ,com/revature/P2API/controller/UserController  java/lang/Object userService (Lcom/revature/P2API/service/UserService; loginRepository /Lcom/revature/P2API/repository/LoginRepository; listService -Lcom/revature/P2API/service/MusicListService; musicController 3Lcom/revature/P2API/controller/MusicListController; songService (Lcom/revature/P2API/service/SongService; <init> �(Lcom/revature/P2API/service/UserService;Lcom/revature/P2API/repository/LoginRepository;Lcom/revature/P2API/service/MusicListService;Lcom/revature/P2API/service/SongService;Lcom/revature/P2API/controller/MusicListController;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	    	    	   	 
	    	      LineNumberTable LocalVariableTable this .Lcom/revature/P2API/controller/UserController; MethodParameters 
createUser B(Lcom/revature/P2API/models/User;)Lcom/revature/P2API/models/User; 5Lorg/springframework/web/bind/annotation/PostMapping; value /create "RuntimeVisibleParameterAnnotations 5Lorg/springframework/web/bind/annotation/RequestBody;
 . 0 / &com/revature/P2API/service/UserService & '
 2 4 3 com/revature/P2API/models/User 5 6 getUsername ()Ljava/lang/String; 8 : 9 -com/revature/P2API/repository/LoginRepository ; < findByUsername ((Ljava/lang/String;)Ljava/util/Optional; > #com/revature/P2API/models/MusicList @ java/lang/StringBuilder
 B D C java/lang/String E F valueOf &(Ljava/lang/Object;)Ljava/lang/String;
 ? H  I (Ljava/lang/String;)V K 's 
 ? M N O append -(Ljava/lang/String;)Ljava/lang/StringBuilder; Q  Library
 ? S T 6 toString
 V X W java/util/Optional Y Z get ()Ljava/lang/Object;
 = \  ] 5(Ljava/lang/String;Lcom/revature/P2API/models/User;)V
 _ a ` 1com/revature/P2API/controller/MusicListController b c 
createList L(Lcom/revature/P2API/models/MusicList;)Lcom/revature/P2API/models/MusicList;
 e g f +com/revature/P2API/service/MusicListService h c saveList
 e j k l getListByName 9(Ljava/lang/String;)Lcom/revature/P2API/models/MusicList;
 = n o p getId ()J
 2 n
 _ s t u addUserToList )(JJ)Lcom/revature/P2API/models/MusicList; user  Lcom/revature/P2API/models/User; login Ljava/util/Optional; list %Lcom/revature/P2API/models/MusicList; LocalVariableTypeTable 6Ljava/util/Optional<Lcom/revature/P2API/models/User;>; getUser #(J)Lcom/revature/P2API/models/User; 4Lorg/springframework/web/bind/annotation/GetMapping; /{id} 6Lorg/springframework/web/bind/annotation/PathVariable;
 . � �  getUserById id J 
deleteUser (J)V 7Lorg/springframework/web/bind/annotation/DeleteMapping; /delete/{id}
 . � � � deleteUserById 
updateUser (JLjava/lang/String;)V 4Lorg/springframework/web/bind/annotation/PutMapping; 6Lorg/springframework/web/bind/annotation/RequestParam;
 . � � � password Ljava/lang/String; getListsNames (J)Ljava/util/List; 	Signature '(J)Ljava/util/List<Ljava/lang/String;>; /user/{id}/lists
 . � � � getUsers ()Ljava/util/List; 4()Ljava/util/List<Lcom/revature/P2API/models/User;>;
 . � � � 
SourceFile UserController.java 8Lorg/springframework/web/bind/annotation/RestController; 8Lorg/springframework/web/bind/annotation/RequestMapping; path /users 5Lorg/springframework/web/bind/annotation/CrossOrigin; * !                 	 
                             �      *� *+� *,� *-� *� *� �    !       +  , 	 -  .  /  0  1 "   >      # $                     	 
                %          	          & '       (  )[ s * +     ,      �     �*� +� -W*� +� 1� 7 M� =Y� ?Y+� 1� A� GJ� LP� L� R,� U� 2� [N*� -� ^W*� -� dW*� *� � ?Y+� 1� A� GJ� LP� L� R� i� m,� U� 2� q� rW+�    !       5 	 7  9 A ; J < S > � ? "   *    � # $     � v w   u x y  A K z {  |      u x }  %    v    ~        �  )[ s � +     �      =     	*� � ��    !       F "       	 # $     	 � �  %    �    � �       �  )[ s � +     �      A     	*� � ��    !   
    K  L "       	 # $     	 � �  %    �    � �       �  )[ s � +     �    �      L     
*� -� ��    !   
    P 	 R "        
 # $     
 � �    
 � �  %   	 �   �    � �  �    �      �  )[ s � +     �      =     	*� � ��    !       W "       	 # $     	 � �  %    �    � �  �    �      �      2     *� � ��    !       \ "        # $    �    �      �   �  �[ s � �  )[ s �PK
    �<U�E)    1   com/revature/P2API/controller/UserController.javapackage com.revature.P2API.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P2API.models.MusicList;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;
import com.revature.P2API.repository.LoginRepository;
import com.revature.P2API.service.MusicListService;
import com.revature.P2API.service.SongService;
import com.revature.P2API.service.UserService;

@RestController
@RequestMapping(path="/users")
@CrossOrigin("*")
public class UserController {
	
	
	private final UserService userService;
	private LoginRepository loginRepository;
	private MusicListService listService;
	public MusicListController musicController;
	private SongService songService;
	
	
	@Autowired
	public UserController(UserService userService, LoginRepository loginRepository,  MusicListService listService, SongService songService, MusicListController musicController) {
		super();
		this.userService = userService;
		this.loginRepository = loginRepository;
		this.listService = listService;
		this.songService = songService;
		this.musicController = musicController;
	}
	
	@PostMapping("/create")
	public User createUser(@RequestBody User user) {
		userService.createUser(user);
		
		Optional<User> login = loginRepository.findByUsername(user.getUsername());
		
		MusicList list = new MusicList(user.getUsername() + "'s " + " Library", login.get());
		
		musicController.createList(list);
		listService.saveList(list);
	
		musicController.addUserToList(listService.getListByName(user.getUsername() + "'s " + " Library").getId(), login.get().getId());
		return user;
		
		
	}
	
	@GetMapping("/{id}")
	public User getUser(@PathVariable long id) {
		return userService.getUserById(id);
	}
	
	@DeleteMapping("/delete/{id}")
	public void deleteUser(@PathVariable long id) {
		userService.deleteUserById(id);
	}
	
	@PutMapping("/{id}")
	public void updateUser(@PathVariable long id, @RequestParam() String password) {
		userService.updateUser(id, password);
		
	}
	
	//http://localhost:8080/users/user/1/lists
	@GetMapping("/user/{id}/lists")
	public List<String> getListsNames(@PathVariable long id){
		return userService.getListsNames(id);
	}
	
	@GetMapping
	public List<User> getUsers() {
		return userService.getUsers();
	}
	
	

}PK
    L�=U�j��.  .  6   com/revature/P2API/controller/ArtistController$1.class����   4   0com/revature/P2API/controller/ArtistController$1  -com/fasterxml/jackson/core/type/TypeReference this$0 0Lcom/revature/P2API/controller/ArtistController; <init> 3(Lcom/revature/P2API/controller/ArtistController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 2Lcom/revature/P2API/controller/ArtistController$1; MethodParameters 
SourceFile ArtistController.java 	Signature SLcom/fasterxml/jackson/core/type/TypeReference<Lcom/revature/P2API/models/Artist;>; EnclosingMethod  .com/revature/P2API/controller/ArtistController   getArtistByName &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           ,        
         �                     
        PK
    L�=U�=��,  ,  6   com/revature/P2API/controller/ArtistController$2.class����   4   0com/revature/P2API/controller/ArtistController$2  -com/fasterxml/jackson/core/type/TypeReference this$0 0Lcom/revature/P2API/controller/ArtistController; <init> 3(Lcom/revature/P2API/controller/ArtistController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 2Lcom/revature/P2API/controller/ArtistController$2; MethodParameters 
SourceFile ArtistController.java 	Signature SLcom/fasterxml/jackson/core/type/TypeReference<Lcom/revature/P2API/models/Artist;>; EnclosingMethod  .com/revature/P2API/controller/ArtistController   getArtistById &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           D        
         �                     
        PK
    L�=U�L��  �  4   com/revature/P2API/controller/ArtistController.class����   4 u  .com/revature/P2API/controller/ArtistController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; result Ljava/lang/Object; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
    	      +com/fasterxml/jackson/databind/ObjectMapper
  	   	 
  +org/springframework/web/client/RestTemplate
  	     LineNumberTable LocalVariableTable this 0Lcom/revature/P2API/controller/ArtistController; getArtistByName &(Ljava/lang/String;)Ljava/lang/Object; 
Exceptions $ java/io/IOException RuntimeVisibleAnnotations 8Lorg/springframework/web/bind/annotation/RequestMapping; value 
/name/{id} method 7Lorg/springframework/web/bind/annotation/RequestMethod; GET 6Lorg/springframework/web/bind/annotation/ResponseBody; "RuntimeVisibleParameterAnnotations 6Lorg/springframework/web/bind/annotation/PathVariable; 0 java/lang/StringBuilder 2 ;https://www.theaudiodb.com/api/v1/json/523532/search.php?s=
 / 4  5 (Ljava/lang/String;)V
 / 7 8 9 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 / ; < = toString ()Ljava/lang/String; ? java/lang/String
  A B C getForObject J(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object; E {"artists":null}
 > G H I equals (Ljava/lang/Object;)Z
 > K L M length ()I
 > O P Q 	substring (II)Ljava/lang/String; S 0com/revature/P2API/controller/ArtistController$1
 R U  V 3(Lcom/revature/P2API/controller/ArtistController;)V
  X Y Z 	readValue U(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object; \  com/revature/P2API/models/Artist id Ljava/lang/String; response responseFormatted StackMapTable MethodParameters getArtistById e 3com/fasterxml/jackson/databind/JsonMappingException g 2com/fasterxml/jackson/core/JsonProcessingException /id/{id} j ;https://www.theaudiodb.com/api/v1/json/523532/artist.php?i= l 0com/revature/P2API/controller/ArtistController$2
 k U 
SourceFile ArtistController.java 8Lorg/springframework/web/bind/annotation/RestController; /artist 5Lorg/springframework/web/bind/annotation/CrossOrigin; * InnerClasses !                   	 
           Z      *� *� *� Y� � *� Y� � �              	                      !  "     # %     &  '[ s ( )[ e * + ,   -     .      �     [*� � /Y1� 3+� 6� :>� � @� >M,D� F� *,� � ',,� Jd� NN**� -� RY*� T� W� [� *� �       "    #  $  # ! & * ' 2 + ? , V 0    *    [       [ ] ^  ! : _ ^  ?  ` ^  a   	 � 2 ># b    ]    c !  "     d f %     &  '[ s h )[ e * + ,   -     .      �     [*� � /Yi� 3+� 6� :>� � @� >M,D� F� *,� � ',,� Jd� NN**� -� kY*� m� W� [� *� �       "    :  ;  : ! = * > 2 B ? D V I    *    [       [ ] ^  ! : _ ^  ?  ` ^  a   	 � 2 ># b    ]    n    o %     p   &  '[ s q r  '[ s s t     R       k      PK
    6=UN��I�  �  3   com/revature/P2API/controller/ArtistController.javapackage com.revature.P2API.controller;

import java.io.IOException;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Artist;

@RestController
@RequestMapping("/artist")
@CrossOrigin("*")
public class ArtistController {

	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public ArtistController() {
		this.restTemplate = new RestTemplate();
	}

	@RequestMapping(value = "/name/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getArtistByName(@PathVariable String id) throws IOException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/search.php?s=" + id,
				String.class);

		if (response.equals("{\"artists\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(12, response.length() - 2);
			result = (Artist) mapper.readValue(responseFormatted, new TypeReference<Artist>() {
			});

		}
		return result;
		

	}
	

	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getArtistById(@PathVariable String id)
			throws JsonMappingException, JsonProcessingException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/artist.php?i=" + id,
				String.class);

		if (response.equals("{\"artists\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(12, response.length() - 2);

			result = (Artist) mapper.readValue(responseFormatted, new TypeReference<Artist>() {
			});

		}

		return result;

	}
	
	

}
PK
    L�=UU#��E  E  1   com/revature/P2API/controller/SPAController.class����   4   +com/revature/P2API/controller/SPAController  java/lang/Object <init> ()V Code
  	   LineNumberTable LocalVariableTable this -Lcom/revature/P2API/controller/SPAController; homePage ()Ljava/lang/String; RuntimeVisibleAnnotations 4Lorg/springframework/web/bind/annotation/GetMapping;  index 
SourceFile SPAController.java +Lorg/springframework/stereotype/Controller; !               /     *� �    
                                   -     �    
                                 PK
    r�:UM���P  P  0   com/revature/P2API/controller/SPAController.javapackage com.revature.P2API.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SPAController {
	
	@GetMapping
	public String homePage() {
		return "index";
	}

}
PK
    L�=U	Ȑ�#  #  2   com/revature/P2API/controller/AuthController.class����   4 �  ,com/revature/P2API/controller/AuthController  java/lang/Object authenticationManager CLorg/springframework/security/authentication/AuthenticationManager; RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; userService (Lcom/revature/P2API/service/UserService; jwtTokenUtil *Lcom/revature/P2API/security/JwtTokenUtil; uCon .Lcom/revature/P2API/controller/UserController; <init> ()V Code
     LineNumberTable LocalVariableTable this .Lcom/revature/P2API/controller/AuthController; login K(Lcom/revature/P2API/models/User;)Lorg/springframework/http/ResponseEntity; 	Signature �(Lcom/revature/P2API/models/User;)Lorg/springframework/http/ResponseEntity<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>; 5Lorg/springframework/web/bind/annotation/PostMapping; value "RuntimeVisibleParameterAnnotations 5Lorg/springframework/web/bind/annotation/RequestBody; ! Oorg/springframework/security/authentication/UsernamePasswordAuthenticationToken
 # % $ com/revature/P2API/models/User & ' getUsername ()Ljava/lang/String;
 # ) * ' getPassword
   ,  - '(Ljava/lang/Object;Ljava/lang/Object;)V	  /   1 3 2 Aorg/springframework/security/authentication/AuthenticationManager 4 5 authenticate f(Lorg/springframework/security/core/Authentication;)Lorg/springframework/security/core/Authentication; 7 9 8 0org/springframework/security/core/Authentication : ; getPrincipal ()Ljava/lang/Object; = 2org/springframework/security/core/userdetails/User	  ? 	 

 < %
 B D C &com/revature/P2API/service/UserService E F getByUsername 4(Ljava/lang/String;)Lcom/revature/P2API/models/User;	  H  
 J L K (com/revature/P2API/security/JwtTokenUtil M N generateAccessToken 4(Lcom/revature/P2API/models/User;)Ljava/lang/String;
 J P Q N generateRefreshToken S java/util/HashMap
 R  V access_token X Z Y java/util/Map [ \ put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; ^ refresh_token ` id
 # b c d getId ()J
 f h g java/lang/Long i j toString (J)Ljava/lang/String; l username
 n p o 'org/springframework/http/ResponseEntity q r ok 7()Lorg/springframework/http/ResponseEntity$BodyBuilder; t v u 3org/springframework/http/ResponseEntity$BodyBuilder w x body =(Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity; request  Lcom/revature/P2API/models/User; token QLorg/springframework/security/authentication/UsernamePasswordAuthenticationToken; authentication 2Lorg/springframework/security/core/Authentication; userDetails 4Lorg/springframework/security/core/userdetails/User; user accessToken Ljava/lang/String; refreshToken tokens Ljava/util/Map; LocalVariableTypeTable 5Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>; MethodParameters refresh R(Ljavax/servlet/http/HttpServletRequest;)Lorg/springframework/http/ResponseEntity; �(Ljavax/servlet/http/HttpServletRequest;)Lorg/springframework/http/ResponseEntity<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>; � Authorization � � � %javax/servlet/http/HttpServletRequest � � 	getHeader &(Ljava/lang/String;)Ljava/lang/String; � Bearer 
 � � � java/lang/String � � 
startsWith (Ljava/lang/String;)Z
 � � � � length ()I
 � � � � 	substring (I)Ljava/lang/String;
 J � � � validate
 J � � � getUserName
 B � � � loadUserByUsername O(Ljava/lang/String;)Lorg/springframework/security/core/userdetails/UserDetails;
 n � � r 
badRequest 'Ljavax/servlet/http/HttpServletRequest; authorizationHeader StackMapTable register B(Lcom/revature/P2API/models/User;)Lcom/revature/P2API/models/User;	  �  
 � � � ,com/revature/P2API/controller/UserController � � 
createUser 
SourceFile AuthController.java 8Lorg/springframework/web/bind/annotation/RestController; 8Lorg/springframework/web/bind/annotation/RequestMapping; /auth 5Lorg/springframework/web/bind/annotation/CrossOrigin; * InnerClasses BodyBuilder !                   	 
                                           /     *� �                                        [ s            O  	   ��  Y+� "+� (� +M*� .,� 0 N-� 6 � <:*� >� @� A:*� G� I:*� G� O:� RY� T:U� W W]� W W_� a� e� W Wk� "� W W� m� s �       2    )  *  , & - 4 / ? 0 J 2 S 3 _ 4 k 5 } 6 � :    \ 	   �       � y z   � { |   | } ~  & q  �  4 c � z  ? X � �  J M � �  S D � �  �     S D � �  �    y    � �      �        [ s �   :     �+�� � M,� n,�� �� e,�� �� �N*� G-� �� P*� >*� G-� �� �� <:*� >� @� A:*� G� I:� RY� T:U� W W� m� s �� �� s �       .    ? 	 @  A   B + C ? D M F X H a I m K x O    R    �       � y �  	 y � �    X � �  ? 9  �  M + � z  X   � �  a  � �  �     a  � �  �    � x � �    y    � �         [ s �            =     	*� �+� ��           T        	       	 y z  �    y    �    �      �   �  [ s � �  [ s � �   
  t n �	PK
    �<U/��    1   com/revature/P2API/controller/AuthController.javapackage com.revature.P2API.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.P2API.models.User;
import com.revature.P2API.security.JwtTokenUtil;
import com.revature.P2API.service.UserService;

@RestController
@RequestMapping("/auth")
@CrossOrigin("*")
public class AuthController {
	 @Autowired
	    private AuthenticationManager authenticationManager;

	    @Autowired
	    private UserService userService;

	    @Autowired
	    private JwtTokenUtil jwtTokenUtil;
	    
	    @Autowired UserController uCon;

	    @PostMapping("login")
	    public ResponseEntity<Map<String, String>> login(@RequestBody User request) {
	        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword());
	        Authentication authentication = authenticationManager.authenticate(token);

	        org.springframework.security.core.userdetails.User userDetails = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
	        User user = userService.getByUsername(userDetails.getUsername());

	        String accessToken = jwtTokenUtil.generateAccessToken(user);
	        String refreshToken = jwtTokenUtil.generateRefreshToken(user);

	        Map<String, String> tokens = new HashMap<>();
	        tokens.put("access_token", accessToken);
	        tokens.put("refresh_token", refreshToken);
	        tokens.put("id", Long.toString(user.getId()));
	        tokens.put("username", user.getUsername());
	
	        

	        return ResponseEntity.ok().body(tokens);
	    }

	    @PostMapping("refresh")
	    public ResponseEntity<Map<String, String>> refresh(HttpServletRequest request) {
	        String authorizationHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
	        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
	            String refreshToken = authorizationHeader.substring("Bearer ".length());
	            if (jwtTokenUtil.validate(refreshToken)) {
	                org.springframework.security.core.userdetails.User userDetails = (org.springframework.security.core.userdetails.User) userService.loadUserByUsername(jwtTokenUtil.getUserName(refreshToken));
	                User user = userService.getByUsername(userDetails.getUsername());

	                String accessToken = jwtTokenUtil.generateAccessToken(user);

	                Map<String, String> tokens = new HashMap<>();
	                tokens.put("access_token", accessToken);

	                return ResponseEntity.ok().body(tokens);
	            }
	        }

	        return ResponseEntity.badRequest().body(null);
	    }

	    @PostMapping("register")
	    public User register(@RequestBody User request) {
	        return uCon.createUser(request);
	    }

}
PK
    L�=Uɗ�$  $  5   com/revature/P2API/controller/AlbumController$1.class����   4   /com/revature/P2API/controller/AlbumController$1  -com/fasterxml/jackson/core/type/TypeReference this$0 /Lcom/revature/P2API/controller/AlbumController; <init> 2(Lcom/revature/P2API/controller/AlbumController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 1Lcom/revature/P2API/controller/AlbumController$1; MethodParameters 
SourceFile AlbumController.java 	Signature RLcom/fasterxml/jackson/core/type/TypeReference<Lcom/revature/P2API/models/Album;>; EnclosingMethod  -com/revature/P2API/controller/AlbumController   getAlbumById &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           /        
         �                     
        PK
    L�=U���,  ,  5   com/revature/P2API/controller/AlbumController$2.class����   4   /com/revature/P2API/controller/AlbumController$2  -com/fasterxml/jackson/core/type/TypeReference this$0 /Lcom/revature/P2API/controller/AlbumController; <init> 2(Lcom/revature/P2API/controller/AlbumController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 1Lcom/revature/P2API/controller/AlbumController$2; MethodParameters 
SourceFile AlbumController.java 	Signature SLcom/fasterxml/jackson/core/type/TypeReference<[Lcom/revature/P2API/models/Album;>; EnclosingMethod  -com/revature/P2API/controller/AlbumController   getAlbumsByArtistId &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           E        
         �                     
        PK
    L�=U�XS��  �  3   com/revature/P2API/controller/AlbumController.class����   4 u  -com/revature/P2API/controller/AlbumController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; result Ljava/lang/Object; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
    	      +com/fasterxml/jackson/databind/ObjectMapper
  	   	 
  +org/springframework/web/client/RestTemplate
  	     LineNumberTable LocalVariableTable this /Lcom/revature/P2API/controller/AlbumController; getAlbumById &(Ljava/lang/String;)Ljava/lang/Object; 
Exceptions $ java/io/IOException RuntimeVisibleAnnotations 8Lorg/springframework/web/bind/annotation/RequestMapping; value 
/name/{id} method 7Lorg/springframework/web/bind/annotation/RequestMethod; GET 6Lorg/springframework/web/bind/annotation/ResponseBody; "RuntimeVisibleParameterAnnotations 6Lorg/springframework/web/bind/annotation/PathVariable; 0 java/lang/StringBuilder 2 :https://www.theaudiodb.com/api/v1/json/523532/album.php?m=
 / 4  5 (Ljava/lang/String;)V
 / 7 8 9 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 / ; < = toString ()Ljava/lang/String; ? java/lang/String
  A B C getForObject J(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object; E {"album":null}
 > G H I equals (Ljava/lang/Object;)Z
 > K L M length ()I
 > O P Q 	substring (II)Ljava/lang/String; S /com/revature/P2API/controller/AlbumController$1
 R U  V 2(Lcom/revature/P2API/controller/AlbumController;)V
  X Y Z 	readValue U(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object; \ com/revature/P2API/models/Album id Ljava/lang/String; response responseFormatted StackMapTable MethodParameters getAlbumsByArtistId e 3com/fasterxml/jackson/databind/JsonMappingException g 2com/fasterxml/jackson/core/JsonProcessingException /id/{id} j :https://www.theaudiodb.com/api/v1/json/523532/album.php?i= l /com/revature/P2API/controller/AlbumController$2
 k U o "[Lcom/revature/P2API/models/Album; 
SourceFile AlbumController.java 8Lorg/springframework/web/bind/annotation/RestController; /album InnerClasses !                   	 
           Z      *� *� *� Y� � *� Y� � �              	                       !  "     # %     &  '[ s ( )[ e * + ,   -     .      �     [*� � /Y1� 3+� 6� :>� � @� >M,D� F� *,� � ',
,� Jd� NN**� -� RY*� T� W� [� *� �       "    %  &  % ! ( * ) 2 - ? / V 4    *    [       [ ] ^  ! : _ ^  ?  ` ^  a   	 � 2 ># b    ]    c !  "     d f %     &  '[ s h )[ e * + ,   -     .      �     [*� � /Yi� 3+� 6� :>� � @� >M,D� F� *,� � ',	,� Jd� NN**� -� kY*� m� W� n� *� �       "    <  =  < ! ? * @ 2 C ? E V J    *    [       [ ] ^  ! : _ ^  ?  ` ^  a   	 � 2 ># b    ]    p    q %     r   &  '[ s s t     R       k      PK
    6=Ux��G	  G	  2   com/revature/P2API/controller/AlbumController.javapackage com.revature.P2API.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@RestController
@RequestMapping("/album")
public class AlbumController {

	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public AlbumController() {
		this.restTemplate = new RestTemplate();
	}

	@RequestMapping(value = "/name/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getAlbumById(@PathVariable String id) throws IOException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/album.php?m=" + id,
				String.class);

		if (response.equals("{\"album\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(10, response.length() - 2);

			result = (Album) mapper.readValue(responseFormatted, new TypeReference<Album>() {
			});

		}

		return result;

	}

	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getAlbumsByArtistId(@PathVariable String id)
			throws JsonMappingException, JsonProcessingException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/album.php?i=" + id,
				String.class);

		if (response.equals("{\"album\":null}"))
			result = response;

		else {
			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Album[]) mapper.readValue(responseFormatted, new TypeReference<Album[]>() {
			});

		}

		return result;

	}

}
PK
    L�=U[O/]�  �  7   com/revature/P2API/controller/MusicListController.class����   4 �  1com/revature/P2API/controller/MusicListController  java/lang/Object listService -Lcom/revature/P2API/service/MusicListService; songService (Lcom/revature/P2API/service/SongService; userService (Lcom/revature/P2API/service/UserService; <init> �(Lcom/revature/P2API/service/MusicListService;Lcom/revature/P2API/service/SongService;Lcom/revature/P2API/service/UserService;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	    	    	   	 
 LineNumberTable LocalVariableTable this 3Lcom/revature/P2API/controller/MusicListController; MethodParameters 
createList L(Lcom/revature/P2API/models/MusicList;)Lcom/revature/P2API/models/MusicList; 5Lorg/springframework/web/bind/annotation/PostMapping; value /create "RuntimeVisibleParameterAnnotations 5Lorg/springframework/web/bind/annotation/RequestBody;
 & ( ' +com/revature/P2API/service/MusicListService  ) ((Lcom/revature/P2API/models/MusicList;)V
 + - , #com/revature/P2API/models/MusicList . / getName ()Ljava/lang/String;
  1 2 3 getList 9(Ljava/lang/String;)Lcom/revature/P2API/models/MusicList; list %Lcom/revature/P2API/models/MusicList; list2 addSongToList L(JLjava/lang/String;Ljava/lang/String;)Lcom/revature/P2API/models/MusicList; 
Exceptions ; java/io/IOException 4Lorg/springframework/web/bind/annotation/PutMapping; /{listId}/songs/{trackId} 6Lorg/springframework/web/bind/annotation/PathVariable; 6Lorg/springframework/web/bind/annotation/RequestParam;
 & A B C getListById ((J)Lcom/revature/P2API/models/MusicList;
 E G F &com/revature/P2API/service/SongService H I getSongByTrackId 4(Ljava/lang/String;)Lcom/revature/P2API/models/Song;
 E K L I createSongByTrackId
 + N O P addSong #(Lcom/revature/P2API/models/Song;)V
 & R S  saveList
 U W V com/revature/P2API/models/Song X Y setStrAlbumThumb (Ljava/lang/String;)V
 + [ \ ] getSongs ()Ljava/util/Set; _ a ` java/util/Set b c contains (Ljava/lang/Object;)Z listId J trackId Ljava/lang/String; strAlbumThumb song  Lcom/revature/P2API/models/Song; createdSong StackMapTable addSongsToList 8(Ljava/util/List;J)Lcom/revature/P2API/models/MusicList; 	Signature Z(Ljava/util/List<Lcom/revature/P2API/models/Song;>;J)Lcom/revature/P2API/models/MusicList; /{listId}/manySongs s u t java/util/List v w get (I)Ljava/lang/Object; s y z { size ()I songs Ljava/util/List; i I LocalVariableTypeTable 2Ljava/util/List<Lcom/revature/P2API/models/Song;>; addUserToList )(JJ)Lcom/revature/P2API/models/MusicList; /{listId}/users/{userId}
 � � � &com/revature/P2API/service/UserService � � getUserById #(J)Lcom/revature/P2API/models/User;
 + � � � addUser #(Lcom/revature/P2API/models/User;)V userId user  Lcom/revature/P2API/models/User; 4Lorg/springframework/web/bind/annotation/GetMapping; /list
 & � � 3 getListByName name getUsers ()Ljava/util/List; 9()Ljava/util/List<Lcom/revature/P2API/models/MusicList;>;
 & � � � getlists 
SourceFile MusicListController.java 8Lorg/springframework/web/bind/annotation/RestController; 8Lorg/springframework/web/bind/annotation/RequestMapping; path /lists 5Lorg/springframework/web/bind/annotation/CrossOrigin; * !                 	 
                   l     *� *+� *,� *-� �           '  ( 	 )  *  +    *                        	 
            	               ![ s " #     $      Y     *� +� %*+� *� 0M,�           /  1  3                 4 5    6 5      4    7 8  9     :      <  ![ s = #     >    >    ?          c*� � @:*� -� D:� *� -� J:� M*� � Q�� *� T� Z� ^ � � M*� � Q��       2    B 
 C  E  F # G * H 4 J 9 K @ L O M V N ` Q    H    c       c d e    c f g    c h g  
 Y 4 5   O i j  #  k j  l    � 4 + U+     d   f   h    m n  o    p         ![ s q #     $    >      �     8*�  � @:6� +� r � U� M�+� x ���*� � Q�           W 
 Y  Z   Y . ^    4    8       8 | }    8 d e  
 . 4 5   ! ~   �       8 | �  l   
 �  +    	 |   d    � �       <  ![ s � #     >    >      �     %*� � @:*� !� �:� �*� � Q�           c 
 d  f  g    4    %       % d e    % � e  
  4 5    � �     	 d   �    2 3       �  ![ s � #     ?      M     *� +� �M,�       
    l 	 n                 � g  	  4 5      �    � �  o    �      �      2     *� � ��           s              �    �      �   �  �[ s � �  ![ s �PK
    h=Uu��  �  6   com/revature/P2API/controller/MusicListController.javapackage com.revature.P2API.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.revature.P2API.models.MusicList;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;
import com.revature.P2API.service.MusicListService;
import com.revature.P2API.service.SongService;
import com.revature.P2API.service.UserService;

@RestController
@RequestMapping(path="/lists")
@CrossOrigin("*")
public class MusicListController {
	
	private final MusicListService listService;
	private final SongService songService;
	private final UserService userService;
	
	@Autowired
	public MusicListController(MusicListService listService, SongService songService, UserService userService) {
		super();
		this.listService = listService;
		this.songService = songService;
		this.userService = userService;
	}
	
	@PostMapping("/create")
	public MusicList createList(@RequestBody MusicList list) {
		listService.createList(list);
		
		MusicList list2 = getList(list.getName());
		
		return list2;
	}
	
	/*
	@PutMapping("/{listId}/songs/{songId}")
	public MusicList addSongToList(@PathVariable long listId, @PathVariable long songId) {
		MusicList list = listService.getListById(listId);
		Song song = songService.getSongById(songId);
		
		list.addSong(song);
		return listService.saveList(list);
	}*/
	
	@PutMapping("/{listId}/songs/{trackId}")
	public MusicList addSongToList(@PathVariable long listId, @PathVariable String trackId, @RequestParam String strAlbumThumb) throws IOException {
		MusicList list = listService.getListById(listId);
		Song song = songService.getSongByTrackId(trackId);
		
		if(song == null) {
			Song createdSong = songService.createSongByTrackId(trackId);
			list.addSong(createdSong);
			return listService.saveList(list);
			
		}else if(song != null) {
			song.setStrAlbumThumb(strAlbumThumb);
			if (!list.getSongs().contains(song)) {
				list.addSong(song);
				return listService.saveList(list);
			}
		}
		return list;
	}
	
	@PostMapping("/{listId}/manySongs")
	public MusicList addSongsToList(@RequestBody List<Song> songs,@PathVariable long listId ) {
		
		MusicList list = listService.getListById(listId);
		
		for (int i = 0; i < songs.size(); i++) {
			list.addSong(songs.get(i));
		
		}
		
		return listService.saveList(list);
	}
	
	@PutMapping("/{listId}/users/{userId}")
	public MusicList addUserToList(@PathVariable long listId, @PathVariable long userId) {
		MusicList list = listService.getListById(listId);
		User user = userService.getUserById(userId);
		
		list.addUser(user);
		return listService.saveList(list);
	}
	
	@GetMapping("/list")
	public MusicList getList(@RequestParam String name) {
		MusicList list = listService.getListByName(name);

		return list;
	}
	
	@GetMapping
	public List<MusicList> getUsers() {
		return listService.getlists();
	}
	
	
}
PK
    L�=U<���#  #  4   com/revature/P2API/controller/SongController$1.class����   4   .com/revature/P2API/controller/SongController$1  -com/fasterxml/jackson/core/type/TypeReference this$0 .Lcom/revature/P2API/controller/SongController; <init> 1(Lcom/revature/P2API/controller/SongController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 0Lcom/revature/P2API/controller/SongController$1; MethodParameters 
SourceFile SongController.java 	Signature RLcom/fasterxml/jackson/core/type/TypeReference<[Lcom/revature/P2API/models/Song;>; EnclosingMethod  ,com/revature/P2API/controller/SongController   getSongsByAlbumId &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           F        
         �                     
        PK
    L�=U�L��    4   com/revature/P2API/controller/SongController$2.class����   4   .com/revature/P2API/controller/SongController$2  -com/fasterxml/jackson/core/type/TypeReference this$0 .Lcom/revature/P2API/controller/SongController; <init> 1(Lcom/revature/P2API/controller/SongController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 0Lcom/revature/P2API/controller/SongController$2; MethodParameters 
SourceFile SongController.java 	Signature QLcom/fasterxml/jackson/core/type/TypeReference<Lcom/revature/P2API/models/Song;>; EnclosingMethod  ,com/revature/P2API/controller/SongController   getSongById &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           [        
         �                     
        PK
    L�=U��U�1  1  4   com/revature/P2API/controller/SongController$3.class����   4   .com/revature/P2API/controller/SongController$3  -com/fasterxml/jackson/core/type/TypeReference this$0 .Lcom/revature/P2API/controller/SongController; <init> 1(Lcom/revature/P2API/controller/SongController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 0Lcom/revature/P2API/controller/SongController$3; MethodParameters 
SourceFile SongController.java 	Signature cLcom/fasterxml/jackson/core/type/TypeReference<Ljava/util/List<Lcom/revature/P2API/models/Song;>;>; EnclosingMethod  ,com/revature/P2API/controller/SongController   getSongsByArtist $(Ljava/lang/String;)Ljava/util/List; InnerClasses                  	   4     
*+� 
*� �           �        
         �                     
        PK
    L�=U6+�X,  ,  4   com/revature/P2API/controller/SongController$4.class����   4   .com/revature/P2API/controller/SongController$4  -com/fasterxml/jackson/core/type/TypeReference this$0 .Lcom/revature/P2API/controller/SongController; <init> 1(Lcom/revature/P2API/controller/SongController;)V Code	    
     ()V LineNumberTable LocalVariableTable this 0Lcom/revature/P2API/controller/SongController$4; MethodParameters 
SourceFile SongController.java 	Signature RLcom/fasterxml/jackson/core/type/TypeReference<[Lcom/revature/P2API/models/Song;>; EnclosingMethod  ,com/revature/P2API/controller/SongController   getMusicVideosByArtistName &(Ljava/lang/String;)Ljava/lang/Object; InnerClasses                  	   4     
*+� 
*� �           �        
         �                     
        PK
    L�=U� �UX   X   2   com/revature/P2API/controller/SongController.class����   4/  ,com/revature/P2API/controller/SongController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; result Ljava/lang/Object; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; songService (Lcom/revature/P2API/service/SongService; artistService *Lcom/revature/P2API/service/ArtistService; albumService )Lcom/revature/P2API/service/AlbumService; albumController /Lcom/revature/P2API/controller/AlbumController; <init> �(Lcom/revature/P2API/service/SongService;Lcom/revature/P2API/service/ArtistService;Lcom/revature/P2API/service/AlbumService;Lcom/revature/P2API/controller/AlbumController;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	      +com/fasterxml/jackson/databind/ObjectMapper
  	  ! 	 
	  #  	  %  	  '  	  )   + +org/springframework/web/client/RestTemplate
 * 	  .   LineNumberTable LocalVariableTable this .Lcom/revature/P2API/controller/SongController; MethodParameters getSongsByAlbumId &(Ljava/lang/String;)Ljava/lang/Object; 
Exceptions 8 java/io/IOException 8Lorg/springframework/web/bind/annotation/RequestMapping; value /song/album/{id} method 7Lorg/springframework/web/bind/annotation/RequestMethod; GET 6Lorg/springframework/web/bind/annotation/ResponseBody; "RuntimeVisibleParameterAnnotations 6Lorg/springframework/web/bind/annotation/PathVariable; C java/lang/StringBuilder E :https://www.theaudiodb.com/api/v1/json/523532/track.php?m=
 B G  H (Ljava/lang/String;)V
 B J K L append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 B N O P toString ()Ljava/lang/String; R java/lang/String
 * T U V getForObject J(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object; X {"track":null}
 Q Z [ \ equals (Ljava/lang/Object;)Z
 Q ^ _ ` length ()I
 Q b c d 	substring (II)Ljava/lang/String; f .com/revature/P2API/controller/SongController$1
 e h  i 1(Lcom/revature/P2API/controller/SongController;)V
  k l m 	readValue U(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object; o ![Lcom/revature/P2API/models/Song; id Ljava/lang/String; response responseFormatted StackMapTable getSongById w java/lang/Exception /song/id/{id}	 z | { java/lang/System } ~ out Ljava/io/PrintStream; � TOP OF GETSONGBYID
 � � � java/io/PrintStream � H println � :https://www.theaudiodb.com/api/v1/json/523532/track.php?h= � RESPONSE =  � .com/revature/P2API/controller/SongController$2
 � h � com/revature/P2API/models/Song
 � � � P getIdArtist
 � � � (com/revature/P2API/service/ArtistService � � getArtistByName 6(Ljava/lang/String;)Lcom/revature/P2API/models/Artist; � 	ARTIST = 
  N
 � � � P 
getIdAlbum
 � � � -com/revature/P2API/controller/AlbumController � 5 getAlbumById � com/revature/P2API/models/Album � ALBUM = 
 � � � P getStrAlbumThumb
 � � � H setStrAlbumThumb
  � � � 
createSong #(Lcom/revature/P2API/models/Song;)V artist "Lcom/revature/P2API/models/Artist; album !Lcom/revature/P2API/models/Album; 
updateSong (JLjava/lang/String;)V 4Lorg/springframework/web/bind/annotation/PutMapping; /{id} 6Lorg/springframework/web/bind/annotation/RequestParam;
 � � � &com/revature/P2API/service/SongService � � J strAlbumThumb getSongsByArtist $(Ljava/lang/String;)Ljava/util/List; � 3com/fasterxml/jackson/databind/JsonMappingException � 2com/fasterxml/jackson/core/JsonProcessingException 	Signature F(Ljava/lang/String;)Ljava/util/List<Lcom/revature/P2API/models/Song;>; 4Lorg/springframework/web/bind/annotation/GetMapping; /artist
 � � �  com/revature/P2API/models/Artist
 � � � 'com/revature/P2API/service/AlbumService � � getAlbumsByArtistId
 � � � � getSongsByArtistAlbums "(Ljava/util/List;)Ljava/util/List; � � � java/util/List � � iterator ()Ljava/util/Iterator; � � � java/util/Iterator � � next ()Ljava/lang/Object;
 � � � P getStrArtistThumb � � � � hasNext ()Z � 9https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=
 Q N � {"mvids":null} � Null response �   � .com/revature/P2API/controller/SongController$3
 � h
 � � � P 
getIdTrack
 � � � P getStrMusicVid
 � � � H setStrMusicVid name albums Ljava/util/List; songsWithVids songs song  Lcom/revature/P2API/models/Song; songVid LocalVariableTypeTable 3Ljava/util/List<Lcom/revature/P2API/models/Album;>; 2Ljava/util/List<Lcom/revature/P2API/models/Song;>; getMusicVideosByArtistName /videos/artist .com/revature/P2API/controller/SongController$4
 h 5Lorg/springframework/web/bind/annotation/PostMapping; /create 5Lorg/springframework/web/bind/annotation/RequestBody; START CREATE SONG
 � getAlbumThumb &(Ljava/lang/String;)Ljava/lang/String;
 � � B(Lcom/revature/P2API/models/Song;)Lcom/revature/P2API/models/Song; albumStr 
deleteUser (J)V 7Lorg/springframework/web/bind/annotation/DeleteMapping; /delete/{id}
 � ! deleteSongById getSongs ()Ljava/util/List; 4()Ljava/util/List<Lcom/revature/P2API/models/Song;>;
 �&"# 
SourceFile SongController.java 8Lorg/springframework/web/bind/annotation/RestController; path /songs 5Lorg/springframework/web/bind/annotation/CrossOrigin; * InnerClasses !                   	 
                       	                �     5*� *� *� Y� �  *,� "*+� $*-� &*� (*� *Y� ,� -�    /   & 	   0  ' 	 (  1  2  3 # 4 ) 6 4 7 0   4    5 1 2     5      5      5      5    3                 4 5  6     7      9  :[ s ; <[ e = > ?   @     A      �     [*� -� BYD� F+� I� MQ� � S� QM,W� Y� *,� � ',	,� ]d� aN**�  -� eY*� g� j� n� *� �    /   "    <  =  < ! ? * @ 2 D ? F V K 0   *    [ 1 2     [ p q  ! : r q  ?  s q  t   	 � 2 Q# 3    p    u 5  6     v      9  :[ s x <[ e = > ?   @     A     �     � y� �*� -� BY�� F+� I� MQ� � S� QM� y� BY�� F,� I� M� �,W� Y� *,� � �,
,� ]d� aN**�  -� �Y*� �� j� �� *� "*� � �� �� �:� y� BY�� F� �� I� M� �*� (*� � �� �� �� �:� y� BY�� F� �� I� M� �*� � �� �� �**� � �� �*� � ��    /   B    S  T  U " T ) V ? W H X P Z ] [ t _ � ` � b � d � f � j � o 0   >    � 1 2     � p q  ) � r q  ] � s q  � d � �  � 4 � �  t    � P Q� � 3    p    � �       �  :[ s � @     A    �      L     
*� $-� ��    /   
    u 	 w 0        
 1 2     
 p �    
 � q  3   	 p   �    � �  6     � � �    �      �  :[ s � @     �     �    *� "+� �M*� &,� ʶ �N:*� $-� �:� � :� � � � �:,� � �� � ���*� -� BY� F,� ʶ � I� MQ� � S� Q:� Y� � y� �*� � �	� ]d� a:*�  � �Y*� �� j� �:� � :	� H	� � � �:� � :� &� � � �:
� �
� �� 
� �� �� � ���	� � ����    /   V    | 	 ~    � " � M � g � m � u �  � � � � � � � � � � � � � � � � � � � � � 0   p    1 2     � q  	 � �   � �    �   " �   : 	  u � r q  � q s q  � 9  �  
       � �   �  " �  t   � � .   Q � � � �  �  � L   Q � � � � Q  � 1 
  Q � � � � Q Q  �  �    Q � � � � Q Q � �  �  "� 	 
  Q � � � � Q Q  �  � 	   Q � � � � Q   3    �   	 5  6     � �      �  :[ s
 ?   @     �          y*� "+� �M� y,� ʶ � �*� -� BY� F,� ʶ � I� MQ� � S� QN-W� Y� *-� � )-	-� ]d� a:**�  �Y*�� j� n� *� �    /   * 
   � 	 �  � 0 � 6 � = � F � N � \ � t � 0   4    y 1 2     y p q  	 p � �  = < r q  \  s q  t    � N � Q% 3    p    � �  6     � �       :[ s @          �     .� y� �� y+� �� �*� &+� ��M+,� �*� $+�W�    /       � 	 �  �  � $ � - � 0        . 1 2     .    q  3              :[ s @     A      A     	*� $��    /   
    �  � 0       	 1 2     	 p �  3    p   "#  �   $      �      2     *� $�%�    /       � 0        1 2   '   (     )   9 *[ s+,  :[ s-.   "  e       �       �            PK
    Tl=U5����  �  1   com/revature/P2API/controller/SongController.javapackage com.revature.P2API.controller;

import java.io.IOException;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;
import com.revature.P2API.models.Song;
import com.revature.P2API.service.AlbumService;
import com.revature.P2API.service.ArtistService;
import com.revature.P2API.service.SongService;

@RestController
@RequestMapping(path="/songs")
@CrossOrigin("*")
public class SongController {

	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	private final SongService songService;
	private final ArtistService artistService;
	private final AlbumService albumService;
	private final AlbumController albumController;
	
	@Autowired
	public SongController(SongService songService, ArtistService artistService, AlbumService albumService, AlbumController albumController) {
		this.artistService = artistService;
		this.songService = songService;
		this.albumService = albumService;
		this.albumController = albumController;
		
		this.restTemplate = new RestTemplate();
	}

	@RequestMapping(value = "/song/album/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getSongsByAlbumId(@PathVariable String id) throws IOException {

		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?m=" + id,
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Song[]) mapper.readValue(responseFormatted, new TypeReference<Song[]>() {
			});

		}

		return result;

	}

	@RequestMapping(value = "/song/id/{id}", method = RequestMethod.GET)
	public @ResponseBody Object getSongById(@PathVariable String id)
			throws Exception {

		System.out.println("TOP OF GETSONGBYID");
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?h=" + id,
				String.class);
		System.out.println("RESPONSE = " + response);
		if (response.equals("{\"track\":null}"))
			result = response;
		else {
			String responseFormatted = response.substring(10, response.length() - 2);
			result = (Song) mapper.readValue(responseFormatted, new TypeReference<Song>() {
				
			});

			Artist artist = artistService.getArtistByName( ((Song) result).getIdArtist());
			System.out.println("ARTIST = " + artist.toString());
			
			Album album = (Album) albumController.getAlbumById(((Song) result).getIdAlbum());
			
			System.out.println("ALBUM = " + album.toString());
	
		((Song) result).setStrAlbumThumb(album.getStrAlbumThumb());
		
		
		
		createSong((Song) result);
//		
		}
//		return  (Song) result;
//		}
		return (Song) result;

	}
	
	@PutMapping("/{id}")
	public void updateSong(@PathVariable long id, @RequestParam() String strAlbumThumb) {
		songService.updateSong(id, strAlbumThumb);
		
	}
	
	//http://localhost:8080/songs/artist?name=shakira
	@GetMapping("/artist")
	public List<Song> getSongsByArtist(@RequestParam String name) throws JsonMappingException, JsonProcessingException{
		Artist artist = artistService.getArtistByName(name);
		
		List<Album> albums = albumService.getAlbumsByArtistId(artist.getIdArtist());
		List<Song> songsWithVids = null;
		List<Song> songs = songService.getSongsByArtistAlbums(albums);
		for (Song song : songs) song.setStrAlbumThumb(artist.getStrArtistThumb());
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artist.getIdArtist().toString(),
				String.class);
		
		

		if (response.equals("{\"mvids\":null}")) {
			System.out.println("Null response");
			result = "";

		}else {

			String responseFormatted = response.substring(9, response.length() - 1);

			songsWithVids = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
			});
			

			
			for (Song songVid : songsWithVids) {
				for (Song song : songs) {
//					String thumb = albumService.getAlbumThumb(song.getIdAlbum());
//					System.out.println(thumb);
//					song.setStrAlbumThumb(thumb);
//				
					if (songVid.getIdTrack() == song.getIdTrack()) {
						song.setStrMusicVid(songVid.getStrMusicVid());
						
					}
				}
				
			}

		}
		
		
		
		
		return songs;
	}
	
	@GetMapping("/videos/artist")
	public @ResponseBody Object getMusicVideosByArtistName(@RequestParam String id) throws JsonMappingException, JsonProcessingException{
		Artist artist = artistService.getArtistByName(id);
		
		System.out.println(artist.getIdArtist().toString());
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/mvid.php?i=" + artist.getIdArtist().toString(),
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (Song[]) mapper.readValue(responseFormatted, new TypeReference<Song[]>() {
			});

		}

		return result;

	}
	
	@PostMapping("/create")
	public void createSong(@RequestBody Song song) throws JsonMappingException, JsonProcessingException {
		System.out.println("START CREATE SONG");
		System.out.println(song.toString());
		String albumStr = albumService.getAlbumThumb(song.getIdAlbum());
		song.setStrAlbumThumb(albumStr);
		songService.createSong(song);
	}
	
	
	@DeleteMapping("/delete/{id}")
	public void deleteUser(@PathVariable long id) {
		songService.deleteSongById(id);
	}
	
	@GetMapping
	public List<Song> getSongs() {
		return songService.getSongs();
	}
	
}
PK
    L�=U�k��    *   com/revature/P2API/models/JwtRequest.class����   4 (  $com/revature/P2API/models/JwtRequest  java/lang/Object serialVersionUID J ConstantValueR?�ƈ�� username Ljava/lang/String; password <init> ()V Code
     LineNumberTable LocalVariableTable this &Lcom/revature/P2API/models/JwtRequest; '(Ljava/lang/String;Ljava/lang/String;)V
     setUsername (Ljava/lang/String;)V
     setPassword MethodParameters getUsername ()Ljava/lang/String;	  " 
  getPassword	  %   
SourceFile JwtRequest.java !                
                 3     *� �       
                          Y     *� *+� *,� �              	                    
            	 
              /     *� !�                               >     *+� !�       
                      
       
    #       /     *� $�                               >     *+� $�       
    "  #                           &    'PK
    +<U��=&�  �  )   com/revature/P2API/models/JwtRequest.javapackage com.revature.P2API.models;

public class JwtRequest {
	
private static final long serialVersionUID = 5926468583005150707L;
	
	private String username;
	private String password;
	
	//need default constructor for JSON Parsing
	public JwtRequest()
	{
		
	}

	public JwtRequest(String username, String password) {
		this.setUsername(username);
		this.setPassword(password);
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
PK
    L�=U�%��  �  $   com/revature/P2API/models/Song.class����   4 {  com/revature/P2API/models/Song  java/lang/Object id J RuntimeVisibleAnnotations Ljavax/persistence/Id; "Ljavax/persistence/GeneratedValue; strategy "Ljavax/persistence/GenerationType; SEQUENCE idTrack Ljava/lang/String; idAlbum idArtist strTrack strAlbum 	strArtist intDuration strGenre intTrackNumber strMusicVid Ljavax/persistence/Column; columnDefinition text length �   strAlbumThumb lists Ljava/util/Set; 	Signature 6Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>; -Lcom/fasterxml/jackson/annotation/JsonIgnore; Ljavax/persistence/ManyToMany; mappedBy songs <init> ()V Code
  * & ' LineNumberTable LocalVariableTable this  Lcom/revature/P2API/models/Song; �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Ljava/lang/String;)V �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>;Ljava/lang/String;)V	  2  	  4  	  6  	  8  	  :  	  <  	  >  	  @  	  B  	  D  	  F   LocalVariableTypeTable MethodParameters �(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V �(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>;)V	  L   �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>;)V	  P   �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>;)V getId ()J setId (J)V getStrMusicVid ()Ljava/lang/String; setStrMusicVid (Ljava/lang/String;)V setLists (Ljava/util/Set;)V 9(Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>;)V getStrAlbumThumb setStrAlbumThumb 
getIdTrack 
setIdTrack 
getIdAlbum 
setIdAlbum getIdArtist setIdArtist getStrTrack setStrTrack getStrAlbum setStrAlbum getStrArtist setStrArtist getIntDuration setIntDuration getStrGenre setStrGenre getIntTrackNumber setIntTrackNumber getLists ()Ljava/util/Set; 8()Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>; 
SourceFile 	Song.java 7Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties; ignoreUnknown    Ljavax/persistence/Entity; !                  	  
e                                                           s  I             s  I           !      "   #  $s %   & '  (   3     *� )�    +   
    7  8 ,        - .    & /       0 (       D*� )*+� 1*,� 3*-� 5*� 7*� 9*� ;*� =*� ?*	� A*
� C*� E�    +   6    >  ? 	 @  A  B  C  D % E + F 1 G 7 H = I C K ,   z    D - .     D      D      D      D      D      D      D      D      D   	   D   
   D    G       D  ! 
 H   -                                   & I       J (       E*� )*� K*-� 1*� 3*� 5*� 7*� 9*� ;*	� =*
� ?*� A*� C�    +   6    O  P 	 Q  R  S  T   U & V , W 2 X 8 Y > Z D [ ,   z    E - .     E      E      E      E      E      E      E      E   	   E   
   E      E    G       E  !  H   -                                   & M       N (  2     J*� )*+� 1*,� 3*-� 5*� 7*� 9*� ;*� =*� ?*	� A*
� E*� O*� C�    +   :    c  d 	 e  f  g  h  i % j + k 1 l 7 m = n C p I q ,   �    J - .     J      J      J      J      J      J      J      J      J   	   J   
   J      J    G       J  !  H   1                                      & Q       R (       D*� )*+� 1*,� 3*-� 5*� 7*� 9*� ;*� =*� ?*	� A*
� E*� C�    +   6    x  y 	 z  {  |  }  ~ %  + � 1 � 7 � = � C � ,   z    D - .     D      D      D      D      D      D      D      D      D   	   D   
   D    G       D  !  H   -                                   S T  (   /     *� K�    +       � ,        - .    U V  (   >     *� K�    +   
    �  � ,        - .         H        W X  (   /     *� E�    +       � ,        - .    Y Z  (   >     *+� E�    +   
    �  � ,        - .         H        [ \       ] (   P     *+� C�    +   
    �  � ,        - .         G         !  H        ^ X  (   /     *� O�    +       � ,        - .    _ Z  (   >     *+� O�    +   
    �  � ,        - .         H        ` X  (   /     *� 1�    +       � ,        - .    a Z  (   >     *+� 1�    +   
    �  � ,        - .         H        b X  (   /     *� 3�    +       � ,        - .    c Z  (   >     *+� 3�    +   
    �  � ,        - .         H        d X  (   /     *� 5�    +       � ,        - .    e Z  (   >     *+� 5�    +   
    �  � ,        - .         H        f X  (   /     *� 7�    +       � ,        - .    g Z  (   >     *+� 7�    +   
    �  � ,        - .         H        h X  (   /     *� 9�    +       � ,        - .    i Z  (   >     *+� 9�    +   
    �  � ,        - .         H        j X  (   /     *� ;�    +       � ,        - .    k Z  (   >     *+� ;�    +   
    �  � ,        - .         H        l X  (   /     *� =�    +       � ,        - .    m Z  (   >     *+� =�    +   
    �  � ,        - .         H        n X  (   /     *� ?�    +       � ,        - .    o Z  (   >     *+� ?�    +   
    �  � ,        - .         H        p X  (   /     *� A�    +       � ,        - .    q Z  (   >     *+� A�    +   
    �  � ,        - .         H        r s       t (   /     *� C�    +       � ,        - .    u    v      w  xZ y z  PK
    @(=U3���  �  #   com/revature/P2API/models/Song.javapackage com.revature.P2API.models;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.revature.P2API.models.MusicList;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
public class Song {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	
	private String idTrack;
	
	private String idAlbum;
	
	private String idArtist;
	
	private String strTrack;
	
	private String strAlbum;
	
	private String strArtist;
	
	private String intDuration;
	
	private String strGenre;
	
	private String intTrackNumber;
	
	@Column(columnDefinition="text", length=10485760)
	private String strMusicVid;
	
	@Column(columnDefinition="text", length=10485760)
	private String strAlbumThumb;
	
	
	@JsonIgnore
	@ManyToMany(mappedBy="songs")
    private Set<MusicList> lists;

	
	
	public Song() {
		super();
	}
	
	

	public Song(String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum, String strArtist,
			String intDuration, String strGenre, String intTrackNumber, Set<MusicList> lists, String strMusicVid) {
		super();
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.lists = lists;
		this.strMusicVid = strMusicVid;
		
	}

	public Song(long id, String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum,
			String strArtist, String intDuration, String strGenre, String intTrackNumber, Set<MusicList> lists ) {
		super();
		this.id = id;
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.lists = lists;
	}


	

	public Song(String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum, String strArtist,
			String intDuration, String strGenre, String intTrackNumber, String strMusicVid, String strAlbumThumb,
			 Set<MusicList> lists) {
		super();
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.strMusicVid = strMusicVid;
		this.strAlbumThumb = strAlbumThumb;
		
		this.lists = lists;
	}



	public Song(String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum, String strArtist,
			String intDuration, String strGenre, String intTrackNumber, String strMusicVid,
			Set<MusicList> lists) {
		super();
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.strMusicVid = strMusicVid;
		this.lists = lists;
	}



	
	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}



	public String getStrMusicVid() {
		return strMusicVid;
	}



	public void setStrMusicVid(String strMusicVid) {
		this.strMusicVid = strMusicVid;
	}



	public void setLists(Set<MusicList> lists) {
		this.lists = lists;
	}



	public String getStrAlbumThumb() {
		return strAlbumThumb;
	}



	public void setStrAlbumThumb(String strAlbumThumb) {
		this.strAlbumThumb = strAlbumThumb;
	}



	public String getIdTrack() {
		return idTrack;
	}

	public void setIdTrack(String idTrack) {
		this.idTrack = idTrack;
	}

	public String getIdAlbum() {
		return idAlbum;
	}

	public void setIdAlbum(String idAlbum) {
		this.idAlbum = idAlbum;
	}

	public String getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(String idArtist) {
		this.idArtist = idArtist;
	}

	public String getStrTrack() {
		return strTrack;
	}

	public void setStrTrack(String strTrack) {
		this.strTrack = strTrack;
	}

	public String getStrAlbum() {
		return strAlbum;
	}

	public void setStrAlbum(String strAlbum) {
		this.strAlbum = strAlbum;
	}

	public String getStrArtist() {
		return strArtist;
	}

	public void setStrArtist(String strArtist) {
		this.strArtist = strArtist;
	}

	public String getIntDuration() {
		return intDuration;
	}

	public void setIntDuration(String intDuration) {
		this.intDuration = intDuration;
	}

	public String getStrGenre() {
		return strGenre;
	}

	public void setStrGenre(String strGenre) {
		this.strGenre = strGenre;
	}

	public String getIntTrackNumber() {
		return intTrackNumber;
	}

	public void setIntTrackNumber(String intTrackNumber) {
		this.intTrackNumber = intTrackNumber;
	}
	
	public Set<MusicList> getLists() {
		return lists;
	}

/*
	@Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj.getClass() != this.getClass()) {
            return false;
        }

        final Song other = (Song) obj;
  
        if(!this.idTrack.equals(other.idTrack) && !this.idAlbum.equals(other.idAlbum) &&
        		!this.idArtist.equals(other.idArtist) && !this.strTrack.equals(other.idArtist) &&
        		!this.strAlbum.equals(other.strAlbum) && !this.strArtist.equals(other.strArtist) &&
        		!this.intDuration.equals(other.intDuration) && !this.strGenre.equals(other.strGenre) &&
        		!this.intTrackNumber.equals(other.intTrackNumber) && !this.strMusicVid.equals(other.strMusicVid) &&
        		!this.strDescriptionEN.equals(other.strDescriptionEN)) {
        	return false;
        }

        return true;
    }	
*/
}
PK
    L�=U3�    %   com/revature/P2API/models/Album.class����   4 U  com/revature/P2API/models/Album  java/lang/Object idAlbum Ljava/lang/String; idArtist strAlbum 	strArtist intYearReleased strStyle strGenre strLabel strReleaseFormat strAlbumThumb intScore strMood <init> ()V Code
     LineNumberTable LocalVariableTable this !Lcom/revature/P2API/models/Album; �(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V	    	    	  !  	  # 	 	  % 
 	  '  	  )  	  +  	  -  	  /  	  1  	  3   MethodParameters 
getIdAlbum ()Ljava/lang/String; 
setIdAlbum (Ljava/lang/String;)V getIdArtist setIdArtist getStrAlbum setStrAlbum getStrArtist setStrArtist getIntYearReleased setIntYearReleased getStrStyle setStrStyle getStrGenre setStrGenre getStrLabel setStrLabel getStrReleaseFormat setStrReleaseFormat getStrAlbumThumb setStrAlbumThumb getIntScore setIntScore 
getStrMood 
setStrMood 
SourceFile 
Album.java RuntimeVisibleAnnotations 7Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties; ignoreUnknown    !                      	     
                                               3     *� �       
    "  #                         J*� *+� *,� *-�  *� "*� $*� &*� (*� **	� ,*
� .*� 0*� 2�       :    *  + 	 ,  -  .  /  0 % 1 + 2 1 3 7 4 = 5 C 6 I 7    �    J       J      J      J      J 	     J 
     J      J      J      J   	   J   
   J      J    4   1          	   
                         5 6     /     *� �           <              7 8     >     *+� �       
    @  A                   4        9 6     /     *� �           D              : 8     >     *+� �       
    H  I                   4        ; 6     /     *�  �           L              < 8     >     *+�  �       
    P  Q                   4        = 6     /     *� "�           T              > 8     >     *+� "�       
    X  Y                	   4    	    ? 6     /     *� $�           \              @ 8     >     *+� $�       
    `  a                
   4    
    A 6     /     *� &�           d              B 8     >     *+� &�       
    h  i                   4        C 6     /     *� (�           l              D 8     >     *+� (�       
    p  q                   4        E 6     /     *� *�           t              F 8     >     *+� *�       
    x  y                   4        G 6     /     *� ,�           |              H 8     >     *+� ,�       
    �  �                   4        I 6     /     *� .�           �              J 8     >     *+� .�       
    �  �                   4        K 6     /     *� 0�           �              L 8     >     *+� 0�       
    �  �                   4        M 6     /     *� 2�           �              N 8     >     *+� 2�       
    �  �                   4        O    P Q     R  SZ TPK
    @[=U+Jۭ�  �  $   com/revature/P2API/models/Album.javapackage com.revature.P2API.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Album {
	
	private String idAlbum;
	
	private String idArtist;
	
	private String strAlbum;
	
	private String strArtist;
	
	private String intYearReleased;
	
	private String strStyle;
	
	private String strGenre;
	
	private String strLabel;
	
	private String strReleaseFormat;
	
	private String strAlbumThumb;
	
	private String intScore;
	
	private String strMood;
	

	public Album() {
		super();
	}
	
	

	public Album(String idAlbum, String idArtist, String strAlbum, String strArtist, String intYearReleased,
			String strStyle, String strGenre, String strLabel, String strReleaseFormat, String strAlbumThumb,
			 String intScore, String strMood) {
		super();
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intYearReleased = intYearReleased;
		this.strStyle = strStyle;
		this.strGenre = strGenre;
		this.strLabel = strLabel;
		this.strReleaseFormat = strReleaseFormat;
		this.strAlbumThumb = strAlbumThumb;
		this.intScore = intScore;
		this.strMood = strMood;
	}



	public String getIdAlbum() {
		return idAlbum;
	}

	public void setIdAlbum(String idAlbum) {
		this.idAlbum = idAlbum;
	}

	public String getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(String idArtist) {
		this.idArtist = idArtist;
	}

	public String getStrAlbum() {
		return strAlbum;
	}

	public void setStrAlbum(String strAlbum) {
		this.strAlbum = strAlbum;
	}

	public String getStrArtist() {
		return strArtist;
	}

	public void setStrArtist(String strArtist) {
		this.strArtist = strArtist;
	}

	public String getIntYearReleased() {
		return intYearReleased;
	}

	public void setIntYearReleased(String intYearReleased) {
		this.intYearReleased = intYearReleased;
	}

	public String getStrStyle() {
		return strStyle;
	}

	public void setStrStyle(String strStyle) {
		this.strStyle = strStyle;
	}

	public String getStrGenre() {
		return strGenre;
	}

	public void setStrGenre(String strGenre) {
		this.strGenre = strGenre;
	}

	public String getStrLabel() {
		return strLabel;
	}

	public void setStrLabel(String strLabel) {
		this.strLabel = strLabel;
	}

	public String getStrReleaseFormat() {
		return strReleaseFormat;
	}

	public void setStrReleaseFormat(String strReleaseFormat) {
		this.strReleaseFormat = strReleaseFormat;
	}

	public String getStrAlbumThumb() {
		return strAlbumThumb;
	}

	public void setStrAlbumThumb(String strAlbumThumb) {
		this.strAlbumThumb = strAlbumThumb;
	}

	public String getIntScore() {
		return intScore;
	}

	public void setIntScore(String intScore) {
		this.intScore = intScore;
	}

	public String getStrMood() {
		return strMood;
	}

	public void setStrMood(String strMood) {
		this.strMood = strMood;
	}
	
	
	

}
PK
    L�=U5�E|�  �  )   com/revature/P2API/models/MusicList.class����   4 j  #com/revature/P2API/models/MusicList  java/lang/Object id J RuntimeVisibleAnnotations Ljavax/persistence/Id; "Ljavax/persistence/GeneratedValue; strategy "Ljavax/persistence/GenerationType; SEQUENCE name Ljava/lang/String; songs Ljava/util/Set; 	Signature 1Ljava/util/Set<Lcom/revature/P2API/models/Song;>; Ljavax/persistence/ManyToMany; Ljavax/persistence/JoinTable; 	list_song joinColumns Ljavax/persistence/JoinColumn; list_id inverseJoinColumns song_id user  Lcom/revature/P2API/models/User; Ljavax/persistence/ManyToOne; cascade Ljavax/persistence/CascadeType; ALL user_id referencedColumnName <init> ()V Code
  ' # $ LineNumberTable LocalVariableTable this %Lcom/revature/P2API/models/MusicList; (Ljava/lang/String;)V	  .   MethodParameters (JLjava/lang/String;)V	  2   D(Ljava/lang/String;Ljava/util/Set;Lcom/revature/P2API/models/User;)V f(Ljava/lang/String;Ljava/util/Set<Lcom/revature/P2API/models/Song;>;Lcom/revature/P2API/models/User;)V	  6  	  8   LocalVariableTypeTable 5(Ljava/lang/String;Lcom/revature/P2API/models/User;)V getId ()J setId (J)V getName ()Ljava/lang/String; setName getSongs ()Ljava/util/Set; 3()Ljava/util/Set<Lcom/revature/P2API/models/Song;>; addSong #(Lcom/revature/P2API/models/Song;)V H J I java/util/Set K L add (Ljava/lang/Object;)Z song  Lcom/revature/P2API/models/Song; getUser "()Lcom/revature/P2API/models/User; addUser #(Lcom/revature/P2API/models/User;)V toString U java/lang/StringBuilder W 	List [id=
 T Y # ,
 T [ \ ] append (J)Ljava/lang/StringBuilder; _ , name=
 T a \ b -(Ljava/lang/String;)Ljava/lang/StringBuilder; d ]
 T f S @ 
SourceFile MusicList.java Ljavax/persistence/Entity; !                  	  
e                    -       s  [ @   s  [ @   s             [ e      s ! "s    # $  %   3     *� &�    (   
    '  ( )        * +    # ,  %   F     
*� &*+� -�    (       +  , 	 - )       
 * +     
    /        # 0  %   Y     *� &*� 1*-� -�    (       0  1 	 2  3 )         * +               /   	        # 3      4 %   ~     *� &*+� -*,� 5*-� 7�    (       8  9 	 :  ;  < )   *     * +                     9           /              # :  %   Y     *� &*+� -*,� 7�    (       ?  @ 	 A  B )         * +               /   	        ; <  %   /     *� 1�    (       E )        * +    = >  %   >     *� 1�    (   
    I  J )        * +         /        ? @  %   /     *� -�    (       M )        * +    A ,  %   >     *+� -�    (   
    Q  R )        * +         /        B C      D %   /     *� 5�    (       U )        * +    E F  %   D     *� 5+� G W�    (   
    _  ` )        * +      M N  /    M    O P  %   /     *� 7�    (       c )        * +    Q R  %   >     *+� 7�    (   
    m  n )        * +         /        S @  %   O     %� TYV� X*� 1� Z^� `*� -� `c� `� e�    (       s )       % * +    g    h      i  PK
     <UJ���    (   com/revature/P2API/models/MusicList.javapackage com.revature.P2API.models;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.revature.P2API.models.Song;

import javax.persistence.JoinColumn;

@Entity
public class MusicList {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	private String name;
	
	@ManyToMany
	@JoinTable(
			name="list_song",
			joinColumns = @JoinColumn(name="list_id"),
			inverseJoinColumns = @JoinColumn(name="song_id")		
	)
    private Set<Song> songs;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id", referencedColumnName="id")
	private User user;
	

	public MusicList() {
		super();
	}

	public MusicList(String name) {
		super();
		this.name = name;
	}

	public MusicList(long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	

	public MusicList(String name, Set<Song> songs, User user) {
		super();
		this.name = name;
		this.songs = songs;
		this.user = user;
	}

	public MusicList(String name, User user) {
		super();
		this.name = name;
		this.user = user;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Set<Song> getSongs() {
		return songs;
	}

	/*
	public void setSongs(Set<Song> songs) {
		this.songs = songs;
	}
	*/
	
	public void addSong(Song song) {
		songs.add(song);
	}
	
	public User getUser() {
		return user;
	}

	/*
	public void setUser(User user) {
		this.user = user;
	}*/
	
	
	public void addUser(User user) {
		this.user = user;
	}
	

	@Override
	public String toString() {
		return "List [id=" + id + ", name=" + name + "]";
	}	
	
}
PK
    L�=U�d��X	  X	  $   com/revature/P2API/models/User.class����   4 X  com/revature/P2API/models/User  java/lang/Object id J RuntimeVisibleAnnotations Ljavax/persistence/Id; "Ljavax/persistence/GeneratedValue; strategy "Ljavax/persistence/GenerationType; SEQUENCE username Ljava/lang/String; password lists Ljava/util/Set; 	Signature 6Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>; -Lcom/fasterxml/jackson/annotation/JsonIgnore; Ljavax/persistence/OneToMany; mappedBy user cascade Ljavax/persistence/CascadeType; ALL <init> ()V Code
     LineNumberTable LocalVariableTable this  Lcom/revature/P2API/models/User; '(Ljava/lang/String;Ljava/lang/String;)V	  &  	  (   MethodParameters ((JLjava/lang/String;Ljava/lang/String;)V	  ,   getId ()J setId (J)V getUsername ()Ljava/lang/String; setUsername (Ljava/lang/String;)V getPassword setPassword getLists ()Ljava/util/Set; 8()Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>;	  ;   toString > java/lang/StringBuilder @ 	User [id=
 = B  4
 = D E F append (J)Ljava/lang/StringBuilder; H , username=
 = J E K -(Ljava/lang/String;)Ljava/lang/StringBuilder; M , password= O ]
 = Q < 2 
SourceFile 	User.java Ljavax/persistence/Entity; Ljavax/persistence/Table; name users !                  	  
e                                s  [ e           3     *� �        
       !        " #     $     Y     *� *+� %*,� '�            #  $ 	 %  & !         " #               )   	         *     m     *� *� +*-� %*� '�            )  * 	 +  ,  - !   *     " #                     )              - .     /     *� +�            1 !        " #    / 0     >     *� +�        
    6  7 !        " #         )        1 2     /     *� %�            ; !        " #    3 4     >     *+� %�        
    @  A !        " #         )        5 2     /     *� '�            E !        " #    6 4     >     *+� '�        
    J  K !        " #         )        7 8      9    /     *� :�            N !        " #    < 2     [     1� =Y?� A*� +� CG� I*� %� IL� I*� '� IN� I� P�            X !       1 " #    R    S      T   U  Vs WPK
    &Y=U��.}  }  #   com/revature/P2API/models/User.javapackage com.revature.P2API.models;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	private String username;
	private String password;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private Set<MusicList> lists;
	
	
	public User() {
		super();
	}


	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public User(long id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

	public Set<MusicList> getLists() {
		return lists;
	}

	/*
	public void setLists(Set<MusicList> lists) {
		this.lists = lists;
	}
	*/
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + "]";
	}
	
	
}PK
    L�=Umz�    &   com/revature/P2API/models/Artist.class����   4 k   com/revature/P2API/models/Artist  java/lang/Object idArtist Ljava/lang/String; 	strArtist strLabel intFormedYear strStyle strGenre strMood 
strWebsite strBiographyEN 
intMembers Ljava/lang/Integer; 
strCountry strCountryCode strArtistThumb strArtistLogo strArtistBanner strLastFMChart <init> ()V Code
     LineNumberTable LocalVariableTable this "Lcom/revature/P2API/models/Artist; (Ljava/lang/String;)V	  "   MethodParameters getIdArtist ()Ljava/lang/String;	  '   setIdArtist getStrArtist setStrArtist getStrLabel	  -   setStrLabel getIntFormedYear	  1 	  setIntFormedYear getStrStyle	  5 
  setStrStyle getStrGenre	  9   setStrGenre 
getStrMood	  =   
setStrMood getStrWebsite	  A   setStrWebsite getStrBiographyEN	  E   setStrBiographyEN getIntMembers ()Ljava/lang/Integer;	  J   setIntMembers (Ljava/lang/Integer;)V getStrCountry	  O   setStrCountry getStrCountryCode	  S   setStrCountryCode getStrArtistThumb	  W   setStrArtistThumb getStrArtistLogo	  [   setStrArtistLogo getStrArtistBanner	  _   setStrArtistBanner getStrLastFMChart	  c   setStrLastFMChart 
SourceFile Artist.java RuntimeVisibleAnnotations 7Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties; ignoreUnknown    !                      	     
                                                           "        3     *� �       
    ,  -                     F     
*� *+� !�           /  0 	 1        
       
    #        $ %     /     *� &�           4              (       >     *+� &�       
    8  9                   #        ) %     /     *� !�           <              *       >     *+� !�       
    @  A                   #        + %     /     *� ,�           D              .       >     *+� ,�       
    H  I                   #        / %     /     *� 0�           L              2       >     *+� 0�       
    P  Q                	   #    	    3 %     /     *� 4�           T              6       >     *+� 4�       
    X  Y                
   #    
    7 %     /     *� 8�           \              :       >     *+� 8�       
    `  a                   #        ; %     /     *� <�           d              >       >     *+� <�       
    h  i                   #        ? %     /     *� @�           l              B       >     *+� @�       
    p  q                   #        C %     /     *� D�           t              F       >     *+� D�       
    x  y                   #        G H     /     *� I�           |              K L     >     *+� I�       
    �  �                   #        M %     /     *� N�           �              P       >     *+� N�       
    �  �                   #        Q %     /     *� R�           �              T       >     *+� R�       
    �  �                   #        U %     /     *� V�           �              X       >     *+� V�       
    �  �                   #        Y %     /     *� Z�           �              \       >     *+� Z�       
    �  �                   #        ] %     /     *� ^�           �              `       >     *+� ^�       
    �  �                   #        a %     /     *� b�           �              d       >     *+� b�       
    �  �                   #        e    f g     h  iZ jPK
    <U����Z  Z  %   com/revature/P2API/models/Artist.javapackage com.revature.P2API.models;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Artist {
	
	private String idArtist;
	
	private String strArtist;
	
	private String strLabel;
	
	private String intFormedYear;
	
	private String strStyle;
	
	private String strGenre;
	
	private String strMood;
	
	private String strWebsite;
	
	private String strBiographyEN;
	
	private Integer intMembers;
	
	private String strCountry; 
	
	private String strCountryCode;
	
	private String strArtistThumb;
	
	private String strArtistLogo;
	
	private String strArtistBanner;
	
	private String strLastFMChart;

	public Artist() {
		super();
	}

	public Artist(String strArtist) {
		this.strArtist = strArtist;
	}

	public String getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(String idArtist) {
		this.idArtist = idArtist;
	}

	public String getStrArtist() {
		return strArtist;
	}

	public void setStrArtist(String strArtist) {
		this.strArtist = strArtist;
	}

	public String getStrLabel() {
		return strLabel;
	}

	public void setStrLabel(String strLabel) {
		this.strLabel = strLabel;
	}

	public String getIntFormedYear() {
		return intFormedYear;
	}

	public void setIntFormedYear(String intFormedYear) {
		this.intFormedYear = intFormedYear;
	}

	public String getStrStyle() {
		return strStyle;
	}

	public void setStrStyle(String strStyle) {
		this.strStyle = strStyle;
	}

	public String getStrGenre() {
		return strGenre;
	}

	public void setStrGenre(String strGenre) {
		this.strGenre = strGenre;
	}

	public String getStrMood() {
		return strMood;
	}

	public void setStrMood(String strMood) {
		this.strMood = strMood;
	}

	public String getStrWebsite() {
		return strWebsite;
	}

	public void setStrWebsite(String strWebsite) {
		this.strWebsite = strWebsite;
	}

	public String getStrBiographyEN() {
		return strBiographyEN;
	}

	public void setStrBiographyEN(String strBiographyEN) {
		this.strBiographyEN = strBiographyEN;
	}

	public Integer getIntMembers() {
		return intMembers;
	}

	public void setIntMembers(Integer intMembers) {
		this.intMembers = intMembers;
	}

	public String getStrCountry() {
		return strCountry;
	}

	public void setStrCountry(String strCountry) {
		this.strCountry = strCountry;
	}

	public String getStrCountryCode() {
		return strCountryCode;
	}

	public void setStrCountryCode(String strCountryCode) {
		this.strCountryCode = strCountryCode;
	}

	public String getStrArtistThumb() {
		return strArtistThumb;
	}

	public void setStrArtistThumb(String strArtistThumb) {
		this.strArtistThumb = strArtistThumb;
	}

	public String getStrArtistLogo() {
		return strArtistLogo;
	}

	public void setStrArtistLogo(String strArtistLogo) {
		this.strArtistLogo = strArtistLogo;
	}

	public String getStrArtistBanner() {
		return strArtistBanner;
	}

	public void setStrArtistBanner(String strArtistBanner) {
		this.strArtistBanner = strArtistBanner;
	}

	public String getStrLastFMChart() {
		return strLastFMChart;
	}

	public void setStrLastFMChart(String strLastFMChart) {
		this.strLastFMChart = strLastFMChart;
	}

	
	
	
	
	
	
	

}
PK
    L�=U���wT  T  +   com/revature/P2API/models/JwtResponse.class����   4   %com/revature/P2API/models/JwtResponse  java/lang/Object serialVersionUID J ConstantValue���֨t� jwttoken Ljava/lang/String; <init> (Ljava/lang/String;)V Code
     ()V	   
  LineNumberTable LocalVariableTable this 'Lcom/revature/P2API/models/JwtResponse; MethodParameters getToken ()Ljava/lang/String; 
SourceFile JwtResponse.java !                
            F     
*� *+� �             	 	 
        
       
 
       
          /     *� �                             PK
    +<U+c8  8  *   com/revature/P2API/models/JwtResponse.javapackage com.revature.P2API.models;

public class JwtResponse {
	
	private static final long serialVersionUID = -8091879091924046844L;
	private final String jwttoken;

	public JwtResponse(String jwttoken) {
		this.jwttoken = jwttoken;
	}

	public String getToken() {
		return this.jwttoken;
	}

}
PK
    L�=Um��g)  )  2   com/revature/P2API/repository/UserRepository.class����   4   ,com/revature/P2API/repository/UserRepository  java/lang/Object  5org/springframework/data/jpa/repository/JpaRepository findByUsername 4(Ljava/lang/String;)Lcom/revature/P2API/models/User; username MethodParameters 
SourceFile UserRepository.java 	Signature {Ljava/lang/Object;Lorg/springframework/data/jpa/repository/JpaRepository<Lcom/revature/P2API/models/User;Ljava/lang/Long;>; RuntimeVisibleAnnotations +Lorg/springframework/stereotype/Repository;           
    	                     PK
    +<UƸ�I  I  1   com/revature/P2API/repository/UserRepository.javapackage com.revature.P2API.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.P2API.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

	User findByUsername(String username);
	

}PK
    L�=UFp�*~  ~  7   com/revature/P2API/repository/MusicListRepository.class����   4   1com/revature/P2API/repository/MusicListRepository  java/lang/Object  5org/springframework/data/jpa/repository/JpaRepository 
findByName ((Ljava/lang/String;)Ljava/util/Optional; 	Signature O(Ljava/lang/String;)Ljava/util/Optional<Lcom/revature/P2API/models/MusicList;>; name MethodParameters 
SourceFile MusicListRepository.java �Ljava/lang/Object;Lorg/springframework/data/jpa/repository/JpaRepository<Lcom/revature/P2API/models/MusicList;Ljava/lang/Long;>; RuntimeVisibleAnnotations +Lorg/springframework/stereotype/Repository;           	    
              	            PK
    �<U��a�~  ~  6   com/revature/P2API/repository/MusicListRepository.javapackage com.revature.P2API.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.P2API.models.MusicList;

@Repository
public interface MusicListRepository extends JpaRepository<MusicList, Long>{
	
	Optional<MusicList> findByName(String name);
	
}
PK
    L�=UКBk  k  2   com/revature/P2API/repository/SongRepository.class����   4   ,com/revature/P2API/repository/SongRepository  java/lang/Object  5org/springframework/data/jpa/repository/JpaRepository findByIdTrack ((Ljava/lang/String;)Ljava/util/Optional; 	Signature J(Ljava/lang/String;)Ljava/util/Optional<Lcom/revature/P2API/models/Song;>; id MethodParameters 
SourceFile SongRepository.java {Ljava/lang/Object;Lorg/springframework/data/jpa/repository/JpaRepository<Lcom/revature/P2API/models/Song;Ljava/lang/Long;>; RuntimeVisibleAnnotations +Lorg/springframework/stereotype/Repository;           	    
              	            PK
    a=U�b�    1   com/revature/P2API/repository/SongRepository.javapackage com.revature.P2API.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

//import com.revature.P2API.repository.models.Song;

import com.revature.P2API.models.Song;

@Repository
public interface SongRepository extends JpaRepository<Song, Long>{

	Optional<Song> findByIdTrack(String id);


	
}PK
    L�=Uq�$,Y  Y  3   com/revature/P2API/repository/LoginRepository.class����   4   -com/revature/P2API/repository/LoginRepository  java/lang/Object  5org/springframework/data/jpa/repository/JpaRepository findByUsernameAndPassword :(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Optional; 	Signature \(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Optional<Lcom/revature/P2API/models/User;>; username password MethodParameters findByUsername ((Ljava/lang/String;)Ljava/util/Optional; J(Ljava/lang/String;)Ljava/util/Optional<Lcom/revature/P2API/models/User;>; 
SourceFile LoginRepository.java ~Ljava/lang/Object;Lorg/springframework/data/jpa/repository/JpaRepository<Lcom/revature/P2API/models/User;Ljava/lang/Integer;>; RuntimeVisibleAnnotations +Lorg/springframework/stereotype/Repository;           	    
    	          	                  	            PK
    +<U
�b��  �  2   com/revature/P2API/repository/LoginRepository.javapackage com.revature.P2API.repository;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.P2API.models.User;



@Repository
public interface LoginRepository extends JpaRepository<User, Integer>{

	Optional<User> findByUsernameAndPassword(String username, String password);

	Optional<User> findByUsername(String username);
}
PK
    L�=U����o  o  9   com/revature/P2API/security/JwtAuthenticationFilter.class����   4 �  3com/revature/P2API/security/JwtAuthenticationFilter  3org/springframework/web/filter/OncePerRequestFilter userService (Lcom/revature/P2API/service/UserService; RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; jwtTokenUtil *Lcom/revature/P2API/security/JwtTokenUtil; <init> ()V Code
     LineNumberTable LocalVariableTable this 5Lcom/revature/P2API/security/JwtAuthenticationFilter; doFilterInternal m(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Ljavax/servlet/FilterChain;)V 
Exceptions  javax/servlet/ServletException  java/io/IOException  Authorization     %javax/servlet/http/HttpServletRequest ! " 	getHeader &(Ljava/lang/String;)Ljava/lang/String;
 $ & % $org/springframework/util/StringUtils ' ( 	hasLength (Ljava/lang/String;)Z * Bearer 
 , . - java/lang/String / ( 
startsWith 1 3 2 javax/servlet/FilterChain 4 5 doFilter @(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V 7  
 , 9 : ; split '(Ljava/lang/String;)[Ljava/lang/String;
 , = > ? trim ()Ljava/lang/String;	  A 	 

 C E D (com/revature/P2API/security/JwtTokenUtil F ( validate	  H  
 C J K " getUserName
 M O N &com/revature/P2API/service/UserService P Q loadUserByUsername O(Ljava/lang/String;)Lorg/springframework/security/core/userdetails/UserDetails; S Oorg/springframework/security/authentication/UsernamePasswordAuthenticationToken
 U W V java/util/Optional X Y 
ofNullable ((Ljava/lang/Object;)Ljava/util/Optional;   [ \ ] apply ()Ljava/util/function/Function;
 U _ ` a map 3(Ljava/util/function/Function;)Ljava/util/Optional; c e d java/util/List f g of ()Ljava/util/List;
 U i j k orElse &(Ljava/lang/Object;)Ljava/lang/Object; m java/util/Collection
 R o  p =(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)V r Norg/springframework/security/web/authentication/WebAuthenticationDetailsSource
 q 
 q u v w buildDetails s(Ljavax/servlet/http/HttpServletRequest;)Lorg/springframework/security/web/authentication/WebAuthenticationDetails;
 R y z { 
setDetails (Ljava/lang/Object;)V
 }  ~ ?org/springframework/security/core/context/SecurityContextHolder � � 
getContext =()Lorg/springframework/security/core/context/SecurityContext; � � � 9org/springframework/security/core/context/SecurityContext � � setAuthentication 5(Lorg/springframework/security/core/Authentication;)V request 'Ljavax/servlet/http/HttpServletRequest; response (Ljavax/servlet/http/HttpServletResponse; filterChain Ljavax/servlet/FilterChain; header Ljava/lang/String; token userDetails ;Lorg/springframework/security/core/userdetails/UserDetails; authenticationToken QLorg/springframework/security/authentication/UsernamePasswordAuthenticationToken; StackMapTable MethodParameters 
SourceFile JwtAuthenticationFilter.java *Lorg/springframework/stereotype/Component; BootstrapMethods
 � � � "java/lang/invoke/LambdaMetafactory � � metafactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � k � � � 9org/springframework/security/core/userdetails/UserDetails � � getAuthorities ()Ljava/util/Collection;	 � S(Lorg/springframework/security/core/userdetails/UserDetails;)Ljava/util/Collection; � InnerClasses � %java/lang/invoke/MethodHandles$Lookup � java/lang/invoke/MethodHandles Lookup !                   	 
                  /     *� �                                     h     �+�  :� #� )� +� -+,� 0 �6� 82� <:*� @� B� -+,� 0 �*� G*� @� I� L:� RY� T� Z  � ^� b� h� l� n:� qY� s+� t� x� |� � -+,� 0 �       J    $ 
 %  & $ ' % * 3 + ? , G - H 0 Z 2 ^ 3 ` 4 a 5 w 2 | 8 � : � < � =    R    �       � � �    � � �    � � �  
 � � �  3 l � �  Z E � �  | # � �  �    �  ,� " , �    �   �   �    �    �      �   �     �  � � � �   
  � � � PK
    �<U���,C	  C	  8   com/revature/P2API/security/JwtAuthenticationFilter.javapackage com.revature.P2API.security;

import java.io.IOException;

import java.util.List;
import java.util.Optional;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.revature.P2API.service.UserService;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private UserService userService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        final String header = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (!StringUtils.hasLength(header) || !header.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        final String token = header.split(" ")[1].trim();
        if (!jwtTokenUtil.validate(token)) {
            filterChain.doFilter(request, response);
            return;
        }

        UserDetails userDetails = userService.loadUserByUsername(jwtTokenUtil.getUserName(token));

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                userDetails,
                null,
                Optional.ofNullable(userDetails).map(UserDetails::getAuthorities).orElse(List.of())
        );

        authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

        SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        filterChain.doFilter(request, response);
    }

}
PK
    L�=UŶ���  �  0   com/revature/P2API/security/SecurityConfig.class����   4 �  *com/revature/P2API/security/SecurityConfig  ]org/springframework/security/config/annotation/web/configuration/WebSecurityConfigurerAdapter jwtAuthenticationFilter 5Lcom/revature/P2API/security/JwtAuthenticationFilter; RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; <init> ()V Code
   	 
 LineNumberTable LocalVariableTable this ,Lcom/revature/P2API/security/SecurityConfig; 	configure M(Lorg/springframework/security/config/annotation/web/builders/HttpSecurity;)V 
Exceptions  java/lang/Exception
    Horg/springframework/security/config/annotation/web/builders/HttpSecurity   cors Q()Lorg/springframework/security/config/annotation/web/configurers/CorsConfigurer;
     Morg/springframework/security/config/annotation/web/configurers/CorsConfigurer ! " and B()Lorg/springframework/security/config/annotation/SecurityBuilder;
  $ % & csrf Q()Lorg/springframework/security/config/annotation/web/configurers/CsrfConfigurer;
 ( * ) Morg/springframework/security/config/annotation/web/configurers/CsrfConfigurer + , disable J()Lorg/springframework/security/config/annotation/web/HttpSecurityBuilder;
  . / 0 sessionManagement ^()Lorg/springframework/security/config/annotation/web/configurers/SessionManagementConfigurer;	 2 4 3 >org/springframework/security/config/http/SessionCreationPolicy 5 6 	STATELESS @Lorg/springframework/security/config/http/SessionCreationPolicy;
 8 : 9 Zorg/springframework/security/config/annotation/web/configurers/SessionManagementConfigurer ; < sessionCreationPolicy �(Lorg/springframework/security/config/http/SessionCreationPolicy;)Lorg/springframework/security/config/annotation/web/configurers/SessionManagementConfigurer;
 8  
  ? @ A exceptionHandling ^()Lorg/springframework/security/config/annotation/web/configurers/ExceptionHandlingConfigurer;   C D E commence =()Lorg/springframework/security/web/AuthenticationEntryPoint;
 G I H Zorg/springframework/security/config/annotation/web/configurers/ExceptionHandlingConfigurer J K authenticationEntryPoint �(Lorg/springframework/security/web/AuthenticationEntryPoint;)Lorg/springframework/security/config/annotation/web/configurers/ExceptionHandlingConfigurer;
 G  
  N O P authorizeRequests �()Lorg/springframework/security/config/annotation/web/configurers/ExpressionUrlAuthorizationConfigurer$ExpressionInterceptUrlRegistry; R java/lang/String T /auth/**
 V X W �org/springframework/security/config/annotation/web/configurers/ExpressionUrlAuthorizationConfigurer$ExpressionInterceptUrlRegistry Y Z antMatchers '([Ljava/lang/String;)Ljava/lang/Object; \ qorg/springframework/security/config/annotation/web/configurers/ExpressionUrlAuthorizationConfigurer$AuthorizedUrl
 [ ^ _ P 	permitAll a 	/login/** c /users/create**
 V e f g 
anyRequest ()Ljava/lang/Object;
 [ i j P authenticated	  l   n Torg/springframework/security/web/authentication/UsernamePasswordAuthenticationFilter
  p q r addFilterBefore s(Ljavax/servlet/Filter;Ljava/lang/Class;)Lorg/springframework/security/config/annotation/web/builders/HttpSecurity; http JLorg/springframework/security/config/annotation/web/builders/HttpSecurity; MethodParameters authenticationManagerBean E()Lorg/springframework/security/authentication/AuthenticationManager; -Lorg/springframework/context/annotation/Bean;
  z v w lambda$0 �(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/springframework/security/core/AuthenticationException;)V ~ java/io/IOException � javax/servlet/ServletException	 � � � java/lang/System � � out Ljava/io/PrintStream; � Unauthorized request
 � � � java/io/PrintStream � � println (Ljava/lang/String;)V
 � � � 9org/springframework/security/core/AuthenticationException � � 
getMessage ()Ljava/lang/String; � � � &javax/servlet/http/HttpServletResponse � � 	sendError (ILjava/lang/String;)V request 'Ljavax/servlet/http/HttpServletRequest; response (Ljavax/servlet/http/HttpServletResponse; authException ;Lorg/springframework/security/core/AuthenticationException; 
SourceFile SecurityConfig.java 6Lorg/springframework/context/annotation/Configuration; TLorg/springframework/security/config/annotation/web/configuration/EnableWebSecurity; BootstrapMethods
 � � � "java/lang/invoke/LambdaMetafactory � � metafactory �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � |
  � { | � | InnerClasses � %java/lang/invoke/MethodHandles$Lookup � java/lang/invoke/MethodHandles Lookup � corg/springframework/security/config/annotation/web/configurers/ExpressionUrlAuthorizationConfigurer AuthorizedUrl ExpressionInterceptUrlRegistry !                    	 
     /     *� �                                         �+� � � � #� '� L+� -� 1� 7� =� L+� >� B  � F� L� L+� M� QYSS� U� [� ]� QY`S� U� [� ]� QYbS� U� [� ]� d� [� hW+*� km� oW�       N             $  %   & ! ) # . " 1 ( 7   8 * B + T , f - r . | 0 � 1        �       � s t  u    s    v w             x      /     *� y�           6            
 { |       }     \     � ��� �+�,� �� � �           $  %  &          � �      � �     � �   �    �    
  �   �   �     �  � � � �     � � �  [ � �  V � � PK
    6=U�i�  �  /   com/revature/P2API/security/SecurityConfig.javapackage com.revature.P2API.security;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private JwtAuthenticationFilter jwtAuthenticationFilter;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http = http.cors().and().csrf().disable();

        http = http
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and();

        http = http
                .exceptionHandling()
                .authenticationEntryPoint(
                        ((request, response, authException) -> {
                            System.out.println("Unauthorized request");
                            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, authException.getMessage());
                        })
                )
                .and();

        http.authorizeRequests()
        		.antMatchers("/auth/**").permitAll()
        		.antMatchers("/login/**").permitAll()
        		.antMatchers("/users/create**").permitAll()
                .anyRequest().authenticated();

        http.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

}
PK
    L�=Ur6RV�  �  .   com/revature/P2API/security/JwtTokenUtil.class����   4 �  (com/revature/P2API/security/JwtTokenUtil  java/lang/Object 	jwtSecret Ljava/lang/String; ConstantValue 	 CctlD5JL16m8wLTgsFNhzqjQP 	jwtIssuer  com.revature <init> ()V Code
    	    	   
  LineNumberTable LocalVariableTable this *Lcom/revature/P2API/security/JwtTokenUtil; generateAccessToken 4(Lcom/revature/P2API/models/User;)Ljava/lang/String;
    java/lang/String   ! getBytes ()[B
 # % $ "com/auth0/jwt/algorithms/Algorithm & ' HMAC512 (([B)Lcom/auth0/jwt/algorithms/Algorithm;
 ) + * com/auth0/jwt/JWT , - create $()Lcom/auth0/jwt/JWTCreator$Builder; / %s,%s
 1 3 2 com/revature/P2API/models/User 4 5 getId ()J
 7 9 8 java/lang/Long : ; valueOf (J)Ljava/lang/Long;
 1 = > ? getUsername ()Ljava/lang/String;
  A B C format 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
 E G F  com/auth0/jwt/JWTCreator$Builder H I withSubject 6(Ljava/lang/String;)Lcom/auth0/jwt/JWTCreator$Builder;
 E K L I 
withIssuer N java/util/Date
 P R Q java/lang/System S 5 currentTimeMillis     ��
 M W  X (J)V
 E Z [ \ withExpiresAt 4(Ljava/util/Date;)Lcom/auth0/jwt/JWTCreator$Builder;
 E ^ _ ` sign 8(Lcom/auth0/jwt/algorithms/Algorithm;)Ljava/lang/String; user  Lcom/revature/P2API/models/User; 	algorithm $Lcom/auth0/jwt/algorithms/Algorithm; MethodParameters generateRefreshToken     6� validate (Ljava/lang/String;)Z
 ) l m n decode 9(Ljava/lang/String;)Lcom/auth0/jwt/interfaces/DecodedJWT; p r q #com/auth0/jwt/interfaces/DecodedJWT s t getExpiresAt ()Ljava/util/Date;
 M v w 5 getTime
 y { z java/util/Calendar | } getInstance ()Ljava/util/Calendar;
 7  � 5 	longValue
 y � w t	 P � � � out Ljava/io/PrintStream; � JWT is invalid - {%s}
 � � � "java/lang/IllegalArgumentException � ? 
getMessage
 � � � java/io/PrintStream � � println (Ljava/lang/String;)V token 	expiresAt Ljava/lang/Long; cal Ljava/util/Calendar; e $Ljava/lang/IllegalArgumentException; StackMapTable getUserName &(Ljava/lang/String;)Ljava/lang/String; p � � ? 
getSubject � ,
  � � � split '(Ljava/lang/String;)[Ljava/lang/String; subject 
SourceFile JwtTokenUtil.java RuntimeVisibleAnnotations *Lorg/springframework/stereotype/Component; InnerClasses � com/auth0/jwt/JWTCreator Builder !                
                G     *� *� *� �              
                       �     D� � "M� (.� Y+� 0� 6SY+� <S� @� D� J� MY� O Ta� V� Y,� ]�            	    )  .  ?  C          D       D a b  	 ; c d  e    a    f      �     D� � "M� (.� Y+� 0� 6SY+� <S� @� D� J� MY� O ga� V� Y,� ]�             	 "  # ) $ . % ? & C "         D       D a b  	 ; c d  e    a    i j     �     >+� k� o � u� 6M� xN,� ~-� �� u�� �M� ��� Y,� �S� @� ��    # % �         +  ,  - # . % 0 & 1 < 4    4    >       > �     � �    � �  &  � �  �    e � e    �    � �     U     +� k� � M,�� �2�       
    8 
 :                 �   
 	 �   e    �    �    � �     �   �   
  E � � 	PK
    6=U�$i�  �  -   com/revature/P2API/security/JwtTokenUtil.javapackage com.revature.P2API.security;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.revature.P2API.models.User;

@Component
public class JwtTokenUtil {

    private final String jwtSecret = "CctlD5JL16m8wLTgsFNhzqjQP";
    private final String jwtIssuer = "com.revature";

    public String generateAccessToken(User user) {
        Algorithm algorithm = Algorithm.HMAC512(jwtSecret.getBytes());


        return JWT.create()
                .withSubject(String.format("%s,%s", user.getId(), user.getUsername()))
                .withIssuer(jwtIssuer)
                .withExpiresAt(new Date(System.currentTimeMillis() + 5 * 60 * 1000))
                .sign(algorithm);
    }

    public String generateRefreshToken(User user) {
        Algorithm algorithm = Algorithm.HMAC512(jwtSecret.getBytes());

        return JWT.create()
                .withSubject(String.format("%s,%s", user.getId(), user.getUsername()))
                .withIssuer(jwtIssuer)
                .withExpiresAt(new Date(System.currentTimeMillis() + 60 * 60 * 1000))
                .sign(algorithm);
    }

    public boolean validate(String token) {
        try {
            Long expiresAt = JWT.decode(token).getExpiresAt().getTime();
            Calendar cal = Calendar.getInstance();
            if (expiresAt >= cal.getTime().getTime()) {
                return true;
            }
        } catch (IllegalArgumentException e) {
            System.out.println(String.format("JWT is invalid - {%s}", e.getMessage()));
        }

        return false;
    }

    public String getUserName(String token) {
        String subject = JWT.decode(token).getSubject();

        return subject.split(",")[1];
    }


}
PK
    L�=U��o��  �  -   com/revature/P2API/service/LoginService.class����   4 E  'com/revature/P2API/service/LoginService  java/lang/Object loginRepository /Lcom/revature/P2API/repository/LoginRepository; <init> 2(Lcom/revature/P2API/repository/LoginRepository;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	     LineNumberTable LocalVariableTable this )Lcom/revature/P2API/service/LoginService; MethodParameters login B(Lcom/revature/P2API/models/User;)Lcom/revature/P2API/models/User;
    com/revature/P2API/models/User   getUsername ()Ljava/lang/String;  !   -com/revature/P2API/repository/LoginRepository " # findByUsername ((Ljava/lang/String;)Ljava/util/Optional;
 % ' & java/util/Optional ( ) 	isPresent ()Z
 % + , - get ()Ljava/lang/Object;	 / 1 0 java/lang/System 2 3 out Ljava/io/PrintStream; 5 user not found
 7 9 8 java/io/PrintStream : ; println (Ljava/lang/String;)V user  Lcom/revature/P2API/models/User; Ljava/util/Optional; LocalVariableTypeTable 6Ljava/util/Optional<Lcom/revature/P2API/models/User;>; StackMapTable 
SourceFile LoginService.java (Lorg/springframework/stereotype/Service; !                	     
      F     
*� *+� �              	         
       
                  �     '*� +� �  M,� $� ,� *� �� .4� 6�                  %           '       ' < =     >  ?        @  A    �  %     <    B    C 	     D  PK
    6=UI#ж4  4  ,   com/revature/P2API/service/LoginService.javapackage com.revature.P2API.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P2API.repository.LoginRepository;

import com.revature.P2API.models.User;


@Service
public class LoginService {
	
	private LoginRepository loginRepository;
	
	@Autowired
	public LoginService(LoginRepository loginRepository) {
		this.loginRepository = loginRepository;
	}

	public User login(User user) {
		
		Optional<User> login = loginRepository.findByUsername(user.getUsername());
		
		if(login.isPresent()) {
//			JwtHandler.createJwt(user.getUsername(), "login", "Music", 800000);
			return login.get();
		}else {
			System.out.println("user not found");
			return null;
					}
	}
}
PK
    L�=U���f  f  ,   com/revature/P2API/service/UserService.class����   4 �  &com/revature/P2API/service/UserService  java/lang/Object  @org/springframework/security/core/userdetails/UserDetailsService userRepository .Lcom/revature/P2API/repository/UserRepository; encoder >Lorg/springframework/security/crypto/password/PasswordEncoder; RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; <init> 1(Lcom/revature/P2API/repository/UserRepository;)V Code
     ()V	     LineNumberTable LocalVariableTable this (Lcom/revature/P2API/service/UserService; MethodParameters getUserById #(J)Lcom/revature/P2API/models/User;
    java/lang/Long   ! valueOf (J)Ljava/lang/Long; # % $ ,com/revature/P2API/repository/UserRepository & ' findById ((Ljava/lang/Object;)Ljava/util/Optional;
 ) + * java/util/Optional , - 	isPresent ()Z / java/lang/IllegalStateException 1 java/lang/StringBuilder 3 No user with this id: 
 0 5  6 (Ljava/lang/String;)V
 0 8 9 : append (J)Ljava/lang/StringBuilder;
 0 < = > toString ()Ljava/lang/String;
 . 5
 ) A B C get ()Ljava/lang/Object; E com/revature/P2API/models/User id J user Ljava/util/Optional; LocalVariableTypeTable 6Ljava/util/Optional<Lcom/revature/P2API/models/User;>; StackMapTable 
createUser B(Lcom/revature/P2API/models/User;)Lcom/revature/P2API/models/User;	  P 	 

 D R S > getPassword U W V <org/springframework/security/crypto/password/PasswordEncoder X Y encode ,(Ljava/lang/CharSequence;)Ljava/lang/String;
 D [ \ 6 setPassword # ^ _ ` save &(Ljava/lang/Object;)Ljava/lang/Object;  Lcom/revature/P2API/models/User; getUsers ()Ljava/util/List; 	Signature 4()Ljava/util/List<Lcom/revature/P2API/models/User;>; # g h c findAll deleteUserById (J)V # l m n 
existsById (Ljava/lang/Object;)Z p 3Unable to delete because no user with this id exist # r s t 
deleteById (Ljava/lang/Object;)V isUser Z getByUsername 4(Ljava/lang/String;)Lcom/revature/P2API/models/User; # z { x findByUsername username Ljava/lang/String; getListsNames (J)Ljava/util/List; '(J)Ljava/util/List<Ljava/lang/String;>;
  �  
 D � � � getLists ()Ljava/util/Set; � java/util/ArrayList
 �  � � � java/util/Set � � iterator ()Ljava/util/Iterator; � � � java/util/Iterator � C next � #com/revature/P2API/models/MusicList
 � � � > getName � � � java/util/List � n add � � � - hasNext lists Ljava/util/Set; 
listsNames Ljava/util/List; list %Lcom/revature/P2API/models/MusicList; 6Ljava/util/Set<Lcom/revature/P2API/models/MusicList;>; $Ljava/util/List<Ljava/lang/String;>; 
updateUser (JLjava/lang/String;)V !Ljavax/transaction/Transactional;
 � � � java/util/Objects � � equals '(Ljava/lang/Object;Ljava/lang/Object;)Z password loadUserByUsername O(Ljava/lang/String;)Lorg/springframework/security/core/userdetails/UserDetails; 
Exceptions � Gorg/springframework/security/core/userdetails/UsernameNotFoundException
  � w x � User '%s' not found
 � � � java/lang/String � � format 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
 � 5 � Borg/springframework/security/core/authority/SimpleGrantedAuthority � admin
 � 5 � � � java/util/Collection � 2org/springframework/security/core/userdetails/User
 D � � > getUsername
 � �  � =(Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;)V authorities Ljava/util/Collection; \Ljava/util/Collection<Lorg/springframework/security/core/authority/SimpleGrantedAuthority;>; 
SourceFile UserService.java (Lorg/springframework/stereotype/Service; !            	 
          	                F     
*� *+� �           &  ' 	 *        
       
                  �     5*� � � " N-� (� � .Y� 0Y2� 4� 7� ;� ?�-� @� D�           -  .  / - 2         5       5 F G   ' H I  J      ' H K  L    � - )     F    M N     W     +*� O+� Q� T � Z*� +� ] � D�       
    6  9                H a      H    b c  d    e    4     
*� � f �           =        
      i j     �     **� � � k >� � .Yo� ?�*� � � q �           A  B  C  E ) G         *       * F G    u v  L    �      F    w x     ?     *� +� y �           J                | }      |    ~   d    �    �     G*� �N-� �:� �Y� �:� � :� � � � �:� �� � W� � ����           N  O  P  R - S : R D U    >    G       G F G   A H a   ; � �   2 � �  -  � �  J      ; � �   2 � �  L    � !   D � �  �       F    � �       �      �     [*� � � " :� (� � .Y� 0Y2� 4� 7� ;� ?�-� *� @� D� Q-� �� � @� D*� O-� T � Z�           Z  [  \ / _ E ` Z c    *    [       [ F G    [ � }   L H I  J      L H K  L   	 � / )*    	 F   �    � �  �     �    �     H*+� �M,� � �Y�� Y+S� �� ÿ� �Y� �N-� �YƷ ȹ � W� �Y,� �,� Q-� Ѱ           g  i 
 j  l ' n 7 o    *    H       H | }   B H a  ' ! � �  J     ' ! � �  L    �  D     |    �    �      �  PK
    6=U����I  I  +   com/revature/P2API/service/UserService.javapackage com.revature.P2API.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.revature.P2API.controller.MusicListController;
import com.revature.P2API.models.MusicList;
import com.revature.P2API.models.User;
import com.revature.P2API.repository.LoginRepository;
import com.revature.P2API.repository.UserRepository;

@Service
public class UserService implements UserDetailsService {
	
	private UserRepository userRepository;
	
	@Autowired
	private PasswordEncoder encoder;



	@Autowired
	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	
	
	}

	public User getUserById(long id) {
		Optional<User> user = userRepository.findById(id);
		if(!user.isPresent()) {
			throw new IllegalStateException("No user with this id: "+ id);
		}
		
		return user.get();
	}
	
	public User createUser(User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		
		
		return userRepository.save(user);
	}
	
	public List<User> getUsers() {
		return userRepository.findAll();
	}

	public void deleteUserById(long id) {
		boolean isUser = userRepository.existsById(id);
		if(!isUser){
			throw new IllegalStateException("Unable to delete because no user with this id exist");
		}
		userRepository.deleteById(id);
		
	}
	
	 public User getByUsername(String username) {
	        return userRepository.findByUsername(username);
	    }
	
	public List<String> getListsNames(long id){
		User user = this.getUserById(id);
		Set<MusicList> lists = user.getLists();
		List<String> listsNames = new ArrayList<String>();
	    
		for(MusicList list: lists) {
			listsNames.add(list.getName());
		}
		return listsNames;
	}
	
	@Transactional
	public void updateUser(long id, String password) {
		Optional<User> user = userRepository.findById(id);
		if(!user.isPresent()) {
			throw new IllegalStateException("No user with this id: "+ id);
		}
		
		if(password != null && !Objects.equals(user.get().getPassword(), password)) {
			user.get().setPassword(encoder.encode(password));	
		}
		
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = getByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(String.format("User '%s' not found", username));
        } else {
            Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
           
                authorities.add(new SimpleGrantedAuthority("admin"));
                return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
            }

          
        }
	


	
}PK
    L�=U���    /   com/revature/P2API/service/AlbumService$1.class����   4   )com/revature/P2API/service/AlbumService$1  -com/fasterxml/jackson/core/type/TypeReference this$0 )Lcom/revature/P2API/service/AlbumService; <init> ,(Lcom/revature/P2API/service/AlbumService;)V Code	    
     ()V LineNumberTable LocalVariableTable this +Lcom/revature/P2API/service/AlbumService$1; MethodParameters 
SourceFile AlbumService.java 	Signature dLcom/fasterxml/jackson/core/type/TypeReference<Ljava/util/List<Lcom/revature/P2API/models/Album;>;>; EnclosingMethod  'com/revature/P2API/service/AlbumService   getAlbumsByArtistId $(Ljava/lang/String;)Ljava/util/List; InnerClasses                  	   4     
*+� 
*� �           $        
         �                     
        PK
    L�=U.a�ݒ
  �
  -   com/revature/P2API/service/AlbumService.class����   4 }  'com/revature/P2API/service/AlbumService  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; result Ljava/lang/Object; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
    	      +com/fasterxml/jackson/databind/ObjectMapper
  	   	 
  +org/springframework/web/client/RestTemplate
  	     LineNumberTable LocalVariableTable this )Lcom/revature/P2API/service/AlbumService; getAlbumsByArtistId $(Ljava/lang/String;)Ljava/util/List; 
Exceptions $ 3com/fasterxml/jackson/databind/JsonMappingException & 2com/fasterxml/jackson/core/JsonProcessingException 	Signature G(Ljava/lang/String;)Ljava/util/List<Lcom/revature/P2API/models/Album;>; * java/lang/StringBuilder , :https://www.theaudiodb.com/api/v1/json/523532/album.php?i=
 ) .  / (Ljava/lang/String;)V
 ) 1 2 3 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 ) 5 6 7 toString ()Ljava/lang/String; 9 java/lang/String
  ; < = getForObject J(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object; ? {"album":null}
 8 A B C equals (Ljava/lang/Object;)Z
 8 E F G length ()I
 8 I J K 	substring (II)Ljava/lang/String; M )com/revature/P2API/service/AlbumService$1
 L O  P ,(Lcom/revature/P2API/service/AlbumService;)V
  R S T 	readValue U(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object; V java/util/List artistId Ljava/lang/String; response responseFormatted StackMapTable MethodParameters getAlbumThumb &(Ljava/lang/String;)Ljava/lang/String; ` 6https://theaudiodb.com/api/v1/json/523532/album.php?m= b strAlbumThumb
 8 d e f indexOf (Ljava/lang/String;)I h strAlbumThumbHQ	 j l k java/lang/System m n out Ljava/io/PrintStream;
 p r q java/io/PrintStream s / println albumId start I end 
SourceFile AlbumService.java RuntimeVisibleAnnotations (Lorg/springframework/stereotype/Service; InnerClasses !                   	 
           Z      *� *� *� Y� � *� Y� � �              	                      !  "     # % '    (    �     ^*� � )Y+� -+� 0� 48� � :� 8M,>� @� *,� � ',	,� Dd� HN**� -� LY*� N� Q� U� *� � U�       "         !  *  2 " ? $ V )    *    ^       ^ W X  ! = Y X  ?  Z X  [   	 � 2 8# \    W    ] ^  "     # %    �     I*� � )Y_� -+� 0� 48� � :� 8M,a� c>,g� c6,`d� H:� i� o�       "    -  .  - ! 0 ( 1 0 2 > 3 F 7    >    I       I t X  ! ( Y X  ( ! u v  0  w v  >   X  \    t    x    y z     {   |   
  L      PK
    8[=U����  �  ,   com/revature/P2API/service/AlbumService.javapackage com.revature.P2API.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Album;
import com.revature.P2API.models.Artist;

@Service
public class AlbumService {
	
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public AlbumService() {
		this.restTemplate = new RestTemplate();
	}
	
	public List<Album> getAlbumsByArtistId(String artistId) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/album.php?i=" + artistId,
				String.class);

		if (response.equals("{\"album\":null}"))
			result = response;

		else {
			String responseFormatted = response.substring(9, response.length() - 1);

			result = (List<Album>) mapper.readValue(responseFormatted, new TypeReference<List<Album>>() {
			});

		}
	
		return (List<Album>) result;
	}
	
	public String getAlbumThumb(String albumId) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://theaudiodb.com/api/v1/json/523532/album.php?m=" + albumId,
				String.class);

			int start = response.indexOf("strAlbumThumb");
		    int end = response.indexOf("strAlbumThumbHQ");
			String result = response.substring(start + 16, end - 3);
			System.out.println(result);

		

		return result;
	}
	
}PK
    L�=U��a    .   com/revature/P2API/service/SongService$1.class����   4   (com/revature/P2API/service/SongService$1  -com/fasterxml/jackson/core/type/TypeReference this$0 (Lcom/revature/P2API/service/SongService; <init> +(Lcom/revature/P2API/service/SongService;)V Code	    
     ()V LineNumberTable LocalVariableTable this *Lcom/revature/P2API/service/SongService$1; MethodParameters 
SourceFile SongService.java 	Signature QLcom/fasterxml/jackson/core/type/TypeReference<Lcom/revature/P2API/models/Song;>; EnclosingMethod  &com/revature/P2API/service/SongService   createSongByTrackId 4(Ljava/lang/String;)Lcom/revature/P2API/models/Song; InnerClasses                  	   4     
*+� 
*� �           ;        
         �                     
        PK
    L�=UR��    .   com/revature/P2API/service/SongService$2.class����   4   (com/revature/P2API/service/SongService$2  -com/fasterxml/jackson/core/type/TypeReference this$0 (Lcom/revature/P2API/service/SongService; <init> +(Lcom/revature/P2API/service/SongService;)V Code	    
     ()V LineNumberTable LocalVariableTable this *Lcom/revature/P2API/service/SongService$2; MethodParameters 
SourceFile SongService.java 	Signature cLcom/fasterxml/jackson/core/type/TypeReference<Ljava/util/List<Lcom/revature/P2API/models/Song;>;>; EnclosingMethod  &com/revature/P2API/service/SongService   getSongsByAlbumId $(Ljava/lang/String;)Ljava/util/List; InnerClasses                  	   4     
*+� 
*� �           }        
         �                     
        PK
    L�=U>Se�t  t  ,   com/revature/P2API/service/SongService.class����   4  &com/revature/P2API/service/SongService  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; result Ljava/lang/Object; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; songRepository .Lcom/revature/P2API/repository/SongRepository; albumController /Lcom/revature/P2API/controller/AlbumController; <init> `(Lcom/revature/P2API/repository/SongRepository;Lcom/revature/P2API/controller/AlbumController;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	      +com/fasterxml/jackson/databind/ObjectMapper
  	   	 
  +org/springframework/web/client/RestTemplate
  	  "  	  $  	  &   LineNumberTable LocalVariableTable this (Lcom/revature/P2API/service/SongService; MethodParameters 
createSong B(Lcom/revature/P2API/models/Song;)Lcom/revature/P2API/models/Song; / 1 0 ,com/revature/P2API/repository/SongRepository 2 3 save &(Ljava/lang/Object;)Ljava/lang/Object; 5 com/revature/P2API/models/Song song  Lcom/revature/P2API/models/Song; createSongByTrackId 4(Ljava/lang/String;)Lcom/revature/P2API/models/Song; 
Exceptions < java/io/IOException > java/lang/StringBuilder @ :https://www.theaudiodb.com/api/v1/json/523532/track.php?h=
 = B  C (Ljava/lang/String;)V
 = E F G append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 = I J K toString ()Ljava/lang/String; M java/lang/String
  O P Q getForObject J(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object; S {"track":null}
 L U V W equals (Ljava/lang/Object;)Z
 L Y Z [ length ()I
 L ] ^ _ 	substring (II)Ljava/lang/String; a (com/revature/P2API/service/SongService$1
 ` c  d +(Lcom/revature/P2API/service/SongService;)V
  f g h 	readValue U(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object;
 4 j k K 
getIdAlbum
 m o n -com/revature/P2API/controller/AlbumController p q getAlbumById &(Ljava/lang/String;)Ljava/lang/Object; s com/revature/P2API/models/Album	 u w v java/lang/System x y out Ljava/io/PrintStream; { ALBUM = 
  I
 ~ �  java/io/PrintStream � C println
 r � � K getStrAlbumThumb
 4 � � C setStrAlbumThumb trackId Ljava/lang/String; response responseFormatted album !Lcom/revature/P2API/models/Album; StackMapTable getSongById #(J)Lcom/revature/P2API/models/Song;
 � � � java/lang/Long � � valueOf (J)Ljava/lang/Long; / � � � findById ((Ljava/lang/Object;)Ljava/util/Optional;
 � � � java/util/Optional � � 	isPresent ()Z � java/lang/IllegalStateException � No song with this id: 
 = � F � (J)Ljava/lang/StringBuilder;
 � B
 � � � � get ()Ljava/lang/Object; id J Ljava/util/Optional; LocalVariableTypeTable 6Ljava/util/Optional<Lcom/revature/P2API/models/Song;>; getSongByTrackId / � � � findByIdTrack ((Ljava/lang/String;)Ljava/util/Optional; deleteSongById (J)V / � � W 
existsById � 3Unable to delete because no song with this id exist / � � � 
deleteById (Ljava/lang/Object;)V isUser Z getSongsByArtistAlbums "(Ljava/util/List;)Ljava/util/List; � 3com/fasterxml/jackson/databind/JsonMappingException � 2com/fasterxml/jackson/core/JsonProcessingException 	Signature g(Ljava/util/List<Lcom/revature/P2API/models/Album;>;)Ljava/util/List<Lcom/revature/P2API/models/Song;>; � java/util/ArrayList
 �  � � � java/util/List � � iterator ()Ljava/util/Iterator; � � � java/util/Iterator � � next
 r j
  � � � getSongsByAlbumId $(Ljava/lang/String;)Ljava/util/List; � � � W add � � � � hasNext albums Ljava/util/List; allSongs 
albumSongs 3Ljava/util/List<Lcom/revature/P2API/models/Album;>; 2Ljava/util/List<Lcom/revature/P2API/models/Song;>; F(Ljava/lang/String;)Ljava/util/List<Lcom/revature/P2API/models/Song;>; � :https://www.theaudiodb.com/api/v1/json/523532/track.php?m= � (com/revature/P2API/service/SongService$2
 � c albumId getSongs ()Ljava/util/List; 4()Ljava/util/List<Lcom/revature/P2API/models/Song;>; / � � � findAll 
updateSong (JLjava/lang/String;)V !Ljavax/transaction/Transactional; � No user with this id:  strAlbumThumb 
SourceFile SongService.java (Lorg/springframework/stereotype/Service; InnerClasses !                   	 
             
                �     **� *� *� Y� � *� Y�  � !*+� #*,� %�    '       &   	   '  ( $ ) ) * (        * ) *     *      *    +   	        , -     B     *� #+� . � 4�    '       - (        ) *      6 7  +    6    8 9  :     ;   A     �*� !� =Y?� A+� D� HL� � N� LM,R� T� *,� � ',
,� Xd� \N**� -� `Y*� b� e� 4� *� %*� � 4� i� l� rN� t� =Yz� A-� |� D� H� }*� � 4:*� � 4-� �� �*� #� . � 4�    '   2    2  3  2 ! 5 * 6 2 9 ? ; V @ k B � E � F � G (   >    � ) *     � � �  ! � � �  ?  � �  k ? � �  �  6 7  �   	 � 2 L# +    �    � �     �     5*� #� �� � N-� �� � �Y� =Y�� A� �� H� ��-� �� 4�    '       K  L  M - P (        5 ) *     5 � �   ' 6 �  �      ' 6 �  �    � - � +    �    � 9     �     *� #+� � M,� �� �,� �� 4�    '       T  U  W  Y (         ) *      � �    6 �  �       6 �  �    �  � +    �    � �     �     **� #� �� � >� � �Y�� ��*� #� �� � �    '       ]  ^  _  a ) c (        * ) *     * � �    � �  �    �  +    �    � �  :     � � �    �   K     _� �Y� �M+� � :� C� � � rN*-� ڷ �:� � :� � � � 4:,� � W� � ���� � ���,�    '   "    f  h  i ( j @ k I j S h ] n (   >    _ ) *     _ � �   W � �   5 � �  ( + � �  @ 	 6 7  �        _ � �   W � �  ( + � �  �   H �    � �  �  �     � � r � �  �  � 	   � �  �   +    �    � �  :     � � �    �    �     ^*� !� =Y� A+� D� HL� � N� LM,R� T� *,� � ',	,� Xd� \N**� -� �Y*� � e� е *� � а    '   "    s  t  s ! v * w 2 { ? } V � (   *    ^ ) *     ^ � �  ! = � �  ?  � �  �   	 � 2 L# +    �    � �  �    �    4     
*� #� � �    '       � (       
 ) *    � �       �      �     <*� #� �� � :� �� � �Y� =Y�� A� �� H� ��� �� 4-� ��    '       �  �  � / � ; � (   *    < ) *     < � �    < � �   - 6 �  �      - 6 �  �    � / � +   	 �   �    �    �             `       �      PK
    �h=US؅C�  �  +   com/revature/P2API/service/SongService.javapackage com.revature.P2API.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.revature.P2API.repository.SongRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.models.Album;
//import com.revature.P2API.repository.models.Song;
import com.revature.P2API.models.Song;
import com.revature.P2API.models.User;

@Service
public class SongService {
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();
	
	final private SongRepository songRepository;
	
	final private AlbumController albumController;

	@Autowired
	public SongService(SongRepository songRepository, AlbumController albumController) {
		super();
		this.restTemplate = new RestTemplate();
		this.songRepository = songRepository;
		this.albumController = albumController;
	}
	
	public Song createSong(Song song) {
		return songRepository.save(song);
		
	}
	
	public Song createSongByTrackId(String trackId) throws IOException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?h=" + trackId,
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {
			String responseFormatted = response.substring(10, response.length() - 2);

			result = (Song) mapper.readValue(responseFormatted, new TypeReference<Song>() {
			});

		}
		
		Album album = (Album) albumController.getAlbumById(((Song) result).getIdAlbum());
		
		System.out.println("ALBUM = " + album.toString());

		
		Song song = (Song) result;
		((Song) result).setStrAlbumThumb(album.getStrAlbumThumb());
		return songRepository.save(song);
	}
	
	public Song getSongById(long id) {
		Optional<Song> song = songRepository.findById(id);
		if(!song.isPresent()) {
			throw new IllegalStateException("No song with this id: "+ id);
			//return null;
		}
		return song.get();
	}
	
	public Song getSongByTrackId(String id) {
		Optional<Song> song = songRepository.findByIdTrack(id);
		if(!song.isPresent()) {
			//throw new IllegalStateException("No song with this id: "+ id);
			return null;
		}
		return song.get();
	}
	
	public void deleteSongById(long id) {
		boolean isUser = songRepository.existsById(id);
		if(!isUser){
			throw new IllegalStateException("Unable to delete because no song with this id exist");
		}
		songRepository.deleteById(id);
		
	}
	
	public List<Song> getSongsByArtistAlbums(List<Album> albums) throws JsonMappingException, JsonProcessingException{
		List<Song> allSongs = new ArrayList<Song>();
		
		for(Album album: albums) {
			List<Song> albumSongs = this.getSongsByAlbumId(album.getIdAlbum());
			for(Song song : albumSongs) {
				allSongs.add(song);
			}
		}
		return allSongs;
	}
	
	private List<Song> getSongsByAlbumId(String albumId) throws JsonMappingException, JsonProcessingException {
		
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/track.php?m=" + albumId,
				String.class);

		if (response.equals("{\"track\":null}"))
			result = response;

		else {

			String responseFormatted = response.substring(9, response.length() - 1);

			result = (List<Song>) mapper.readValue(responseFormatted, new TypeReference<List<Song>>() {
			});

		}
		return (List<Song>) result;
	}

	public List<Song> getSongs() {
		return songRepository.findAll();
	}

	
	@Transactional
	public void updateSong(long id, String strAlbumThumb) {
		Optional<Song> song = songRepository.findById(id);
		if(!song.isPresent()) {
			throw new IllegalStateException("No user with this id: "+ id);
		}
	
		song.get().setStrAlbumThumb(strAlbumThumb);	
		
		
	}

	
	
}PK
    L�=U�l�hN
  N
  1   com/revature/P2API/service/MusicListService.class����   4 g  +com/revature/P2API/service/MusicListService  java/lang/Object listRepository 3Lcom/revature/P2API/repository/MusicListRepository; <init> 6(Lcom/revature/P2API/repository/MusicListRepository;)V RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; Code
     ()V	     LineNumberTable LocalVariableTable this -Lcom/revature/P2API/service/MusicListService; MethodParameters 
createList ((Lcom/revature/P2API/models/MusicList;)V    1com/revature/P2API/repository/MusicListRepository   save &(Ljava/lang/Object;)Ljava/lang/Object; list %Lcom/revature/P2API/models/MusicList; getListById ((J)Lcom/revature/P2API/models/MusicList;
 # % $ java/lang/Long & ' valueOf (J)Ljava/lang/Long;  ) * + findById ((Ljava/lang/Object;)Ljava/util/Optional;
 - / . java/util/Optional 0 1 	isPresent ()Z 3 java/lang/IllegalStateException 5 java/lang/StringBuilder 7 No list with this id: 
 4 9  : (Ljava/lang/String;)V
 4 < = > append (J)Ljava/lang/StringBuilder;
 4 @ A B toString ()Ljava/lang/String;
 2 9
 - E F G get ()Ljava/lang/Object; I #com/revature/P2API/models/MusicList id J Ljava/util/Optional; LocalVariableTypeTable ;Ljava/util/Optional<Lcom/revature/P2API/models/MusicList;>; StackMapTable getListByName 9(Ljava/lang/String;)Lcom/revature/P2API/models/MusicList;  S T U 
findByName ((Ljava/lang/String;)Ljava/util/Optional;
 4 W = X -(Ljava/lang/String;)Ljava/lang/StringBuilder; name Ljava/lang/String; saveList L(Lcom/revature/P2API/models/MusicList;)Lcom/revature/P2API/models/MusicList; getlists ()Ljava/util/List; 	Signature 9()Ljava/util/List<Lcom/revature/P2API/models/MusicList;>;  b c ^ findAll 
SourceFile MusicListService.java (Lorg/springframework/stereotype/Service; !                	     
      F     
*� *+� �              	         
       
                  D     *� +�  W�       
                                   !     �     5*� � "� ( N-� ,� � 2Y� 4Y6� 8� ;� ?� C�-� D� H�                -          5       5 J K   '  L  M      '  N  O    � - -     J    P Q     �     2*� +� R M,� ,� � 2Y� 4Y6� 8+� V� ?� C�,� D� H�           #  $  % * '         2       2 Y Z   '  L  M      '  N  O    � * -     Y    [ \     B     *� +�  � H�           +                           ] ^  _    `    4     
*� � a �           0        
      d    e 	     f  PK
    6=U�����  �  0   com/revature/P2API/service/MusicListService.javapackage com.revature.P2API.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P2API.repository.MusicListRepository;
import com.revature.P2API.models.MusicList;

@Service
public class MusicListService {
	final private MusicListRepository listRepository;

	@Autowired
	public MusicListService(MusicListRepository listRepository) {
		super();
		this.listRepository = listRepository;
	}
	
	public void createList(MusicList list) {
		listRepository.save(list);
	}
	
	public MusicList getListById(long id) {
		Optional<MusicList> list = listRepository.findById(id);
		if(!list.isPresent()) {
			throw new IllegalStateException("No list with this id: "+ id);
		}
		return list.get();
	}
	
	public MusicList getListByName(String name) {
		Optional<MusicList> list = listRepository.findByName(name);
		if(!list.isPresent()) {
			throw new IllegalStateException("No list with this id: "+ name);
		}
		return list.get();
	}
	
	public MusicList saveList(MusicList list) {
		return listRepository.save(list);
	}
	
	
	public List<MusicList> getlists() {
		return listRepository.findAll();
	}
	
}PK
    L�=U���    0   com/revature/P2API/service/ArtistService$1.class����   4   *com/revature/P2API/service/ArtistService$1  -com/fasterxml/jackson/core/type/TypeReference this$0 *Lcom/revature/P2API/service/ArtistService; <init> -(Lcom/revature/P2API/service/ArtistService;)V Code	    
     ()V LineNumberTable LocalVariableTable this ,Lcom/revature/P2API/service/ArtistService$1; MethodParameters 
SourceFile ArtistService.java 	Signature SLcom/fasterxml/jackson/core/type/TypeReference<Lcom/revature/P2API/models/Artist;>; EnclosingMethod  (com/revature/P2API/service/ArtistService   getArtistByName 6(Ljava/lang/String;)Lcom/revature/P2API/models/Artist; InnerClasses                  	   4     
*+� 
*� �           $        
         �                     
        PK
    L�=U��`D  D  .   com/revature/P2API/service/ArtistService.class����   4 c  (com/revature/P2API/service/ArtistService  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; result Ljava/lang/Object; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
    	      +com/fasterxml/jackson/databind/ObjectMapper
  	   	 
  +org/springframework/web/client/RestTemplate
  	     LineNumberTable LocalVariableTable this *Lcom/revature/P2API/service/ArtistService; getArtistByName 6(Ljava/lang/String;)Lcom/revature/P2API/models/Artist; 
Exceptions $ 3com/fasterxml/jackson/databind/JsonMappingException & 2com/fasterxml/jackson/core/JsonProcessingException ( java/lang/StringBuilder * ;https://www.theaudiodb.com/api/v1/json/523532/search.php?s=
 ' ,  - (Ljava/lang/String;)V
 ' / 0 1 append -(Ljava/lang/String;)Ljava/lang/StringBuilder;
 ' 3 4 5 toString ()Ljava/lang/String; 7 java/lang/String
  9 : ; getForObject J(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object; = {"artists":null}
 6 ? @ A equals (Ljava/lang/Object;)Z C  com/revature/P2API/models/Artist E No artist found
 B ,
 6 H I J length ()I
 6 L M N 	substring (II)Ljava/lang/String; P *com/revature/P2API/service/ArtistService$1
 O R  S -(Lcom/revature/P2API/service/ArtistService;)V
  U V W 	readValue U(Ljava/lang/String;Lcom/fasterxml/jackson/core/type/TypeReference;)Ljava/lang/Object; name Ljava/lang/String; response responseFormatted StackMapTable MethodParameters 
SourceFile ArtistService.java RuntimeVisibleAnnotations (Lorg/springframework/stereotype/Service; InnerClasses !                   	 
           Z      *� *� *� Y� � *� Y� � �              	                      !  "     # %    �     f*� � 'Y)� ++� .� 26� � 8� 6M,<� >� *� BYD� F� � ',,� Gd� KN**� -� OY*� Q� T� B� *� � B�       "         !  *  : # G $ ^ (    *    f       f X Y  ! E Z Y  G  [ Y  \   	 � : 6# ]    X    ^    _ `     a   b   
  O      PK
    6=U��dU  U  -   com/revature/P2API/service/ArtistService.javapackage com.revature.P2API.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Artist;
import com.revature.P2API.models.Song;
import com.revature.P2API.repository.SongRepository;
import org.springframework.web.client.RestTemplate;

@Service
public class ArtistService {
	
	private final RestTemplate restTemplate;
	Object result = null;
	ObjectMapper mapper = new ObjectMapper();

	public ArtistService() {
		this.restTemplate = new RestTemplate();
	}
	
	public Artist getArtistByName(String name) throws JsonMappingException, JsonProcessingException {
		String response = restTemplate.getForObject("https://www.theaudiodb.com/api/v1/json/523532/search.php?s=" + name,
				String.class);

		if (response.equals("{\"artists\":null}"))
			result = new Artist("No artist found");

		else {

			String responseFormatted = response.substring(12, response.length() - 2);
			result = (Artist) mapper.readValue(responseFormatted, new TypeReference<Artist>() {
			});

		}
		return (Artist) result;
	}
	
}PK
    �9U뿨{    	   .DS_Store   Bud1           	                                                          ocblob                                                                                                                                                                                                                                                                                                                                                                                                                                                c o mIlocblob      A   .������      c o mbwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    c o mvSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    (=U�4��� �� !   resources/Infinity-1.6s-197px.gifGIF89a� � �   - ./00144555 6 7!7!8"8"9#:$;$;%<&='>*A*B+C,C,D-D.E/F	/G	0G	0H	1I	2I
2J
3K
4K
4L
5L5M6N7O8P9Q9R:R;S;S<T=U=V>V?W@XAYAZBZC\C\D\D]E]E^F_G`HaIbIbJcJdKdLeLfMfMgNgNhOhOiPiPjQkRkRlSlSmTmTnVoVpWqXrYsYtZtZu[u[v\v\w]w]w]x^x_y_z`z`z`{a{a|b|b}c~de�f�g�h�i�k�l�l�m�n�n�o�p�p�q� q� r� s�!t�!u�!v�"v�"w�"x�"y�#{�#{�#|�$|�$}�$~�%�%��%��%��%��&��&��'��'��'��'��(��(��(��(��)��)��)��*��*��*��+��+��+��+��,��,��,��,��-��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�NETSCAPE2.0   !�	   ,    � �  � H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&	.l�j�I�Q���@�C'c�$ʔ��(L��a��W@���Ż��ީ� U�f����?��� ��A��K�}��7Ƨk�
��A�m��ǣ��};
U������|A�}ފt0�Q��v�2}p�RCRR�)�DA�(�`G�!�v߹�&J(QXҡvn�dĈ��AP/��]"-��b�@��Ōӑ����ء=E�t:�D#�ӉH#J\49b9� �q%���p��p�[�%m)����PS����&�馂�4(� ���$ɩ'�� �z�WR�v(FL4�i��vH�KP2gu%�)��0��ng���(GK@p	�h���B��3֨R��8I]qB*Q �$vTC�ЃwL�'�t��4�K� 	�$@��xEJt��'W ��>�bp�'.fR JH�H�0�1d!!D�."��x#2/L���E��#'�b#��T����`Qy���Iw8I1��
�t8�Q��hHI��1]��Xl�A��)#
S��DGB��Iutx�Lv��G^�I<+�1��� Y�5����B�4�/�����ąO�d򌌐����O����d󌑔T��������4�� ��x	%) �������h�Dǌ��p���R8ڀ
" ��
&�R8������T�)3n���� �
��R�K�HHH^÷0K~��GK٧��G���Jq�8	�+U������3�"zK����G�h;JG�Q\�;	��#����Nbe�%����@�9u�$%(Ō� �)�t!Y��W�
TbF��K,'?��MA�I}\����p
J\H�&����j�(j�`�7	�-$�#P�@�!&o�P�D26�l$^���\"�1�iQ��  *�j#)�����7�{I%�4�Ɍf�ьj����g"	مF�|nFB�	�\f���b���p��pE3	�:d0���BR� /���C��H��0��_CI�\D.s1�fxŐw�E�Jɳf�i!� S�ܐFё�@��Z �l+#�VJhe+\�`A��!yJ#!(r4��\� �:V���>��
V(�2�F.�O��j%�꧄f��*��T-��@	ă�,b��zI�j2aD	��(��Pj����b�'�ng�є@56�T:(��'�T���饿�)F���4��J8�N1�Ry	'�2�P1�
|1'B2�@�X)�'7Z('�8�
H>iQ?�@&l�>	���$JED�P�8q��xuN2
���2p�$7��3ݡU)�����H�/p�:Ѥ�@%<>z�d�E��*ω΅0A��Ӆ�cQ��F7���F������r���df3�aE*2��<��	98�O`��9�!� �*\���6�ɮv����z����x�K�����M�z����������|�K������ͯ~������� ��L���N����;�����'La� !�	   ,    � � � - . / . /01122334456 66 7 8!7!8"8"9#9#:$;%;%<%=&=&>'>(?(?)@*A+A*B+B+C,C,D-D-E.E.F/F/G0G0H1H	0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N6O7N7O8P8Q9Q8Q9Q9R:R:S;S<S;T<T<U=U=V>V?W?X@X@YAYAZB[C\C]D\D]D^E]F_G`GaHaIbIcJcJcKdKeLeLfMfMgNhOhOiPiQkRkRlRlSmSnTmTnUnUoUpVpWqXrXsYsYtZsZtZu[u[u[v\v\w]w]x^x_y_z`z`{a{a|b|b}c~c~dee�f�f�f�g�g�h�i�i�j�j�k�k�l�l�m�m�n�o�p�p�q�r� r� s� s� t� t�!t�!u�!u�!v�!v�!v�!w�!w�"w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�f&t<�r��ܾxۄ���'J��"��A$�W5w��ms��%�.��ܾ����M:A�A6�y�o��$��D����/]�過1�����Z2uA�j��7G>&S�ԫ���� f��߯o��	�Գ�~��R783��M����-8 13 5 !�H8�7�4��h(!>P����`(up��"���PK�����;7�hA�_���3�H8B�����SK�H(%�,�Tȕ�E"R�\��N|�)'!	b�v�Ś�R'p��ME�SgxA|4ʞ0�DM-D�ux�ʡ0���Lp��u�t�*����2M��s;tʧ0z	S��JG��ʤ�/- ���1s�F{Ъ�6��d���(� Gj ���+�+>���C�!�+E�%,qT�ĐF(���".t�����p��]��JVD)N!(�B���G(��%3d0����e*-C$>���p�2� #��LJO)�0���LQ���J���0�r%<RP�@1=�r�=s�K�\Y	-`�=��ˍ�,SW�24E<s�,%ip�5���j�hj$�67"7�0�C2L���%���c�������t@3QB�Q"0�B<*>�!L�D�lGP��:#�-�1���!!#"�"/1-q7��dR�"�!ҋ"� �	�I:I�(�H��8Ll�$2W�4������ /Kr��I��(�G!�X�K�,��(��bn� ">/QM�=}�D���� "Z����J�k�HcQ-Z�%�%�@%��% �`ђ?i� ������ �bIՐKj�@��NB�XI����D"2HX �s��XD�G�\"� $�P�N��|,�u.I��(��g'iA�z�A� BD���$��p`�7
!L�!�o�*��H.p�%��09��d!;��#Y ������9"��H` �$�� �#bB?�P$�P5�g)[DI~ˆ��A�R�H�T��AI�tOE� I �d��rI�@Lx���|�$^��5 �Q\�1� �`$K���F��Hl%-�$�T-L��bq!�&����=j_INv�U�."R�"�P� 0F�@I�$Dd�������͖��g=�J�A$x��
)�g����$ q���T"�(]��A��в+��.�@�I�.��\bE��u� ��k�GTҭw�sI�`�<�%"*�Dbp/Ա'��Ă<�H" 6��Q�p�đ����$6�Ƥ�1,�(�����Hh�) �$`�F�pM�2I���*s�d���b�y�U8�$�	2�r�D
F��>Fa�CL*����֒ �Pr�	&�:��jO��I(��)��*�N.�Sh�%8���|rE`���'�����jh����,�m��7�ג��CJ�v(yB�-Qb�VQ<�T�u"�dҊ+i�
K1 >{%a<R&PX�ځ�&t@�E�p��UEݠ/��x���Mr`#	�¨V�'�1�oD��	:ѱ�@�
ݽ�e���_8��a�3`A	:h�J�0��F6���W����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�����6���p����L�:���x>r@  !�	   ,    � � � - . / . /011223344556 66 6 7 8!7!8"8"9#9#:$;%;%<%=&=&>'>(?(?)@*A+A*B+B+C,C,D-D-E.E.F/G0G0H	0H	1H	1I	1J	2I	2J	3J
3K
4L
5L
5M
6M6N7N7O8P9Q8Q9Q9R:R:S;S<S;T<T<U=U=V>V?W?X@X@YAZB[C[C\D\D]D]D^E]E^F_G_G`GaHaHbIbIcJcJcKdKeLeLfMfMgNhOhOiPiPjQkRkRlSmTmTnUnUoUpWqXrXsYsYtZsZt[u[u[v\v\w]w^x^y_y_z`z`{a{a|b|b}c~c~de�f�f�g�g�h�i�i�j�j�k�k�l�l�m�m�o�p�p�q�r� r� s� t� t�!t�!u�!u�!v�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#|�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��,��-������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��$u4�B�m�v�t��D'�PU��T�:|�!���^L�������{���"� �8�KR`�ª�u���d��ί����R2uAh������� �"B�S���N�G���iC�T�#��G_8`���� *!�� �8�02$��rR�p�Fm����2�H����l'���3��96Z8y@�ѣ����"C���Oq$)�m࢓�ѓ T�x�FN�%�|�Ǘ��цd�xGN`�ia(M�&�Z�4=shF��)�<?��B;~���E�R���0��,ڟ/`��"fs�L�`J_0m⩈���è�YB�#�rxO�/%i��0Q�r��Kr�j]/��+���4İց!Q�!� �+-C�*qL� 1�&���DF���@X�T�Q��Ȭ4E���Bmx�7[B�B�T3	�@8I:�R1=�cH5��k��"DpC�9h(���ӣ0)-�c36D�� 52��! ��XQ��HJ�ؘ�����/�v�	��:TP�@�/�rR6�"LH&	�	-0%�<�$ˋ�,�N�2�E$�b+%q��4��$&Q`͋�t������IIG64[&I��(HL�d#�"($�a2ĔJ��zT�3"�3ҩ"��CRR(� �":�����!�"b"}ǡ0�`����.���$���� 6Cs�H�:�NH
��K�2d6�t��4��5��Ȑꔀ�"�����=�sJ��_ i���,�GuR	�,t���C�h	���̂C] I�,�	�,�q=REK:��6��b�J �!ACl,i�X���9H+aU��1�(�C�H �8D��G� K
 ��#��Nb{�w.9B�B����$/��`�e$�sP�J�4��/!��,t��BD�I�1�v� &_QCr�b$�V��D���CfIPd��@wC�CL��"�"rF�:�W$�1)�6DT��E���(����ND� �Et��m�RI�F�^�<�(�#q�����0I4�I�ȡq��/�F�
'YA&�x�!Lº��1A5�%��O(���J��w�y�m4�� 6��I�У]� "�DQ�t�d��R"����T�$j��%�C�l���!I����B�;ԌJ��aK`�I+間N)\+@X�,��ӰD��ؐD�.gY�`+��G�<ө��aJ��,un%�V���D��Y2G3]r�����*YW��q3�X­�\TӴ=��
�¹'KrA�\d�%/p`S
���d
��f�+�.)d��a:���zm	�$��T­$zIʜ����ө�P��K":�{��'�@�2U$�X��|�Q�$�=����Ŏ
j��z���	%S��6 X���E� AQ�8?�c0��--�-$E
ws�=:���$ D�&$��A�T�Ez2���gylJ��!M#i?���(P�	r�P7$���P��F�{���?�xD��OG��W.cM���L:���H��
7X�R>`T��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�%����6���p����L�:���xγ����>��π��� !�	   ,    � � � - . / . /01223344556 66 6 7 8!7!8"8"8"9#9#:$;%;%<%=&=&>'>(?(?)@*@*A+A+B+C,C,D-D-E.E/G0G0H	0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
4M
5L
5M6N6O7N7O8P8Q9Q9R:R:S;S;T<T<U=U=V>V?W?X@X@YAYAZAZB[C\D\D]D]D^E]F_G_G`GaHaHbIbIcJcKdKeLeLfMgNgNhOhOiPiPjQkRkRlRlSmSnTmTnUnUoUpVpWqXrXsYsYtZsZt[u[v\v\w]w]x^x_z`z`{a{a|b|b}c~c~e�f�f�g�g�h�i�i�j�j�k�k�k�l�m�m�n�o�p�p�q�r� r� r� s� s� t� t�!t�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-��������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��$s0�:vM\�t�lmB䦊��$��1��ֳt��];v�$�*�b�[�����]�Nn� ��<��JP`����u��l��aί�����R2U��g���w�CL��W�,��ʄ�Ͽ^;C�D�#��78_���h 9s��|��`�Ā� ��s���$X� ht���!@Q�r⇸h0�¼x�.�D96~!!aa��3DPh�G����"G,�����S���mPc���!`����X��ǚ6�q�p�XGNV�i�$]��X܄ğ6�1�&��x$M-����H �<
i
3@��'Q��~H�}1=��<�ɩ'6S��~�BCR���/!���J�P�~��.M���*�Ʊ:���׆BY(��>�����!X �����Q�&h Q1L+`*��SzC�	)�E/=�
CfY�$B!�LلJ�)�!69'��PۀY�
2t@"�LJK��U�ɇ�d@0`jBAD8��c(��c.�M�Ņ�dJ��@A� �x�IB��K��`"h�H�Ϝ`�_�(pI��(L�Y�z�F��(�����JI�(�����e%QP��E�dƋ��Q	�X��m Δ�oT���A)/R	[H�\:΄�B4�$"��'$9�!2Ąʔ�~T�3'�3��'��Kz"R/�  '����J�!�rb"}w+L)�ޣ�$���."��!301p͒�P=Ү�R'��R �,��'9ĉ*���/aĒ�Q���D���>$��xaI�@�IP=�� $L�P4\R�I+y߅� ��]�-�ܒ�Z|� �҅4�ԍH��hI'>��p�C�XI b��gȍ%Ms��>b>%c%�X�:F���rq��ơ4,��i	N��`�D<��$�ZAH:8=��^|Q_��̓X �܅�a(�GN|���+��l�I���u� &:��%DR��b$
Xƒ恄�t�Cj	^�J�@S�CL��"��'r9 XLi1!�5NT��/:�G :��%zx�F�B*Հ��$R7��w��$Y㋤��l"K3��8y"p��6��F��,YA&��Q�J�<�"w9����@�F�УIhf#R8"N��B���%Q �.D
d��'�B]rWIC(���ᆇ��`K�F`��O%`��5��X�͒8��c-iQ)���pe i �܁�8bJ�`	��� 0�$OKr�X�	��Y��<��<���qkz�?L�0��^��ИLcJPuI%k�̽�S��Lt���XT&?X�/.������Ja�"��5q+ˉ� �G�0��M�PY��d�6�%N(1�6ل�:t��^+i��(��5�8�X� iNvp!zl�'~�U&z2]!(Z�,���\�p ����7��zrJ���`ӳ	��$T;�D��@��Q������H�P>���	�~��R�@�5��H� �
\l�{
��%9Ci��H��"nDB�)��nzӟm4����D.CL�����9��
H��
6ȑ����&;��P����L�*[��Xβ����.{��`���L�2���hN�+����6���p����L�:���xγ����>��π��M�B�' !�	   ,    � � � - . / . //011223445 66 7 8!7!8"8"9#9#:$;%<%=&<&=&>'>(?(?)@)A+A+B+C,C,D-D-E.E/F/G0G0H	0H	1H	1I	1J	2I	2J
3K
4L
5L
5M
6M6N6O7O7P8P8Q9Q9R:R:S;S<S;T<T<U=U=V>V?W?X@X@YAZAZBZB[C\D\D]D^E]F_G_G`GaHaIbIcJcJcJdKdKeLeLfMgNgOhPiPjQkRkRlRlSmSnTnToUnUoUpVpWqXrXsYsYtZsZt[u[v\w]x^y_y_z`z`{a{a|b|b}c~c~d~de�f�f�g�g�h�i�i�j�j�k�k�l�l�m�m�n�p�q�r� q� r� s� t� t�!t�!u�!u�!v�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��'��'��'��'��'��(��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��,��-��������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��"m&�
�,ۻwؔ�U�G��!��d��p�5K�!�.x��������'��pv	_\��&
�!ż�r[k&������G����2���;�!�M�ҧ7V�t� _����N]%-Ip:��w�,�B0��"����4ȟ.. 5@�X� 5Q�4 �xX ;xP���!*퉤/.ZH�C�M���DHCT�c�����!!tD� Jz�?����d�4^�=�᥋װ���c���Nu��b9E\���.��St���I���T���:���D�jb::Ԕ�8���Dx����0�\*�C|⩉�  "��XHC��j�!�1�પ2��8��@��zGBs���2������c�Ad �!�,�ଇ�$HPIN[`�+�(j8т�&��YAAЉ	;L��O�Aݕ���D����AB
ı���d��W��	y��5Q&��/C��1`ǎJ����x�M�.�� �KJGI�QK�% �ܕ�HQ��J��(���d�\9�)�b������0\���8s��hZQ��x�I����]����DwQ��hJIԨL�Y�l�$E�L�Z������Q � ;)G2dk!$�jb%~��b&$A�0M~dɬ�zd�1&z3��&��#�R"R�&� R&�B���B-&�!R.&�P���N��"��Ɯ4��t�vI�x�MH��GJ��)��!�<.�I��&��R!J�#J6�h�G4x��KYPR:v�8�?- 	<��� J��J��!!��*K0�5�%��@b%U�% ��DђDY� ���榒 �BIȸ�J\�)��y��Jl5$q��%�+�@�iC%��;���$0��N�v(�/��Dr����$+��h�Rx("�`��U��E9|	d![�D�#����q� &f0Q'D�<�b$�֐�1�� bb�HZ� �ASRb�q`$ހ�< TD�1A &-��d�E�`%�x��U����I0h"wȀ#��5(&��$����񀍌.J0plL����F�p�E��(�&`���`i�H)!�t(��G^�+��\��0W��L��#���	C��""J��E��K�D��(A�́��ha`WRd�.%Z�p����gW�F�brM�c(y��@��&��;(�&�d��$d.�K��)�&�:p�65=�XMP�E��%�*z�pByx�;�j��ݤJG
b��V�7���� TԮ��D�lqn&+(`�	��D��9�/e�/֠;������������4����I"�(��J[�`�PB �� �u;9Ĵ��٢l�����d��($8����
�u�9�Jy�
	� ��?��:�. ��<���/A�m��sU/B�
F�?�/C�p/MC��C��HL�?�0D+��\���E0��oC�hCf��{�� ��GL����(N��W�����0���gL����8α�w�����@���L�"��HN�����&;��P����L�*[��X�H@  !�	   ,    � � � - . / . /011223344556 66 7 8!7!8"8"9#9#:$:$;%;%<%=&=&>'>(?(?)@)A*@*A+A*B+B+C,D-D-E.E.F/G0G0H	0H	1H	1I	1J	2I	2J	3J
2K
3K
4L
5L
5M
6M6N6O7P8P9Q8Q9Q:R:S;S<S<T<U=U=V>V?W?X@X@YAZB[B\C\D\D]E^F_G_G`GaHaHbIbIcKdKeLfMfMgNhOhOiPiQkRkRlRlSmTmTnUnUoUoUpVpWqXrXsYtZsZt[u[u[v\v]w]x^x^y_y_z`z`{a{a|b|b}c~c~d~e�f�f�g�g�h�i�j�j�k�k�l�m�m�n�n�o�o�p�q�r� r� r� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$|�$}�$}�$~�$�$��%��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��,��-������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��%n*��L<s�l��˃�$���	V2q�=���$�.�2�������N�;A��5�y�i��$�:���͟ՑPӃ�\���'�d�3�īn�"6�[���N��F�?�w�����}�t�R0 s���l�v���̀� }�s���a� eT����!@Q�r���A//^HC-�M���EHNx���$T���#tD@!J~�N?�勷L��4^��=������Q݌y�;ա��(qo�GNV���:TTD��/^qS� z�;]L���'�DM.���t@D�'���
3 M�/��P ��z"4ȴ��/�ѐ%����HL>���%b��?�����^����쇨��ȱ�#�Ae0��,!퇎�E����J�x	�R���-Xaʛ�0u^R�D0m��0+M�5~|����4 ���^�	���5Q:�sC�Po�v�0% e7e8� �C�CsCD!���u�T��iJ��8~�1�p��9Q=��IC���!��˨`Q]��I�������̦LwQ�ԈJIԸ�i5@˵�l4�35j@�/�CG���#���_�T�}xD@(�"�Q /jB��ӤGtb+�p̉ߌT�;��(�Z�/� �'�2�ejʂ"%}!"��!%�2��$��!-"��a1&�6���M����'�qR�	'	rb �pb(�pΛᜀR'��Qͪ���J�#DJ�_d '|H+Ø���g|HN�T�	F�,�Ň� 5|�,Y�0�$��`�Ci 	>����kHǀ�?��(�A�R���4����jH^�m�$ZCzGyZR ](u���J�$�CI�s	�>D���>�2	0ǣ�D'r@H��!`��lR2����@�	+ND��`�J"G
`�}B$p8�,F��p�F�	3N����EH�|�#7Ąo'��H��!d��CL�q�r�D/�7$]�&<x�'H���e!U��a��EBI�^��l�Qb�L|�!l��5�F��!Ya&�;!L���bsA ������S&��>�;�<�<��M��W�D
C��"BK|�D�@�LL�Ĕ��G�H�C���+-�;61ƅ�iq�B&���xI ��!.T����J�*�0 3p�M��ANb� ��kh��Nn����@Uw� ���.i C������T�*_��b�?�A֮3ΘD«�!�P�@
�(��2Y ���	�`@H�,L����@�o<���<�^�b��U�"Ie�b��n�c��yĵ�1���Y��%d��X�ê�Y�2X%V 	������:�V Rpj�ށ	�� ����Dw�!x��t�(�!N�݉�ш�=�!���� ����*!`@�3� F)�+�@����|�K������ͯ~������� ��L���N����;�����'L�
[��ΰ�7��{�� ��GL����(N��W���  !�	   ,    � � � - . / . /01122334456 66 7 8!7!8"9#9#:$;%;%<%=&=&>'>(?(?)@*@*A+A+B+C,D-D-E.E.F/G0G0H1H	1H	1I	1J	2I	2J	3J
3K
4L
5L
5M
6M6N7N7O8P9Q8Q9Q:R:S;S<S<T<U=U=V>V?W?X@X@YAZB[C\D\D]D]D^E^F_G_G`HaIbIcJcKdKeLeLfMgNhOhOiPiPjQjQkRkRlRlSmSnTmUnUoVpWqXrXsYsYtZsZt[u[v\v\w]w]x^y_y_z`z`{a{a|b|b}c~c~d~de�e�f�f�g�g�h�i�i�j�j�k�l�l�m�m�n�n�o�o�p�q�r� r� r� s� s� t� t�!t�!u�!u�!v�!v�!v�!w�!w�"w�"x�"x�"y�"z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&"j"�
��:o�PA��eȂ�!���C�ձo�5�!�.h�Hں���_W�T�;;��5�y�h��$�ڄ����y�iQs��\���Ud�1�ī�G��ԭ__��\�����-M@H9��g,�B0��#ȡ���4؟.. 5 �X��7X�4��x���.&zJ#m�K��b�PClC������� 6>��|BZ��tD  Iz��?�e����3^�a=��e��8�:���;š&�\\dǛ-��t�GE���b7�p��-2Q%��h�5� N�-6�@j�7&�t�3��P �tj�3�T��-�ѐ$��8HL�8��b"��>�� ��z�FBp��!�.!"��^�ű����z��I�d��1^vRF-8peX��82$��|�����x9�JNDI$� Ì���(x3�/_0��yT�*�"$:{�PAF��	�x�M�!�G�;B�.D���u�PQ�	J��HK��A�˿��E	�H#,'��#.�U�g@C�Et٢{%�B#/`�A1/��E C�)%e@�2]g�.�:�����H]����%�ʱ�t$õjAR�&��Q��*�G{�x	I7H��j !q�6#�j�!���!�""�a�+#5 ����d��r�4��:�A͉�NҺ�"��Ř�5��rZI�x�MH
���I����'�a���`b(�ވ��&����j��CJ�w!�2+q�����fx� т�P��%�,i��� 2xh,�@�>�JxH ���J�� �"I�x�J�e�*��x�[	!�ԍ��sB�GT�l�dY�BRGyZR� $0��N�$��%R0��<b�7���_"@��y�\I6 ��&��P2DrBaM$PK�66Hn!Q���'��"J:��1<����EB�r�$5�d�H��<�u$ ���&h�U�$�hQ>��(��&(��$H�@�ceU��Q�t�@7 ��Z�ldW��M�P�_��4�E�,ҀQ\	
8	 ��cҕZ4Z�EL �(�A'�z�����YB8�d	�`�9�BJ� �ZH"����d��](X	�v4�1<��2" �,�r��X����F� �w%l�S(6��>�gt�L�x �L�i5���tm/���z�!��4�D:���͠:�V�a�Q�����j���D��q@u�ha����V1f0j���~S1�i��1D�$"Z� �c�x�KX�1S�j��1T�pU��_e�@B�#*��@�P�<��ST�@�ب�)��B �F�KЬC�`.I��-Dvӛ�Dc:�n�j)r�5DB�p�g�QBP�FgK�����M�r����:��Ѝ�t�K��Z���ͮv����z����x�K�����M�z����������|�K������ͯ~�����w+ !�	   ,    � � � - . / . /01122344556 66 7 8!7!8"8"9#9#:$:$;%<%=&='>(?(?)@)A*@*A+B+C,C,D-D-E.E.F/F/G0G0H1H	1H	1I	1J	2I	2J	3J
3K
4L
4M
5M6N6O7N7O8P9Q8Q9Q9R:R:S;S<S;T<U=U>V?W?X@X@YAYAZAZB\C\D\E^F_G_G`G`GaHaHbIbIcJcIcJcKdKeLeLfMgNgOhOiPjQkRkRlRlSmSnTmTnUnUoWqXrXsYsYtZs[u\v]x^y_y_z`z`{a{a|b|b}c}c~c~d~de�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�p�p�q�r� s� s� t�!t�!u�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�f�#n"��̚:o�PQ�&
��!���Ci1o�-���!�*x�������}������<�2BF
`}"��u��l���M�������c�4�«~�R��0�[��VN��F���q�D�����}�@��x 7r �wp����� |�s���|1@I�͇��� Ee0�ڲ�H�ㅰ�&����!6H�d��>:��A�1_���ǈ ��S�OkP	c,3f���Z~�FO}�	#6Bdģ�(�l��Ez�	c9Ma獆Tɞ0^qS� 
#%Ub(���P�-��%i")�ܘ0��\
�%���(�_L��
�"I�*��}Ĥë0Ι� �~�/%�i����~��.!R,�[TƲ
�R��EAV,Y�����0av��/8P�f('a�$e�@0D�(a��TJ��{1�/frC '��.],�PX�B�*�R�9~H�PڄɌ	τ����M����D���
��lk$D4�-E&�R,>���DP�#sp�0AQ���I?�8K�����S�E$}#�%�r#.
`� )2��E�rc*%qp�1l�H��l� 07,R�0�CG�,�HG,��$���G� +�Gn��	I'�˩)B� !���7�4+�8�t�������zR(�2R �xJ #}�b"}�!%I���$рb("��a0&)� ���M������D��q&#�Ix�(΀���ٍ(�������9*��a���T�W�ć�X�̤����BA 	>D
��AK{`�(>����C�`�v#O�$"H��!Q��vLj@K��!*��]��JpE%M��JHV�k��Y�Z�AK
0m#$@�NBt��.�!��O&aA�ԥ�`@�1�D2���$ �������#)�\'�
�M����ԓǑ�E����&��D r("x�P�I A�+�D<��@�yFN� �_ljF�j"�8�"8�( J,#Fz�Rl���r� �@B*Y �訑���2P�����2L�8C[Lq#Z��"@!���?H�l��Z:��`jT��\pv#N�n"L�b�4Q'	��$a�͢�q�1F����s2���2p�,P�q�@B$��j��K3µ'��=0C&�$��ŝT��9���=��:�B_p��^�J~��K�#ο4b���``|�S��s0,N7�Ͽ0��.�b����%f!��b`�ey#H���~�Ǆ�X��d� TU���1�I�TF 	Pܢ�ч��u NP��A�.�U �C���5!x�2�4�&�!K���qG=�!���1����"ъ^0�3��(�)�@���T�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv����z����x�K�����M�z���  !�	   ,    � � � - . / . /011223445 66 7 8!7!8"8"8"9#9#:$;%;%<%=&=&>'>(?(?)@)A*@*A+B+C,C-D.E/F/G	0H	1H	1I	1J	2I	2J	3J
4L
5M
6M6N6O7N7O7P8P9Q9Q:R:S;S<S<T<U=U>V?W?X@X@YAYAZB[C\D\E^F_G`G`GaHaHbIbKdKeLeLfMgNgNhOhOiPjQjQkRkRlRlSmTmTnUnUoUpWqXrXsYtZs[u[u\v\w]x^x_y_z`z`{a{a|b|b}c}c~d~de�f�f�g�g�h�i�i�j�j�k�l�l�m�m�n�n�p�q�r� r� s� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��,��-��������������������������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�& c��l�7i�<%��E	��!�p���.i�x�ZT�K�_ !d������fEf��f\	_���$�
�ļ��Tc8��0&���9���0U��]����H;����O��q��(����5;�����^6�t��
�h 4g �k@� �r�Q��ͅc� %��1 �MFa�J� ���H�ㅉ0���"3A��>:(��@a!_�z3�`� >��OcP	c)�i��)Z��EOq�	#3=dģ�)b��l��Eo�	c91a�|TTȞ)v��M<l(��L�ȡ)nSDM)P�(����L��5%�t�0��ȈCDj������HC�����1� +�s*�ǭ)�R��
b	�!,��\��Ǧ(�AX4�,� -���Ē��K��)�G���6d�h�;䃝�`q�x�B��	�JHP�L�� ��		 �@���PBh�>��\�t<��3asB�T6�CM$S$,)	Q$./DdA"�VW�q�K�@�T���$@����[4FP��(>NrR>��sE(�"�7�tZ����&urc+
`Ā&1[�E�#%ep�/lDȵ�ltÍŔt���2t�G�}tDō�dj��vć�x|t�`��  ����:��)� #�R�)b2�)�+R ��j��!) ����J�5��4���4��������@���r�H�"-��I���/�4��'�B�.�$B4qF#J&8(�H1�ȍJ7|f67����^�4��X��􄕘`���Be�%r��Zj�g& 	@t�,`a7J�Kp B�C%��T���QI/� ٪��� ��J�`�A�����(�@��� D�P���}�)Z�I|Ѝ8��r`ᖁ�`�ɱi
a1مtX���N�'xGH�P�JR$��( \��WX ��}� ��T����BU	�&B%��,F�#N���0E�h�FJժ��m0�5�SQCBa�č�'6��t`遏<q �V? +|�F�^U#��/�} "�խd�=��H���C���0�b�H�*�I�2�f�@B @�i
J����. -�%�e.� ����5`@�38� �8�R̩͇Al�ĶѠ���� A�:#답.�7FN������Q�C
	,�U��"���A1�0h��6KAj�ߤE�c>��b"󄕶���	|�*b��2I��U�8��9�-��D��1�nǦR|�q &F�\�!u`d�>���o�S�<������`Q�B���,*��10M�f7���z����hGK�Қ���M�jW��ֺ����4�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�Kݏ !�	   ,    � � � - . . /00112234456 66 7 8!7!8"8"9#:$;%;%<%=&=&>'>(?(?)@)A*@*A+B+C,C,D-D-E.E/F/G0G0H	1H	1I	1J	2I	2J	3J
3K
4L
5M6N6O7N7O7P8P9Q8Q9Q:R:S;S<S<T<U=U=V>V>W?W?X@X@YAYAZB\C[C\D\D]F_G_G`G`GaHaIbIcJcKdKeLeLfMfMgNgNhOhOiPjQkRkRlRlSmSnTmTnToUnUoVpWqXrXsYsYtZsZt[u[u[v\v\w]x^y_y_z`z`{a{a|b|b}c}c~c~dd�e�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�o�p�q�r� r� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#|�#|�#}�$}�$}�$~�$�$�%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��!k(�څLZ�l�V]�S�ɇ� ���s���lے�"5)_4���������զ�Noj	_�{Y'4(�6)ż�rZkp�԰����o���0U�a���wiCL�ȩON��Nt�6�9o�@В�|��|�8��
�x�5o �u\����T^��'��[�b����a-څ��-*^��PBTc����� 5?�|>^H�t4� EvH?�Ѥ�����0N�!=񡥊@fT�$ޱdƸ�E�Ib"9E�f�pR4ɜ*�q����%a⧊LԔ�6���I �I�$r��L$���8�'���2!ҩ��4Tɨ$������B���J�/%`����P�v��.-�+�YưҒ�v8�QAd���� K�h9
M�� :����:������� !�h)�JM4��!���|y� ��㔹l�@B��L����K�&:4�5Z"c­MV�CU��i(��/1Dd�%�V7�m�ˍE�$ˍ� ;�ܤ�6HP�@�*ހ�7Β�E'�s9�hXQ (��I��x�1pJʤ��($jp�1C�F�4��Fx�_6(y��8/tɰ�t$������)��v���|����4����48��~�@1�a��$
Rԗ�R�1#�Iw��
I�\
II�ǌ)y�!%����%���w�<�������x��Ij��(<�� �y�4�dsvJ,|q�b@0K�J!`�&6!�5C�⨔�8_��CXFtH�JZ|Y�X�_x
K���r�Y�%X���A+tHU*	 *�䉱��B�XI������C�Pɱ�Dh��$J�I�0�4yc|`�ց�p� �M�� X��ƕD�<$S1��T��v#� ������DM���Lut$
BH0�N��+���0B�:T͏+�P <�)Y٢+W��:¹V��+(��4R�V9�+��Q-�W�Y��
n�X�Jk�b�}�QA���5�ԋf {�N����G�&��L�.p兒�8�n�@B"��hI  �ѡM�EZ��-� �HS7h0�'tH
`a���#���r~�"�m��T84�0�����2���m,D��gu��5�Gfy�>�sυPA��	F΢ �鳂Q�v';���h9:1�`kH��ւ���r�IC<zGl�L�	@9��5���S�^ib���B�P�yN�K��2ZP�$�o��:�T�0�x"�%�TU���HS,�Ճ<�Ș0�Pֆ�:*j�"��ֈ6A��3��U�U"�a%^��dx��E"��򯐍�d'K��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����&�lgK������ͭnw��������p�K�����M�rA !�	   ,    � � � - . . /01122334456 66 6 7 8!7!8"8"9#:$;%;%<%=&<&='>(?(?)@*@+A+B+C,D-D-E.E.F/F/G	1H	1I	1J	2I	2J	3J
4L
5L
5M
6M6N6O7P8P9Q9Q:R:S;S<S<T<U=U=V>V?W?X@X@YAYAZAZC[C\D\D]D]D^G_G`HaHbIbIcJcJcKdKeLeLfMgNgNhOhPiQkRkRlRlSmSnTmTnUnUoVpWqXrXsYsYtZsZt[u[v\v\w]x_y_z`z`{a{a|b}c}c~d~e�f�f�f�g�g�h�i�i�j�j�k�k�m�m�n�p�p�q�r� r� s� t� t�!t�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&�e��%�8j�@1�F	��!����H�.j�~����!�*@b��������̆�м�x7Sd>dE���u��d���̪����z�b��/�«wΈC����_���� X���.�-M��6���#�-��,(M�t��4�6v0�� ttca��\!@Ip�̇.�ňDa�
���`H����80�����3@��C�>6�i@q!_�~s���>S�OcP	#*3b���ZZ��=�&����g��Nm�y��!'�}��ĝ7R�!|��M;p(��L�ȡ(VAM*P�(��D$ɤ(�9��`
�#0��?���0Ґ"�~x�L�4�
#�!��LĄ@��~FBk�� 1	",�[�ű&���~�=�d��	�-aR2�-4P�],*��p�"\�@��`D$ER�RT&C�	1��,gNC 'Lsf,\,��gx�a+0�Rd7w�Є9L	Ƅ��5���f�RE��BD0��u����L��X
-����Y�Ex�_/��c*<Wt0@�Ë	20}r�+
`��&/c��Ee\�3Q�����4��!����X׈�/]q��r���,΀sJJ`0Ө(��߷��U5(�2 H�Ț�V��8�H��
*Wq�(�H`�)&t�݇6�Tʤ�{�͇��� ���2�V	�X�I�*�0:z�.�$��mN#X1|؍J8���68�%ć��Tř��5����t��s�%Ƈ��� �>>�XR|��Jt�%�bQ��j�[�ibI����.ȩ
a� ��w�xCN�@X��6�D��S5J e|h&ـ	��|�h�#�|1)_L�+g@)F� na
�]�J`��� g�:�Ÿ�b�	 'de��m%t(GDիIX1+���7V�.
ˋZY�|񀍸�Y��J(n�;��[���Ux�#P\�P!��
�q"Da�Z0�"�I� ���Qh�E����+8�J���|��P�J�HCn°_���AƊ���LK�W.��.ЫM���@l��Ih	��O
�"�b+�J�u�񄃄�G��
N$M�p!!���)��n2'��ѕB�S8�h-4���ꝿ�9�BRg�h�++P�4%J4�`!��ǈ �����Bi
�"�S�2�#BP�M�ax~�Q�<�e�F>0G�T�mf�C�lQʍ4!�Y�Ԕ�p�*��@	l@���
אU6�I�АT�`de � �1�u��Tp�@��@]ڪ@
�I��(kB`ahIFPkC�P#ݓ�Cv���6�^!r3 ���g�1�K �L��*K��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����,�lgK������ͭnw��������p�K�����M�r����:�# !�	   ,    � � � - . . /01223344556 66 6 7 8!7!8"8"8"9#9#:$;%;%<%=&=&>'>(?(?)@*@*A+B+C,C-D-E.E/F/G0G0H	1H	1I	1J	2I	2J	3J
3K
4L
5M
6M6N6O7N7P8P9Q8Q9Q:R:S;S<T<U=U>V?W?X@X@YAZAZB[C\D\D]D]F_G_G`GaHaIbIcJcJcKdKeLeLfMgNgNhOhOiPiQjQkRkRlRlSmSnTmTnToUnUoVpWqXrXsYsYtZsZt[u[u[v]w]x_y_z`z`{a{a|b}c}c~d~de�f�f�g�g�h�i�j�j�k�k�l�m�m�o�p�q�r� r� s� s� t� t�!t�!u�!u�!u�!v�!v�!w�!w�"x�"x�"x�"y�"z�#z�#{�#|�#|�#}�$}�$}�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��"i��uL�9m�JE�#����#���	U0m�-�%K�#�&`�������M�M�����<x�HE�.�Լ:sYi6��F��￝��A15A�`���C��ʩW�J�� Z���o� -M08���L�PK�b�)0l�'yH�Qa��pq�mX�Fi��΢�H,�b��@A�ռ�!5с4662NBy!_��Ӈ  �RTL��ʊi�b�����Oz`�"5@dD����d���E�Y�&=9�担T�Ȝ������b$I�'���6��hI pI��!�S�@��$����!���HC���^9�`*�k*$Ȫ����NT
�c$�ƭ߽��!����A`k]8�`��4QPC.+�'9�e&e(�B����i�0�nB��(�B_��z�<��L>��{-�.^bS (���-X(�g�j]+�t�}<�5X���DV�CN,�0R�TD����J��#H��|�J'z���+6�R ELt�rp� qU6�r�E)�9���)/֒ F��2'G_����4�#�2��(�CG�{�V���jG��W�V��  !��� \�*�"M*�\�!"*#����0ʕw�P+�"�U8�bR��9K�\! �'Q����8�"ƀ	٤�	`Ѱ�8*�0�������^����RQ�1B�h��bQ��'+ J��8��ҫX*"�
N��i��"�~��Y�aE[��&aA���}%D*TI:�@7]#_��$7#Q��W� "U�$ւ�1,���> ) �8��t�"�>�P�J.܊�D��h�V��X�V���r�L#?�.$�������H$�*]�/��'�e 	+A��*�V(�gҨAVla�LTD	�XpHtz��4�@���GL�*���6� ��d�3Q"�ɤb��*V`1ڀ��H`��4Ns2!�*ʸV����|�i���~�o*��cz�!4�@K���e��*$^�BU�^V�	A�Daes8vXH�4�ME��cC�%X�V�4&
���ɀUa�όy	2:�K=��U��?YJb"P��Q�bY��"Y��ȡ�$B�u��P�=� e��F�.bF�	]��v�Ōp�sr�VǫGx� ���"�u���I�R����2�)��;���W`	K��$�Ū���4�~��Kb 0������ 0�6`K��iK@��-PT��$T&"G���ay�U"	X#��f"�+E.�G�"��6r��B��	3��`'K��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����,�lgK������ͭnw��������p�K�����M�r����:�' !�	   ,    � � � - . . /011223344556 66 7 8!7!8"8"9#:$;%<%=&=&>'>(?(?)@*@*A+B+C,C-D-E.E/G0H	0H	1H	1I	1J	2I	3J
4L
5L
5M
6M6N6O7N7O7P8P9Q8Q9Q:R:S;S<S;T<T<U=U>V>W?W?X@X@YAZBZB[C\D\D]D]E^F_G`G`GaHaHbIbIcJcJcKdKeLeLfMfMgNgNhOhOiQkRkRlRlSmTnUnUoVpWqXrXsYsYtZsZtZu[u\v]x^y_y_z`z`{a{a|b|b}c}c~c~de�f�f�g�g�h�i�i�j�j�k�l�k�l�m�m�n�n�p�p�q�r� r� s� s� t� t�!t�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#{�#{�#|�#|�#}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��-������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�� i�ʅL9m�N=�C�ɇ� ����(�0m��u�P��*P������=kM�����<��0�
�Լ:�Xi6��&��������@�0�聇{���I�҃_4�g������r��U
�  6m��p`c zN4%��<h 3ZP� _8c!z���|h�,��A-&���R?TӢ����'I}���������S�Qg i�+)j��N�g�QwTi"5<d���P�`�h�Et�	^	D5�f��T�ț�y0�t���D��i��A����&R"�C\Bhs�e@2��(�C`)s3ȥ&�P#�
W�P7�j"i�oذ	�ˬ�a	�!+9ظ !�~h�A_�
�P;���8Lŏ��rġA�Re'g$��� �$j�0�jF�@�Bi4�J)�qBQJ ���� �h�� �����`��T���8�5U&C3UV�EUB����]����-B�U��؊-���mc�U8��`��	3V��X�1 
͞�|U-��F�p�gV\�(�
%�k![Y��	"�\j�.�d��p%��1�$	��r5Ǉ���'�z�V�|HC�I��W�X�I
H�,Bs���w�D�j&��W|(�I!dSf6!����dC�U�s%XDX8�JWh�X�?(
Kz8Y�XfX�K��b5dMa!(+@������_�s����Ө,�M�e�����8e~SCX���I)x�9	`��`.&i����\�U)z�t1���sWk�+F��^D�	�
L䃐 d��[W��!`$�#��ڶ�H�h���v���Yh�H�z剰e�h&"6�1c��XAE��3�����Jf�
Rd3�9�����bF��D��>%~CX���N�	�J���2mCRLH�$b��Z��U��F6�!P�y�$ @PZj��8eTiպ�l �J��/���F%	`�O8VF�'��c�J3	*�Vj҆�� 8��:fH"��@�X�lN��B5ÈM�e.�C5��PMk�
 7LrD�!�S0������\H ��P>��{%$&R;0�A*hxe1'2��)S9D&�h)h�S�	 $h�a���%�R���N9����ȡW���F�6m�*T�ƪ��.��UV!�B#�đ(�D��
��n��"9@�q�0+I8���(�D�̏�R�6�L�xKd`@�h"�[�@��%�d��!�R꘨�8�L2�1@@�nz�f bo: h�l #Bp�e��V�"��F.:!�44�w��b���:�����d'K��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����!�lgK������ͭnw��������p�K��$ !�	   ,    � � � - 6'>/G6O7O?W?XF_G`OhWq^y_zg�n�o�!w�!w�$~�$�'��*��*��-������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�� D���3",X`@�P
p�@A �8�๶m���Y�A�۵- � ���s�)@�o�#��9���#�i�v���gU@��y���,���m���wO�6��'0��A� �'�g��@y֦�S�� �� �=h�Q%����Yp@H
px��� h�mP��b���Q ���S*�8`x���N�c�	\�ᐵ5� �*P��Lb@SDɡ	�$�J�h�i��E�ܗrِ�HB�Th���Bly��FU��E*�@�Hx��{���AK�蛅�x(A�~	�y6j�v���yԙr.P�v��ɣ@^�x��	�T�R�ZB$ �����"V�(T�&�C
����(��Bu����P XZߤVU���%����]�|�^4@���V��Ry; �J��G/VXXA��i)�U�* �	�'�Ue�`�)�%�U�ޔ I�%W<�p�w��$�DA�nv�����h�ە��aL��_��U��$��v�U��N�~�)*lhXK�WrJ!�x,XN�7uJ�G�V#��5I�
XYY��5J]�7vVQ���IU�x��	6�d��[@4J���W<�$ ͼz�U��D�m����,��{6�ty��w�q�-w���oOu4}���m�Q9< Ħ��Si�W�E�o�U���p�����f~Q ��A�ps�<E�:ۻY!?��i�{|G5��E'$�w�#���M����g#���wK�;��"��	^ Vǡ
 �}I��� �W���4 ����@ %n�3O�@(�0���
�{��?��)�R�w���(=I!�kCC���F��B
�vx��ND�+��g�#r~E� ��B�(:�����(?$�R7I-��_�B�(=��I�H0h���y�Cpf%���I=���t6���V2WH�&��~{��H9��1% �L$E� D��NS) $�� =n�+�$T��&��Lv	����"	�n=ڣ�\)��R@���J�3���o���m��b�g��� � H �� FS a�D �5ϔM�T��L�:���v�����<�I�z���=̧>���~�� �@JЂ��M�B�І:����D'JъZ��ͨF7�юz�� �H� !�	   ,    � � � - . / . /0122334455 66 7 8!7!8"8"9#:$:$;%;%<%=&<&=&>'>(?(?(@)@)A*@*A+A+B,C,D-D-E.E/F/G0G0H	0H	1H	1I	1J	2I	2J	3J
3K
4L
5M
6M6N6O7N7O8P9Q8Q9Q:R:S;S<S<T<U=U=V>V?W?X@X@YAZAZB\C\D\D]E^F_G_G`G`GaHaHbIbIcJcKdKeLfMgNgNhOhOiPjQkRkRlSmSnTnUnWqXrYtZs[u[u[v\v]x^y_z`z`{a{a|b|b}c}c~d~de�f�f�g�g�h�i�j�j�k�k�k�l�m�m�n�n�o�p�p�q�r� r� s� s� t� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#|�#|�#}�$}�$~�$~�$�$�%��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��,��-��������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&�#m��E�Y�k�L9�sFJ��@I����װc���f�P<������6jAdK��]���U`�W���9� S��a�c�  �3��{�w��e�*����s �[�����=J��
�u�q��[2`P� st#�]]����Kp"�pK����`�!l�$RVCVd��ኮ����a��i`��8��
�����\uG�DF3DFNp��3V�A���q�P~@�PBHE�d9�TB��%��H@%Yj3ٌ��$�9D�&c�"�Ÿ9&$`���H���n��(z	���)eBt�g�P!�g�n��$zbcAT�`J(��'Q	!*��HQ��zN�T�dy�P�� ?�ѥ��	䄞�|O2sǉ1�E-cVc 3l3&/MP%�y<T�4Y��gP2FUI�KY�Ȫ+VR^U�ชEa-�N��U@��
� ��s�U��(�1
��� V��%Bqo�h%Ɗ���"�VI�XY����k�pu͇��$s�}p��9��)ŅtUǇ��)�|v�ʇ<��
��|������ |�΂oW	|ȠI\�g1|4�g��֐ ���� f)��a)�!0+u1fb	�a(,�J�c��a#,-P��@,V�R �>��XExx�J~�ɇX-x�Jd�I8X|(�IE���8E��"�r��B��f�X?bh�I��2|E
�$Y��H���2�� <�\��b� P/ŧ�5�G�2�&,g5��z�����8R�U��9ص� ���J�V�l�]��VN�"X��"�TaӉZ�8R,r��m06�AV��"K��!L �	cc]Y�Z�C$��>'��
0r�3�!_ ד�!��[���D8\ !x�	��Ӕ�CY��� �oȂ�r[��	���� 	=q���QD`$؁P��g$�Ay�1䄂�p��CP~�����
�'�0`����V(H%x��mP@9�*{È������O��Y�f��� �˗娄.2�
(L��/a&J�BY�/�9ED�C1�*�p�!!�>@	�57x$d	7KY7�B�� ��x�2P��D'5b���G��1)֍Q~��@Xێ���Q3�Z��`(��6�`��0 J���6b�H	 ��Z:E��S*`В��M����@(�0q�s�ԍ3Te	�Y�2�7���\Q"�tհF@���(� ����7Z��%4�+H�
[�3հ'ц)��X?� ���@p���F2hA�I"B@�m&K��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����,�lgK������ͭnw��������p�K�����M�r����:�$ !�	   ,    � � � - . . /01122334455 66 7 8!7!8"8"8"9#:#;$:$;%;%<%=&<&='>(?(?)@)A*@+B+C,D-D-E.E.F/F/G0G0H	0H	1H	1I	1J	2I	2J	3J
4K
4L
5M
6M6N6O7O8P9Q9Q9R:R:S;S<S;T<T<U=U=V>V?W?X@X@YAYAZAZBZB[C\D\D]E^F^F_G`G`GaHbIbIcJcKdKeLeLfMfMgNgNhOhOiPiPjQkRkRlRlSmTnUnVpWqXrYtZs[uZu[u[v\v]w]x^y_z`z`{a{a|b|b}c}c~d~de�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�o�p�p�q�r� r� s� s� t� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-��������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L���"p"���Z:o�VQ�&���<y-��װc����OF����u-8n;Tp�X���Q� <a�0ՐK�=N��Y��ν77:���ӽ|oh`N� �'T'?Q(��0˼}޶��� ��nO)���6�([6G��8��A�F( a(b�!ᆰŢ_F�R�_��ቮaDF,Lc_^ف���q��7Mx[MA#��T�:j�?���DaHH�V*|�䏚 V���L��%5�!X�唋4��fp�gz��BV�s":W!�e�S�����X�U��yf�@Ό�X��g�Ev��8�U���	O�� >�Qə?64�b�3J�s�1�/Irc  �VႢ�A ��tˏeXuĉ������ �f\%�� @��@z8P\���,`�	�x[�2'`�ʆ�(���;�0`����8��#�g�Y�!�91t�H��ŢmV�H8�G�0�(l%��� �"�3��Z�!"]�0,oE�����(����V�D�CI�x��]�c`0&)���\�U�q�{zi�_��'�Ѝ��� ���R�҈�a%a�1+y��b�]�),�A#�b�a��$,-���40V>�R ��HbXB��J�$)�X+x�Jdx�EXDHJB�9�9B���}u����^~��W�؋I��g4|���$]�+��H���2��ث��Z� a� pm�����6c=G�2($k�r�x@�!�CI�X�m :�nt~��Q�վ"C�F���$[aņl�<�0�f��X���\�H�l�Q�l�c�����[p�q��$(n(�";�Ul�1�	��U�:D$ 	��H6q�p�'��8�8��0��F���f���4d���&n!cJCH�`�Y  A6�47�P���QwFᱚ4CSlp��.Ѓ2d�K��@L6�J��� �`����A5q��c�%d	�[�l����J��A��L�6a@4<)2$D���3n�T�&�+]�9�4b���DCj��$�DO�t'����
8a�]��66d �H�r��YP"��d�r҆T6�"��$6x�O��"&Z$"x�K��FȈ*%At��'�� !/8��B�K�	x��e� �K2�,,3`�0%Hʰ(�%�CI������	X*�8$�P�؃�H� >tR�0R��8��2�*q�)���SJ�@�$�B-q���T<�qX��ф�4��w2�0%�FB�@DjE�2B�?��֘���1i "���F(��v�GxC$^�fx���!�0�d�'��p�P���hF.JA�A���	�hGK�Қ���M�jW��ֺ����>�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv�ː�  !�	   ,    � � � - . / . /0112233445 66 7 8!7!8"8"9#:$;%;%<%=&<&='>(?(?)@)A*@*B+A+B,C,D-D-E.E.F/F/G0G1H	1H	1I	1J	2I	2J	3J
3K
4L
5M
6M6N6O7N7O8P9Q9Q:R:S;S<S<T<U=U>V?W?X@X@YAYAZAZB[C\D\D]E]E^G_G`G`GaHaHbIbKdKeLeLfMgNgNhOhOiQkRkRlSlSmTnUnUoUpVpWqXrXsYtZsZt[uZu[u\v]x^y_z`z`{a{a|b|b}c}c~c~d~e�f�f�g�g�h�i�i�j�k�k�l�k�l�m�m�n�n�o�p�p�q�r� r� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#{�#|�#|�#}�$}�$}�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��!g��5�Y�j�H5�#�ɇ�,A�,��װc���F�K<������3n;\�W�㽽5� <a�.͐K�m��WԚν��5���㭻y�Ǹ�}�����_�,$������������z������2cr �k���@�q�&��ƃ�3�E��l�p��vHE/ s07�%D�)"2���as�X)XCc�� ��u#X	�#��<Ԡy�L �K�HHCn�g�W:T���_]%@��K��P���EW��Y%	���p���U~�DA2d`-\��%e,����#U�0�	���VKp�L�!Ԁ��8� P`��l5����Q�C�^H�"1��`&Z�.2DdA#)^��Z��`*P�6|��BV= �J�L�ݡ��(Ʋ F���t�����F��{�Zuq`��nele	�t|Ƚ�廕���B H� ��Z� �"Ar�]=y�)#�ɸzx��9��J�yz�~����vh��jW
�W�I�Ye/�z��1�5K:�X4��J;���6=�e~�����5�}���G�o�E~���@�6�XT���J��a'c��-+�A�b����3*y�daU�_(�͒�V��q�
/iM�_1��%i`9��p�( �d��|�"�Wi���H�2�,�r����t�����V���KH��HQ,B�/���BL� رG�(�Z# �ao~0�B���O�Q&�%#iK���k�l� *���R)��E��k��_E�
�l�r+��f����,� S�'.�Ձ,!�� !r�5�@��>FhI��u�H`!<""�?�p�/d�0t�!�[����q�Wp� ذ��`�*���p��P��I�3<  @�F��9��@)pI1U%,�;�B$��z	�aKr�v��	h8�B�%�>�@BA�p�Cv�/�#�)��N	^Ҁe9oB�>y�'�dO����T�29�+c����p���dL̄�pp�!���d�f��s41Kmp�&�L�#$ I~�
71)Q�D��X8)D&�p�:dR:��!������qb/�����.B�L����؝F���=�'S0潴ʏ|�� GC�b�b�.��q�e�(	((��Q����wT�8���(AhG#d8�qK�b�5��G�H#KZP�QcU�Р$�"	1IBt�5�O*G���������Z����5�9Fr0O�@~h�y���3��+�A�"PQbxf�� ���X (�� N܂l���$����b粘ͬf7���z����hGK�Қ���M�jW��ֺ����0�lgK������ͭnw��������p�K�����M�r����:��Ѝ.Q !�	   ,    � � � - . . /01122334456 66 7 8!7!8"9#9#:$;%<%=&<&=&>'>(?(?)@*@*A+B,C,D-D.E/F/G0G0H	0H	1H	1I	1J	2I	2J	3J
4K
4L
5M
6M6N6O7N7O7P8P9Q8Q9Q:R:S;S<S<T<U=U>V>W?W?X@X@YAZAZC\C]D\D]D]E^F_G_G`G`GaHaHbIbIcJcJcKdKeLeLfMfMgNgNhOhOiPiPjQkRkRlSmTnUnUoVpWqXrYtZsZt[uZu[u[v\w]x_z`za{a|b}c}c~d~de�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�o�o�p�q�r� r� s� t�!t�!u�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��!m��5�ٷi�F9�c�ɇ�,I���װc�~�&�K:����u�6n;T@�W�㽹9� <a�.̐K����QԚνw48���í�y�Ǹ�}�����]�����������y��z������2cx �k����V���9a��� ��6Z�a'P↔0�Ĝb$��≄<��s��l�0��y,����&Lᝅ�1?��FB5��[1N�EH�3�q��iRX�EAL��	Y�lxIK�� 9��Ȍ;T�{_��D����BhAK�ш ����L�_�� 7|�P�lH�R�7�WC8�KU0I��m�*�b ELXC*r��|��� `Q	��zܪ]�r ,
`��'��vAWL%R�l<r��ݰ�"Ͼ֌W� ��G�d�M&^���-�TH�Utu�3�I�Τ�U��B�&���U+��PR*�b�6��b��5���]%�'M���T�����RҸH	`ŀ7*�Pކ� V���R!�!��}�.2�5���<H�cQ��'+ ����~��H���~ۦ4��a�����r4�@��J�JF��_J(�.5��_�'�P͏՘���"$J��W�I$�d2�tDw��J�$U ��H@��sg�Im���H̢k,����ys���.�d�뺖")He�w�I���KH����G����%��_Э��8�bGO�'�I8���IO�k#r�!~|��,��<��#�æ�F(�_"'�r�+[�@��'�W��H_&��Pa/�� W�M/@`�?�@�+d��I�ʋ l��0��J����@D��q��< bJ~� j�����B�*\�A̸�C��!�*�ߠ1�D���P38 �$�B�XC� 8�AIXI1Ԕ%��8èNt�iF�"p ���U�%��G(��a��x�-�S#��M��N�ZddR:aC�>��i8�%= eoF��=��7��!^F4$��|%d��#���	  iI��#e%Ȑh���HAM��GH$ ���7�p5�r���'CyCd�i�$љlr����aH[��J���6�]�0@�	����m� ӣ�6�)$SW� �GĐq=�C1��eP��)�):P$K��C�P��k��[H���$o8bA&��#��JT1)�=O���$�pQ2���a`DBL����"���t d5�!<��k$bXQk�s@� �4	�R�P#t�A��"�a��1<�ZlBmp~�
��	n�&nkc��D �`G�x����hGK�Қ���M�jW��ֺ����:�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���=J@  !�	   ,    � � � - . . /0112234455 66 7 8!7!8"8"9#9#:$;%<%=&<&>'>(?(?)@)A*@*A*B+B+C,C,D-D.E.F/F/G0H1H	0H	1I	1J	2J
4L
5L
5M
6M6N6O7O7P8P9Q9Q:R:S;S;T<U=U>V?W?X@YAYAZAZC\D\E^F^F_G_G`G`GaH`HaHbIbIcJcKdKeLeLfMgNgNhOhOiPiPjQkRkRlSmTnUnVpWqXrYtZsZt[uZu[u[v]w]x^x^y_y_z`z`{a{a|b|b}c}c~c~d~de�f�f�g�g�h�i�j�k�k�k�l�m�m�o�p�p�q�r� r� r� s� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#{�#|�#|�#}�$|�$}�$}�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�� f��l�7i�B1�����9T̛�װc�nu&�G2�����*3n;L�EW�㽷1� <a ,ʐK�}�΃�U̚ν7�4��x���y�Į�}!����Y�������������uC�z������2cp �k����V���)a��~ ƃ6ZȈa)L←0����#���≂FÌ.b�-�x"~��R��Ð3r��^�lH�G���9p�Ȍ:�uD����BP!K�Ј`���˃r<�E4# ���� �	�����QWZ�J%�ÅZ� h
%a�����Y9 ������sZY��J-�	�ް��X��K�jde 7.td���E	�q|��6���}� � ��!֍�%#H&"���2R �I�X�T[�)>�V6��bR�͸GX	���I 3�1��E�H����0�d4.��Rf���$!�4�*�p�-� �te�$~��dE���Cwl�4~��$��-�ā}�%1R�-;H-�r^4��~��n����|f��~���G�w��	|���~˨ԅ�[�~-�D� ��7.n�JU����H�ݧ�I*,{�4%�t	~���~�����>�AI`� "}b�H|��.���k������@���©H���H- x7H4ʪ7����Y0�3���Gx��k���Q���
I� X�,#�o4��<~��Q �k�}G5X�H�؋a�~l�ltA���b�(b�.����/6��E@��$+;P(.R�_�7���E6������D� B�]06��E$��E%[rԨE�P:�(DHУ�%��p�4�0X�3��z� e̮!�5�	�D�B�HC�4x�B�8M�"_�A�A���,��cz��Tp�.��B�5�8��h ;�bC�`�n��m� D�#�S��j���"L�'.Y�1<ɝ�!���/�#��8�R�^ٛJ¤�܍"b�\�F2�/_#�k�����b��jS�r� �Kc\�&��e#$�K��,��h�� ��J���Hن�4��p�I71)��`$���d�xF֢� .n��'��'t�25b���5J���k��#\����1�������C���*
:�j�U$Y�&�$h�!�F1�q�F,�$hD��F��"� i��N�����.*�	��3�B�(BL�`,�l*C����Ԅ����`E5�91�`�"�$ 7�C�s8��+�9C"J1�`x���̠l�'�����K���'ц+� 0ŎhGK�Қ���M�jW��ֺ����?�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv��ݢ !�	   ,    � � � - . . /0112233445 66 7 8!7!8"9#9#:$;%<%=&=&>'>(?'?(?)@)A*@*A*B+B,C,D-D-E.E/F/G0G0H	1H	1I	1J	2J
4K
4L
5M
6M6N6O7N7O7P8P8Q9Q8Q9Q:R:S;S;T<T<U=U>V?W?X@X@YAYAZAZB[C\C]D\D]D^F_G_G`G`GaHaHbIbKdKeLeLfMfMgNgNhOhOiPiQjQkRkRlRlSmSnTnUnVpWqXrYtZsZtZu[uZu[u[v]x^x^y_y_z`z`{a{a|b|b}c}c~c~d~de�f�f�f�f�g�g�h�i�j�k�k�l�m�m�o�p�p�q�r� r� s� s� t� t�!t�!u�!u�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$�$�%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��-������������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�f!j��U�8l�PQ�3�I��(i�L��װc����J@�����,5n;T�W�㽿Q� <a�.ϐK�ͭσ�U�ν�57����y�ɸ�m����g�d������%������z������2cv �k���XV(N�9a��� ƃ7ZH�a(d↘0�Ɯ�%��≈FÌ.b�-�x"~��X��Ð3���^�l��J���8|QɌ:�D����Bh�K�ֈ��-~��5#�]D8��Mp����I�+�b EKhc�&t� ,Xd�0�1�)֢ F�b!qap�0lĈ�0����R�"l J�\(CG�p� N4���2\��	�w|�G��|����҂I���KH�V	65��55�t�4�D����:S�]��H��
I�X�M2��+#��_�$�b�,2�"�׋I�b�0�p�%!%�'IУ�����}ք��/��5��$�y ����C�ƺ�	~�}T�}���E����	~V�d~���ǃ�ܚR&��R�M���<X˫*M�� Q�_(+P������}U�~��H�}��~=��~Ѩ䅋Y�d��}(�T� �d�1��0~���}p����3fS�I���H����I03d2���~Ɉdʽ$Q )��$>���"��2�o#��-��4�g���@�d ������`�"U#0�@J�u��G�~�3$Y �+��Q�=G~ (	IY N����n#r4���QA��r�F�u��8b# Ɓ&P�Th��^V@�|"�A�� ��� A��EF�
���V�������"rș�7�E@A �%�[
�i Iܐ;�DB�
!%�pP6�0C�l�3�&��g\�!0�������A�h�5gC��  @`��J<��P�Ia%�p�� %
���p�6��m��_�Ђ%���*K�pD }�98:��dO�<O8�p,�>�p	��J�x!!d�ew����I�ҡ�B� L�d	&�(fo��#*s7��	���	��DƠd��1>3"t� vFMqdC5%5+!� ����(�M���CT���CNQ�9\�A�4�N�YKl�"Ch�+ȓC�R�z�J@��r&��2b���PA��7�Ǎ[��ݨ`6�0��~�`�HX���	#pDA�G��;\�$��6��	%	
�Q8(a��U�.��R 7(4D���JV��]�M��P�	1A�D5P*F���Q҄��%�@�ī��5�IF jPE���h�y��%5+�Y�#V�cx���!����(���@O�"j�(F.T�5!t؉T�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv����z����x�K�����M�z�[��  !�	   ,    � � � - . . /011223445 66 7 8!7!8"8"9#9#:$:$;%<%=&<(?(?)@)A*@+B+C-D-E.E/F/G0G0H1H	1H	1I	1J	2J	3J
3K
4L
5L
5M
6M6N6O7O7P8P9Q8Q9Q:R:S;S<S;T<T<U=U>V?W?X@X@YAYAZAZB[C\D\D]D]D^E^F_G_G`G`GaHaHbIbIcJcKdKeLeLfMfMgNgNhOhOiPiPjQkRkRlSlSmTnUnUpVpWqXrXsYtZsZt[uZu[u[v]w]x^x^y_z`z`{a{a|b|b}c}c~c~d~de�f�f�f�f�g�g�h�i�j�k�m�m�n�o�p�p�q�r� r� s� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#{�#|�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��-��������������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��j��u,ڸl�LQ�3&	��i�l��װc���&�G>����5,5n;LX���Q� <a�-АK��͏��K�ν�57�����y�˴�m�����c�܃�������E������z������2cw �k���V8��-a��� ��7ZH�a#h↗0�Ȝ�%��≈Ì.b�-�x"~��V��Ð8:1v��6�l2�/��a&fq��E%3� ���v-Q�3w0��X��5 �4Et�m"�J�8�4��l�L<��/������`Z8K�9�Pw���
��4:�X�IN<s�'ـ�+�TVB1��*�Uc[I�HK- ��M���}������0�Q#�P�-S �#)G�T��4�x	$a��R�-��D~q�d"~� "^2�v��2ҍ�� �%�!$�] ��2R �<�~0�_"���%��6!�T�����/&)P˃;t 7�����qR="(�K��LH��J`�/Q��7!��JG>H�K���G���JYTȂK��HW�'
K{<��,��� )z�$,`�����R���}R���z�Ұ�IR�岒!������ 	�I�R.^�R��� �y���3����A���qR	���Is�'�H���xIx�c3�D~ֆ�6~�D�1H���#���'"��*#E`\��؂�H��w�H' �CHރ��)�z$���d���oԾ��q��G�~�A��������J��# �$H�4 ��#�c3A���@S ɲ 4�hw�`lJ���@{"�)��]�0S�n<aC� �|� 
�Iv� U؋"��t�`t�"P�jp�Y �H{��l�"C�-P�&P�"@�ӈD��p�R"���!�	� �,����AШ�C`��*�B���
$��8�4> �jC�P�b7h�AOXI2�d#l	C�� C���	`'��j� � 	h�����#��?߰A��_��,�1�#�%�
�|O$\��fD�;`H�ɝf,�%9�tڰ=�9b��"��r2�L�M!d£x�f��ԥ=ǡQŤ�dg 2�M�S%�	1�9Ј@����lrvʎ"�`�r�qN�"�!t��hr�b�A��Ԉ�F<�c�'���**��Q�r��n����7T�%%�`�/B��e0p�#
~�#q" Y@r�$L��(Fx��>���`�KtQ1����a�!2��Xb�8�n +R��O:�2�I� c���R�n4��$��&�>1ǫ��5��F'�@՛��h�y���#�U+ �B��\ �3�X�-Hq�B��A����Btb�G4���T8"?pv�K��Z���ͮv����z����x�K�����M�z����������|�K������ͯ~������� ��L���N����%  !�	   ,    � � � - . . /01122334455 66 7 8!7!8"8"9#:$;%<%=&<&='>(?(?)@)A*@+B+C,C,D-D.E.F/F/G0G0H1H	1H	1I	1J	2I	2J	3J
3K
4K
4L
4M
5M
6M6N6O7N7O8P8Q9Q8Q9Q:R:S;S<S;T<T<U=U=V>V?W?X@X@YAYAZAZB[C\C]D\D]D]E^F_G_G`G`GaHbIbIcJcKdKeLeLfMfMgNgNhOhOiPiPjQjQkRkRlSmTnUnUoVpWqXrYtZsZtZu[uZu[u\v]x^y_y`z`{a{a|b|b}c}c~d~de�f�f�f�g�g�h�i�i�j�j�k�k�m�m�n�n�o�p�p�q�q�r� r� r� s� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#{�#|�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L���"r&�&�ۻq�^]�&���<�t��װc��5'�ON����u.9n;T�FY���]� <a 1ېK��Q�νw�:���î�y����}�����u�L������\�����#�z������2c} �k���V��qa���(B��DĆFb���V'HܔB9$n��Pd���5g�d�41��	Pt2]�2�c����Jw{ĴÑ=��S%�5�<B�;��6�Ĉ�G���+����d�N8]p�: �T̆����
P�����Me�'�JOT�M�!� ���6��~)�� ;��P e|��4������BD�`�!/���	�Z�d��@�X�	M� X�I= xK�������Ł%��ʁ�(��XX�L���"%ap`3l��1��	��0+� ��*G�T��1uP�f�t�z�H�����  �B9���G�T�IL`��9�t�4��I�t�t�2�����@)���K���H���CI�<H�0ih�H��g�I
l�`4�4�6��R��i�Y"�J�.�_ y��(� ΃��$��~$~쨴ÿ~�R ߇�HI���J�:��
.� �*,	� 6��D
~_�d�}�����������������<
KKޗHC�G�J\�a�*�y ��7*�@M�e�~&�d�u�t�g=�	�I�v���G���Iz�'��	cR�j��&9��5"��3I
���;�X?���D��� `q?��B^ ��� � h!�)
�X(�#}��	F�� � +(�Qp�#H�}�A�L hA	cs��X�?� ����pD����lj��?��� Ԍh�Jbl$��H�@(	�R�֐"oJ�ŉ @� R�I�v�YL�"M8�y��X� A<�N�y����q�"/C�/P�(^�"<8Ɔ�f�HD "!������e8�lpH\��b`��FC%]�P3�`�� |��TD��d���@�Q!+�dx�D��'�`
����1��|�G�0�" @�0��4X�B��$��a����s���1�x.�a����.!d��6���9zXH *��� B���F2��Ec3�O�s�����d��`����(@�r��&���$ �E���"ʎ�QDMCN�PNZ�A%WNj��n�#FH�=�ȓ1���H�OC��s�H7b���1A��IgȎ9���"9�0����ؙHb`#
6�EA�Y�d<�$ �9
�2
�	���*Bt`�=z�R�:H�D֠+KT�����E��p�
����Ij� h���RQ�� T	�����NaT���5�Y. Q��$ :8D_�cH<��V���0�Yc�)�4j!�H�A	�f@�9$��87�!YHFhv������� ��L���N����;�����'L�
[��ΰ�7��{�� ��GL����(N��W�����0���gL�%  !�	   ,    � � � - . . /01122334455 66 6 7 8!7!8"8"9#9#:$;%;%<%=&<&='>(?(?)@*@*B+B,C,D-D-E.E.F/F/G0G0H	1H	1I	1J	2I	3J
3K
4L
5M
6M6N6O7N7O7P8P8Q9Q8Q9Q:R:S;S<S;T<T<U=U=V>V?W?X@X@YAYAZAZBZB[C]D\D]D^E^F_G`G`GaHaHbIbIcKdKeLeLfMfMgNgOhOiPiQjQkRkRlRlSlSmSnTnUnUoUoVpWqXrYtZsZtZu[uZu[u[v\v]x^x^y_y_z`z`{a{a|b|b}c}c~c~d~de�e�f�f�f�g�g�h�i�i�j�j�k�l�m�m�n�o�p�q�q�r� q� r� s� s�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�f�"o2�*f-��t�du�&J��<��͞�װc����OV����u�7n;Tp�Y���u� <a 1��K�����W�ν�9:���3��y����������smP��38E2���a��x#[4pe��VQi�s/%��F��|@!��=��ሮ��Oy���Nw��={���{f�4ŋ/6�2��q8�h�NE�gDM)�$����$����L\�d���D�� #W.�Mf	�a^�GMdX�KX��j�$�����#s��M�d�HK3�y%=Q�tI�����28���.8P�exf2)1".+=�b7~0�_�9$Ȕ̈�>�$̈��%C�Q��P��#&CDh��/���Ȉ?��K�� @�J�8�L�a(�I<d����0͋�Ą�1~`R,��E��1a�������8��%/��
�4�MIc4HϱU��7�4DyA)��Q#.
ӬK2�I��g�  E�(1Ep�܌�&�5���q�DG�(�����@*$�s�K��"���$�ވ� ��"R<�)c�ۍX/]�1|Ԅ� �~�D����K�082�G!0��I#�C�!/]�  ���<*�6���t�I���Ь�����:�E������� $rS1K����G\��IK�fLx+}�_ e�_+-)p�^�d�Z�4�Ǹd�#�ҫ��
�����$z�R;�� ����дj|�	�
R=���*$���I{�W�H��WL�KݔJ"��hC$�`L20 ���Dt �CϘ I
�U�$�Ij0�݄DF�߈�A����Al��>��9���\4��q�{���g�ӌ�8�;��@(\t
� �Iv� B|��	F��N|��IH75���Y��8��q�I�ՠh<@#ЅXP�ab#�R�*P�Y`�-����!Y�E�H$E����$BȐ-XV�8�?� ^�X� ��M���n@!T� � �c.B(r�	%N�""`��!@�\TK�"#�ň���@e� j�ᢥ@P|Q8���e�y)ႋ�!�$���ǋ�&��#H��h���:oDWX	6pd�58�R`�j���fKEt � 
m@ڋ���`*H�8����%�%�*)�Ȁ�.��E�p	���qÇQCMm�6�a�z�BTE&�(*|�ȐM(�=��I���O8��T�N60��/�ǁDp
�g+��Hͺ�?H$ )e�k�QC��A����D0��נ!'��-""�>B'pek8d�#HȬ�	$��[f֤j"~���Vw1 .����`�555ARy�tR��	©�[``$.��K�a>� `�}�`)�%%�$��A�i�J4�	Z^iPXJ��X���%-(a��A��p�Ƌj���4�8.���%0�?�`,M~ 	�6hJ��jXs�nX�	��I r��֘G�x�r�r8d�Ÿ���_�BM0%P.0*���8���a�b�o(�e�C����8α�w�����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�
����6��( !�	   ,    � � � - . . /0112233456 66 7 8!7!8"8"9#9#:$;%;%<%=&<&='>(?(?)@)A*@*B+B,C-D-E.E/F/G0G0H	1H	1I	1J	2I	2J	3J
3K
4L
5M
6M6N6O7N7O8P8Q9Q9Q:R:S;S<S;T<T<U=U>V?W?X@X@YAYAZAZB[C]D\D]D^E^F_G_G`G`GaHaHbIbIcJcKdKeLeLfMfMgNgNhOhOiPiPjQkRkRlRlSmTnUnVpWqXrXsYtZsZtZu[u[u[v\v]x^x^y_z`z`{a{a|b|b}c~d~de�f�f�f�g�g�h�i�i�j�k�m�m�n�n�o�o�p�p�q�q�r� r� s� s� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$~�$~�$�$�%��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�� l�ҥ�:n�PI�S�ɇ�(a���װc���F�CB�����,6�����4�z+W.)������dj�˳�􀨄D�s��`
c����9��6�" p�����q�3v��|@QĂ߁�тAO�x�Cq��f�;%A�1!�9��9|���*n��Oh��"l�,h�UX�=��⎮Y�bMJ��Nr�h$:w��ȎY��đGB�&;���M<�呒�$���P�	�l	�%´���'�˘�e%11q�/�4��f"�P&	S|�)�K�Y�
/!g�f��R��9�K�@�'/�%-�)��0�$G�cK�@�	�J���9�1	�;��Ǒ��$�����Ah�˖ڌ�R��h�J�T�G� 6P.#�K��͎��4Ď��Q�	KLв�x'��b+P��7G^���X�I:��p̑z�4@�.�ZR�"ڢ F�r$1-���	�����0�ђF��.3":S�"��BG�)�1� b�=�t���rT���P�R "BB7!���<R�ʄH�H��8�H��FLR�H�Hu�ثH|£9W�@�6�y>K�/zSL[�Ȉ�H�T�I
��c2�D�{*R!�q����J�-b�}�(������� �`�J8��"�-�%�9TD�Ĭ����/*����<BC3K��R�FҒn;���J�RXHST(JK
��',YL! �P�..������K��{�B�ռ4;�n��/�'�DA�rIت��� D���4����Gv;	*t�H�B��I�����B*�)B$���iGÐ�H|�P��!bEL��@݂`"qW�� �����0��R!4�ܯB�I6B�"��F��8b �QH$�Z��D�G���F Q4�X�E4 �v �` F2Gn�*xd�����i�F]�aBdp��i��p�J�
�B��Z�i�!P8�' I�0D�0��\d��� ڱ�Btd$`�"(rNR�a�"g�O E#i��ċ^����H��((� �2�9�G���@/:BJ��"p��!k����@�<@:G���)%W0�2�P��H ��"lA�l�@B. ���H
+Aّ^�Y]�n`ŋ�����ia���%�J�`�1G�"�-�� ���В�4D@\^z�G�dРi�X�3��E��K��S]r!�+j�xE(�>nr$�z C��QT��7"R������I
�����)"�DY����k�S% ���5�)M�p��Ȱ"���kȐ����Ȯ�꧜�5��p�E����6�'{�*.^��l̫����z�?8#�U�)���Ҹ�AH�P��z�	C):_:
��0�4-g�� Վ�b0�� �^��CIB"5�E$%�D�t�%,� p�,����D���6�pZ�8���$D$�H�`C5�b�c��Lx����(չ�jXs�p|B�q�AI�8cJ�.V.�G�B��6l�	?��
J`��6��x5���U4�A��mv�����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�����6���p����L�:��$ !�	   ,    � � � - . . /011223344556 66 7 8!7!8"8"8"9#9#:$;%;%<%=&<&='>(?(?)@)A*@+A*B+A+B+C,C,D-D-E.E.F/F/G0G0H	0H	1H	1I	1J	2I	2J	3J
4K
4L
5M
6M6N6O7N7O7P8P8Q9Q8Q9Q:R:S;S<S;T<T<U=U>V>W?W?X@X@YAYAZAZB[B\C[C\C]D\D]D^E^F_G_G`G`GaHbIbJcKdKeLeLfMfMgOhOiPiQkRkRlRlSmSnTmTnUnUoVpWqXrYtZsZtZuZu[u[v\v\w]w]x^x^y_y_z`za{a|b|b}c}c~c~d~de�f�f�f�g�g�h�i�j�k�l�m�m�n�o�o�p�p�q�q�r� r� r� s� s� t�!t�!u�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#{�#|�#|�#}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��&v<�R���>w�p�*$�����%+��_X�n��۸s�.v�� e����Y��μ�0;��0�7�GSHU GZ��������S9���)�4��r����(������v����h;y�0��lG	0>	F���TF���ӆQ����p@�6��	QK�S��4!S+�fLA�㊊��ƍ����Os�b0ѹ����CFO� �":H����m��T�8HKMf��9i�e���4Ƙ��p����(+Y ���dP��yc)�4��� 0����#)*��g-}�$��BZ�'zR���
�%J$�'/)Ph�Bڑ�ո鍠-YB���l���(n�R�R��J4�"��'�Ԍ���Q�T ���YK9� ���d���BB�ᩓ��Rs�#d*s#>��P m��$7���"��xMJO��LU�,�Ÿ����(J����]񫐧�$A�+�r�1
�*E,\��!1��,�tˊ�(�� �ELD�"&%m�b5lD��9��y%�7�+�Б�<�S�K1��I���iG�y��/R�($��2�t����4@6�3��)B�%2�� V+R �𘏋0Ō�"��%�#<*��ć��d�Θ��2<f� L�`�MH	|H�I�#.������$7�DB;<6��> ��Rs�8�K�E�HP`H�Jh�H�.��� E!-,!�c8��
�^�d����܍����	���Ғ"�X�J�'8HJ�3\��w�n%Ê�@���%����R2�� $�	^·u)%,�P�@��&���Nr��C$DK�2`���}�$���7Db���D�b��4&@$|"�Çz�&��F��H��!:�d%� L� $]p�#��E��A�-)��X�:� "I���D�L]<E5���$�Ð>p��M��1$��DՀ@Lx��Nl�X�H��C�-��\ʉ ��%��I��^�&�@�4F`�"FA8I1bt�=��jBj�(�%�r�i"R,�AX�E�%�LH���,QR��C9��yS<�"H��Q���/FLɅxT�< !(��;�
�P�*r4�pM�h`p�V�'��X������0c���J� H 4�B��}Y+W�y��(R�"i�,��K��Ǌ�a�1��KP�2�q��O1�Ϲ�C��,r��
�1фSq㶋�b��Y*L����"��ju�1����Nm�E�
�2'M5�B>�
*�@�n�G>�X:`��D^o��`b�4�H��Z���©v�H�!VN�i8��GB�ͤB�'-�i�>b `�A	ZI_r����)<�0���TӸ�Hr��WUcEY�35�����xU)Vj�*dRO�0�I60�Ez��YJ��%q �%4�e��a*�@�$6ڀƕL�;굃$�����0��,!��"�U�m�9��& �$z�ol�
���e���^(��ه9���]HB(�O0��-�a�`�>͡e�v`�o*C����8α�w�����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�����6���? !�	   ,    � � � - . / . /01122334556 66 7 8!7!8"8"9#9#:$;%<%=&<&=&>'>(?(?)@*@*B+B,C-D-E.E/F/G0G0H	0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N7N7O7P8P8Q9Q8Q9Q9R:R:S;S;T<T<U=U>V?W?X@X@YAYAZAZB[C\C]D\D]D]D^E^F_G_G`GaH`HaHbIbIcJcKdKeLfMfMgNgNhOhOiPiPjQkRkRlRlSmSnTnToUnUpVpWqXrXsYtZsZtZu[uZu[u[v\w]x^x_y_z`za{a|b|b}c}c~c~d~de�f�f�g�g�h�i�j�j�k�m�m�n�n�o�p�p�q�q�r� r� s� s�!t�!u�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#{�#|�#|�#}�$}�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&�#r2�
�[<r�`q�&J������*��s�EV�#�.xr�Z������kN�%H_��&	�>Qż��]r4��c���RH��.p�̻���8�u�;�5� ����x�E���wm]��
���8v���	��/- 5  �8h`5c�R+z���.Zȋv*�P�y�\0�߬h�7����q�CPg4������I���<b�䆑%�bI�0ٝ="e��aR4WZ��N�uY" %�"fut��ř+>B�'l2��M@�g���Ɲñ�CM(��g�����8&�t�4���H�D
�4�Ԉ�%F�q�HL8p�"� �c����R���Z"!��)�.E"��f��%���î8Z!��<�+#�(n8���F'g�P
>��� �H9�JO�M �!� �\)	.} H6F.��/8�cHp8RJC�K R������ĸQ�2��/ѐ�C�����d:�JL	��"-'� �.�UtB�F��Ȉ�I����1���U�Ā0+�R�+2��F�0)CL([�!�Q�;sd���dS�:�I����#F���K�HJ��
C H�	J�L�a8#��a"ybd�0Q�"���,#�ʏ������!���P�-?���KDt��H�XX�I�#4���䄤@���D��+�bhK�t�vG!tJ#��c"/���q�`�;*񰰌E�D@��� �.��?��}K\:XH�;�
Kq�x��,�b� -��&-Q��/
RI���h�BJc�h&#T�dh��GJ�s���X^�,���B�x	�~t����@( �:4��8�_D@�	:t0�p�>x�I*B7����B���6,�,�G��I�a�j����KL@7)c$B�T!:t�1A�-􋘅�z�HXP�¤F���:2B�P$���1��������h m��p:���#NR#�(�&H�> � &b#;r�1�G$aZ����ԀI���֡
�D+�]R&�b�I K�
�(nE��L��d��"���xp�^�(�dIڌ4#PDr2�J��#\� &�܏�q�RBd*[R��#�L�x��mx�!�pldD���G̨��Z2�I�p�@B2pB��
+�Ƴ�5- 0@Y�C~�А�K�@$q�arL�K�i)\LaHa�;��"k������>RI�(.i�oLu�����F^�]A$�@�}v`�
 IԤjG�V�H��U�PCd1Q�	-��ee�9TP��Jsc`\�7����H0�W�!'���Gb��BB'�+�^Q$����䉮u����oH]�O~8�J�� �$�������(A��:de)�̈�Ujp�mJR�%E���H��B�ˡDA�]��J4��8E#
K1�.ˤ5�d��8��G�@@Е#h�V�hq0gT����&@��5V�
}]e7��d{�!���j{��	'4+��C&li��Ƹ'����FT��#N1q�f6����W����0���gL����8α�w�����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���h�q@  !�	   ,    � � � - . / . /01223344556 66 7 8!7!8"9#:$:$;%;%<%=&<&=&>'>(?(?)@+A+B+C,C-D.E/F/G0G0H1H	1H	1I	1J	2I	2J	3J
2K
3K
4L
5L
5M
6M6N6O7N7O8P8Q9Q8Q9Q9R:R:S;S<S;T<T<U=U=V>V?W?X@X@YAYAZAZBZB[C[C]D\D]D^E^F_G_G`G`HaHbIbIcJcJcKdKeLeLfMfMgNgNhOhOiPiPjQkRkRlRlSmSnTnToUnUpVpWqXrXsYtZsZtZu[uZu[u[v\v\w]w]x^x^y_y_z`z`{a{a|b|b}c}c~c~d~dee�e�f�f�f�g�g�h�i�j�k�k�m�m�n�o�p�p�q�q�r� r� s� s�!u�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&#tB�Z���>w�n�B�FJ��(�ze�Z�}��m[�Ԝ"�*��	�����6V'w� :4���7MN`�"��u���d��!P�����:2U��i����W�C���W/-́�i<�߿�Q��64��~��T�8`;zܗR 
�H �|����I��� E] ��Ik���/u�9.fx#� O��SDPh��c�� �!H�9�>b�d��(��bG�%p�4ȕ(��G5p9�;�!���ttř�ّl�H	GtĹ�7�p��(���$|�g�5� O�(�@F} �^;%�d 7��xJF)T7��� b�Q8�^IL7��b�}��p��������yp���q��%��x�Ed�$-�`l��HqQ'��&�J�\�
P��@<�a
�>\DJz�b�@�Br�r�3+E��8�h�j(�e;$\t�/��⅃}0�8J6�2C*���\��P�~����Ȑä��ϴQ�BiL0̀^�B�L��t:QV�JL���.'�P�0�Ut6P���x�I��x�1P�x�� 3.�RR.Z��F�@CLd��!��b>&s���\B��I���%J&�2L�XJҮ2C H�(�JLH�:#�
""����0	��"�.# ː�����!1 �P�<��KC���H�d�I
,3�6�T�� ���D��.޲�K��8�G!��J#�3d#/� �qɐ!>*�a�Y�D@�
� �V�RC�#K�dHH��P-XR8��n,�E�� 8d�-���A���LAk I2��( i<�K�!~�J�KJ����HV�!z\o%���R��� $�`��^":�c�'9�(1&���N�"���\��!��&�F��!�^��0)�\D�	�$ ��H� "e���sQ2��e("����;()7�H3�C��q@��KR�$WL�# a��A�U��K��Jqɍ8E� 	\d��d@JJ%Gt�"4��.��`"H%�b#P�*P�O�[|ɚ�IR~-LR�]*&���4D`���E;8�]d�D��oJjǏ&b���$M�Q10 ��nH���"2���	)��ԡg����Q9��� �!$S	�D�7��{˹�4� ��\ ��QV�(�����Nb91�";�@�%��Ai,��q���	ъPZRD6�b(CP�#
��q�M"�����s���2�ª�	LP��L�`�N%d� k��K(�dZ�������-RB�V��7��)M��'�����n�;ia%hM+r�16�%[��%v2
6��%GpGP�`��-����ԉKwx���+?�	���b��z�
S

�:�s$�%+���1��@y�d� C��Q��kPr  ��4� m㴍',E �r��_��x��Q*	v(H<��0��:�S*bp�z�a˞�@�B�,���l��e�<� � G���78�Z?��fxQ
?l�^G�@�PJ����m@A#��28α�w�����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�����6���p�����  !�	   ,    � � � - . / . /01223344556 66 6 7 8!7!8"9#:$:$;%<%=&<&>'>(?(?)@)A*@*A+A+B,C,D-D.E/F/G0G0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N6O7N7O7P8P8Q9Q8Q9Q9R:R:S;S;T<T<U=U>V?W?X@X@YAYAZBZB[C\D\D]D^F_G_G`G`GaH`HaHbIbIcJcKdKeLeLfMfMgNgOhOiPiPjQkRkRlRlSmTmTnUnUoUpVpWqXrYtZsZtZu[uZu[u[v\w]w]x^x^y_y_z`za{a|b|b}c}c~de�f�f�f�g�h�i�i�j�j�k�l�m�m�n�o�p�q�q�r� r� r� s� s� t�!t�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$~�$~�$�$�$��%��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��,��-��������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&$q.�F��<s�^i�F
��$�4��*�5u�QF�R�#�*�R)ۼ�����KNn�1�$�<8�IN`����u��h�	�ѵ�����J2UAf�����C���W�����x��;D��(���^7[��
�h 9u܇����`���� ~xa؈1@I4���!@Q�r⇽l'����-uD86~y UqN�~�CPfXH��2"GX����SS����9 L�'�ѓ`��5�L�'�l��F��y�9ma���X�Þ'bqS� ��&�b���P�,��'1 ��0��\�b'ᩃ� ����IDX��_#�1���s>dǬ�ɓ�Kt��l<�Ư��$Ğ؅CG$�#-���H�PӦ��Jǀ)JO���;����@4T̋��	@�Bo�f1+A1�6~��eS&9&04Ň�0��p3��)}�#<��P f�f50$�����B�ዾ������uf�C&�8_+DTC3D�.=�b�DQ�6e(� Nz��A.�8�I=���� M��0/੢iE��#&�b�/`Ԁ)Yn���w��A ���������L�Q%Y��J���_��eFl��� ��b</tDɔ��SJ~�I����#Sc1L�|J:'C H�L�IL���8#�zb"u2%�0��"�q�,# 7�����!��P�-K�sL�~x�H�|��I
���4�䫃愔���T��6���K����G 8P"�r,	/�����|*���^d� tjH��!g��Kb�[B�$ �+X�:"i�s+�Ň� �V9(-��~!!���B�i@�J�DcI�`	+f'|h.9����@�t�BB �/��ٵ��K]J�� ��'��K�G$x%(8Q�>"�A&����L�*��nB��Xb�%i�&�Ƈ�!E}Hn/9��
�d'B�H�p�e��%I����!���Dn�O����aJ�dG��!3�$'�F]�)�$xƉ�A�%w#�&>��D��#q��<�`�SBGn J��$�9�3vْd����Nd��(�F�`fK��%S��"�8�Va�8�T1	D����=��Idh#R�%��R9�@��(1�E3 �PoI�""��٨	)Q[��Y���#�7��� ��=:�J|G$lX�%#����!u(���U��}-�i�6qL �z��D�� L�@[K���Al%�;ْ.��?�pI��4������T[��x��.^�s$��qJр	�ۜ>ń ��R	^bQ�
��I I$(�� ��,pб���`�D�L�C���5	��OD)�H��j�Ӓ�)�?��:���P�$D*[����a#���%�"~��]81@D���|�"�NЀ�t\a(
����R�b#U�pnQ�����c�<a� �q�Pܳ(p�l�ğh`�j��}ZG?
n�rԡ�HCLC��	<�jF*�!���@΢��ڰ*<[�����6(����"����R���Mm����P����L�*[��Xβ����.{��`���L�2���hN�0����6���p����L�:���xγ����>��π��M�B�ЈN��K !�	   ,    � � � - . / . /0122334455 66 7 8!7!8"9#9#:$;%;%<%=&<&=&>(?(?)@)A*@*B+B,C-D.E/F/G0G0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N6O7N7O8P8Q9Q8Q9Q9R:R:S;S<S;T<T<U=U=V>V>W?X@X@YAYAZAZB[C\C]D]D^F_G`G`GaHaHbIbIcJcJcKdKeLfMfMfMgNgOhOiPiPjQjQkRkRlRlSmSnTnToUnUoVpWqXrYtZsZtZu[u[u[v\v\w]w]x^x^y_z`z`{a{a|b|b}c}c~dd�e�f�f�f�g�h�i�i�j�k�k�l�l�m�m�n�n�o�p�p�q�q�r� r� s� s�!u�!u�!u�!v�!v�!v�!w�!w�"w�"x�"y�"z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��"o,�F��<s�^e
�ʇ�����Y�y�QF�R�!�*pB)������'wN8
E�8�HL`u���u��`��AQ�����*2UAf�����iC� ��W�����x��;C�Ă.���M,��0H���T&�4�/+ 5 �YX 6^`��xX <yP��h!/ۉT�+.Z�KC�]��CHY�ã����i�<���Q�(�<]����.�cF0���j��Ǘ.��CF2�F��z�tǚ5�qp�GNR�Y##e��&RqS� �b&�a����P�	�,�'	>��&�S�L,����<�ǧ&F!L���"$Q������Të.ʩ��к�/!p��&��%�Z(ͩ+9R��Z T@��+K=D�a<PT���R2_���*8@�dhR�����6zT�����|i�JNH�M�!� I�"%6b(��H��J�(	�Ce��%5t)�����(�KJGyQ�.��0P<��AD1��#(�R�=������QiD���,'���.�Ud��J�!P�x̦)��5�D���(��`)( �6�
kS�*%aP��3lD��/ `A��j�45n.��2G�H��v[��'G.$��$��b"�/�%2_�}�!'$E�!1t􈔞�Gx�T�Qʘ8�H��XvH�H), PXc�09����������t��F�#�h3�5�BDI����H��xCI�(��.=�!."��!2&)�%��0 ��2GH`"Йd ��+��A�Hf���Z��hlH�x�Ld���C�PI:ģ��� �+�
@�9c%�;V�jxH �a�Z���H�h	,<��\�B�[Iu�D:���Ae �<d��( k5BK�f�"~$O҆KJp%eP%��@r4A�%-T�R24� $-0�^r�!�#(1��:���0I���G��-I$ո^rE%i�&����!Q�0)��x�	��&R�H�`"mT�%EH����J���DkI�<d���KI�x�G��;��3r&a%%���1 ����C��I�!�L@3#�p&H҄9
&PӐ��Ȳ@W(	2=��DX���F�8M�$>�P4"WI	��n�"V���,0��?`� �Hj���d�.��Z�L%��!�r��Ո#eI��D�DD3���P�>�"&xƗ�ᅇ�G�P���ї�`GXR���a�.������L� C" {�_�KP���D	�V��ВHɀ1т\�s	�( <��LҰW�h�.Ae�vQ@6<=��$j�Қ`��i�L`��&@+f�s��D�0�nB�R��7�@�AMl@�)'x�c�H���B�0-N*1�3�
O�TXG���qhO�`��'G�/���Z����x�WP�'(^��|�:��B�v�
Q J�
�_�AqCq`I�F%$�����
S�8oe�MDK�x���~�s���)Io��҃Gx�E��� (�7���$���G�/�q�b�H6�����A;��P����L�*[��Xβ����.{��`���L�2���hN�.����6���p����L�:���xγ����>��π��M�B�ЈFH@  !�	   ,    � � � - . / . /0122344556 66 6 7 8!7!8"9#9#:$;%;%<%=&<&>'>(?(?)@*@+A+B+C,C-D.E.F/F/G0G0H	1I	1J	2I	2J	3J
3K
4L
5L
5M
6M6N6O7N7O7P8P8Q9Q8Q9Q9R:R:S;S;T<T<U=U=V>V?W?X@X@YAYAZAZB[C[C]D\D]D^E^F_G_G`G`GaHaHbIbKdKeLfMgNgOhOiPiPjQkRkRlRlSmSnUnUoUoUpVpWqXrYtZsZtZu[u[u\v\w]x^x^y_y_z`z`{a{a|b|b}c}c~de�f�f�f�g�g�h�i�i�j�j�k�l�m�m�n�o�p�p�q�q�r� r� r� s� s� t�!u�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#{�#{�#|�#|�#}�$}�$}�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&�"l"���̚�n�VU�c
�=����Y�:k�|������	�4�溷�߽u������T�+�-�QX��ZN]�-6lb1U�{�OF��&@s̻yߕ8Ĕ������p@L���Ս�%�;���5[�T
�(�6ṗq`�`~���� y�3��τ1�I<D�����!@Q�2↸d'�������X0�8�5�$�3:NhA�!c���Ǉ��!�
��Oh@�"-.fT�'V��FOzt��5@d�A�bnx�Nr�9c�p��#���tΈHER���T�䃟�X�D`Y����P
�,��&>T��rS�L �鈘<tǧ#:c�L���"#-�����Të+©#�n��/!�i���Ш�Nh�K�;b��솱��ó�EA]P�!�+�e(h4�B�@F&t)�n~��((�@O�1�����.���B|ы�ی  	��i����@��J� ��Cdd�e3l%8s4��� iKJFI�Y`I��t9	�PL�>�D������i�!�󌯜����@W�	��3)X�@�3�`�*3� F�"t.��ˌ������4��#Ԋ�sE,3c�!�1��!��#ͺ�$qR�G~�J�G~��H�n� ���" @̈ڌ$��|������Ċ1��ǈ���(�jB���!�-#�PR,��R�#�"҈Ę��.��vIQO�MH
�hkI���4�T�!�0"�'�`���k��
�Q��ROZy	)���,�tĆƬ􅕜 K�6!~d:K$i�-%���>r)Q�%�ґ.�f��M� A��Fђ4OG�`��&���lB�pI	���@�D�H\��q�%�H��T�� $�^�� �c�'9��(���&�@�76ebEI$���3(�")0I2�(Y��p/)A�tt�	�#"�H�0�_���[/�\�("����7@�?IGtD��QA� �K4%PT�#8���A.I/&��*�ɍbE� �f��d@P�%Gp0#-��3�Lf`%Hl�QJ���D�H
�0��\��&)��%>X���H`����+ǩdb8(qÀy��bx�%�|���]���DD*ґR�3&�^���� Eԑ0TR��&"ȑ���	$q匬��n�6A_�,A�H �R���� ~�y�M�����)�Ä6��l��<�p	D$�!��YG�N4��*<a`T��3��?��O �U�$B&@�{&�N��7�� K@���tCAq�[����:���P*�V��D�0�k��;�(p��&�*�1Fp���٘l�Y�{��	,;L���7�PČT��Ae��>mQ���l3`�@�IO�-BV07q�.B�`+-��T.C|���Ѱ�u(��<�N�mv[�)�� Fa#H����|�K������ͯ~������� ��L���N����;�����'L�
[��ΰ�7��{�� ��GL����(N��W�b� !�	   ,    � � � - . / . /012234456 66 7 8!7!8"9#:$;%<%=&<&=&>'>(?(?)@*@*B+B,C,D-D.E.F/F/G0G0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N7N7O7P8P8Q9Q9Q9R:R:S;S<S<T<U=U>V?W?X@X@YAYAZAZBZB[C\C]D\D]D]E^F_G_G`G`GaHaHbIbIcKdKeLfMfMgNgOhOiPiPjQkRkRlRlSmSnTnUnUpVpWqXrXsYtZsZtZu[uZu[u\w]w]x^x^y_y_z`z`{a{a|b|b}c}c~c~de�f�f�g�h�i�i�j�j�k�l�l�m�m�n�n�o�p�p�q�r� r� s� s�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#{�#|�#|�#}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�&!k$�҅�ڹm�RQ�S�I�1��iD���sԐ�jIM�^(�����������Nb<e��w3GH`UB��u��X��P�����25������&G	C��̩WL���L����@�DB'����4X��	�h`6o܇�	���|���� x�s���x1@Ib��C� EU �Ҳ�H ㅰP0T���a5�4�7>^H�A�qb����ǈA`
����OgP	c,3f4B3Z�xFOy�	c5>d�7f�X�Nr�y#m!'�m��ĝ7"R|��M<�(��Lɡ(�sCM%t�(��(�Т�~��3�L�0^r)�(&c�L��
##a�����Dë0ҩP!�VY�K|��f$�Ư��"Ģ��AR$�a�,����0Q�N��+�f'g$�� F%w�0�D���#B���*,�F)a�TB��{-�E.ff  ,�4^(���Pi�J�I�8�5a&��Z�@C��퍵�DD����hk1'D�0E�yR,>�r�DKx#sp�H/���I9�(�t�`����E	��#&�r�-	`��)2S��E�rc)%Yp#1lɴ� ����e�H`�X�
=��-qo�nA'0�� ��2rG~��	I�~� 1B��`�،4+�\�3����0� �(�2R ���J�"���"͂�%�2)-P�����$·���@���I �MH
�hkIdo�2{���!u�"(}�Z��|��(����'SY�)! ����C�X��¤�� �C@ �d
� �J�`�*>D�d�B�bI�T8���Bc �>Ԋ�(�LK�v�*�
b�KD��"�[��H�P����LR\J�v��D(�K�@� ��(�@HPB���G� �I��!���C�0"K0�"=#&)Ƈ�!�}H
0A�|$-��("�HԀ�E�d��-�Z�")�p!�a1I��?�D�H�ZjtI&�
Ku� m��4H2��@&��(aʍF�&�J�T�����9+��b$Lb��Hl�y��J2���&Q��(�98F,�	.t���AK���E
�
��$4�o�	-ecb���b��Q=v�I|�$s@��@�nt���p>���M >M#	��x�^�D�1�x��	i�B* �T�h
+A��Ӌw��tm��p ��+_d2\rK0g��O�P��'0�@��	W�X�\P��T�H�/f�*x��U��A��A`&�V�$B0�k�o�J�@�m�	
�v��q�Ƞ�2QM��6d���p`t�"d`�_�a2b��фʤ L�"��*��]��7)c�J�I�X�i�X�Io��l��0�k@�nE<�F���p��7�i�#����>�.x!
^,'6����`?����M�z����������|�K������ͯ~������� ��L���N����;�����'L�
[��ΰ�7��{�� FH@  !�	   ,    � � � - . / . /0122344556 66 7 8!7!8"9#:$;%<%=&<&=&>'>(?(?)@*@*A+B+C,C,D-D.E.F/F/G0G0H	0H	1H	1I	1J	2I	2J	3J
3K
4L
5L
5M
6M6N6O7N7O8P8Q9Q8Q9Q9R:R:S;S<S<T<U=U=V>V?X@X@YAYAZAZB[C\C]D\D]D^E^F_G_G`G`GaHaHbIbIcJcKdKeLeLfMfMgNgOhOiPiPjQkRkRlRlSmSnTmUnUoUpVpWqXrXsYsYtZsZtZu[uZu[u\w]x^y_y_z`z`{a{a|b|b}c}c~de�f�f�f�g�g�h�i�j�j�k�l�m�m�o�p�q�r� r� s� s�!u�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#{�#|�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�f�"o*���ۺo�Re"�扇���!�iձo�9�Պ�"�&h2Iں�����Nn����<x�HL`mB��u��\��፭�����225��c��G�)C��ԩWo����\��9C�$�"��7�5Z�
�h`7s܇�wt�`���� ~�s��р1@I�1͇��� EY@�޲�H�ㅱT0���a6�D��>:�MA�!_��CȈ`����OkP	�,3fd��Z~�FO�	c6@dģ�(걓l���E|�	c9Ea獌TDɞ0Nq�� 
c&ib(���P�	�,
c'
:D�'����3�L�0n�P ����3ȴ��0B��%����HL6�
�
%bk�7�����~�FBu�!�.9b,�\DƲ�ʒ�~��Q�d���R1a��F+4@�e('�	a'&d�0�,8�F)a
�RTR�{-��/fv $�e/^(��TCe*�R$:��ۄ��ф��P��>��ECDd­u�L����I���J�9!�����E�x#+'��#-�UT3D�s�% &�6��ʍ�$����<J�- ̍��t���4��$�N�Q���e�Hb��NI��#���]�T*��v�H��|DH�$E�!0����zT�1(r3R�(� �&��R0� �(�2R ��:J�!��!"}�!%�"��$��!,"��!1&%� ���=�~�(�q�Գ�L'�bH��J x�7 �T��y��)��J(� &�Rf��J��!��:K&G�>�D�H�t�K��vE҆�T�.�$f�(Z� e0),1Ň�p���%# ���a|����2^�?&%.%�C��	@2�&���PR��#�)b�
&y�'��@��!&#(P����,�C������J�x�H�%E�t@y��M��$^H�#�@F"��&��R+D�aq$���l�	*��&��4J��L�'89��|�(�F,	f�L�'��R���((YB$�Ì(�dZ��F�7Q@%;��)�1�W�b>т�B� �$�l�K �t�X� U���8+�"��/�R �1I�x@D@���.��^����Q�!�7^@У0��C��@5&U!/�c�&ʠ�@�^m� ���%��j�9�^� R�X�/j()x�QM�B��a�_`S�4B0��o��� :

��4K<̟J�Ŕ�j�`�`�-J8���V�c�r�ꋒ)�Y(Tf!3�2�W ,@���'�X�h�plb�ڊt�Mޘ����&��J�x�<	�<�D0"4�� �@��O4$��R"����Q�B��%�P��}����Q�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv����z����x�K�����M/B !�	   ,    � � � - . / . /012234456 66 7 8!7!8"9#9#:$;%;%<%=&=&>'>(?(?)@)A*@*A+A*B+B+C,C,D-D.E.F/F/G0G	1I	1J	2I	2J
3K
4L
5L
6M6N7O7P8P8Q9Q8Q9Q9R:R:S;S<S;T<T<U=U=V>V?W?X@X@YAYAZB[C\C]D\D]D^E^F_G`G`GaHaHbJcJcKdKeLeLfMfMgNgNhOhPiPjQkRkRlRlSmSnTmUoUpVpWqYsYtZsZt[uZu[u[v\w]x^x_y_z`za{a|b|b}c}c~de�f�f�f�g�g�h�i�i�j�j�k�k�k�l�m�n�n�o�p�p�q�r� r� r� s� s�!t�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��%_�����6l�NE�SƉ�����I�0l�!�Ŋ�� ���c���������&��np	_|Y"%���㋹u��\��a����wBUū�����!f�J�ҧ���
��˗��σ���~�A�E KP�66h���t��4�`-/  �X��2]P� `t�a���!@Q�r⋵l'R��x�+5�.6�(y Qa�F�CP#$C���!"G��$�\�DÐS���YPc�/�ѓހi�4=d�4f�X�Ng�I��!g�m�ĝDR#|��M(ph��L4ɡ6�sCM(�h�� ��Lj�5&�D@-��H�Ch��� �$���HC���j� 1A!k�w,$ȭL��R��j�	�!싩�ȱ6fq̾H+K*���8Q��]k��+}�e7��Bn�Ƣw�0�|B8�Bi��/+1��2a,��b�h�5$ ��5m��	q�G�S&��yDnSG��A��ɘ����x��~XK�-)Ͱ�.DDA$�^ǈ�@̒i��	��$@Q���6HP��,D�rRDZr�	��[1%X���6�`R =�b�֥Jt-�K���$������"�.����e�H4ؘ
)�!�Э�Z�d��c|Dȱ�|ć����ˋ�"�N�Q��X�H�ȄH��Z9H>�(�H\ ;R ��
�����"U��$���*%�{�H��M%%����M��b#4'zN��ߙL'��"� =s��'����׀�R�'���#�I8�&88�D��rAH�!W�Dm��J�q" �RK&�%;�'��H~Ѡm��%&"�48�vY�q!1�~�В2��,ŉ�0���S	�?��'�I:�X�%a�T����$pO&^��6	%'xQL��-�D�	��t�'��N'J���V��[�L����$tˡ��ő��E���p!4�(cyޡR�C��F*K��	�i� USY���HX#�z�#�2�I��#7���R�P1b#ț�&`�<�����g�Q�e�F.b
"�-(ۤ��ЎH�`b���D#I�����@�=:�[�tJ (���х��aJ���	�`����� 2��)�|�Dp ��+�2��qX�@��K*G��O3�ؗ=d�:G�$?�B�$��2T%1��XAa`B����TFɠ<P��lj���t �ъ�c`*f�P2aЭ��ʸ���*��*�������z�I �M�hW�����\�A�00c�kCvp��(��+Dp�A0�@�P�*X�� 
l �'|Q!�Іk�����z����hGK�Қ���M�jW��ֺ����7�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z! !�	   ,    � � � - . / . /012234456 66 7 8!7!8"9#9#:$;%<%=&=&>'>(?(?)@)A*@*A+B+C,C-D.E/F/G0G	0H	1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N6O7O7P8P8Q9Q9Q:R:S;S<S<T<U=U=V>V?X@X@YAYAZAZB[B\C[C\C]D\D]D^E^F_G_G`G`GaHaHbJcKdKeLeLfMfMgNgNhOhOiPiQkRkRlRlSmSnTmTnUoVpWqXsYsYtZsZtZu[u[u\w]x^x_y_z`za{a|b|b}c}c~de�f�f�f�g�h�i�i�j�j�k�l�m�n�o�p�p�q�r� r� r� s� t�!t�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��&��&��&��&��'��'��'��'��(��(��(��(��(��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�9�*��e��4_� �)��CPK���d�״ŏ�B�h^ѳ*۷����&�n����<��DH`���u��\��a�����gB��&o����)CL�ЫO�+��������?�� ����2X��h`4o܇�sD�`�����\�1^P� ` 㡁��!@Q�r���l'��x�*��36z��!�c�2CPMhC����!"G��$�]��|S^Ȋ�YPc����!`�،�L�'ֱ�l���Ev��b9�a���T�Ȟ/>qXz!$Eb���P�
�,�b%
:D�%��(�3-`b�'N�P ��z"1���/"��#���(HLH�*�B���d/5�����P�z��K��������TB�����IAm���'Y	W���9�A��9􃝒����������J9L)
-��-eF $X�-\(��z(3e*�B�1`�CNI�ƀ���7Dʒ�D��@D��ms�H���I{��J�)���QcE4h�)()}�(XTB0D�%��4�����e��E�23'ґ���������p����l�06r9��6'�Б"��Q`�I�x��G� �G}�(jI�\��q!bk��ˉИ���t�$3�����.��Ç��	����ʉs�Ԋ�R���������&���*&)���$`�Fs���I�g0��ǉ(���u��]R�q:J2��yI�=�1n��C���t��)uІ)�K�*򐿖t�LYXI�.��DnJw`	)<d���W=rF�R���a,��'Xb�U0,r(�V�� ,F(�����9�`9��č���'��W* 1;Q�S&����5;C&�܅��AH� 	�<�	�� T�H[Hbq�4x��*E�@B��+��4Q�� zZ�W^`+H�q#�x�#�]!�#3��z���, �q �^4�PX�p�E�
}�+,P�/<`���F8�J��,i4p" ��j�u=k�n�#���Vz�
��fx�!gX�.���\� � ��5�!�{4��\���A�@h`�J�x��� �)ō,�bx�P�$T�?��,�ӌW��TO���Q0���@B�P��ejр��M���CC�Ã��j��)�`b	R�h�!@&JJ�& h7|x��ݓ���=�!��[�l�Y��=� !V�$���L�L
Bf*`|�2Y �(�K�� �@$I�`(�A/�$�7��A�/�$�58 ���!���|�!�� ��c("	_�+�\�6b��PlfS� �O��ͬf7���z����hGK�Қ���M�jW��ֺ����0�lgK������ͭnw��������p�K�����M�r����:��Ѝng !�	   ,    � � � - . / . /0122344556 66 7 8!7!8"9#9#:$:$;%;%<%=&<&=&>'>(?(?)@)A*@*A+B+C,C-D.E.F/F/G0G1H	1I	1J	2I	2J
3K
4K
4L
5L
5M
6M6N6O7N7O8P8Q9Q9Q9R:R:S;S<S<T<U=U>V?W?X@X@YAYAZAZB[C\D\D]D^F_G_G`G`GaHaHbJcKdKeLfMgNgNhOhOiPiPjQkRkRlRlSmTmUoUpVpWqXsYsYtZsZtZu[uZu[u[v\v\w]w]x^y_y_z`za{a|b}c}c~c~de�f�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�n�o�p�p�q�r� r� r� s� s� t�!u�!u�!v�!v�!v�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-��������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��#k"��լ�9n�RM�3�I��"���3�U1n�1���Q"�2�Iڹ����}kMn����<��EK`����u��d��AM�����22���f��'7�CL�̩W?,���h���\�@�$A!��7�4X���h�6n܇�p�� ���� z�w���x1@I�͇�#� E]0�ڲ�H�ㅰT0����5�D��>X�Au�a���ǈ����OfP	c,3ft��Z~hFOv�	�5Adģ�(αSl�h�Et�	#95���R�#|�8�M/(��LDɡ(��CMx�(��(��L��6'���0V�P��~���0�Q*��4ɪ�(S����
bk�8�DƮ(����~،/�R�ZƲ���1�:X�Q�g����5TjbF.$@a,'�	a�$`�0�/8�)a�3>B3�	-�/fjS (I�.\(��x��d-�r#��M�̠����|��0IKK��(U0	��92AD4Sd�+��!,�N��70׍!�⍭�$���HWQ
�}N1&X� �0�� F��'`� �0������F�T��F,sc�)��z�X�#�"�Q��EK|+#|�~|������4���H��*HHK��i\R7Ը�G%�\�#"��b] ���X�����+��R��8~�@/���4I;�X4�f3����5�6qn��I5�x�W;�c�8;�D@�� �fV�31��T���*^1
��5P�u9Hc��D��S�O,�
S V�!,U���R�� ,5���!�� E3�	���nt�$s��W0p�@E�&IƇ��|�Q�Ɛ I���Qt� � �.��}�\�ݪV�=� F܊%l
�q� Q��4���]%�#��Q$�2�e�q#6`���T�y��`D������D�B+T�0�WV�(}YɄԶA�H�F�؊�`ֈD�I�ŴR�g�`�>�F 3t�F�؊|� ��2��I�\��c���� �N v�%°�@�^hP ��ѕr�(
Q�5�6�JrE(R�A��M�@�+p��!�r^'e�JXh�7"d������͍!l�gp��G�Ǟ
��@�ጞ��� D8�Po��,��N56'׹s�eyA(��;�s"�p�֒6|���BF��M?-����aTk�1�&�%�Ʉ�P��*�g�
���� Mmb��� %�H%e8�2	iA(ʹ7T�	YB1��5< ��"jXD���!�A!�џg0�	X�k�d �5"�؏lh�5a|���d'K��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����(�lgK������ͭnw��������p�K�����M�r�K��  !�	   ,    � � � - . / . /012234456 66 6 7 8!7!8"9#9#:#;$;%<%=&<&=&>'>(?(?)@)A*@+A*B+B+C,C,D-D-E.E.F/F/G0G	1I	1J	2I
2K
3K
4K
4L
5L
6M6N7O7P8P8Q9Q8Q9Q9R:R:S;S<S<T<U=U=V>V?W?X@X@YAYAZAZB[C\D\D]D]D^F_G_G`G`GaHbIbJcKdKeLfMgNgOhOiPiPjQjQkRkRlRlSmTmUoUpVpWqXrXsYsYtZsZt[uZu[u[v\w]w]x^x_y_z`za{a|b|b}c}c~c~de�f�f�g�g�h�i�i�j�j�k�k�l�m�m�o�p�p�q�r� r� s� s�!t�!u�!u�!u�!v�!v�!w�!w�"x�"x�"y�"z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��!tm2���m�PQ�S
��!���Ciհm�%��
"�2Xh9t����V��:;��E��pg�� �j�����i��PSZ����d��P�ī^�҆�0�_�>ؘO����]8A�$�!��G�4Z����_6p���rd�`�ĀT gxs���|1@I�͇�C� E1�⇵p'���x!,86~X�!-qM�RSP[���$�a��B�O~��]Pc����/\�h͑%1d����h���Ew���;e"'��T�ȝ/Z��2|~H�D���8:�$��Z�&����
7�酗8 '����6�Щ��4$ɨ(b���B�����99�T�����P�~�iM����!쇪҄ñ�EAU�Ǭ����ɇ���� P������@l�9�;L�@O�1
���4A4��"�	-��.afC (Xȥ.^(��{Ыd5���x�D�g>��	�pi�� H9D�bS���	U`��Q2AD2C$7��cs�p,�7��7OP�@,=��Su�5�T����p�����E
��#Y-P
ˡLw���8�V�0��F c#�X9"�"� �]pu���|�ǋ�r�H��zT@0(b��%�R/��U �\��"��_)m�*%�{�W	�h-b��̇ۀ5��r*��I�X X"hӦ6ܞd��}��\��CJ��bu��*%��c��$,��ac-�;��@�R��!V �T
K__�}X�V)�J�|�CX���wJ�|�XT�S9�����e^��8��������	�w'hp�$���3�bf0� 	P$��@@f��E�@����+�ŨTq;� �E���rѪO`�#��ڇ����PV���F�"Ih�֠8r�Y� x���8�m/� V: Df�#h!�H��H�j��E
Њ�*B�Հ��Q�Z6��U����<"A�l�G���gD�`��ilASg�_��q[TI �*��c��� ��$�Q�U����6Ub;��ؕ��U)W�D�xP�&�>��J ��$s(� \8�x"qK)i	Q�4��\�JZ�B�����*? �LUN��	+.��!4��r6TX�!�Q4χ ���F��	B" ��A���Cz�#�Y���At��������@W��,G��
�q��4���ob9�zB�ʍ�:��CY<`��c	!)���Q����C�4^!	0�d�0�V ,���'VX�T\:FЪz�,�KڀCɊ&�J�`���(�D/E2�ڐ ����3���5e3�B
_XH6��M�w��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����-�lgK������ͭnw��������p�K�����M�r����:��	 !�	   ,    � � � - . / . /0122344556 66 7 8!7!8"9#9#:$;%;%<%=&<&=&>'>(?(?)@)A*A+A*B+B,C,D-D-E.E/F/G0G	1I	1J	2I	2J	3J
3K
4K
4L
5L
6M6N7O7P8P8Q9Q8Q9Q9R:R:S;S<S<U=U=V>V?W?X@X@YAZBZB[B\C\D\D]D^E^F^F_G_G`G`GaH`HaHbIbJcIcJcKdKeLeLfMfMfMgNgOhOiPiPjQjQkRkRlRlSlSmSnTmUoUpVpWqXsYsYtZsZtZu[u[v\v\w]x^x_y_z`za{a|b|b}c}c~c~dee�f�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�o�p�p�q�r� r� s� s�!u�!u�!v�!v�!w�!w�"x�"y�"z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L��'mu����7d�8Z�D�N���7u؜�u	�_S�)�M�������5��uz	_\�$%�!���u��`��AN�����*BuB�����!�P�ҧ7f� �.���'�BK	����~�d@Sc�`7w؇�zt������T�L��4`P� eP����!@R��8�.ۉ�/*�hKG���Rި!6����
�C����*��EQ�0��--ft�R��Q�d9`6?d4�6^�؇P��  ���t���6R�%t�EP��'�秊�� )��'ʁ0J�1zs�Oq@��'���*Bc�Od��u�4�ɨ1.��^ǦB����$?�"+sl$�ǭ�~�	��*��!����Ă.����M_���}
�%S�� �`��j�0PtnR�<�Bo���0A E)ǀc�$ZTy�g S�7% ��7e�R�	yH5R&aU�x	�	�x��p�9D�rU�P{�%D4C2D�yU�8HP� .>ʒ
���2$X� �1ސ��ȬJt- ̍�le	��lA37�{%�B�ӎ�W���G�Ĉ)W�Ț�G�"7^E9�� ��]�
��0��#��U-��R�2~�@0���4I]j�XT�&4�T���%�jz#J5�h�W:��9:�D@�
� eR��3#
1V�R��,#Z1=����*�� c�-�*,%���a�Q&"+3�aE���)Ŭ�
`�`Λ��
*��d�	Τ&i�a:_e>(50�2F$� �Y�J�H���+��|19� PCn�(PU�!F)�J 6�*T�#�و�!BS��'�H"b�	����Gl@�	U!+�
�ޱ.��`-F�
���
��#jVX 1�!#)�o;��a>��7�@���V����KD "#���P�2�GJ�P��t-d��1���2�� Aż�9�!�;��L:���	3� x��'%gH%�SS
�t�Q>d�
|�-d�DO&��7�!!r��u����8@@e��B!L��@*|Pә2�f�S���)R63���3������R�,�#	���MeR�J�K5T%L�.��0>�**�Q4�w�"��dD��$nt�Gf�rk�ٰ�a� 1��x��0����Br�[�c
\aÄhA#�� c�R�����&a� 8�|rD�'2��xbP�X�X�1��cI�:�;��,!���sK��%J`Y)�� �``	t�Bk�F�(F��XeʘFLc@Ҡ��׊T O�C#R1	�f6��VW��Z���ͬf7���z����hGK�Қ���M�jW��ֺ����/�lgK������ͭnw��������p�K�����M�r����:���-I@  !�	   ,    � � � - 6'>/G6O7O?W?XF_G`OhWq^y_zg�n�o�!w�!w�$~�$�'��*��*��-������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9g &`،�B�T��П-p�0!���X����	
H��@��ߜ-8@��
��oƭ{&o�ʣc�`@� �ҕG(�@���7�WPP�j ��?h�R����-(�� �t�O``���Q	Пt,p��h~PѦ`t�&� �=_�OI`atR	nh_�N�x�G���`M�]�at�����Y �E��c��cr,Z���6���H�6E6�bR�Ii[�9`� %���a���`>�#R�������� �on�fBn�9��G@g�E&���\"u���t$�VcQ��f�-ʨ�|"%�P�f�p���2@	8 )�g
tݐ�8�@�P �8V@U 	 ���ࣉ$�(A(੊�F���&N @�"^�dCQn��U�9jv�� �n��U	@��j4;��du躵U��D��`��2I/�Q�ƫU���iQ �>��U�0��[U�oN�Q�
j|1�c��^ale�`�Z�l�$�۟�\&s���0{e��8��0�_	�.�<,����'��<� �e)����X��x-J2��oW&w�R��+�Ѝ��vx4�U��(��6xj�5��_�twvcku5�Y���W�٪IT+� ò�tHL��ՌVN�sGl�w���"�9I;�3W��H�)wVs#Y�E�(�U�79;E����V�K�{D��7<S���Q��T �oy�Bo8yT������wzU��+��exU
DN��'���K@������QHjU�� pن��l�m*�\�H3�U�8�S��>� 🅢6���H8 @q@��OE�bJ0A��y�O��2��Y�]��at2��)k�9��o�"��	�WC��@L���^w���]K���8�AD����R����	�z�!Q��"*>do:�`P�Ԯ�(�[HTJ��ȣ�]ʌ>AR�4�o�Q)~���72J*���$�J��S�!	\o#�� wuI��1#�RS�G�'\)	�+]D5>E����-E" o��Z[)$x�D� ��+� drf��d	op�JMv� Ԥ@�Y�i�'V�2�� 	�s��� n�)	���P�����Ŗ>���~�� �@JЂ��M�B�І:����D'JъZ��ͨF7�юz�� �HGJҒ���(M�JW�Җ���0�)> !�	   ,    � � � - 6'>/G6O7O?W?XF_G`OhWq^y_zg�n�o�!w�!w�$~�$�'��*��*��-������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L�(���
0�`A�0��0!2�EPa�h
��`��۸_;@�l�йEW`�z&m����``��#ȆY ��+(���9v��[�
x�k
�*0ہ����/z�t���������� wV��h�'� �H��Qՠ�$�oh�Vex�n$��ZH��U�EL��~�I5���Y�"E H�~HU����XQ@z�@T3���-���L6E��L�ݓ�ה�J�ѕXRxcR��eC`���P�	�
���G:@kX�y�s���R\fz����XF)����X�S
�$�)�65��i�@��$P@o� �;VPU��8j~@V���� �$:
���8� .zx�9I��V ��A��B � �V%P,��] �CӲAVق���m��N宺�IpmD�:xnV����Fwf�`V��'F?��U�j�Q:l�OJ�ѻ�Y��g�p�c^E1��$��1r������������O�lR��%��@^00IV�J^2HI�'��E�+ҁ�n�'�̢t�~Qo5�y�t5}܆��Ю��|)��uy]�t6{a{55�U���yYc���N�5X�*9�IIӧ��4Z��HA+=s�@N�rGc�w��}JN�����O�9�u�M0�"q>��S��c�����Z��D��X���������&���P�../�ċ������UP9��V$}�Wa�<nR���V���r FĠ�U)����q��=䬇eC k�� ���MB|u��o'  :� $�p��2d4R�D�i`o.� ��(�qݎ���a'o9�����7bgR@ٞ���B&'QB�!��WC�u�9��"Bޙ�'e��.
��(2 ��
e�f��]�.RL���F��0LeLH�C��KV�H.�ģ��H����uD��qGmԈw�:��q��&D.��� 1��Mŏ)I,���0��� IԀPv$ ���H�y�;� `�ɺ9E~$� +7w7iǔH	 -�C��%�٣y �H�`��)�1��+��jW3;� �oU@�L����U����L�2���<�I�z���J̧>���~�� �@JЂ��M�B�І:����D'JъZ��ͨF7�юz�� �HGJҒ���(M�JW
π  !�	   ,    � � � - . / . /0122344556 66 6 7 8!7!8"8"9#9#:$:$;%;%<%=&<&=&>'>(?(?)@)A*A*B+B+C,C,D-D.E/G0G1H	0H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M
6M6N7O8P8Q9Q8Q9Q9R:R:S;S<S<T<U=U=V>V?X@X@YAYAZAZB[C\C]D\D]D]D^E]E^G`G`GaHaHbIcJcKdKeLeLfMfMgOhOiPiPjQkRkRlRlSmSnTnUnUpVpWqXrXsYsZsZt[uZu[u[v\w]x^x^y_y_z`za{a|b|b}c~de�f�f�g�g�h�i�i�j�k�l�l�m�m�o�p�p�q�r� r� s� s� t� t�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$��%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-��������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L91�(jUZEl۹j�x����H��A��u���װ[?s�j��Ԋͻ�kOH�r�a;��K��'F��gVes�l�i�)ߞ|�����|�]iC�u<s_�[V��m�f��2����M���0Þ+$���n�%ț+���~�H��)h!l����&�!�]�r�-j�."���[Y@N�Ҭ��׸�ckyh�F�� q�;yNY9�8ST��FV�U!:�3�D�@i�8=\�G�@D�&ZB�M
V�ad��I�Z6c@Uj@�GC��Y&"U��%�	i�����P�-Zґ������sS=Q&�Ѩ�|RUJ�M�ť�v9U�A���'%e�@��0@��(P�R�hI� �P�����@B!�!M�KX%�zESB3P^S�C�#-W�p�"FBAD6��W0�9�&�!0���du�5�w
-�b�:dUB~�*Jq����(Zy0L��A��ʴh^V��pl�t4�!~�U_��!""&\�,r� L��t%�1��"�Е��J #��^�@����ꅰ|��z�B�H�Z�X;�3h3�$H��5�ZjSJ8�x�Wg�)�)@v�/�%��X�$���E��)F��R*n1�9�x��(Ur!~^d(,mj��a�]$!+saaYZ��)ysa`Q����
!~����&�q�9_u0ͥ�|`2>���p[�$	�(]%�y��0�����B�J� )!"�Z`�ȟ �Ʉ8�Vn��Z%�sDe�������w���
҂V�?�Db#���*��䪀�F���+'haC�U� �pܬ�m06�0E�@�(,��$2�I�09��@DL %k'�F��]��$<D�2R1J�<#U�;���|���"9Ͱ�"8CK�  J�8#	�:DH�0D]A'K`O'ְ�$�>0�&��Dzʄ| Ī-�Q2t����	��#�Û` j74��I�G:�'[#��a��qr �P*�����a��c�g�E��D��D��B^��s�If��M�!��1����O���D��Y��u<�3F�'�2>�{d�/y�?����)�8�W�|P�P@_�`#"x�ITC~� �F O��a(a�8�3�CdܐQ�S/g�`$4�Î���T��CJ��?��[���P`�A��<)ـ%\	�d@�)Vx�VA��� �eꆢ�2�,�����X$e��SI�+Z�E�p&@h��Wɪ�@�x){���&�A"D��g<�	2�
�`�K��͠W6x
E�a
4�"P.@*�A���t@#�H��k��f7���z����hGK�Қ���M�jW��ֺ����5�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��$  !�	   ,    � � � - . / . /012234456 66 6 7 8!7!8"9#9#:$;%<%=&<&=&>'>(?(?)@)A*A+B+C,C,D-D.E/F/G0G	1H	1I	1J	2I	2J
3K
4L
5L
5M
6M6N7O8P8Q9Q8Q9Q9R:R:S;S;T<T<U=U=V>V?X@X@YAYAZAZB[C\C]D\D]D^E^F_G_G`G`GaHaHbJcKdKeLeLfMfMfMgNgNhOhOiPiPjQjQkRkRlRlSmSnTmTnUoUoUpVpWqXrXsYsZsZt[uZu[u[v\w]w]x^x^y_y_z`za{a|b|b}c~de�f�f�f�g�g�h�i�i�j�j�k�l�m�o�p�p�q�r� r� r� s� s� t� t�!t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L91%c�Tb%,�9i�z����G��9��e���װ[3ktj��Ԋͻ��NAn?�����㾃y9 <�D��K��J��̹6��o[,����̻����������aUp��	�D���[��6D�kܼ�߂�qqV���"�it�{f�e�1�7TdD5�ؚcy���a���wGE���`#Q���8x%�@D�&C�	]]��"1٤��0��1���$W6yW�d��B���d94lUb	š�����Z�Ŝa"��4%�SDAO��mbŊ�޸0PaR��8�Bh���/Y��b4 Pw:	u�ǀ&��03:R�`C2N��d���A2AD1���X@��asE	Ȣa+Ya���	3�E	`��YU���u� F��(Z1��=�Q\2��V�ol@r䂡�a����!�� &\ ��c~T@0Z�U��pH<0CW	��,(׉��~ux%��|�R������i�m%)�_6`�Ѝ��4p  V�\�M(ɰ�i`u�d87�D �� �!CF�R2�� ��0���*�M1�&R��J���ا�
K��-V��:�0����M
����� VI79N(���^�����@i����U����&�3^U���H@��2���sH�,xW���*F�4��k�){RrG� 4[����U��F�08�M	�0� UB�k�sdC�!ʴ%:����n$���A���.H�Ls'�a����sa$�a�`r�YLg��a��"p����,�;��D�p9
����2�����<��@D$ &�+,J䪗T>������
��� 3 .C��	��s�&(�m� ��� � PX2��7��D^{�2��I(� @n�M\�1��d	/� ���dĄ6��8E�%�=)|	&��r<� W��w$!��i�7]H>�g�&�$%l�?��7E�� ^I�/��5T�	nɉ�%d��\��f� �irCt�h���$n���D �O�r6�@�4ٯ���b�ɞ(y#��A���	#y#d��2�#zc���҈(FA��dڠ&D�L�~(
	�H�o�$^�ξ����4@��Z��D��)b�L#J "��n�!%Y@��,Nܮ(9�Ŝ�Q�{���'����#��J�(�JT��&a�U� ����Y09�0`t�58`*7@C��Epp&9`Dy�^�w��y�q���&�"��VG �Z9�	z��;@����5z�D��	/��O*��&�!��w@#H�PÎf7���z����hGK�Қ���M�jW��ֺ����4�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�Kݢ !�	   ,    � � � - . / . /0122344556 66 7 8!7!8"9#9#:$;%;%<%=&=&>'>(?)@)A*@*A+A+B+C,C,D-D.E.F/F/G0G1H	1I	1J	2I	2J
3K
4L
5L
5M
6M6N7O8P8Q9Q8Q9Q9R:R:S;S<U=U=V>V?W?X@X@YAYAZAZB[C\C]D\D^E^F_G_G`G`GaHaHbJcJcKdKeLeLfMfMgOhPiPjQjQkRkRlRlSmSnTnToUnUoUpVpWqXrXsYsZsZt[uZu[u[v\v\w]x^y_y_z`z`{a{a|b|b}c~dee�f�f�g�g�h�i�j�j�k�l�l�m�m�n�n�o�p�p�q�r� r� r� s� s� t� t�!u�!u�!v�!v�!w�!w�"x�"y�"z�#z�#{�#|�#|�#|�#}�$}�$}�$~�$~�$�$��%��%��%��%��%��&��&��&��&��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-��������������������������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9�%c�HR%�ڸh�v�rd&���9��5���װ[+Stj��̊ͻ��NCn?�PI��㾁}9 <�BސK���J��ĩ6��oZ.����̻�����������_U��;�����L �����d������X� �`kt0fǃ���b�TX�l������P����
���]���ՠpV�m�&3�Xsd��]-�㌃���yo,4ȑ3�c�X]�FBn@��`5@�{�@q�Z��Wg�NAa\�=N��+�Yc�@?�9L��J�!���|�2 `�}ꒅ	u��3��ҁ2NÅC����t%��92AD3�`�\a�jw�A� �JW��*�0#X��� ���&��m-�ˁ�p�D��5�Q��V$C-l�tÛ�a�U�߶�G~ XIWO~{�G��5^AB-%"� �] ���\',���*��RR�����jI�$!��5`Y@��8pR� �
��h(���i`�߰��ׂXd�(�J���X�TxK��7�Xh��4@�4	~a��)��R)J�o���~<�E�榴~)����3��J'���W(C�M�	'с�8.)�����H&��A3e*��I�§Kbo�(aRĠ:�$��_(+�!*���.���H���`J�tǌ!�
���D�w�m-w�)�zR<G��3)���ɘ�8�|�����{;t$���A�R�R	�IsF��#=�-����~�����k����@�Hɒ�S����y��0>`��A6;	����M�)�`l��A�PI04��9D��o����N�TJj� id�!�Z�U����UVpH Ȱ6�b%SC�8Jq�$$i��� ��AFj������J�P!f�aA@A*��/X�Gܘ�@jp�I|!� ��@
�%���[�p[�yJȒ=H�;a:�.�G�$��$rfw�2�9�(�K�pJ��a!�l%oT���ɲ5�cHoٚCȤ Z�e&����2�I
�#KL��!��-����L��ًH �(�p��&l8e�(�!Q�!'��d�,�N"B'�"���32���N
�����@��'���K~���F�@�Q(^ș��ᅐ|������#�*;I8�,b��(
('����בdz�Ƭ2����Z�$�uLB�>ҜR00��mc	p�"k�A�KY �Q!`!&G惌��L	�h"~�q��d�(�B�C�`	���y�A��$�X�y�	$�T+0BA`$�A���'��&�`>@�@��C|���h�!�;��hGK�Қ���M�jW��ֺ����<�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv� !�	   ,    � � � - . / . /0122344556 66 7 8!7"8"9#9#:$;%;%<&<&=&>'>(?(?)@)A*A*B+B+C,D-D.E/F/G0G1H	1H	1J	2I	2J
3K
4K
4L
5L
5M
6M6N7O8P9Q8Q9Q:R:S;S<S;T<T<U=U>V?W?X@X@YAYAZAZB[B\C\C]D\D]D]D^E^F_G_G`GaHaHbKdKeLeLfMfMgNgOhOiPiPjQkRkRlRlSlSmSnTmTnToUoUpVpWqXrXsYtZsZtZu[uZu[u[v\v]w]x^x^y_y_z`za{a|b|b}c~c~de�f�f�f�g�h�i�i�j�j�k�k�l�m�n�n�o�p�p�q�r� r� r� s� s� t� t�!u�!v�!v�!w�!w�"w�"x�"x�"y�"z�#z�#{�#{�#|�#|�$}�$}�$~�$~�$�$�%��%��%��%��&��&��&��&��'��'��'��'��(��(��(��(��(��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L91%b�Pb5�h�|��tƇ��9��E���װ[/kdj��܊ͻ��O@n?�i��㾅y9 <��CސK��J��ȱ6��o\,����̻������!����eU��;�����L@�����d������� �`ku0vǃ���b�TX��U�a���P�|��5% '&~���MҢ��fȌ&�S�_o���ny�p`ACB_�8�!ka@I��!��AV(�#i���q�p0P3Z�<�Bf���/ga��tͤh�}�	u��3Q��x�h8 ȃ������A2AD1��c5io�$A� ��X�l�0#X��� 	V����I5�ˁ��ED��=�Q��Xg�J��p�`��k!��%`�k� �Հ��Ԇ��0|����\'R���/V�R���J�b[I���XԂc2������N#J2�wX:���7X�D�q�� b�2���	k�Br3� �BL�TxK��'�I"h�/A��@6N��J���I[ ��,�(���t
~U��w��tȇ��~:�T�y7����]��4|'�� 4�]J���I'�'��HW��I*h��6m�T�$��4x��3J.�eI�޷�H�'Ij%1{������~��R����� ��_#�� ����$� �0�ܪ�Q �K(�vd���AC� ��ъʷFI��$$Q �6.\�b��w4��QQR��E3yF2���F�%��0���Da?؈"�A�� d
�T J�$2��5� �E
�
e�$E;�#*b�k\�7�BE<��Y��E""����7��DD �	%��p�1Z�+HCC�A14f9d��Jn@�R�'!H�0>$? ��a�tx������J:Q�eD�
/�  *�/d�E܈�@�բJx����@�
!�%����"��X�{L�<H�;��A�pI�H�%o�t҆�1�9�X�K���S���+{sŗ�a��Cl�Krd-&�a/91A����T�dR�h�rx>��l��&9h�%+!� x����M��N.�"err�N��"���"v2�r^w��<sCH�����5���i=���w	�m� �C�b������c�l,a(���L���d��U��PHm#�����Mq�By�L8�qPbX(�@%��!cxj) ��>$�D���5��P�T�5}�0�#l�B�@��'d��aF">(,�< ��"�  �Y�!lP̙��`�y��$�+ H��@	Ut��"����(xAҀ�P��;�$����a紨M�jW��ֺ����F�lgK������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv����z���oQ !�	   ,    � � � - . / . /0122344556 66 7 8!7!8"9#:$;%<&<&=&>'>(?)@)A*A+A*B+B+C-D.E.F/F/G0G0H	0H	1J	2J	3J
3K
4K
4L
5L
5M
6M6N6O7O8P9Q8Q9Q:R:S;S<S;T<T<U=U=V>V>W?X@X@YAYAZAZB[C\C]D]D]D^E]F_G_G`G`GaHaIbJcKdKeLfMfMgNgOhOiPiPjQjQkRkRlRlSmSnTmTnUoVpWqXrXsYsZsZtZu[uZu[u[v\v\w]x^x^y_y_z`za{a|b|b}c~c~dee�f�f�f�g�g�h�i�j�j�k�l�m�n�n�o�p�p�q�q�r� q� r� r� s� s� t� t�!u�!v�!v�!w�!w�"x�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��+��+��+��+��+��,��,��,��,��-������������������������������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9q%a�LZEL�j�z�rd���5��E���װ[;Sdj��Ԋͻ�kN?n?�`i��㾅y9 <�BߐK�=�J����6��o[*���ͻ����������aU�܃;�����L������d������X� �`kr0Fǃ���b�TX��Q�a���P�|�a6#@&&~Ȍ�EҢ��6Ȍ&�3�_n���}u��5���qC��c^<�(I6L��
I�1����E�}	mp�4q��hx�1t��8x�]ܢ�$D�1��/D �&fcE	Ȃ +n}�7��Ia1)V���ʰ�	����=�ˁ������l$A2^���>ґVqV>
�� V��/�0�MD�c !�5(�PH��A�4e��#"5�_&�q3f��ʌ���p���t�0 S7-�R����BR���K$�xK&!�6#�p��-�`"3�����5���RfJ��wHg�WJK h�)�$|)�d�}�������}=�~X�d	�u��
~S��~}����0����}����R �T�	K�R�1�ҍ&�0�� ���E���&����� �����8��R���	R6�5r�	��M�%�z�8"т�5m���4CB��I���H����H�d1�������#~��� �I���m"u�"� �!pn�����GB h�H��wL�p
�u�F�~�4$1`��H}l�\�  FBR �#�F�O~G1�|�%qy�3l���q�Fp��P�$�8�. v�|����,� ��gd%a�f�@��@{�1bV��A(+I���	F���q�1:���
D�4DD�2��t!(�| 
�I����[��W!ct����1��@�P	(�<�� H�4T �Ъ�0�PăX� <V��K`A*`/\�E��@:f"Jx�� �ʀC
-�%G"��A��A�]K@J���	�B)�	�8@R��N"�Xz�rI�g���a!z�t�<�7�cH�CȄ �`&l2a���P��i�dJx8�Mrl�5�A��I	B����M��LDT$C��CN� �Y��<�NKm#?�Y)�� �'����F8 �R��'] �+Ō�EB�CP~ / zc� �Bt ��%e_3Z&��i|��@Q
�^Έv�H���&).$�
f�qL�U(� %|�!d$�)Q`��`���� �&�:��lar<L���%��J\q�g"�3�"��P(�*�B"b�g�ՔI j@�g���@BR�� x���E2���^x�h`B���
��	i(�'|�Ј�h�X�ǰC������ͭnw��������p�K�����M�r����:��Ѝ�t�K��Z���ͮv����z����x�K�����M�z������( !�	   ,    � � � - . / . /0112234455 66 7 8!7!8"8"9#9#:$;%;%<%=&=&>'>(?(?)@)A*@*A+A+B+C,C,D-D-E.E.F/F/G0G1H	1H	1I	1J	2J
3K
4K
4L
5L
5M
6M6N7O7P8P8Q9Q8Q9Q9R:R:S;S<U=U=V>V>W?W?X@X@YAYAZAZB[C\C]D\D]D]D^E]E^F_G_G`G`GaH`HaHbKdKeLfMfMgNgNhOhOiPiPjQjQkRkRlRlSmSnTmTnUoVpWqXrXsYsZsZt[u[v\v\w]x^x^y_y_z`za{a|b|b}c}c~c~d~de�f�f�f�g�g�h�i�j�j�k�k�k�l�m�m�n�n�o�p�p�q�r� r� r� s� t�!t�!u�!u�!v�!w�!w�"x�"x�"y�"z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-��������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9q�(jm��L\�m҈Ѳ�Ȇ�;�֮��װ[[��$j����ͻ��SHn?�����㾕�A <��E�K���K���7���^1��0�ͻ�����������qY�l�;������L�����Cd������� �`k|0�ǃ�C�b�TXa�q�a���P�|�a8'�(&~8��eҢ���Ȍ&���_x���}���5�e�qC��c^D̨�=L�@P�����䅂}
#�	yH6&�R(�0QT�a7e8� !���Ѽ�M,f0��hhɚ����B���5���O�TH�)����t�t��D'�̤X���I�xǉNaTx���=@́��t�yr��C��lA� f@�`�P�HG���H���GMCa"	`'$Y�35�Ba���ߌd~/̔�����4��~��������z��~��t�8�RҼ��"R0�E��<؋m%M��8!!��0�� 4�T�!���/!�`7#�t��}�~�(���CJ 	 5�_0.ѐ΃X�T�}E�4~����6N��,�m�e�:xMKއH]�
K�T�K���H�g��J7jشJ��H,�ǍJB~�J��H�'JD��"�(���	�^'�����\p��#��c���X�%=��5"���#Y�L���R�����2��ߎ*׉��n���Ft|��R �0�7�)S�G���k��t 4�iCR' �ъ����G� (�H��;���6���Fp�9�h�$8�3��M�7�����
�$��,Ҁ�]�7�p F� ��$C@P-`�����*R�Z �g�&)�F���(at8��9�&� �@H;�dDD2J�tJQ����_2J��q���
!C�*�̪B�PCІ�!*���Q�� $sXƇ�� \�L�4�����J��!R��	0p�zp�O��6�<c�V��� ����I�%N��ԡ��A��O�X��\��V8�,�K�`�%(O1�c���a����ZhJ�Y�5���Lb����BP��,+&	�X9]CD��m����b�;�S4�|#�9��D	���$҇r��7q8�G�8�39��5%V5X�;�b.ű��P�ŤDO&Kc|`#"0F.��r���*��=�\�9�	, q}��PN��U�h"�����%,^9 �3�@�p�(FX'p�E�؄�PDDGЀ�R`R~;\�Jd�p�!�Ly��� e0!&3�E��!
J%	�8�5ę� E-����'T�Q汆"v�ƚ���8�5(��j�G��%jA�i$�Ho#�0���'X�"NA�F4����������M�r����:��Ѝ�t�K��Z���ͮv����z����x�K�����M�z����������|�K������ͯ~�������D	 !�	   ,    � � � - . / . /0112234456 66 7 8!7!8"8"9#:$;%;%<%=&=&>'>(?(?)@)A*A*B+B+C,C,D-D.E.F/F/G0G	1H	1I	1J	2J
2K
3K
4K
4L
5M
6M6N7O8P8Q9Q8Q9Q:R:S;S<S<T<U=U>V?W?X@X@YAYAZB[C\D\D]D]D^E]E^F^F_G_G`GaHaIbIcJcKdKeLeLfMfMgNhOhOiPiPjQjQkRkRlRlSmTnUnUoUoUpVpWqXrXsYsZsZt[u[v\w]w]x^x^y_y_z`za{a|b|b}c~c~d~dd�ee�f�f�f�g�g�h�i�i�j�j�k�k�l�m�m�n�o�p�p�q�r� r� r� s� s� t� t�!t�!u�!v�!v�!v�!w�!w�"w�"x�"y�"z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��)��)��)��)��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��-��������������������������������������������������������������������� H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L91�%d�Xz��[:l΀Ŋ����9�ᕮ��װ[K[t$j����ͻ��PBn?��	��㾍�A <��B�K�m�J����6���\.���Bͻ������a����kY��;�����L �����d������� �`kv0�ǃ�ӆb�TX��]�a���P�|�a7%�'&~��4}'���M1��P$-�X�L ���'�_�&� �� N@��d��0��t�`O_L�#!-�p�<U�%�9�T�yߜ��=V�E<��h���0+	�"9�`_��h�@B�Q�E�4|�0p��h���1���8�KJ.�G�M�a%D$2���(��ua)~cE	܂ ,'��_�4�Q!2#X��� �`�!�=B�b�Es�)&]�3�P!$E�́���3�t�5&����H����L�B� �`&#�~��$
�`~T�1�m3 ����� R�I��K@ċ )�d�t���k�T�7�R���"�2����K8�`.Ӓ�~ބ������>��I}�W H/�7�K�<�M(A�����_�-]A�~)��HL�ǍK^;X�J>�H\�g3�K�>�K��7Hd�W	K
��0-Y�� �y�+�J�+��_ ���*��+� ��߽)�Ѣ�)�|��U��'������n���M�p��8H2�Iv�'��c��#	�I��'�H����H0sf:�X)���"R��2�����*���g���?�t���k�'J�" (#���15�@|'���?� I& ��(��E�:���XL$Y :`���06�h�Fj ��H�$8�2�ǽ06��^F0. Q�$�8���e��&'�H� T�DlJ�EH�3'��@�+�&���@��d�E��a�	@���$�A��@D$@�6NG"��ք�F�$��(��-`CC�� 04$�?��!0C�D�`�B�x�B�5�JC��  2PyC<D�pAAa%���'̀�4�9 �&Z$���&�P@�Nh�����$��?�At�k�'�,�7σ�'���y&��R���BB�PCx����r	�쉜;,�K�<�^���
��Ays�$`huMҼ��&0��
6��N��!j��7TP#�.�����s��&g0��(b�t�s9Q?�U�#�:	�8���`��Pg$z�o
C�D��/�Tԋ���F(�8/�!(P�h�!Ϗ  6��7�0�t1��X�Hd��*�wBI��=�$�J�<�� ��=B�%ʅ�Uy�JX�ސL��+!@�Ѣn�A�Jy �� cH�%PԌ5�2*E(�Ł�q�2�LP)i$�8�4qF�DW�D��#�F$��Z��� 	Y ���0Fa�54!�
	� K���hhDC!�;���|�K������ͯ~������� ��L���N����;�����'L�
[��ΰ�7��{�� ��GL����(N��� !�	   ,    � � � - . / . /01122344556 66 7 8!7!8#:"9#9#:$:$;%;%<%=&=&>'>(?(?(@)@)A*A+A*B+B+C-D-E.E/G0G1H	1I	1J	2I	2J	3J
3K
4K
4L
5L
5M6N7O8P8Q9Q8Q9Q9R:R:S;S;T<T<U=U>V?W?X@X@YAYAZB[B\C[C\C]D\D]D^E]E^F_G_G`GaHaJcKdKeLeLfMfMgOhOiPiPjQkRkRlRlSmSnTmTnUoUpVpWqXrXsYsYtZsZt[u[v\w]w]x^x^y_y_z`za{a|b|b}c~c~d~de�f�f�g�g�h�i�j�j�k�k�k�l�m�m�n�n�o�p�p�q�q�r� r� r� s� s� t�!u�!u�!v�!w�!w�"x�"y�"z�#z�#{�#{�#|�#|�#}�$}�$}�$~�$~�$�$�%��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��*��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9�'g�Tre��k�~����H��?��Ů��װ[Gk�$j��܊ͻ��PFn?�i��㾉�A <�C�K�m�K����6��o\0��3ͻ������A����e]�L�;������L@����P�a�+��!E	Hm@���FO4�.1��6v�;�!r�@ T�Ȏ9iѝ3 ��*JqS�E��O��H�~4IP�y��D '>��
4�;!�$��0��]��$S&iHL6�'NN�u��/)�$�$��S:s�K� x�Md���!--!5Ua��S���/A�]R"@ �j�Bc0+=�3�`���|�@B �1��I�T���D���*j�u! H:��!���H��`L�A��*����'*z�E
<�+'q!2��1'X��{�`�,�"�*�� F�!*%M �3&���l$3n@�����BLX��"�0(~^��	�g�t��� j)R ��ǋL����G�7#�  1���  "�(1�p���4�u��(��B8�R���"2���x��m%9��7"�x�/����<p�� ��i�� z��I7�w��G)���K.vx)��y/���}��$�9^�R������R���R+�e��UG8JK��WHXd�R Nvh̻,�:HP�׸J�x�.	�� ��6*���:���},�t�w����$
*��� n�'�����x4Iw෎H
���I�o&�$)�_4"��}�5�
$�P�`I\�S�K���H�(��O#��&� H!9��,��	 ��H��b��$|M"@���$��|Ց t"���1!G���I��]�Y�8�C �F����΃�l B��WF*�Dޜ,# �*PV@�\�H`�E�pwI�n d���B� �EN��6�&L�H�!$X�DE���C�BEB�Y��	�E"2�IL�?����f�ԢCJH	�"�2�O!``������u(]@C���AH*!�-�0�H�Ǣ�5b ���[XB2�>z�
+y�<�&����21%rԀ ��Q7X��%\ �RS��`ҏ �JG*	�u�@�b	�y�-���$\�$�<bHj�i0�%��t�oiT:@z�#>z#2$�)a� ��6�xeB�R�@cN2q�/_�	=>�5eG8F%�󥖘S��$/�"D�����'� �.�r|T:	@����]�.Mh$z���c�q���1����p��I�!(W�)	�Q��]�����IJ�ddO(	�!��8��	Ұ`'�X&��K먄�PE��L�p��R �$I*\I
4�Z%�A�L�@(�!bL&&�Do#�6h*I0���C΄n �L���(�	��_w�q4�$�H�w�1	&�V+(B$�_8�����(��(̠�?�@���^0C��M$�P��a�����'L�
[��ΰ�7��{�� ��GL����(N��W�����0���gL����8α�w�����@���L�"��HNrQ !�	   ,    � � � - . . /01122344556 66 6 7 8!7!8"8"9#9#:$;%<%=&=&>'>(?(?)@)A*A+A+A+B+C,C,D-D-E.E.F/F/G0G0H1H	0H	1I	1J	2I	2J	3J
3K
4L
4M
5L
5M
6M6N7O8P8Q9Q8Q9Q9R:R:S;S;T<T<U=U=V>V?W?X@X@YAYAZAZB[C\C]D\D]D^E]E^F_G`HaHbIbJcJcJdKdKeLfMfMgOhOiPiPjQjQkRkRlRlSmSnTmTnUnUoUpVpWqXrXsYsYtZs[u[v\v\w]w^x^y_y_z`z`{a{a|b|b}c~c~d~dee�f�f�f�g�g�h�i�j�j�k�l�l�m�n�o�p�p�q�r� r� s� s� t�!t�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��&��'��'��'��'��'��'��'��(��(��(��(��(��)��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��,��,��,��,��,��-������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9q*ly��=pԊ��Ɇ�;�	F���װ[g�j���ͻ��SJn?�j��㾕�9���L)HBN��70M�k�ږG���\�|�]3�����ܘ�f����{���������r�P+`c#@!a��NA���>)������S ��N��ሮ���"�S��bk���a���ȋ8�CGNh�h�M��#7!A�6}"d���PS�M�����0� Ƹ�L�r�� �#/61�%c^� LU�8�21�����䑘�Lx�9f�.9�#1�(�o������Ţw:�R,8� �mv�<�o�"$2+5�#�/�pΒ�à�@B��H��%���9N4t�!��KJ<�(�0����L̸XJ���M1���:NP� /$�r��a�1!�#3$X����`���B'L^䨊m-�녬�����4�9b��Ҍ�IK��EL���$��n�a�t	���d 18.�!�B�8�s1L���hG(sa9#ɀ��0���!��"�q�8����#�R�H�\ȇHA6L'��"-%q���!Ӡ<�� 5/�B0I�4�NH�� �*/@ˋ�8pR! 2�R"/�#J:\�G@\x5K��)@5}0�E�ոT�;/n�����R�/,vҌ z�R,��JKJ2�H\4��J��"3	��J� ��1+��b: ��L�C�`8*)J�<���N�+�d����d��.n�R
R����qRbs��\��C$P1L���z0�F��!X\�$��3^����Z�H�p�[�$�s�<�_\�"�������H1a��'�o\��!I�|g t
'����b�I@��Bx$L8��d�����.�	�HC:�'p��f��CG~0�/�D#z�6�FѠ �0O. ��@�B(�,F$7�,@\8�BA�6�i��"p!�Za!�9�q䇂x @��E�6"ΙdZ#*��"� �H���A�-F$ �Đ0P"��� '�d  C��ADF��	%�p�:�0K��B���
�1���aH ڰ>%C%gt�3�ж�H`��8:p�:���@AB2p�h�H+���Lц(�� BF1�v� !��1q@`To拢��bRjL�<��N��%��9�G��hnۆM]����`��ƿZ�I�^H�Y�Q�!�Tb� *cCU�@B&�[U�#K�,@�[=6�$�p'���%D&�V߬�5q��
�OL�t}�<hh7��5 �H���5�d�G)-"�v�5:	@�Њ��]�@t�DO��c S#�OX]�V�Ԉ  ��>e����;z
�0�è��PD�Sl�N$'��M��� @L'e� �W�+褥�[Q�p�1��7;	�AEc
K)��$�\�p%��a��*�s`݋���a9���(�&�bDڀ�+g"HC�HiU Lh�>�`��Y� �Ɇ%� ]�p 	s��-�ap���x��`�z�D3�q�b,4�Ʉ�F����@���L�"��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�����6���p����L�:���xs@  !�	   ,    � � � - . / . /01122344556 66 7 8!7!8"8"8"9#9#:$;%<%=&>'>(?(?)@)A*A+A+B+C,C,D-D-E.E.F/G0G0H1H	0H	1I	1J	2I	2J
3K
4K
4L
4M
5L
5M
6M6N7O8P8Q9Q8Q9Q9R:R:S;S<S<T<U=U>V>W?W?X@X@YAYAZB[C\D\D]D^E]E^F_G_G`GaH`HaIbJcJcKdKeLeLfMfMgOhOiPiPjQkRkRlRlSmTmTnUnUoUpVpWqXrXsYsZsZtZu[u[v\v\w]w]x^x^y_y_z`za{a|b|b}c~c~d~de�f�f�f�g�g�h�i�i�j�j�k�l�m�m�n�n�o�p�p�q�r� r� s� s� t� t�!t�!u�!u�!u�!v�!v�!v�!w�!w�"x�"y�"z�#z�#{�#|�#|�#|�#}�$}�$}�$~�$~�$�$�$��%��%��%��%��%��&��&��&��&��&��'��'��'��'��'��(��(��(��(��(��)��)��)��)��*��*��*��*��*��*��*��+��+��+��+��+��+��,��,��,��,��,��-������������������������������������������ H����*\Ȱ�Ç#J�H��ŋ3j�ȱ�Ǐ C�I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`ÊK��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�L���È+^̸��ǐ#K�L9q)ji�լ��nӌ٪����4�BU
�J?�&���۸k_��$Vj��-jDQoz_μ�)"yf^�����k_�l�����~;��	�ؑ_��� K_<c�Ow���/oW����cBN������ EY0�����P�a.e��i51N�v�CP.��bmd�D�!/�O?�pN���1���=1�����d8B���N\4)-1�!e�q�$F<RzS%W�X�MM���K���c;=��~MR���)$9�D�1a��R ���$5�T��b�D��R.j�Ғ"�J�/a���H�R�^)�w-Yf.��tF�a:�R�a�������J�4YN!�D������E�Hi�JI�L
�tR��	y��6B.�45�SL\#%8c����S#0)IQc2$�t mMf2AD64S�(��b,�J��0AQ��X�I!��
1*d3�V�@�!�`"(C1LZ4��o1p����)��tSMR��Ҡ�I^�ϭ/i����t4�zA���
�i�G���H���5#�d����T�2�3!:Bv"�!� �H�����!�!"���0��c�T��+������t�����$QCa9!]�! /@��<p�  
���!<�#J7hH�G:P��+�\c;��D@��� ���4C;<�R��Ғ�<���,f�&����h!Ki2�HXPزJ��c3Ѳ�J� -N 2+QZ�9 pI2(���B�PIx��$RH<G�ٝ����\�:
�	$��ON�I&z�P<D24-�$h��p1�"��x@̧F��(L���T�$��H0���1�� ��!9��xd�(!D��(��y$ �(br�hh�$�D�q�@YΌ���D�3�c����+�� ���I6��g@`#�h�b�����#��.�0�GT�I��U�/2�EL�C=	" X�(��m�M��C4��+D��H�ѤM@$�`�0rI��H(yB�r�L �/$��tc;���CDа)%d{�:��.<�Iψ�C���r��!����R�!=c�AH��/)u��	��C%dupc�VR)�bOp�0�3|BM�DJ��s�bS�@�ՆO�h,�f���L��`���p�@+DD�<��%\� UCよ�q��d�/AeS���l��YL$����"��*s!�hN��	�����	 ��倂�A[]msԄ	��m�Y��C����M�&���"��kr�ƾ�"Q��#t������*�J��hEB5�l��<>I�!V���N��>�]y���~�M=����V���I���g��(	�c�����d�p�B���<��v��&v��Rш�R085)a��*%r��K� �ǣeԴ%h�Dy$�7<R*KHV��ш��d	�xQ*tj@����5����$_ E84<	(tW+8,qcP��0�)�*РC@��lAg`�Z�M%�pqV��HN�����&;��P����L�*[��Xβ����.{��`���L�2���hN�%����6���p����L�:���xγ����>��π��� ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            PK
    Z:U��/�]  ]  $   resources/application-dev.propertiesspring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://music-market-place-test.c9u7ywrrjnzu.us-west-1.rds.amazonaws.com:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=music123
#spring.jpa.generate-ddl=false
#spring.jpa.hibernate.ddl-auto=update
#spring.jpa.show-sql=true
PK
    Z:U��M�W  W  %   resources/application-prod.propertiesspring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://music-market-place.c9u7ywrrjnzu.us-west-1.rds.amazonaws.com:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=music123
#spring.jpa.show-sql=true
#spring.jpa.generate-ddl=true
#spring.jpa.hibernate.ddl-auto=update
PK
    �!<UK�	��  �      resources/application.properties
#spring.profiles.active=dev

spring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://music-market-place.c9u7ywrrjnzu.us-west-1.rds.amazonaws.com:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=music123
spring.jpa.generate-ddl=false
spring.jpa.hibernate.ddl-auto=update
server.port=8080
spring.jpa.show-sql=true


PK
    �9U���R  R     resources/index.html<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music</title>
</head>
<body>
    <div id="banner"></div>
    
    <script src="index.js"></script>
</body>
</html>PK
    $h=U�#Uȷ�  ��     resources/index.jslet banner = document.querySelector("#banner");
window.addEventListener("load", renderLogin);

//JWT
const localstorage_user = JSON.parse(localStorage.getItem('user'));
const inMemoryToken = localstorage_user.access_token;




function derenderPage(){
    document.querySelector("body").innerHTML = "";
}

// Login Page

function renderLogin(){

    derenderPage()
    
    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";
    document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";
    
        //loginContainer Creation

        let loginContainer = document.createElement("div");
        loginContainer.id = "login";
        
        //Black box creation

        let rec = document.createElement("div");
        rec.style.backgroundColor = "black";
        rec.style.width = "200px";
        rec.style.height = "340px";
        loginContainer.appendChild(document.createElement("br"));
        loginContainer.appendChild(document.createElement("br"));
        loginContainer.appendChild(rec);
    
        rec.appendChild(document.createElement("br"));
    
        //Top Buttons
        
        let loginButton = document.createElement("input");
        loginButton.type = "button";
        loginButton.value = "Login";
        loginButton.style.color = "cyan";
        loginButton.style.backgroundColor = "black";
        loginButton.style.borderBottomColor = "silver";
        rec.appendChild(loginButton);
    
        let regButton = document.createElement("input");
        regButton.type = "button";
        regButton.value = "Register";
        regButton.style.color = "cyan";
        regButton.style.backgroundColor = "black";
        regButton.style.borderBottomColor = "cyan";
        regButton.style.marginLeft = "20px";
        regButton.addEventListener("click", renderCreate);
        rec.appendChild(regButton);
    
        //Fields
    
    
        let usernameLabel = document.createElement("p");
        usernameLabel.innerText = "Username";
        rec.appendChild(usernameLabel);
        usernameLabel.style.color = "cyan";
    
        let usernameInput = document.createElement("input");
        usernameInput.id = "username";
        usernameInput.type = "text";
        usernameInput.placeholder = "username";
        usernameInput.style.backgroundColor = "silver";
        rec.appendChild(usernameInput);
        rec.appendChild(document.createElement("br"));
    
        
        let passwordLabel = document.createElement("p");
        passwordLabel.innerText = "Password";
        passwordLabel.style.color = "cyan";
        rec.appendChild(passwordLabel);
    
        let passwordInput = document.createElement("input");
        passwordInput.type = "password";
        passwordInput.id = "password";
        passwordInput.style.backgroundColor = "silver";
        rec.appendChild(passwordInput);
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
    
        let submitButton = document.createElement("input");
        submitButton.type = "button";
        submitButton.value = "Login";
        submitButton.style.width = "80px";
        submitButton.style.borderRadius = "7px";
        submitButton.style.backgroundColor = "gray";
        submitButton.style.borderColor = "gray";
        submitButton.addEventListener("mouseenter", function(){submitButton.style.color = "silver";});
        submitButton.addEventListener("mouseleave", function(){submitButton.style.color = "black";});
        submitButton.addEventListener("click", asyncLogin);
    
        rec.appendChild(submitButton);
        
        document.querySelector("body").appendChild(loginContainer);
        //Login Container Styling
        document.getElementById("login").style.fontFamily = "Arial";
        document.getElementById("login").style.width = "200px"
        document.getElementById("login").style.marginLeft = "auto";
        document.getElementById("login").style.marginRight = "auto";
        document.getElementById("login").style.textAlign = "center";
    }


    function renderCreate(){
        derenderPage()
        document.body.style.width = "100%";
        document.body.style.minHeight = "1000px";
        document.body.style.margin = "0";
        document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";
        
            //createContainer Creation
            let createContainer = document.createElement("div");
            createContainer.id = "create";
            
            //Black box creation
            let rec = document.createElement("div");
            rec.style.backgroundColor = "black";
            rec.style.width = "200px";
            rec.style.height = "400px";
            createContainer.appendChild(document.createElement("br"));
            createContainer.appendChild(document.createElement("br"));
            createContainer.appendChild(rec);
        
            rec.appendChild(document.createElement("br"));
        
            //Top Buttons
            
            let loginButton = document.createElement("input");
            loginButton.type = "button";
            loginButton.value = "Login";
            loginButton.style.color = "cyan";
            loginButton.style.backgroundColor = "black";
            loginButton.style.borderBottomColor = "cyan";
            loginButton.addEventListener("click", renderLogin);
            rec.appendChild(loginButton);
        
            let regButton = document.createElement("input");
            regButton.type = "button";
            regButton.value = "Register";
            regButton.style.color = "cyan";
            regButton.style.backgroundColor = "black";
            regButton.style.borderBottomColor = "silver";
            regButton.style.marginLeft = "20px";
            rec.appendChild(regButton);
        
            //Fields
    
            let registerLabel = document.createElement("p");
            registerLabel.innerText = "Please register";
            rec.appendChild(registerLabel);
            registerLabel.style.color = "cyan";
        
            let usernameLabel = document.createElement("p");
            usernameLabel.innerText = "Username";
            rec.appendChild(usernameLabel);
            usernameLabel.style.color = "cyan";
        
            let usernameInput = document.createElement("input");
            usernameInput.id = "createUsername";
            usernameInput.type = "text";
            usernameInput.placeholder = "username";
            usernameInput.style.backgroundColor = "silver";
            rec.appendChild(usernameInput);
            rec.appendChild(document.createElement("br"));
        
            
            let passwordLabel = document.createElement("p");
            passwordLabel.innerText = "Password";
            passwordLabel.style.color = "cyan";
            rec.appendChild(passwordLabel);
        
            let passwordInput = document.createElement("input");
            passwordInput.type = "password";
            passwordInput.id = "createPassword";
            passwordInput.style.backgroundColor = "silver";
            rec.appendChild(passwordInput);
            rec.appendChild(document.createElement("br"));
            rec.appendChild(document.createElement("br"));
            rec.appendChild(document.createElement("br"));
        
            let submitButton = document.createElement("input");
            submitButton.type = "button";
            submitButton.value = "Register";
            submitButton.style.width = "80px";
            submitButton.style.borderRadius = "7px";
            submitButton.style.backgroundColor = "gray";
            submitButton.style.borderColor = "gray";
            submitButton.addEventListener("mouseenter", function(){submitButton.style.color = "silver";});
            submitButton.addEventListener("mouseleave", function(){submitButton.style.color = "black";});
            submitButton.addEventListener("click", asyncCreate);
        
            rec.appendChild(submitButton);
            
            document.querySelector("body").appendChild(createContainer);
            document.getElementById("create").style.fontFamily = "Arial";
            document.getElementById("create").style.width = "200px"
            document.getElementById("create").style.marginLeft = "auto";
            document.getElementById("create").style.marginRight = "auto";
            document.getElementById("create").style.textAlign = "center";
    }

    function renderHomePage(user, library, playlistName, songs, userLists){

        derenderPage()
        console.log(playlistName);
        document.body.style.width = "100%";
        document.body.style.minHeight = "1000px";
        document.body.style.margin = "0";
    
        let gridContainer = document.createElement("div");
        gridContainer.style.display = "grid";
        gridContainer.style.gridTemplateColumns = "150px auto";
        gridContainer.style.backgroundColor = "";
        gridContainer.style.fontFamily = "Arial";
        
    
        let rightGrid = document.createElement("div");
        rightGrid.style.gridColumnStart = "2";
        rightGrid.style.gridColumnEnd = "2";
        rightGrid.style.textAlign = "right";
        
    
        let leftGrid = document.createElement("div");
        leftGrid.style.gridColumnStart = "1";
        leftGrid.style.gridColumnEnd = "1";
        leftGrid.style.textAlign = "center";
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
    
        let leftBB = document.createElement("div");
        leftBB.style.backgroundColor = "black";
        leftBB.style.width = "120px";
        leftBB.style.marginLeft = "auto";
        leftBB.style.marginRight = "auto";
        leftBB.style.borderRadius = "15px";
        leftBB.appendChild(document.createElement("br"));
    
        let rightBB = document.createElement("div");
        rightBB.style.backgroundColor = "black";
        rightBB.style.width = "70%";
        rightBB.style.marginLeft = "auto";
        rightBB.style.marginRight = "auto";
        rightBB.style.textAlign = "left";
        rightBB.style.borderRadius = "15px";
        
    
        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Store";
        storeButton.style.color = "cyan";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "cyan";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null", userLists);});
        leftBB.appendChild(storeButton);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        
        
        for(let i = 0; i < userLists.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${userLists[i]}`;
            if (temp.value == `${playlistName}`){
                temp.style.color = "gray";
            } else {
            temp.style.color = "cyan";
            }
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){if (temp.value == `${playlistName}`){
                temp.style.color = "gray";
            } else {
            temp.style.color = "cyan";
            }});
            temp.addEventListener("click", function(){asyncLoadPlaylist(user, library, `${temp.value}`, userLists, "false");});
            
            
            leftBB.appendChild(temp);
            leftBB.appendChild(document.createElement("br"));
            leftBB.appendChild(document.createElement("br"));
        }
    
        let createPlaylist = document.createElement("input");
        createPlaylist.type = "button";
        createPlaylist.value = "Create New\nPlaylist";
        createPlaylist.style.color = "cyan";
        createPlaylist.style.backgroundColor = "black";
        createPlaylist.style.textDecoration = "underline";
        createPlaylist.style.wordBreak = "break-all";
        createPlaylist.addEventListener("mouseenter", function(){createPlaylist.style.color = "silver";});
        createPlaylist.addEventListener("mouseleave", function(){createPlaylist.style.color = "cyan";});
        
        createPlaylist.addEventListener("click", function(){asyncLoadPlaylist(user, library, library.name, userLists, "true")});
        leftBB.appendChild(createPlaylist);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        let currentPlaylist = document.createElement("h1");
        currentPlaylist.innerText = `${playlistName}`;
        currentPlaylist.style.textTransform = "capitalize";
        currentPlaylist.style.color = "cyan";
        currentPlaylist.style.marginLeft = "10px";
        rightBB.appendChild(currentPlaylist);
        
    
        
    
    
        for(let i = 0; i < songs.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${songs[i].strTrack}`;
            temp.style.color = "cyan";
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){temp.style.color = "cyan";});
            temp.addEventListener("click", function(){loadSong(`${songss[i]}`);});
            temp.style.marginLeft = "10px";        
                
            rightBB.appendChild(temp);
            rightBB.appendChild(document.createElement("br"));
            rightBB.appendChild(document.createElement("br"));
        }
        
    
    
        let userinfoButton = document.createElement("input");
        userinfoButton.type = "button";
        userinfoButton.value = `${user.username}`;
        userinfoButton.style.textTransform = "capitalize";
        userinfoButton.style.width = "80px";
        userinfoButton.style.height = "30px";
        userinfoButton.style.textAlign = "center";
        userinfoButton.style.backgroundColor = "black";
        userinfoButton.style.color = "white";
        userinfoButton.style.textDecoration = "underline";
        userinfoButton.style.borderColor = "gray";
        userinfoButton.style.borderRadius = "15px";
        userinfoButton.style.marginRight = "100px";
        userinfoButton.addEventListener("mouseenter", function(){userinfoButton.style.color = "silver";});
        userinfoButton.addEventListener("mouseleave", function(){userinfoButton.style.color = "white";});
        userinfoButton.onclick = function(){loadUserInfo(user);} 
        
    
        
       
        rightGrid.appendChild(userinfoButton);
        rightGrid.appendChild(rightBB);
        leftGrid.appendChild(leftBB);
        gridContainer.appendChild(leftGrid);
        
        gridContainer.appendChild(rightGrid);
        
    
       
    
        document.querySelector("body").appendChild(gridContainer);
    } 

    function createNewPlaylist(user, library, songs, userLists){
        derenderPage();
        
        /*
        let homePage = document.createElement("input");
        homePage.type = "button";
        homePage.value = "Return to HomePage";
        homePage.style.width = "150px";
        homePage.style.marginLeft = "20px";
        homePage.style.backgroundColor = "black";
        homePage.style.color = "cyan";
        homePage.style.borderRadius = "15px";
        homePage.style.borderColor = "gray";
        homePage.addEventListener("mouseenter", function(){homePage.style.color = "silver";});
        homePage.addEventListener("mouseleave", function(){homePage.style.color = "cyan";});
        homePage.addEventListener("click", function(){asyncLoadPlaylists(user, library.name);});
        */

        let gridContainer = document.createElement("div");
        gridContainer.style.display = "grid";
        gridContainer.style.gridTemplateColumns = "150px auto";
        gridContainer.style.backgroundColor = "";
        gridContainer.style.fontFamily = "Arial";


        let rightGrid = document.createElement("div");
        rightGrid.style.gridColumnStart = "2";
        rightGrid.style.gridColumnEnd = "2";
        rightGrid.style.textAlign = "left";

        
    
        let leftGrid = document.createElement("div");
        leftGrid.style.gridColumnStart = "1";
        leftGrid.style.gridColumnEnd = "1";
        leftGrid.style.textAlign = "center";
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));


        let leftBB = document.createElement("div");
        leftBB.style.backgroundColor = "black";
        leftBB.style.width = "120px";
        leftBB.style.marginLeft = "auto";
        leftBB.style.marginRight = "auto";
        leftBB.style.borderRadius = "15px";
        leftBB.appendChild(document.createElement("br"));

        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Store";
        storeButton.style.color = "cyan";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "cyan";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null", userLists);});
        leftBB.appendChild(storeButton);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        
        
        for(let i = 0; i < userLists.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${userLists[i]}`;
           
            temp.style.color = "cyan";
            
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){
            temp.style.color = "cyan";
            });
            temp.addEventListener("click", function(){asyncLoadPlaylist(user, library, `${temp.value}`, userLists, "false");});
            
            
            leftBB.appendChild(temp);
            leftBB.appendChild(document.createElement("br"));
            leftBB.appendChild(document.createElement("br"));
        }
    
        let createPlaylist = document.createElement("input");
        createPlaylist.type = "button";
        createPlaylist.value = "Create New\nPlaylist";
        createPlaylist.style.color = "gray";
        createPlaylist.style.backgroundColor = "black";
        createPlaylist.style.textDecoration = "underline";
        createPlaylist.style.wordBreak = "break-all";
        createPlaylist.addEventListener("mouseenter", function(){createPlaylist.style.color = "silver";});
        createPlaylist.addEventListener("mouseleave", function(){createPlaylist.style.color = "gray";});
        
        createPlaylist.addEventListener("click", function(){asyncLoadPlaylist(user, library, library.name, userLists, "true")});
        leftBB.appendChild(createPlaylist);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));

        leftGrid.appendChild(leftBB);


        let blackB = document.createElement("div");
        blackB.style.width = "80%";
        blackB.style.backgroundColor = "black";
        blackB.style.borderRadius = "15px";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
        blackB.style.textIndent = "20px";
        blackB.appendChild(document.createElement("br"));

        
    
        let nameLabel = document.createElement("p");
        nameLabel.innerText = "Playlist Name:";
        nameLabel.style.color = "cyan";
        blackB.appendChild(nameLabel);
        blackB.appendChild(document.createElement("br"));

        let nameInput = document.createElement("input");
        nameInput.id = "name";
        nameInput.type = "text";
        nameInput.placeholder = "Playlist name";
        nameInput.style.backgroundColor = "silver";
        nameInput.style.marginLeft = "20px";
        blackB.appendChild(nameInput);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));

    
        let selectL = document.createElement("p");
        selectL.innerText = "Select the songs you want to add!";
        selectL.style.color = "cyan";
        blackB.appendChild(selectL);
    
        let playlistSongs = [];
        for(let i = 0; i < songs.length; i++){
            let temp = document.createElement("input");
            let buttonValue = songs[i];
            temp.type = "button";
            temp.value = `${songs[i].strTrack}`;
            temp.style.color = "cyan";
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("click", function(){
                if(playlistSongs.includes(buttonValue)){
                temp.style.color = "cyan";
                playlistSongs.splice(playlistSongs.indexOf(buttonValue), 1);
                } else {
                temp.style.color = "gray";
                playlistSongs.push(buttonValue);
                }
    
                
            })
            temp.style.marginLeft = "10px";
            blackB.appendChild(temp);       
            blackB.appendChild(document.createElement("br"));
            blackB.appendChild(document.createElement("br"));
        }       
    
        let createButton = document.createElement("input");
        createButton.type = "button";
        createButton.value = "Create!";
        createButton.style.color = "cyan";
        createButton.style.backgroundColor = "black";
        createButton.style.borderColor = "gray";
        createButton.style.borderRadius = "15px";
        createButton.style.marginLeft = "20px";
        createButton.addEventListener("click", function(){
            asyncCreateNewPlaylist(nameInput.value, playlistSongs, user, library, songs, userLists);
            delay(1000).then(() => asyncLoadPlaylists(user, library.name, "creating"));
        });
        
    
        blackB.appendChild(createButton);
    
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
    
        rightGrid.appendChild(blackB);
        gridContainer.appendChild(leftGrid);
        gridContainer.appendChild(rightGrid);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));

        document.querySelector("body").appendChild(gridContainer);
        document.querySelector("body").appendChild(document.createElement("br"));
        //document.querySelector("body").appendChild(homePage);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        
    
    }

    function renderStore(user, library, searchResults, userLists){
        derenderPage();
        
       
        
        /*
        let homePage = document.createElement("input");
        homePage.type = "button";
        homePage.value = "Return to HomePage";
        homePage.style.width = "150px";
        homePage.style.marginLeft = "20px";
        homePage.style.backgroundColor = "black";
        homePage.style.color = "cyan";
        homePage.style.borderRadius = "15px";
        homePage.style.borderColor = "gray";
        homePage.addEventListener("mouseenter", function(){homePage.style.color = "silver";});
        homePage.addEventListener("mouseleave", function(){homePage.style.color = "cyan";});
        homePage.addEventListener("click", function(){asyncLoadPlaylists(user, library.name);});
        */

        let gridContainer = document.createElement("div");
        gridContainer.style.display = "grid";
        gridContainer.style.gridTemplateColumns = "150px auto";
        gridContainer.style.backgroundColor = "";
        gridContainer.style.fontFamily = "Arial";


        let rightGrid = document.createElement("div");
        rightGrid.style.gridColumnStart = "2";
        rightGrid.style.gridColumnEnd = "2";
        rightGrid.style.textAlign = "center";
        
    
        let leftGrid = document.createElement("div");
        leftGrid.style.gridColumnStart = "1";
        leftGrid.style.gridColumnEnd = "1";
        leftGrid.style.textAlign = "center";
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));
        leftGrid.appendChild(document.createElement("br"));


        let leftBB = document.createElement("div");
        leftBB.style.backgroundColor = "black";
        leftBB.style.width = "120px";
        leftBB.style.marginLeft = "auto";
        leftBB.style.marginRight = "auto";
        leftBB.style.borderRadius = "15px";
        leftBB.appendChild(document.createElement("br"));

        let storeButton = document.createElement("input");
        storeButton.type = "button";
        storeButton.value = "Store";
        storeButton.style.color = "gray";
        storeButton.style.backgroundColor = "black";
        storeButton.style.textDecoration = "underline";
        storeButton.addEventListener("mouseenter", function(){storeButton.style.color = "silver";});
        storeButton.addEventListener("mouseleave", function(){storeButton.style.color = "gray";});
        storeButton.addEventListener("click", function(){renderStore(user, library, "null", userLists);});
        leftBB.appendChild(storeButton);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    
        
        
        for(let i = 0; i < userLists.length; i++){
            let temp = document.createElement("input");
            temp.type = "button";
            temp.value = `${userLists[i]}`;
           
            temp.style.color = "cyan";
            
            temp.style.backgroundColor = "black";
            temp.style.textTransform = "capitalize";
            temp.style.textDecoration = "underline";
            temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
            temp.addEventListener("mouseleave", function(){
            temp.style.color = "cyan";
            });
            temp.addEventListener("click", function(){asyncLoadPlaylist(user, library, `${temp.value}`, userLists, "false");});
            
            
            leftBB.appendChild(temp);
            leftBB.appendChild(document.createElement("br"));
            leftBB.appendChild(document.createElement("br"));
        }
    
        let createPlaylist = document.createElement("input");
        createPlaylist.type = "button";
        createPlaylist.value = "Create New\nPlaylist";
        createPlaylist.style.color = "cyan";
        createPlaylist.style.backgroundColor = "black";
        createPlaylist.style.textDecoration = "underline";
        createPlaylist.style.wordBreak = "break-all";
        createPlaylist.addEventListener("mouseenter", function(){createPlaylist.style.color = "silver";});
        createPlaylist.addEventListener("mouseleave", function(){createPlaylist.style.color = "cyan";});
        
        createPlaylist.addEventListener("click", function(){asyncLoadPlaylist(user, library, library.name, userLists, "true")});
        leftBB.appendChild(createPlaylist);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));

        leftGrid.appendChild(leftBB);

        let loadimg = document.createElement("img");
        loadimg.src = "Eclipse-1s-200px.gif";
        

        let loadDiv = document.createElement('div');
        
        loadDiv.style.position = "absolute";
        loadDiv.style.top = 0;
        
        loadDiv.style.marginTop = "10%";
        loadDiv.style.marginLeft = "35%";
        loadDiv.style.marginRight = "auto";
        loadDiv.style.zIndex = 3;
        loadDiv.style.width = "400px";
        loadDiv.style.height = "300px";
        loadDiv.style.opacity = "0.75";
        loadDiv.style.backgroundColor = "";
        loadDiv.style.textAlign = "center";
        loadDiv.style.display = "none";

        loadDiv.appendChild(loadimg);
        
        
        
        let searchBar = document.createElement("input");
        searchBar.type = "text";
        searchBar.placeholder = "Search by Artist name!";
        searchBar.style.width = "70%";
        searchBar.style.borderRadius = "15px";
        searchBar.style.backgroundColor = "	#404040";
        searchBar.style.borderColor = "gray";
        searchBar.style.textAlign = "center";
        searchBar.style.color = "white";
    
        let searchButton = document.createElement("input");
        searchButton.type = "button";
        searchButton.value = "Search!"
        searchButton.style.borderRadius = "15px";
        searchButton.style.backgroundColor = "gray";
        searchButton.style.borderColor = "gray";
        searchButton.style.textAlign = "center";
        searchButton.style.marginLeft = "10px";
        searchButton.style.color = "black";
        searchButton.addEventListener("click", async function(){
            if(typeof searchBar.value != 'undefined') {   
                loadDiv.style.display = "block";
                asyncSearchByArtist(user, searchBar.value, library, userLists);
            }
        })


        let blackB = document.createElement("div");
        blackB.style.backgroundColor = "black";
        blackB.style.width = "75%";
        blackB.style.borderRadius = "15px";
        blackB.style.textAlign = "center";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
    
    
    
        rightGrid.appendChild(document.createElement("br"));
        rightGrid.appendChild(document.createElement("br"));
        rightGrid.appendChild(searchBar);
        rightGrid.appendChild(searchButton);
        rightGrid.appendChild(document.createElement("br"));
        rightGrid.appendChild(document.createElement("br"));
    
        let newSongs = []
        if(searchResults != "null") {
            loadDiv.style.display = "none";
            for(let i = 0; i < searchResults.length; i++){
                let temp = document.createElement("input");
                let buttonValue = searchResults[i];
                temp.type = "button";
                temp.value = `${searchResults[i].strTrack}`;
                temp.style.color = "cyan";
                temp.style.backgroundColor = "black";
                temp.style.textTransform = "capitalize";
                temp.style.textDecoration = "underline";
                temp.addEventListener("mouseenter", function(){temp.style.color = "silver";});
                temp.addEventListener("mouseleave", function(){
                    if (newSongs.includes(buttonValue)){
                    temp.style.color = "gray";
                } else {
                    temp.style.color = "cyan";
                } });
                temp.addEventListener("click", function(){
                    
                    if(newSongs.includes(buttonValue)){
                        temp.style.color = "cyan";
                        newSongs.splice(newSongs.indexOf(buttonValue), 1);
                    } else {
                        
                        temp.style.color = "gray";
                        newSongs.push(buttonValue);
                    }
                    
                });
                temp.style.marginLeft = "10px";        
                    
                blackB.appendChild(document.createElement("br"));
                blackB.appendChild(temp);
                
            }
        }
    
        let addSongs = document.createElement("input");
    addSongs.type = "button";
    addSongs.value = "Add selected to Library!"
    addSongs.style.borderRadius = "15px";
    addSongs.style.backgroundColor = "gray";
    addSongs.style.borderColor = "gray";
    addSongs.style.textAlign = "center";
    addSongs.style.color = "black";
    console.log(newSongs);
    addSongs.addEventListener("click", function(){
        for (let i = 0; i < newSongs.length; i++){
        asyncPutSongInPlaylist(library.id, newSongs[i]);
        };
    });
    
    if(searchResults != 'null'){
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(addSongs);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
    }
     

    rightGrid.appendChild(blackB);
    gridContainer.style.textAlign = "center";
    gridContainer.style.fontFamily = "Arial";
    
    gridContainer.appendChild(leftGrid);
    gridContainer.append(rightGrid);
    document.querySelector("body").appendChild(document.createElement("br"));
    document.querySelector("body").appendChild(document.createElement("br"));
    document.querySelector("body").appendChild(gridContainer);
    rightGrid.appendChild(loadDiv);


    }

    function loadUserInfo(user){
        derenderPage();
        let homePage = document.createElement("input");
        homePage.type = "button";
        homePage.value = "Return to HomePage";
        homePage.style.width = "150px";
        homePage.style.marginLeft = "20px";
        homePage.style.backgroundColor = "black";
        homePage.style.color = "cyan";
        homePage.style.borderRadius = "15px";
        homePage.style.borderColor = "gray";
        homePage.addEventListener("mouseenter", function(){homePage.style.color = "silver";});
        homePage.addEventListener("mouseleave", function(){homePage.style.color = "cyan";});
        homePage.addEventListener("click", function(){asyncLoadPlaylists(user, `${user.username}'s  Library`);});
    
        let blackB = document.createElement("div");
        blackB.style.width = "80%";
        blackB.style.backgroundColor = "black";
        blackB.style.borderRadius = "15px";
        blackB.style.marginLeft = "auto";
        blackB.style.marginRight = "auto";
        blackB.style.fontFamily = "Arial";
    
        let userID = document.createElement("p");
        userID.innerText = `UserID: ${user.id}`;
        userID.style.color = "cyan";
        userID.style.marginLeft = "20px";
    
        let userName = document.createElement("p");
        userName.innerText = `Username: ${user.username}`;
        userName.style.color = "cyan";
        userName.style.marginLeft = "20px";

        let pUpText = document.createElement("input");
        pUpText.type = "text";
        pUpText.style.width = "150px";
        pUpText.style.backgroundColor = "gray";
        pUpText.style.color = "black";
        //pUpText.style.borderRadius = "15px";
        pUpText.style.borderColor = "black";
        pUpText.style.display = "none";
        pUpText.style.marginLeft = "18px";

        let pUpDone = document.createElement("input");
        pUpDone.type = "button";
        pUpDone.value = "Update!";
        pUpDone.style.width = "80px";
        pUpDone.style.backgroundColor = "black";
        pUpDone.style.color = "cyan";
        //pUpDone.style.borderRadius = "15px";
        pUpDone.style.borderColor = "gray";
        pUpDone.style.display = "none";
        pUpDone.style.marginLeft = "55px";
        pUpDone.addEventListener("mouseenter", function(){pUpDone.style.color = "silver";});
        pUpDone.addEventListener("mouseleave", function(){pUpDone.style.color = "cyan";});
        pUpDone.addEventListener("click", function(){ asyncUpdatePassword(user, pUpText.value); });

        let deleteButton = document.createElement("input");
        deleteButton.type = "button";
        deleteButton.value = "Delete User";
        deleteButton.style.width = "80px";
        deleteButton.style.backgroundColor = "black";
        deleteButton.style.color = "cyan";
        //deleteButton.style.borderRadius = "15px";
        deleteButton.style.borderColor = "gray";
        deleteButton.style.marginLeft = "55px";
        deleteButton.addEventListener("mouseenter", function(){deleteButton.style.color = "silver";});
        deleteButton.addEventListener("mouseleave", function(){deleteButton.style.color = "cyan";});
        deleteButton.addEventListener("click", function(){ ruSure.style.display = "block"; });
        
        let ruSure = document.createElement("input");
        ruSure.type = "button";
        ruSure.value = "Are you sure?";
        ruSure.style.width = "150px";
        ruSure.style.backgroundColor = "black";
        ruSure.style.color = "red";
        //ruSure.style.borderRadius = "15px";
        ruSure.style.borderColor = "gray";
        ruSure.style.marginLeft = "20px";
        ruSure.style.display = "none";
        ruSure.addEventListener("mouseenter", function(){ruSure.style.color = "silver";});
        ruSure.addEventListener("mouseleave", function(){ruSure.style.color = "red";});
        ruSure.addEventListener("click", function(){asyncDeleteUser(user); renderLogin();});

        let pUpdate = document.createElement("input");
        pUpdate.type = "button";
        pUpdate.value = "Update Password";
        pUpdate.style.width = "150px";
        pUpdate.style.backgroundColor = "black";
        pUpdate.style.color = "cyan";
        //pUpdate.style.borderRadius = "15px";
        pUpdate.style.borderColor = "gray";
        pUpdate.style.marginLeft = "20px";
        pUpdate.addEventListener("mouseenter", function(){pUpdate.style.color = "silver";});
        pUpdate.addEventListener("mouseleave", function(){pUpdate.style.color = "cyan";});
        pUpdate.addEventListener("click", function(){pUpText.style.display = "block"; pUpDone.style.display = "block";});
    
        
    
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userID);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(userName);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(pUpdate);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(pUpText);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));

        blackB.appendChild(pUpDone);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(deleteButton);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(ruSure);
        blackB.appendChild(document.createElement("br"));
        blackB.appendChild(document.createElement("br"));

        
        blackB.appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(homePage);
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(document.createElement("br"));
        document.querySelector("body").appendChild(blackB);
    }

    async function asyncLogin() {
        let userInput = document.querySelector("#username").value;
        let passInput = document.querySelector("#password").value;
        console.log(userInput)
        const url = "http://localhost:8080/auth/login";
        
    
        let loginObj = {
            username: userInput,
            password: passInput
        };
    
        try{
            let response = await fetch(
                url,
                {
                    method: "POST",
                    headers: new Headers({
                        'content-type':'application/json'
                    }),
                    body: JSON.stringify(loginObj)}
            )
            
            let user = await response.json();
    
            localStorage.setItem('user', JSON.stringify(user));
            const localstorage_user = JSON.parse(localStorage.getItem('user'));
            const inMemoryToken = localstorage_user.access_token;
    
            asyncLoadPlaylists(user, `${user.username}'s  Library`);
            
        }catch(error){
            console.error(`Error is ${error}`);
        }
    }

    async function asyncCreate() {
        let userInput = document.querySelector("#createUsername").value;
        let passInput = document.querySelector("#createPassword").value;
    
        const url = `http://localhost:8080/users/create`;
    
        let createObj = {
            username: userInput,
            password: passInput
        };
    
        try{
            let response = await fetch(
                url,
                {
                    method: "POST",
                    headers: new Headers({
                        'content-type':'application/json'
                    }),
                    body: JSON.stringify(createObj)}
            )
    
            let user = await response.json();
            
        }catch(error){
            console.error(`Error is ${error}`);
        }
    }

    async function asyncLoadPlaylists(user, libraryName, action){

        const url = `http://localhost:8080/users/user/${user.id}/lists`;

    try{
        let response = await fetch(url, { headers: {"Authorization": `Bearer ${inMemoryToken}`} }) 
        console.log(response);
        console.log(libraryName);
        
        let userLists = await response.json();
        
        let creating = "false";
        asyncLoadLibrary(user, libraryName, userLists, creating, action); 
    }catch(error){
        console.log(`error is ${error}`);
    }
    }

    async function asyncLoadLibrary(user, libraryName, userLists, creating, action){
        const url = `http://localhost:8080/lists/list?name=${libraryName}`;
        try{
            let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
            let library = await response.json();
            asyncLoadPlaylist(user, library, libraryName, userLists, creating, action)
        } catch (error){ 
            console.log(`Error is ${error}`);
        }
        
    }


    async function asyncLoadPlaylist(user, library, playlistName, userLists, creating, action){

        const url = `http://localhost:8080/lists/list?name=${playlistName}`;

        try{
            let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
            let playlist = await response.json();
            let songs = playlist.songs;
            
            songs = songs.sort((a, b) => a.strTrack.localeCompare(b.strTrack));
            console.log(songs);
            if (action == "creating"){
                createNewPlaylist(user, library, songs, userLists);
            }
            if (creating == "false") {
            renderHomePage(user, library, playlistName, songs, userLists);
            } else {
                createNewPlaylist(user, library, songs, userLists);
            }
        } catch (error) {
            console.error(`Error is ${error}`);
        }
    }


    async function asyncCreateNewPlaylist(newName, newSongs, user, library, songs, userLists) {
        const url = 'http://localhost:8080/lists/create';

    let listObj = {
        name: newName
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                }),
                body: JSON.stringify(listObj)
            }
            
        )
        let playlistObj = await response.json();
        for (let i = 0; i < newSongs.length; i++){
            asyncPutSongInPlaylist(playlistObj.id, newSongs[i]);
        }
        asyncMapListtoUser(playlistObj.id, user.id);
    if(response.status == 200){
        //createNewPlaylist(user, library, songs, userLists);
    }
    } catch(error) {
        console.error(`Error is ${error}`);
    }
}

async function asyncPutSongInPlaylist(playlistId, song) {
    console.log(song.strAlbumThumb)
    const url = `http://localhost:8080/lists/${playlistId}/songs/${song.idTrack}?strAlbumThumb=${song.strAlbumThumb}`;
    
    try{
        let response = await fetch(
            url, 
            {
                method: "PUT",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'Content-Type':'application/json'
                })
            }
        )
        let thing = await response.json();
        
    }catch(error)
    {console.log(`error is ${error}`);} 
    asyncPutSongInDatabaseANDLibrary(libraryID, song);
}

async function asyncMapListtoUser(listID, userID) {

    const url = `http://localhost:8080/lists/${listID}/users/${userID}`;

    try{
        let response = await fetch(
            url,  
            {
                method: "PUT",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                })
            }
        )
            let thing = await response.json();
            
        
    } catch(error)
    {console.log(`error is ${error}`);}
}


async function asyncPutSongInDatabaseANDLibrary(libraryID, song){
    console.log(song);
    console.log(song.idTrack);
    console.log(song.strAlbumThumb);
    const url = `http://localhost:8080/songs/song/id/${song.idTrack}`
    
    console.log("Added!");
    try{
    let response = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} });
    
    let newSong = await response.json();
   
   
    }catch (error) {
        console.log(`Error is ${error}`);
    }
    // asyncPutSongInPlaylist(libraryID, newSong);
}

async function asyncSearchByArtist(user, artist, library, userLists){
    const url = `http://localhost:8080/songs/artist?name=${artist}`;
    
    try{
        let result = await fetch(url, { headers: {"Authorization": "Bearer " + inMemoryToken, 'Content-Type': 'application/json'} })
        let songs = await result.json();
        console.log(songs)
        renderStore(user, library, songs, userLists);
    } catch(error){
        console.log(`Error is ${error}`);
    }
    
}

async function asyncUpdatePassword(user, newPass){
    const url = `http://localhost:8080/users/${user.id}?password=${newPass}`;
    console.log(newPass);
    // let newPasswordObj = {
    //     password: newPass
    // };

    try{
        let response = await fetch(
            url,  
            {
                method: "PUT",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                }),
                // body: JSON.stringify(newPasswordObj)
            }
        )
            

    } catch (error) {
        console.log(`Error is ${error}`);
    }
}


function delay(time) {
    return new Promise(resolve => setTimeout(resolve, time));
  }
  
  delay(1000).then(() => console.log('ran after 1 second1 passed'));


async function asyncDeleteUser(user){
    
    const url = `http://localhost:8080/users/delete/${user.id}`

    try{
        let result = await fetch(
            url,
            {
                method: "DELETE",
                headers: new Headers({
					"Authorization": "Bearer " + inMemoryToken,
                    'content-type':'application/json'
                })
            }
        )
        
    }catch(error){
        console.log(`error is ${error}`);
    }
}PK
    r�:UF���?  �?     resources/static/index.jslet banner = document.querySelector("#banner");

window.addEventListener("load", renderLogin)


function derenderPage(){
    document.querySelector("body").innerHTML = "";
}

function renderLogin(){

derenderPage()

document.body.style.width = "100%";
document.body.style.minHeight = "1000px";
document.body.style.margin = "0";
document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";

    //loginContainer Creation
    let loginContainer = document.createElement("div");
    loginContainer.id = "login";
    
    //Black box creation
    let rec = document.createElement("div");
    rec.style.backgroundColor = "black";
    rec.style.width = "200px";
    rec.style.height = "340px";
    loginContainer.appendChild(document.createElement("br"));
    loginContainer.appendChild(document.createElement("br"));
    loginContainer.appendChild(rec);

    rec.appendChild(document.createElement("br"));

    //Top Buttons
    
    let loginButton = document.createElement("input");
    loginButton.type = "button";
    loginButton.value = "Login";
    loginButton.style.color = "cyan";
    loginButton.style.backgroundColor = "black";
    loginButton.style.borderBottomColor = "silver";
    rec.appendChild(loginButton);

    let regButton = document.createElement("input");
    regButton.type = "button";
    regButton.value = "Register";
    regButton.style.color = "cyan";
    regButton.style.backgroundColor = "black";
    regButton.style.borderBottomColor = "cyan";
    regButton.style.marginLeft = "20px";
    regButton.addEventListener("click", renderCreate);
    rec.appendChild(regButton);

    //Fields


    let usernameLabel = document.createElement("p");
    usernameLabel.innerText = "Username";
    rec.appendChild(usernameLabel);
    usernameLabel.style.color = "cyan";

    let usernameInput = document.createElement("input");
    usernameInput.id = "username";
    usernameInput.type = "text";
    usernameInput.placeholder = "username";
    usernameInput.style.backgroundColor = "silver";
    rec.appendChild(usernameInput);
    rec.appendChild(document.createElement("br"));

    
    let passwordLabel = document.createElement("p");
    passwordLabel.innerText = "Password";
    passwordLabel.style.color = "cyan";
    rec.appendChild(passwordLabel);

    let passwordInput = document.createElement("input");
    passwordInput.type = "password";
    passwordInput.id = "password";
    passwordInput.style.backgroundColor = "silver";
    rec.appendChild(passwordInput);
    rec.appendChild(document.createElement("br"));
    rec.appendChild(document.createElement("br"));
    rec.appendChild(document.createElement("br"));

    submitButton = document.createElement("input");
    submitButton.type = "button";
    submitButton.value = "Login";
    submitButton.style.width = "80px";
    submitButton.style.borderRadius = "7px";
    submitButton.addEventListener("click", asyncLogin);

    rec.appendChild(submitButton);
    
    document.querySelector("body").appendChild(loginContainer);
    //Login Container Styling
    document.getElementById("login").style.fontFamily = "Arial";
    document.getElementById("login").style.width = "200px"
    document.getElementById("login").style.marginLeft = "auto";
    document.getElementById("login").style.marginRight = "auto";
    document.getElementById("login").style.textAlign = "center";
}

async function asyncLogin() {
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = "http://localhost:8080/login";

    let loginObj = {
        username: userInput,
        password: passInput
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
                    'content-type':'application/json'
                }),
                body: JSON.stringify(loginObj)}
        )
        let data = await response.json();
        loadPlaylist(data, "list1");
        
    }catch(error){
        console.error(`Error is ${error}`);
    }
}

function renderCreate(){
    derenderPage()
    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";
    document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";
    
        //createContainer Creation
        let createContainer = document.createElement("div");
        createContainer.id = "create";
        
        //Black box creation
        let rec = document.createElement("div");
        rec.style.backgroundColor = "black";
        rec.style.width = "200px";
        rec.style.height = "400px";
        createContainer.appendChild(document.createElement("br"));
        createContainer.appendChild(document.createElement("br"));
        createContainer.appendChild(rec);
    
        rec.appendChild(document.createElement("br"));
    
        //Top Buttons
        
        let loginButton = document.createElement("input");
        loginButton.type = "button";
        loginButton.value = "Login";
        loginButton.style.color = "cyan";
        loginButton.style.backgroundColor = "black";
        loginButton.style.borderBottomColor = "cyan";
        loginButton.addEventListener("click", renderLogin);
        rec.appendChild(loginButton);
    
        let regButton = document.createElement("input");
        regButton.type = "button";
        regButton.value = "Register";
        regButton.style.color = "cyan";
        regButton.style.backgroundColor = "black";
        regButton.style.borderBottomColor = "silver";
        regButton.style.marginLeft = "20px";
        rec.appendChild(regButton);
    
        //Fields
    
        // let emailLabel = document.createElement("p");
        // emailLabel.innerText = "Email";
        // rec.appendChild(emailLabel);
        // emailLabel.style.color = "cyan";

        // let emailInput = document.createElement("input");
        // emailInput.id = "email";
        // emailInput.type = "text";
        // emailInput.placeholder = "email";
        // emailInput.style.backgroundColor = "silver";
        // rec.appendChild(emailInput);
        // rec.appendChild(document.createElement("br"));

        let registerLabel = document.createElement("p");
        registerLabel.innerText = "Please register";
        rec.appendChild(registerLabel);
        registerLabel.style.color = "cyan";
    
        let usernameLabel = document.createElement("p");
        usernameLabel.innerText = "Username";
        rec.appendChild(usernameLabel);
        usernameLabel.style.color = "cyan";
    
        let usernameInput = document.createElement("input");
        usernameInput.id = "username";
        usernameInput.type = "text";
        usernameInput.placeholder = "username";
        usernameInput.style.backgroundColor = "silver";
        rec.appendChild(usernameInput);
        rec.appendChild(document.createElement("br"));
    
        
        let passwordLabel = document.createElement("p");
        passwordLabel.innerText = "Password";
        passwordLabel.style.color = "cyan";
        rec.appendChild(passwordLabel);
    
        let passwordInput = document.createElement("input");
        passwordInput.type = "password";
        passwordInput.id = "password";
        passwordInput.style.backgroundColor = "silver";
        rec.appendChild(passwordInput);
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
    
        let submitButton = document.createElement("input");
        submitButton.type = "button";
        submitButton.value = "Register";
        submitButton.style.width = "80px";
        submitButton.style.borderRadius = "7px";
        submitButton.addEventListener("click", asyncCreate);
    
        rec.appendChild(submitButton);
        
        document.querySelector("body").appendChild(createContainer);
        //Login Container Styling
        document.getElementById("create").style.fontFamily = "Arial";
        document.getElementById("create").style.width = "200px"
        document.getElementById("create").style.marginLeft = "auto";
        document.getElementById("create").style.marginRight = "auto";
        document.getElementById("create").style.textAlign = "center";
}

async function asyncCreate() {
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = `http://localhost:8080/users/create`;

    let createObj = {
        username: userInput,
        password: passInput
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
                    'content-type':'application/json'
                }),
                body: JSON.stringify(createObj)}
        )

        let data = await response.json();
        
    }catch(error){
        console.error(`Error is ${error}`);
    }
}


function renderHomePage(data, playlist, songs){
    derenderPage()

    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";

    let gridContainer = document.createElement("div");
    gridContainer.style.display = "grid";
    gridContainer.style.gridTemplateColumns = "150px auto";
    gridContainer.style.backgroundColor = "";
    gridContainer.style.fontFamily = "Arial";
    gridContainer.appendChild(document.createElement("br"));
    gridContainer.appendChild(document.createElement("br"));

    let rightGrid = document.createElement("div");
    rightGrid.style.gridColumnStart = "2";
    rightGrid.style.gridColumnEnd = "2";
    rightGrid.style.textAlign = "right";
    

    let leftGrid = document.createElement("div");
    leftGrid.style.gridColumnStart = "1";
    leftGrid.style.gridColumnEnd = "1";
    leftGrid.style.textAlign = "center";
    //leftGrid.style.border = "red solid 1px";

    let leftBB = document.createElement("div");
    leftBB.style.backgroundColor = "black";
    leftBB.style.width = "100px";
    leftBB.style.marginLeft = "auto";
    leftBB.style.marginRight = "auto";
    leftBB.style.borderRadius = "15px";
    //leftBB.style.border = "red solid 1px";
    leftBB.appendChild(document.createElement("br"));

    let rightBB = document.createElement("div");
    rightBB.style.backgroundColor = "black";
    rightBB.style.width = "70%";
    rightBB.style.marginLeft = "auto";
    rightBB.style.marginRight = "auto";
    //rightBB.style.border = "red solid 1px";
    rightBB.style.textAlign = "left";
    rightBB.style.borderRadius = "15px";
    

    let storeButton = document.createElement("input");
    storeButton.type = "button";
    storeButton.value = "Store";
    storeButton.style.color = "cyan";
    storeButton.style.backgroundColor = "black";
    storeButton.style.textDecoration = "underline";
    storeButton.addEventListener("click", renderStore);
    leftBB.appendChild(storeButton);
    leftBB.appendChild(document.createElement("br"));
    leftBB.appendChild(document.createElement("br"));

    let libraryButton = document.createElement("input");
    libraryButton.type = "button";
    libraryButton.value = "Library";
    libraryButton.style.color = "cyan";
    libraryButton.style.backgroundColor = "black";
    libraryButton.style.textDecoration = "underline";
    libraryButton.addEventListener("click", function(){loadPlaylist(data,"Library");});
    leftBB.appendChild(libraryButton);
    leftBB.appendChild(document.createElement("br"));
    leftBB.appendChild(document.createElement("br"));


    let playlists = ["ListTest", "list1", "playlist 3", "playlist 4"];
    for(let i = 0; i < playlists.length; i++){
        temp = document.createElement("input");
        temp.type = "button";
        temp.value = `${playlists[i]}`;
        temp.style.color = "cyan";
        temp.style.backgroundColor = "black";
        temp.style.textTransform = "capitalize";
        temp.style.textDecoration = "underline";
        temp.addEventListener("click", function(){loadPlaylist(data, `${playlists[i]}`);});
        
        
        leftBB.appendChild(temp);
        leftBB.appendChild(document.createElement("br"));
        leftBB.appendChild(document.createElement("br"));
    }

    let createPlaylist = document.createElement("input");
    createPlaylist.type = "button";
    createPlaylist.value = "Create New\nPlaylist";
    createPlaylist.style.color = "cyan";
    createPlaylist.style.backgroundColor = "black";
    createPlaylist.style.textDecoration = "underline";
    createPlaylist.style.wordBreak = "break-all";
    createPlaylist.addEventListener("click", createNewPlaylist);
    leftBB.appendChild(createPlaylist);
    leftBB.appendChild(document.createElement("br"));
    leftBB.appendChild(document.createElement("br"));

    let currentPlaylist = document.createElement("h1");
    currentPlaylist.innerText = `${playlist}`;
    currentPlaylist.style.color = "cyan";
    currentPlaylist.style.marginLeft = "10px";
    rightBB.appendChild(currentPlaylist);
    

    console.log(songs);


    for(let i = 0; i < songs.length; i++){
        let temp = document.createElement("input");
        temp.type = "button";
        temp.value = `${songs[i]}`;
        temp.style.color = "cyan";
        temp.style.backgroundColor = "black";
        temp.style.textTransform = "capitalize";
        temp.style.textDecoration = "underline";
        temp.addEventListener("click", loadSong(`${songs[i]}`));
        temp.style.marginLeft = "10px";        
            
        rightBB.appendChild(temp);
        rightBB.appendChild(document.createElement("br"));
        rightBB.appendChild(document.createElement("br"));
    }
    


    let userinfoButton = document.createElement("input");
    userinfoButton.type = "button";
    userinfoButton.value = `${data.username}`;
    userinfoButton.style.textTransform = "capitalize";
    userinfoButton.style.width = "80px";
    userinfoButton.style.height = "30px";
    userinfoButton.style.textAlign = "center";
    userinfoButton.style.backgroundColor = "black";
    userinfoButton.style.color = "white";
    userinfoButton.style.textDecoration = "underline";
    userinfoButton.style.borderColor = "gray";
    userinfoButton.style.borderRadius = "15px";
    userinfoButton.style.marginRight = "100px";
    userinfoButton.onclick = function(){loadUserInfo(data);} 
    


    rightGrid.appendChild(userinfoButton);
    rightGrid.appendChild(rightBB);
    leftGrid.appendChild(leftBB);
    gridContainer.appendChild(leftGrid);
    
    gridContainer.appendChild(rightGrid);
    

   

    document.querySelector("body").appendChild(gridContainer);
}


async function loadPlaylist(data2, playlist){
    
    const url = `http://localhost:8080/lists/list?name=${playlist}`;

    try{
        let response = await fetch(url);

        let data = await response.json();
        let songs = data.songs;
        let songNames = [];
        for(let i = 0; i < songs.length; i++){
            let song = songs[i].strTrack;
            songNames.push(song);
        }
        
        renderHomePage(data2, playlist, songNames)
        
    } catch(error){
        renderHomePage(data2, playlist, [])
        console.error(`Error is ${error}`);
    }
   

    
}

function loadUserInfo(data){
    derenderPage();
    console.log(`${data.id} ${data.username} ${data.password}`);
}

function renderStore(){
    console.log("Need to make store page!");
}

function loadSong(song){
    console.log(song);
}

function createNewPlaylist(){
    console.log("need to implement this too :P")
}PK
    r�:U���R  R     resources/templates/index.html<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music</title>
</head>
<body>
    <div id="banner"></div>
    
    <script src="index.js"></script>
</body>
</html>PK
    L�=U/�z    .   com/revature/P2API/P1ApiApplicationTests.class����   4   (com/revature/P2API/P1ApiApplicationTests  java/lang/Object <init> ()V Code
  	   LineNumberTable LocalVariableTable this *Lcom/revature/P2API/P1ApiApplicationTests; contextLoads RuntimeVisibleAnnotations Lorg/junit/jupiter/api/Test; 
SourceFile P1ApiApplicationTests.java 6Lorg/springframework/boot/test/context/SpringBootTest;                  /     *� �    
                                    +      �    
                                 PK
    �9Un����   �   -   com/revature/P2API/P1ApiApplicationTests.javapackage com.revature.P2API;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class P1ApiApplicationTests {

	@Test
	void contextLoads() {
	}

}
PK
    L�=UP��MU  U  6   com/revature/P2API/controller/TestSongController.class����   4 �  0com/revature/P2API/controller/TestSongController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; sCon .Lcom/revature/P2API/controller/SongController; RuntimeVisibleAnnotations Lorg/mockito/Mock; testRestTemplate ;Lorg/springframework/boot/test/web/client/TestRestTemplate; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
     LineNumberTable LocalVariableTable this 2Lcom/revature/P2API/controller/TestSongController; contextLoads  +com/fasterxml/jackson/databind/ObjectMapper
   result Ljava/lang/Object; getSongByIdIncorrect 
Exceptions ! java/lang/Exception	  #   % 1
 ' ) ( ,com/revature/P2API/controller/SongController * + getSongById &(Ljava/lang/String;)Ljava/lang/Object; - {"track":null}
 / 1 0  org/junit/jupiter/api/Assertions 2 3 assertEquals '(Ljava/lang/Object;Ljava/lang/Object;)V song getSongByIdStatusOK 7 3com/fasterxml/jackson/databind/JsonMappingException 9 2com/fasterxml/jackson/core/JsonProcessingException	  ;   = 6https://www.theaudiodb.com/api/v1/json/2/track.php?h=1 ? java/lang/String
 A C B 9org/springframework/boot/test/web/client/TestRestTemplate D E getForEntity a(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;
 G I H 'org/springframework/http/ResponseEntity J K getStatusCode '()Lorg/springframework/http/HttpStatus;	 M O N #org/springframework/http/HttpStatus P Q OK %Lorg/springframework/http/HttpStatus; response )Lorg/springframework/http/ResponseEntity; LocalVariableTypeTable =Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>; getSongByIdMediaJson
 G X Y Z 
getHeaders (()Lorg/springframework/http/HttpHeaders;
 \ ^ ] $org/springframework/http/HttpHeaders _ ` getContentType &()Lorg/springframework/http/MediaType;	 b d c "org/springframework/http/MediaType e f APPLICATION_JSON $Lorg/springframework/http/MediaType; getSongByIdJsonContent
 G i j k getBody ()Ljava/lang/Object; getSongsByAlbumIdIncorrect n java/io/IOException
 ' p q + getSongsByAlbumId getSongsByAlbumIdStatusOK t 6https://www.theaudiodb.com/api/v1/json/2/track.php?m=1 getSongsByAlbumIdMediaJson getSongsByAlbumIdJsonContent #getMusicVideosByArtistIdJsonContent y 5https://www.theaudiodb.com/api/v1/json/2/mvid.php?i=1
 M { | } resolve ((I)Lorg/springframework/http/HttpStatus; 
SourceFile TestSongController.java !               	     
                     /     *� �                               Q     M� Y� N�           *  + 
 -               	    
                    M     *� "$� &L+,� .�           2 
 4  5             
  4     5        6 8    q     *� :<>� � @L+� F� L� .�           :  ;  :  =  >               R S  T       R U    V        6 8    t     *� :<>� � @L+� W� [� a� .�           C  D  C  F  G               R S  T       R U    g        6 8    p     *� :<>� � @L+� h,� .�           L  M  L  O  P              
 R S  T      
 R U    l        m    M     *� "$� oL+,� .�           U 
 W  X             
  4     r        6 8    q     *� :s>� � @L+� F� L� .�           ]  ^  ]  `  a               R S  T       R U    u        6 8    t     *� :s>� � @L+� W� [� a� .�           f  g  f  i  j               R S  T       R U    v        6 8    p     *� :s>� � @L+� h,� .�           o  p  o  r  s              
 R S  T      
 R U    w        6 8    t     *� :x>� � @L+� F�� z� .�           x  y  x  {  |               R S  T       R U   ~    PK
    3r=U�ъ��  �  5   com/revature/P2API/controller/TestSongController.javapackage com.revature.P2API.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.IOException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestSongController {

	private RestTemplate restTemplate;

	@Mock
	private SongController sCon;

	private TestRestTemplate testRestTemplate;

	private ObjectMapper mapper;
/*
	@BeforeEach
	void setup() {
		this.restTemplate = new RestTemplate();
		this.testRestTemplate = new TestRestTemplate();
		this.sCon = new SongController();

	}
*/
//	@Test
	public void contextLoads() {
		RestTemplate restTemplate;
		Object result = null;
		ObjectMapper mapper = new ObjectMapper();

	}

//	@Test
	void getSongByIdIncorrect() throws Exception {

		Object song = sCon.getSongById("1");

		assertEquals(song, "{\"track\":null}");
	}

//	@Test
	void getSongByIdStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?h=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

//	@Test
	void getSongByIdMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?h=" + "1", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

//	@Test
	void getSongByIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?h=" + "1", String.class);

		assertEquals(response.getBody(), "{\"track\":null}");
	}

//	@Test
	void getSongsByAlbumIdIncorrect() throws IOException {

		Object song = sCon.getSongsByAlbumId("1");

		assertEquals(song, "{\"track\":null}");
	}
//
//	@Test
	void getSongsByAlbumIdStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

//	@Test
	void getSongsByAlbumIdMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + "1", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

//	@Test
	void getSongsByAlbumIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/track.php?m=" + "1", String.class);

		assertEquals(response.getBody(), "{\"track\":null}");
	}
	
//	@Test
	void getMusicVideosByArtistIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/mvid.php?i=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.resolve(500));
	}

}
PK
    L�=U�K��    ;   com/revature/P2API/controller/TestMusicListController.class����   4   5com/revature/P2API/controller/TestMusicListController  java/lang/Object mCon 3Lcom/revature/P2API/controller/MusicListController; <init> ()V Code
      1com/revature/P2API/controller/MusicListController
     �(Lcom/revature/P2API/service/MusicListService;Lcom/revature/P2API/service/SongService;Lcom/revature/P2API/service/UserService;)V	     LineNumberTable LocalVariableTable this 7Lcom/revature/P2API/controller/TestMusicListController; addSongsToList RuntimeVisibleAnnotations Lorg/junit/jupiter/api/Test; 
SourceFile TestMusicListController.java !                	   E     *� 
*� Y� � �             	                            	   +      �                             PK
    +<UAw$�    :   com/revature/P2API/controller/TestMusicListController.javapackage com.revature.P2API.controller;

import org.junit.jupiter.api.Test;

public class TestMusicListController {
	
	
	
	public MusicListController mCon = new MusicListController(null, null, null);
	
	@Test
	void addSongsToList() {
		
	}

}
PK
    L�=Uv�    7   com/revature/P2API/controller/TestAlbumController.class����   4 �  1com/revature/P2API/controller/TestAlbumController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; alCon /Lcom/revature/P2API/controller/AlbumController; RuntimeVisibleAnnotations Lorg/mockito/Mock; testRestTemplate ;Lorg/springframework/boot/test/web/client/TestRestTemplate; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
     LineNumberTable LocalVariableTable this 3Lcom/revature/P2API/controller/TestAlbumController; setup "Lorg/junit/jupiter/api/BeforeEach;  -com/revature/P2API/controller/AlbumController
  	       9org/springframework/boot/test/web/client/TestRestTemplate " Jorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption
  $  % P([Lorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption;)V	  '   contextLoads Lorg/junit/jupiter/api/Test; + +com/fasterxml/jackson/databind/ObjectMapper
 *  result Ljava/lang/Object; getAlbumByIdIncorrect 
Exceptions 2 java/io/IOException 4 1
  6 7 8 getAlbumById &(Ljava/lang/String;)Ljava/lang/Object; : {"album":null}
 < > =  org/junit/jupiter/api/Assertions ? @ assertEquals '(Ljava/lang/Object;Ljava/lang/Object;)V album getAlbumByIdStatusOK D 3com/fasterxml/jackson/databind/JsonMappingException F 2com/fasterxml/jackson/core/JsonProcessingException H 6https://www.theaudiodb.com/api/v1/json/2/album.php?m=1 J java/lang/String
  L M N getForEntity a(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;
 P R Q 'org/springframework/http/ResponseEntity S T getStatusCode '()Lorg/springframework/http/HttpStatus;	 V X W #org/springframework/http/HttpStatus Y Z OK %Lorg/springframework/http/HttpStatus; response )Lorg/springframework/http/ResponseEntity; LocalVariableTypeTable =Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>; getAlbumByIdMediaJson
 P a b c 
getHeaders (()Lorg/springframework/http/HttpHeaders;
 e g f $org/springframework/http/HttpHeaders h i getContentType &()Lorg/springframework/http/MediaType;	 k m l "org/springframework/http/MediaType n o APPLICATION_JSON $Lorg/springframework/http/MediaType; getAlbumByIdJsonContent
 P r s t getBody ()Ljava/lang/Object; getAlbumsByArtistIncorrect
  w x 8 getAlbumsByArtistId getAlbumsByArtistStatusOK { 6https://www.theaudiodb.com/api/v1/json/2/album.php?i=1 getAlbumsByArtistMediaJson getAlbumsByArtistJsonContent 
SourceFile TestAlbumController.java InnerClasses HttpClientOption !               	     
                     /     *� �                             	           M     *� Y� � *� Y� !� #� &�           "  #  $              (   	     )      Q     M� *Y� ,N�           )  * 
 ,               	 - .  
       /   0     1 	     )      M     *� 3� 5L+9� ;�           1 
 3  4             
  A .    B   0     C E 	     )      q     *� &GI� � KL+� O� U� ;�           9  :  9  <  =               [ \  ]       [ ^    _   0     C E 	     )      t     *� &GI� � KL+� `� d� j� ;�           B  C  B  E  F               [ \  ]       [ ^    p   0     C E 	     )      p     *� &GI� � KL+� q9� ;�           K  L  K  N  O              
 [ \  ]      
 [ ^    u   0     1 	     )      M     *� 3� vL+9� ;�           T 
 V  W             
  A .    y   0     C E 	     )      i     *� &zI� � KL+� O� U� ;�           ]  _  `               [ \  ]       [ ^    |   0     C E 	     )      l     *� &zI� � KL+� `� d� j� ;�           f  i  j               [ \  ]       [ ^    }   0     C E 	     )      h     *� &zI� � KL+� q9� ;�           p  s  t              
 [ \  ]      
 [ ^   ~     �   
  !  �@PK
    J;U�_�  �  6   com/revature/P2API/controller/TestAlbumController.javapackage com.revature.P2API.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;


import java.io.IOException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestAlbumController {
	
private RestTemplate restTemplate;
	
	@Mock
	private AlbumController alCon;
	
	private TestRestTemplate testRestTemplate;
	
	private ObjectMapper mapper;
	
	@BeforeEach
	void setup() {
		this.alCon = new AlbumController();
		this.testRestTemplate = new TestRestTemplate();
	}
	
	@Test
	public void contextLoads() {
		RestTemplate restTemplate;
		Object result = null;
		ObjectMapper mapper = new ObjectMapper();
		
	}
	
	@Test
	void getAlbumByIdIncorrect() throws IOException {
		
		Object album = alCon.getAlbumById("1");
		
		assertEquals(album, "{\"album\":null}");
	}
	
	@Test
	void getAlbumByIdStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?m=" + "1", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

	@Test
	void getAlbumByIdMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?m=" + "1", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

	@Test
	void getAlbumByIdJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?m=" + "1", String.class);

		assertEquals(response.getBody(), "{\"album\":null}");
	}
	
	@Test
	void getAlbumsByArtistIncorrect() throws IOException {
		
		Object album = alCon.getAlbumsByArtistId("1");
		
		assertEquals(album, "{\"album\":null}");
	}
	
	@Test
	void getAlbumsByArtistStatusOK() throws JsonMappingException, JsonProcessingException {
		
		
		ResponseEntity<String> response = testRestTemplate.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?i=" + "1", String.class);
		
		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}
	
	@Test
	void getAlbumsByArtistMediaJson() throws JsonMappingException, JsonProcessingException {
		
		
		ResponseEntity<String> response = testRestTemplate.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?i=" + "1", String.class);
		
		
		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}
	
	@Test
	void getAlbumsByArtistJsonContent() throws JsonMappingException, JsonProcessingException {
		
		
		ResponseEntity<String> response = testRestTemplate.getForEntity("https://www.theaudiodb.com/api/v1/json/2/album.php?i=" + "1", String.class);
		
		
		assertEquals(response.getBody(), "{\"album\":null}");
	}

}
PK
    L�=UOl�    8   com/revature/P2API/controller/TestArtistController.class����   4 �  2com/revature/P2API/controller/TestArtistController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; aCon 0Lcom/revature/P2API/controller/ArtistController; RuntimeVisibleAnnotations Lorg/mockito/Mock; testRestTemplate ;Lorg/springframework/boot/test/web/client/TestRestTemplate; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
     LineNumberTable LocalVariableTable this 4Lcom/revature/P2API/controller/TestArtistController; setup "Lorg/junit/jupiter/api/BeforeEach;  +org/springframework/web/client/RestTemplate
  	       9org/springframework/boot/test/web/client/TestRestTemplate " Jorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption
  $  % P([Lorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption;)V	  '   ) .com/revature/P2API/controller/ArtistController
 ( 	  ,   contextLoads Lorg/junit/jupiter/api/Test; 0 +com/fasterxml/jackson/databind/ObjectMapper
 /  result Ljava/lang/Object; getArtistByNameIncorrect 
Exceptions 7 java/io/IOException 9 0
 ( ; < = getArtistByName &(Ljava/lang/String;)Ljava/lang/Object; ? {"artists":null}
 A C B  org/junit/jupiter/api/Assertions D E assertEquals '(Ljava/lang/Object;Ljava/lang/Object;)V artist getArtistByNameStatusOK I 3com/fasterxml/jackson/databind/JsonMappingException K 2com/fasterxml/jackson/core/JsonProcessingException M 7https://www.theaudiodb.com/api/v1/json/2/search.php?s=@ O java/lang/String
  Q R S getForEntity a(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;
 U W V 'org/springframework/http/ResponseEntity X Y getStatusCode '()Lorg/springframework/http/HttpStatus;	 [ ] \ #org/springframework/http/HttpStatus ^ _ OK %Lorg/springframework/http/HttpStatus; response )Lorg/springframework/http/ResponseEntity; LocalVariableTypeTable =Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>; getArtistByNameMediaJson
 U f g h 
getHeaders (()Lorg/springframework/http/HttpHeaders;
 j l k $org/springframework/http/HttpHeaders m n getContentType &()Lorg/springframework/http/MediaType;	 p r q "org/springframework/http/MediaType s t APPLICATION_JSON $Lorg/springframework/http/MediaType; getArtistByNameJsonContent
 U w x y getBody ()Ljava/lang/Object; getArtistByIdIncorrect | 1
 ( ~  = getArtistById 
SourceFile TestArtistController.java InnerClasses HttpClientOption !               	     
                     /     *� �                             	           \     &*� Y� � *� Y� !� #� &*� (Y� *� +�           )  *  + % -        &      -   	     .      Q     M� /Y� 1N�           2  3 
 5               	 2 3  
       4   5     6 	     .      M     *� +8� :L+>� @�           : 
 <  =             
  F 3    G   5     H J 	     .      q     *� &LN� � PL+� T� Z� @�           B  C  B  E  F               ` a  b       ` c    d   5     H J    t     *� &LN� � PL+� e� i� o� @�           K  L  K  N  O               ` a  b       ` c    u   5     H J    p     *� &LN� � PL+� v>� @�           T  U  T  W  X              
 ` a  b      
 ` c    z   5     6 	     .      M     *� +{� }L+>� @�           ] 
 _  `             
  F 3   �    � �   
  !  �@PK
    Sr=U�L�|  |  7   com/revature/P2API/controller/TestArtistController.javapackage com.revature.P2API.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.IOException;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.P2API.models.Artist;

public class TestArtistController {

	private RestTemplate restTemplate;

	@Mock
	private ArtistController aCon;

	private TestRestTemplate testRestTemplate;

	private ObjectMapper mapper;

	@BeforeEach
	void setup() {
		this.restTemplate = new RestTemplate();
		this.testRestTemplate = new TestRestTemplate();
		this.aCon = new ArtistController();

	}

	@Test
	public void contextLoads() {
		RestTemplate restTemplate;
		Object result = null;
		ObjectMapper mapper = new ObjectMapper();

	}

	@Test
	void getArtistByNameIncorrect() throws IOException {

		Object artist = aCon.getArtistByName("0");

		assertEquals(artist, "{\"artists\":null}");
	}

	@Test
	void getArtistByNameStatusOK() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/search.php?s=" + "@", String.class);

		assertEquals(response.getStatusCode(), HttpStatus.OK);
	}

//	@Test
	void getArtistByNameMediaJson() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/search.php?s=" + "@", String.class);

		assertEquals(response.getHeaders().getContentType(), MediaType.APPLICATION_JSON);
	}

//	@Test
	void getArtistByNameJsonContent() throws JsonMappingException, JsonProcessingException {

		ResponseEntity<String> response = testRestTemplate
				.getForEntity("https://www.theaudiodb.com/api/v1/json/2/search.php?s=" + "@", String.class);

		assertEquals(response.getBody(), "{\"artists\":null}");
	}

	@Test
	void getArtistByIdIncorrect() throws IOException {

		Object artist = aCon.getArtistById("1");

		assertEquals(artist, "{\"artists\":null}");
	}

}
PK
    L�=U+^��  �  
   .classpath<?xml version="1.0" encoding="UTF-8"?>
<classpath>
	<classpathentry kind="src" output="target/classes" path="src/main/java">
		<attributes>
			<attribute name="optional" value="true"/>
			<attribute name="maven.pomderived" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry excluding="**" kind="src" output="target/classes" path="src/main/resources">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry kind="src" output="target/test-classes" path="src/test/java">
		<attributes>
			<attribute name="optional" value="true"/>
			<attribute name="maven.pomderived" value="true"/>
			<attribute name="test" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry kind="con" path="org.eclipse.m2e.MAVEN2_CLASSPATH_CONTAINER">
		<attributes>
			<attribute name="maven.pomderived" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry kind="src" path="target/generated-sources/annotations">
		<attributes>
			<attribute name="optional" value="true"/>
			<attribute name="maven.pomderived" value="true"/>
			<attribute name="ignore_optional_problems" value="true"/>
			<attribute name="m2e-apt" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry kind="src" output="target/test-classes" path="target/generated-test-sources/test-annotations">
		<attributes>
			<attribute name="optional" value="true"/>
			<attribute name="maven.pomderived" value="true"/>
			<attribute name="ignore_optional_problems" value="true"/>
			<attribute name="m2e-apt" value="true"/>
			<attribute name="test" value="true"/>
		</attributes>
	</classpathentry>
	<classpathentry kind="output" path="target/classes"/>
</classpath>
PK
    v9UZx�       .factorypath<factorypath>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-starter-web/2.7.3/spring-boot-starter-web-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-starter/2.7.3/spring-boot-starter-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-starter-logging/2.7.3/spring-boot-starter-logging-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/ch/qos/logback/logback-classic/1.2.11/logback-classic-1.2.11.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/ch/qos/logback/logback-core/1.2.11/logback-core-1.2.11.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/apache/logging/log4j/log4j-to-slf4j/2.17.2/log4j-to-slf4j-2.17.2.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/apache/logging/log4j/log4j-api/2.17.2/log4j-api-2.17.2.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/slf4j/jul-to-slf4j/1.7.36/jul-to-slf4j-1.7.36.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/jakarta/annotation/jakarta.annotation-api/1.3.5/jakarta.annotation-api-1.3.5.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/yaml/snakeyaml/1.30/snakeyaml-1.30.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-starter-json/2.7.3/spring-boot-starter-json-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/fasterxml/jackson/core/jackson-databind/2.13.3/jackson-databind-2.13.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/fasterxml/jackson/core/jackson-annotations/2.13.3/jackson-annotations-2.13.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/fasterxml/jackson/core/jackson-core/2.13.3/jackson-core-2.13.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/fasterxml/jackson/datatype/jackson-datatype-jdk8/2.13.3/jackson-datatype-jdk8-2.13.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.13.3/jackson-datatype-jsr310-2.13.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/fasterxml/jackson/module/jackson-module-parameter-names/2.13.3/jackson-module-parameter-names-2.13.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-starter-tomcat/2.7.3/spring-boot-starter-tomcat-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/apache/tomcat/embed/tomcat-embed-core/9.0.65/tomcat-embed-core-9.0.65.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/apache/tomcat/embed/tomcat-embed-el/9.0.65/tomcat-embed-el-9.0.65.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/apache/tomcat/embed/tomcat-embed-websocket/9.0.65/tomcat-embed-websocket-9.0.65.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-web/5.3.22/spring-web-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-webmvc/5.3.22/spring-webmvc-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-expression/5.3.22/spring-expression-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/com/h2database/h2/2.1.214/h2-2.1.214.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/postgresql/postgresql/42.3.6/postgresql-42.3.6.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/checkerframework/checker-qual/3.5.0/checker-qual-3.5.0.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-devtools/2.7.3/spring-boot-devtools-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot/2.7.3/spring-boot-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/boot/spring-boot-autoconfigure/2.7.3/spring-boot-autoconfigure-2.7.3.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-core/5.3.22/spring-core-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-jcl/5.3.22/spring-jcl-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/projectlombok/lombok/1.18.22/lombok-1.18.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/javax/persistence/persistence-api/1.0.2/persistence-api-1.0.2.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/data/spring-data-jpa/2.7.2/spring-data-jpa-2.7.2.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/data/spring-data-commons/2.7.2/spring-data-commons-2.7.2.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-orm/5.3.22/spring-orm-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-jdbc/5.3.22/spring-jdbc-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-context/5.3.22/spring-context-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-aop/5.3.22/spring-aop-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-tx/5.3.22/spring-tx-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/springframework/spring-beans/5.3.22/spring-beans-5.3.22.jar" enabled="true" runInBatchMode="false"/>
    <factorypathentry kind="VARJAR" id="M2_REPO/org/slf4j/slf4j-api/1.7.36/slf4j-api-1.7.36.jar" enabled="true" runInBatchMode="false"/>
</factorypath>
PK
    �9UG���  �  
   .gitignoreHELP.md
target/
!.mvn/wrapper/maven-wrapper.jar
!**/src/main/**/target/
!**/src/test/**/target/

### STS ###
.apt_generated
.classpath
.factorypath
.project
.settings
.springBeans
.sts4-cache

### IntelliJ IDEA ###
.idea
*.iws
*.iml
*.ipr

### NetBeans ###
/nbproject/private/
/nbbuild/
/dist/
/nbdist/
/.nb-gradle/
build/
!**/src/main/**/build/
!**/src/test/**/build/

### VS Code ###
.vscode/
PK
    �9U�� 1g�  g�     .mvn/wrapper/maven-wrapper.jarPK   ��S��>\�   K     META-INF/MANIFEST.MF���
�0�þ@�?�M�BAh���l5�nB�*��i�
Z������79�����H�U�S�'�8�7VSC�ч�(�הB�7b89��d辄��e2��*U�j��4.��B��X�Q�����L�r�}�~?�tJK�ɫ�=�*���Г���	Z8��8`-������c��'PK
    ��S            	   META-INF/PK
    ��S               org/PK
    ��S               org/apache/PK
    ��S               org/apache/maven/PK
    ��S               org/apache/maven/wrapper/PK
    ��S               org/apache/maven/wrapper/cli/PK
    ��S               META-INF/maven/PK
    ��S            (   META-INF/maven/org.apache.maven.wrapper/PK
    ��S            6   META-INF/maven/org.apache.maven.wrapper/maven-wrapper/PK   ��S�G�q        META-INF/DEPENDENCIES��A
1E�=E.����N�u���4	i�����v��!?g:�Lʙn�ڤ�*ph�΂F�PJ#[1�!;����V��~^y����ŃU���_߁�����ʦ��k
vGЅ#| PK   ��S���m  ^,     META-INF/LICENSE�Z[s��~���r�Si��4i牱䆭CiD�n&��%� ���. ���=����dw�VM�5I�ٳ�����E/˝�u�:�^<��?�u�t����B�Mv�������<�h7��W����\�6sc���ʽz���~Z���J��Y]-�7��xws'>��qw}{ws��-~]�SW������	�j.�T�;=�rn��k3�'�	��M#Z%;1�Ie['dW��t���bt�V��Tc�_^>[i7X��{!��pKU��A�U�B��֌۝�N�>hxΔc���X/cO+M�z���w�
P	�� �8�������s+��l��v[z��!S@me#�I�c�$핐%I	Z��Y/��^A�o�i
!�
R����cW��Ҵ��$����a�rxùxg,�я�71ɪ���G3/eFGq�B_�R�W� �Y�*�;�w!#J	N����,`E+;�U�<�׍��+V��N������$ٹe��	�\hЄ��v�GI������%������/i;�a�A���:� �d�A�Fu`�R�+'�3=��6�L\�Z���]�^���&�Q�y|x����[�<�'��$�ְ[	)��GZoU�����kM��[���p4IY�������3�ht�qw�3����r�!8���#A^?P����v��;��Q|�l��p�����cl(?jkZ�����	Q�9|R���o��R�yH\1=��qtLH�^cBR�s� g��'��N����P�n�*-�p��c4��	(��KҘp#-����1b����ZY�<H��M�?å���>�dą�n`x8�[
�dV9X[�BA[/��e��ΰ�Ⓥ�W��#$Sc���
W����h7;� ����$�AP|#:��T�p�~��*܊܅����r��8k� �iՃ&Wb�i|�66|��y6yaX唃H!�K��4��Lou�����NՓ�/ı���0���H��V�R��T��)h:F��j��'2��㤓��N� D��%�"��Ѩ'J�u�����"�����9S6�/�'\��Q6�	�p�H�d�6�
~J�"K�Q���M�m7n ;<x�A�E��z>h#��Z�L���j�De��}���5��i��e�^��f^��˰H5��� 腍l(���uD>��[_`�FW�Ph���d!����R�+��K:"�7@)AZV�"r7���5wTXBJ���	v?V>f+�k�F/2�DAfm�p�rtT�iǖ���ȏ�x�4��`��YC<�Q\��ь����B�M�(P.���#�PD�a�F"��l��"����4���u<v���R�܀���Ѧb�l�PFEHJ���$t���mK��r��7K?����H�p۷���Y��������f&K��TI�H ����� 9�S��� �	���T{�\�3�K��Ǘ�z�'s��pxY[�4�S"��Ts��ᆡۂ�c=��	�%8���+B����@�߀�\j}�E޷�4?b1��ϔs�v�3�J���\�2��`�r�"����K��Y3�]a;�������6u�<��j ~�Q��1<Q���`&�M�>
�ʾo��48�����U+����lv8�"	ɭq���uNZM�Y[@���(j_����`�)_���DVOˎ�q��-��$o���b���n.�5�?�B�
c::e�[VAn%�L ���T�"��ƹ�d0<FiF�O�</E#�n��Q[.`��|�G���QM`ŝo���29����S1LŦ�(ShF}��F#�/y�Uqu�E�X�.�
���ҰO�
���;�O��u+	َQpPn3��gX�i#l6�Q!���7�"O�f.�O Y�Z!2H
�V)�rm艸��z�셼䓎i[���~ܪ�Z9���!��TR}8�$��2��d{��&Qi죰硎���Aw'�=�l{���([�-C����e��U$Xxs��Sw .�8n���Kձ��] ,V
yS��	
�!��?� ��s�����g�A�U�-T<&��3��p�INK��h�%�V��o��ճ��������q {c��=�rg��ٕA��L9�,�+ZO	>���)��Y�"(I��fb<�2�A�ŗ�5s��g�J�2%�S���/I�
�6}ԔA�d�d�IT�gu�>�I��y=@	]'����M�T��ũ�e�zٔ��g�Te
� �Y �V/���s�0#�P���wa�_�f��M�[�8�"5��P����"�:Lf�lȪ�[�w�̤ս��$
��G�g�~
�U��jlm�DL ���;�1��`���D�*虘��8��0O�[�5Q�*��Ұ�	���+s
���UƑ�F�:a�g|흹2b1�]���hS����Y<<ъ�ӹ�J$�ΦyI��۪I��g�D�1�&c�ةu�|K͎�	�^5�@7:�����a�Rc�K��8�8��l�����]%��;r��m���Ӛy�Ejf�"��V���ׯ̀���՗���vK��R͍P��_ad.�1��)X1�D[��(�>C�#S��� ��7Ī��|�t�{���?�3]B΁)wv#���jL_�5�lqnN��}����:��C��C��6ժ�F�o���;�	�tr)~���4jV�Q��+bӁ�ړ�lȦ�7_Δ �ԟ��J;j��Ҷ��]1	���7��yc��`��H�K���a>�]R�uš�q��?��ˉs/q��?[��r=?,��u0�����7������bu��^����Z��X�~_����h�~��K'ф+U6&MDsRp� M.��"{
�`��������z�\��[��z����?]߽��\��|����B���~u���^�������N�~���Y_s����o@�6�t�@73�N�<gMo5�s:pх�P�%���<mt87��v��Δ:���������E�i3˱��9|&�E���.ϗXyПn =X|�аt�N;���,�!tj�h`_��,�mw1����g�������!BG�mq�-����v�|~0zN�e��M�� �V�r;�����J@z9��
�ֳ�gH( �|���g�x!��ƙ��j�w�X�c��[��F��9F���ygf��O.��Z���5���&�~��l�^�9����R7��j$�z���"x�M������+��q��x�e�a��4]����� o��r����\,J�	h�����"�,)>O��������B˝1<�I�䲝f���jExPGʮT|��Ǡ�w���Ւ4c�6Awa6��Boy���̗�Z�<�/���Ac���c'ĭd4�3��Go�tMv9���!���4�(�KL'ݢ$DO��,�L{&]3>c�s��m�h�J�Ю�
`�ՙѹ�-!Q �ъ)�Gk�m��&CW��*Q�ӹ����F:�-�l��>�ƌ6F]8��WWXWϽG�/no��?ߠiZ �z�/���o��>�%���.(�k�iB����B>��F�:�Z��r
$;��o)D��_g�h2��!�����Nz..�L����@��A��.u�Ԧ:�	@��;��vv7������"��zV p6/��i?'(N�r�@�!c嶋hf�q�Zݨ��
ݐM.��r4�F�a���|��_PM<���½kϤ!���o�9�e�/��U�Bz��G�����>H��g��O��*.�������("�#\���<�x��6��1FT�8"u�fC�29م@�C�Ͻr���j}�T�%_�П���3���N�p�K������H��&�������h��ێp@	�,t�o��iI����\��PK   ��S�S ԁ   �      META-INF/NOTICE}�=�@��=�"��kpp���d�9�b�\B����+��ӻ<�p��3>�Tٰ'�������=��kq��g��<��1^é<IbZPM�::�<�k����,����w�]Ou]J���*���W �PK   ��Sޒe�K  �
  3   org/apache/maven/wrapper/BootstrapMainStarter.class�V[w�F�˖��L!`�b��R(!N1��Ћ,ob�,����(-��//}�K�zNyqr�)}�����l�1�S�������������� x?*��%pV�9/+�ἂ1\P0��&�0��"��p)�i!�FqYX_Q0��Q�"#�5!��⺌Weh
z���=���b(D��a^F1
SLo(H��!rʴM�!�L�0H�N�3tdL�OVJy�^��Ib�Э�5ź.����1hǝ���n�V����r�r�����=��ig}���;��Ĕ�@r6sC_�5K�絬���pMb:�9���*ݝ�8��3l"�wJh�ڽ�@yAw����>_�G-��2�^�$��6��׮Lg�T5Ǧ��6ED�W�~��E�������s7|��#˞��[*7����T߈�|v��e�tlOF��1gڅ�^�)�n@fO�%K�ĥ9S�L97nN�� ���g��k�s�>ޮ@i�KE/�xt6�?&Ij�F����7U� ྊ
T�C/e,�xo�x�2�C�6����.[|��p~�q�������*��� �T�t�*��}ܑ�q���y;�{���Zjy��JG�@��Jԑ��R
���H|1��*�S��sژ���_��
w��X6�L�]�|�2�V��%�G�+�o��j�FG��UH؎�����<�ybBN4�pz:a�ui�����؟8��J���n?0���IW��&T���+�;W��(;�T�^{$�ꖙu���n�x�Pu�s?�������6<��w��L�.����M��1�Dgi����u�ɛ��+5�]k�֤����6eg�	�6Z4������n�� � j��cU|>���VD����K-{���P��%�m">ê��-��Ͷ�Z��6�f��K=�m�x��^[���ܤ}�9L킮	S�֋D5��:��'S��Lt&u�^�l�Bʒ�ӭ����
y�0�9.�`l��6W�����wD����C������[�G�H�	�	�hTk�C?=0HV��u��L2�o`&�#�����V�"�]�\Et��(q��Mq)�V�y(�2PE�
:�ƶ�G,7۶���(�u���\(�=[Ŏ�H<�Hυ�i��꽀�����^�r;�~���c4��KH� �.t�� ��Y:Ȃ���A	Gi"_S�%v�_��8Ni0Љ�p��N֓S��n�$IN�z�s�+E��s\���
h>51�`$t\�v�����ѡp���;����?!�vWb����}$r�}�+xz��\��CaAn�`��q�
��'�;X����ҥ����K�i�v�Cvg�s0�PK   ��S�ޗP)  !  2   org/apache/maven/wrapper/DefaultDownloader$1.class�S]OA=Ck�,K�U@�q� ���i����P-1<���5ۙf����A1���Q�;��w�s�9gf�~����U<�pg6������4�ٸ��4�l<���$Zp-x����+J�}��͎�|_H�@�^Oh�$�� �J�@����^�����u߽L��`HUK0�U)j��Я�nH�\E5y��:0�I2i28/���~_P�t	ҹ�;��&5(�*���Q��Q�$ì�U��}�K��]W���j�˒A�S�e3T�@��"ꨖ���,2xU\5��qP�t�`�A�tM�C�h�Q�~��^ު�e�,����,���/�J��ు]�׾���qOU�aW�!��8�M%���@�?ϐp�`dc��˶_?�G�KcF�&�>ü[9�i��5�|�w�8�0�b�������v�$������̏�lּyC�e0'o�b���1�?B�C\s�l�j���NW�Ɓ�3h�O;�'X�)2�_�|�����E��G~
�A�l�d�p�V�7��'p#���MZ����TiHipcz�PK   ��S�FG;/  �  S   org/apache/maven/wrapper/DefaultDownloader$SystemPropertiesProxyAuthenticator.class�S]OA=Ӗn�����  n+v���Ԙ���$(��ih�v�v��N)�W�"D��O�{�w�hM؇�w�=��3sg~����*��Hb�D
3f�3q�	,$���{&�p�D������流Q;��+5�p����M��+�;��QĪU�ms��� S��0��k+�ܔAKH�6y����j_�U�ɐ��}!�o�ռ�����6���{�w�����Yy�S�A��^r�l��t]�Mb��6�s�a��U>�=��B9�A%�E{]Œ>���
Ca�:s+�Ȫx��̜���&1�0{�t���R�BK�����P�Cc���W� �\1PL�Vu���0��БЮ�u�H,�sV���~��eH�a������DIׯ�r�C�F �Y�>#*(7�\�������)3dG��)�{�?��1G9�Eѷ �(i吥b"��r"H�?�
�pC ,\'C�A�Eu.��V�V�2���K0?�MQW������!�l��@���>'hb�5e���&��ĭ��v���kd-���*L�q�PK   ��S��෉  �  0   org/apache/maven/wrapper/DefaultDownloader.class�Y	`�y�����-X�%tZ�^6�ց�HT��i���fv��m�����m�#nk�i��I���	I�`'m��L���ֽ��MB��v�ڕbx3�����{o�������5<k��E���'��!�c��U�����⚁�)����:>���>���y9ܐ�/x_0�E���������~���4��������{~���k ��c:����+�*��������%�:�B*�K%m���������2���4���}������?H��o������c�g�b�_�o:�]�H���/��ᒆo����������[���.�	��*��jj!: jtօ�]��0tQ���b�&��H,d}{��fl�O�Y�]Z8��gm�O%-���AǱ������Y���c�'����}��G��k�\'�[�?a�sv��@]���@���������F�+�IK�)���l���C�E�;m93�	�K93GH,a���,�)'��ݺZf5eτ@�ϝ�����c���l�5�VVݤ������Đ?��;�\o���X�Y�{κh;������+��O��Nڵ�m��nN�΅�LγWOy]�*Y�����V&0��(��_��l���~���`�ǔ�=�J�j�5=��Y��rV���)'�Z_.+`�_J��H��%���o{��f��r.��~չ^�qrsc���!�3�d����L��dJ�����A'��ۚ��j7�4WGs~�r�K����#D�-etV�c'����em���{U�h�D�&"�5�Zv�&��:�keSɕ��S1ƫ��h��y����&ֳG���}p��T��B��T�3�_�m�e�7��y��4v��oڊy�W+L��6�z�B2B�v`�뷼tJr�/�*���p��Y�%
�
u��f"�@�(�K[�=ă��"�wδ��(:
��ϻ�)S�R,������Y�C2L�δĭ��$XjZ^ZF7[ �Z7[J<�%g�,�漤-������B�-�bX��&�V�11��	S&�rxXN����LWF�ܱ&6����z(�񝱜��&6�b��LP�9{~<�?6r|����������c'�����i`[�[E������7\D��i�b'����n���L|�j��N�h��)Z��o^�^E�t)pJ�tI:�Gm�hm�~St�.�Z�&�Mq��!��b��g��2Wk���̬��K@7�qP &�Ƈjd:��8�˦8,�x��������,�6v�̙�1�G�r@��m/f9�����<b˘���P�(S�Ne�S9��;���DR*��~b���D�)⢇�&]/�� 7���\*��?\p�G�Q���x���1q�)�ǉ_R����]�
���}��2���X�"�8!�����(J���[�)0U
p�0�Iq��?3�y��E��2�%ѵPO &���.ͥ��R�t�	˷���M�g��֔���Z/So����l�G`j�.���R)ɨ��O66��go��T6�~,��d\�0#m�0�wb�K��}2C��m���b�wf0p��0�[�hn������ȖB�M;��;��֝�#�WS��Q����b�,���4h���!Bk�#��_�ư���kF)u�$�+�^�E�`��d���,����[��u?X�Ȋ����@�A.9����0����ݯŁ��}���UW���r?�G���7.��˗�����)�5��RQ�Y���3"NiV6��)��E��1��9�=�c�Ժ��m�|�k���,�J\/�[�<u+�i=׻�����!rgfd�C)uEY_�F�5�^�g�4*T�d�͒��7��R�}m�l)�P<��Z��������ή���d�B�'o�M�z;_��1�hF@���Ӯ�rvC�eI�[���lCK�5���u;��SK�Η��T�9�Jf��n�-�Zc�R�E�a��
q=W!ԕ��2`����m��C���v�����on��]�$�,_��\o��Wl�B�*l!��6����Bq���T���/�"������}�Y˵i�/p�"?ұ�mUm�ϡ���9�8���J�Ǎs<@����q�*�B3��J���
R�5٠�
�&W�o���Qr˵u�*�����I��*��je�^�<�`-z�� ؙS�b-�;E��@���ykn`K�^=�������I�X�[�<�b;�J�(7��D�����;�h� B���c�ٶ��E�[���+���0�M�C#��̜U���§����_B\:E��%/��B�@n�c�Hg��P[{4�������"�hM�a��5l��s�[ĖxXĵh(��q]�k�v7��Ǎ�CfT�yl�<XW��l6��=j2��u�c���'��q;��&w8jT���c��/G���h�l��y쾌Sq#Z+�����m?iF����z)��T`]��J@W�h��hX��$W8�6�V�jrU�-����sG��x��V*�.�D��@��E�Gڹ�ga�����q��n<�g��'��x/q��S���x������`�����BS΃���)�eY�ƫc�E���lc�0�G����;�Jd]�e��3�1�.�=�?�`��S��@�)j_{�f~l|�*�5�W�q��H����6�#x��2>����},������[dG��KǷ���V(��?��ru�?�bյ�}��^X��ko���jx���kx��wjx��wkx�����+��&:_� �7`��Y�I���&ۿ����7�|)�I��[	 ��7ݚ��S�:���<�mɏ� >�PId���/�c��%�C��=ڕG��#w^EOGd�5�\��ȁ<�u.��yf�.���&$�dLC���z6�݄���Bh+X+�H��#q�0SH�?�V+D�E�7Q�47�d�g_N�O��k��<���#y����S8���#�{��x����Ho��x�Sp�/�x�5\웬n���1@����+�����KFC�w<t�MF�$�_�	�i��h��b>�h/K``�3l�'��e߅2>O��g�}��(c��~���%��r�����|�҂����Yƺ@{+m<�������&���b�S��M�ҋ'�nG�M�P��������ʮI$(*E�Ƈ��	�dR{ԁ6�������y����s�1��~Y7WXa�WV�<y&r��_��<:�BI����a�dń��ϩ���N|�X1u�B���]\�Z������>��P�4O����G"c�HB>j"g�#�-2Ѩ�tS�:1jOL�Dk��h81�E�Ĥޑ�lwr�1Eg��%w(�����ѯф�3_�z^fl���8Vp,�c��Q��:L�C��XMϨ=�������^V��]��/�-L��Y1Sl�*����
P��*�������(���PK   ��S]St�   �   )   org/apache/maven/wrapper/Downloader.classE�M
�@�_���<�7�q.ݪ ������Δ���ͅ�P�T�B�%/y���`�������U�Z���`�ȋ�s�]/&_����)O�;Bcv8�c�N��7�l.������ͨ�$�����dp`q�V�jd������ؤREb�O8�	�r�wt	�
� �P�c�f���M���oPK   ��SY��  �$  (   org/apache/maven/wrapper/Installer.class�X|T�?'3�{���A �����IDE�� 6	�BD�Ir��L�wfH��ڢ�j���m�Z�JU�N��h��~�]w�Zwk]��v>���<23Iw��~��s�����?z�	"Z�/h���v�n�i�S�w�o
��J������jTG�*��Fnz[�����4G5��>�h�iLtTe-�I�Pة�����H�j�fM������<.�^��.��4iJU�.�Ҕ�<�xV�f����n>��O�w������<_��|����H�T>Y�rQ�BÁ�eS�,.�^��K^��jz[�WKs���*4���L��^�r��+d����Ji|���*����ϒ��5q�F��V�u�+l�N�zx�����7j��d�s��F�s��M0-7��I�8��u�fn�lQ�MTتp�F��M��>��Ks��h�S�)�Bp��)��Ȓ�p��]ܭ��=�l��!��L�����m�[.�khݲ�amۖ�M���n��T�x���:��V�F�@�wS�:3��Cѭ�`�P��I�6BA��ʹ�Ѵz��aW�Q���e��,8lX�uI"�.a��61�;���T>���LJl�_�k�Z>fS��c�\��ɹ��6��!�9��iX[�XS�]��V��qr��D�N-�ALL�uY�?j�"Q��>F���v�	��,4`�VU$|0����)��Br 0�����e��(����}�2�1UJ�I7��1�Y�����n�� ��4����ep�?�K�b���d[�w2M�Y�28+�tc�4v6�B�*��`t�1�u�VPT�Ŧm���׀����Nl�� �$qL�V7b�gfG�P8�����X#���ћ�a{�p�LT�bȨ�N�a>�~�������d��^��[�Ͷb��Ξ�0��ܭ�ސ?���)��qugG�h������-���DD)x)��$P���D���,C�z���G�v2�I��N�_��1,�{��ć�p'�q��b�]F$�6&(8�4}"��i��JڐXsۡ����n�י�����eZM���5�k���~#����;i�+P�Q^�h�7#�~a��6���5�Y@�Db]��Cxs��Շ�X<4}�D�U�7L�Xhw ǜ��q���;m�n��B���u���&���cQ�7���Bi3a�!���2BQk(�!�}P�)S/+�+�j�nC�L���嬌��X��ew*�fM�j�D�0�:\k
_������f��2����ӥ�A�=��r�B����B:G9�T1%64�(�pM~1�޴������-��67*�K��y�^���~I���:��+jt{3�{�Ю�e��a�$<xu�͗��Y�L���|9_�������j��|��_䫡Z&�"l�����%zQ�k�E���_�47i�赏��Dkh�e�^��e:� ������0��k�p#_�/������߰IS(.�<7)�MX������:=@�t����^:�,*~�oAt�Ij�>�)LfZC^�~F?�o�$�ò�H�FM,��~�����X(�7�9�t�$<yQ�do�iD�!3��]�o���иХ���p�eԃD����hp�{j\2.|S�Ř���|�η��:=Bq���L�O�FRzbLo�H�c�b�x��Z�H�Y�;�.����=:� �Q:�jܼ�֩�2�P�H�����M��c���:ߋ؀ÿ��}| Ч����V#
S���_ ����q3'q���`KbM�����4�N��%t~H�ѹ(�($.xX�p$EkeK�e�^:?��ԒHܔ0s�74��؊�a�4��#"�r�v����3�|��`:�%h�#��+���:��z�Cf�;�"Y��,p�bF��pe�|�~T�Q~L���	�$n�����IACҟ�)���?�X�����ɑZ�����r=�y%��'��K⤧��:?���u~��gZ��e/ʝԜ$
�w���lcZ�JV�����񉆨\L��N1S�=���6!��\�q�e�a(þ3&���R7xq��>nIyEn����C�����؇[���UD�d8%��Gq��դ�YrL{�k/5j�PdF��B�M�F��W���0�d�aW�ą:�
�����F9O����3/\��H�3�Է��aR�K�ڜ�JQj*�Z9��b�i���?^3�9�cW�i��G��Xmg�ƢF�则�+(�L�h!f[�(M���D�{⤅h����pNX%�ҏ���9?^��bb5�Bw��҉>�<� I�>��@8C�';����\=��Ĵr�8�~,G��Ɯ�i�H`�aC������P�[�b""u��{���9)����]��� �'���哼;��x[���:���� �^LZ�Y7+#�_��']y�Ǘ�￤�ݍ�kr��������+hF��j����!/�ٙlӥ�-\#��S��@��2���%���$���Zӿ�e,���f�9����)�Τ�4V�A��*K�>{ٓ�ُ�b�t�i�AC#������ܿ3��Fu�2YO��<�wW֓�~���`���k%�]V@�@����b+ͧݴ���K��tFy�9*�g����W����Uu�Ɓoq�q��G(���r�7���D[�v��*��t5f��m�%�����{"(�k�:|!�q��G���l*�?DJ󒧩}I��}�2J��J�cJ�S�!*��Sq�J|N��N�Si�����4�#�AhK��x��]#4�	"f�8�ήqU���y|�)�	u~����	iI21ǧ8j�2�>*�(q�����Ҽ�{���?_D.HI;����㴰=�~V��I	��W�q����l/ow֨�|�����
�V����Q�G;L�L{��3�
<��J��Io	ӓ4ϧ��-���G���#T�><�\���Q4������A���Rڤu��Ҳ��ӝ������z�jFhőJ��8Lg�"#�R�}��[���r�3�Dt8�����]C.:�
��f�:��:�p=z멋(@�I�4DM�M�D�P�F�����~E[�%j��h+�O�G��E�Y��y��r��7P'������w��7R�^�O}|�.F��Ͽ$�_�K���Q���rZJ_F
9!e]�97xͧ��%�S1��W�k�s��}�^��o`��|����p}=�U�m���-���S�6�A�Ū
�ߡ[mi3���v�h?���ə;0s'fj��!u)t�Bw��Rn���'1��н
}���H�W辣�*t�}Z�m-��
�����`"M�7�*"`�V#vΔ\����gM�'j��W��̹��K�\���%��ڋ�������J���j��sm�C���a�r@�)@����W�����A�>�>_
Ujm����X$/e�����O�14��!�
=İ��wa��m0C*ʏ	�s�A�p��^�^r�\_\�)��ͣ��#�q��p�ַv8K׷v���ZGh��Q�|.�+N��y�<�L"��3k���F`US��6�Цj��O�s�g�Oe l���Ӟ�Y�tK2��8�!�_�q���Q��6�ۦ�S�0�Ѐ(Z�:�iur�t�^0Ԏ 7�a~�>$�`6������'_�*B-��*�@M�M̝�9Շ�#�B�0?s�_6%�ʜ���0$�t������v�X��ҋ��?�1�i�a�i��;��U�3"�^�1�\�%xa��+y�r�����xmO~�G>J,^Lǡ�y��z���*C/C����k��;�|�hn����P݊����{��~H�)�������<��^���2:�_@ZI\� _��94�X���r:�S����Q��2^@���OO�`�y����{����f��΄���������6� x�Rǀ�����
�D�����D�&.(�B�*�Z��4�ƓY�H
�y�`���?3꟰!��9�թ�����\45�]�d�uf��U�ye>�_���NFy�W�?D�QW���(-��$���]C�>!8���͆ũ3���qa�Ԯ��T�4[����I���P�+�`���&ǚ9UO���6�T�9ȃ���)��q�J� )H��� � Rt��D�"�E%�
���y[��!n�~a�?E�k��́='ѯm��2i�]a�l���C��oy�{`��q��� ���m�z;�P_"��K�2EF�Fg��'�6��Yr�*�p�8� �_��ye&�Il��iudэPd��6^Ns�c*�._�/�QSp3�xT�e(w��%+&�ʁ,�Գ�r@@�
Ǳr���`��$X9���E�X9(l���x+=EG�?zJ�8tqn�kW p�I~��L��k?7b�y����E�.�M~O��2>�W�r���a�)M�/����{��2�Hg����G�S��˫(�����+�����Q̼ބ�W �MH{���M�W�Loq;������/��H-����u)���ع ��?�?#�bH��	�g
�A����^���7B��p
���Ͽ!�%H_���D�?+��Q�V�/c(2�_V0��6��ݾI(=����傌:�$�U<5�D�r�K͒�Ҷ��W��y�n�W#I87�)�;PK   ��S���  �  %   org/apache/maven/wrapper/Logger.class�SQO�P��6֮tc�
��ئR����3#����k)v���F�)�0A�?�e<��uės��������=����
VL�vJ�A��],긧ᾎ�AВ�*j�0h��7/wZ�l�!���n��!Y��R�{�0�p}�=�v�|�;!�F`s�ͥ��L��n����c������C�[���zBZ��q�\�Q��0��>��}�j����5����%�O�!�
����{�E���uۋW7Z�@�╫��#�e�d"�&��x�e��ǘS����.]����Q��.I������>O�TÊ�gx�P�����v:���Z������őn`�&B�B�.y1;�7�S�G�
�P���$w�c�O���?�b���%�me�o`�W&�)Eg�b�*�2�<U�vD��PLG�(����*����ޢi��#��1���K2b�QJ�V&��l9\��HAͲ,�ΟӮƴ���Ze`	�-c2=&ӱp~�J4IB�����	2_�8��_p��͈��/PK   ��Smo�  ;  /   org/apache/maven/wrapper/MavenWrapperMain.class�Y|[���-���s��v�2���vpl��;�1!	/�D�s�''�Nh��-��Ҕ��Hw����Z��ޥ��] ��{Z��4�
���}�ݷ��}w���g|�V�Ӆf�ra3�.�w�杲y���.���{d�^އ���|P�|ȅ�pF~�WB��.<�+�����.�cJ�G���.,��n|L�C.,�:��
κ��<��jI\��˯O��r�)�V�����q�x\~}N6������_r����S�W]����7�M��o��|W��|߅��~�9�c��'N�T�������r�R�N�R
���_;������J�O��wN�%�'�މ?������?)��=����:�7)��N�C��I'�)��0*�v�?N<%0����@Oow��wO��O��?�Mhސ����`d�I��Ո�L-bh��.��ͷ��߿�@gˀ��@������N���JJ�Ё��N����s�k����wgw�ω�TjQ$kWK'I�)ROK_�`wo�#�u�����^�c�ۃ���C���z@��j��20�w�����`H��-4�E�r�$:̱`L��oDG�ڸӽamB�x�F��q=�픣A{Щ#�#�^`I�����LТ�Z>Ǵ�+)�j-���9��wW0�sv�x���c�"�D�lJ���=Կ v<f���
�dˋ���7C�ܲ�b�1=7������L^i��X@7��JV�kјޗ�|W��X~��3.Y�uj�Y0"\�Ә���BAo��V#�"�r�[SB(qa C�6R��Kn�]!��F43e��� _���M�A����p�+��j&$�V��rq�0�D��U�؜!b޴В�ZD7����to�b��Ko�,}�8L�t�����R�f"��
o�E�D�Q=fģ�%F~],N���6�)M�dglQ�kk��s,v4����-�m��s;��.�>K��@�s�A�Wq�U�q��[�J�ds'X�r]���%��X0�X=I����(�	E��!�Q�
E8U܄��D�T܂W�b�PQ����L`m^`���
I�5y���-2ی����Y�9����L,ؐwa�f���bz�;Uq��!Z�u����B39�A$.dҩ�-�Z���hxvy��Eb�*�������X&�3��Ev>����L��N�P�JU��U�a,��P�Z���뉕�:�yYK�?U\$H���3C�U�AlTD�*�E�"jUQ'�Ѡ
��$��<y(�,��x������`3�R[�Ɏ:����b��Z$b��a�3r�@H��ƹ��#�IZ��I�a��xr�b�g�����+����!=`��q��X��ˤ:��ӷ����kW2I��;֩�X���h�g��&.X�Q�N�j!��Գ����Ƞ���0}\4ׁ��FѤ�����8cUW<�1�S��i��u�d�����@p$�{��sb,�*v�0O��!{Ƣ�QY�Uq��<c*˰u�F<4�	�Ԧ'-n��ye�v7ęYcV=-˹���E4�8�}<!��ކ�T�%��hfm�(��2Ǥ9������k�<�L#%cu�D���VeFF�t̴�*V�$���}�UTU�[�ÖP�7̪�K��]h���î�Z3�]Յ^�hsv0�Է�ZO�u!��+�+�泸�m�#Ts���R�ө)?ӌ���!�,8��+����y���1K����G�{���85��QJ(�n�h�p�~w���[���|��"��
;����,!�YR)OI޶���k�Wg��}P�E�1��MyU��
vS�u�)g�;%���F����2V���N������K��J���!M^�1Nl�0��y���Z�j[N�M�;�f��ĵ��#��A�7��)u��尽�/[�jˇ�,��Yʫ�7��%��ς���.������O$��U�s8��";z�C�N&���u�b�H\�r�oI�ב��-�q;.�c;�αf��P��6��}��ި���z�8d����3/���9��}A��L�@Ȑi]*����q>��l���3c[L�zdk�� �X���9*�NT�s�ߕ�!��ϱ�5��`�8��p�X�x$k<��X�8���b"��^�/�����b	�-���a��00ξG%�"���fL��_;��N6��)5:�Q<4	��L����&��MAm,�,��Bi��PVw?Laacqeq�4�C�(r/�tLb�4�Ma�$*&Q9�e�<�3/E)�&8���5c>�@9�D��E+��Ǚ����^����t��rk�m:b0�;8�]-a����4�1'PH��󡹏\^J��p���x!Cu��^���������q+i�*�4V��t��%������u5	\���G��Lک%t3�=X�k������2�c�L��j�/��X���e��rK��4����&�D��Ռ�46Ș�7N�j
�܄$�&����|K�4�:T1
@T[���TtIM��W�/㗍��D̳B.Eܚђ�[jٔ@-u�zwC�Il��g�[��mIqr�ط�7'�%��	\��%�Q��l�v��R������A�$��;B�PaM�vL⊳I[��D�KU�_�e�*HaҢ����Uьf'�oe��
�樜 �����O�^�_)
{��)�(����=��"A�9�r�{�{g��_�J��6��MbM�����)!�^�:���z��?��D���FGͣXY�(���4܍E��E	\s��T:�t����6��)��J_��+L},{��}s�O���_�?���!P{Hӭ���̈́�~������3If�|��P���	�:�m"�	�f��^�������-�p�㡤;��\�w1_��z�M�[���d�G0�iT(x��{��oRp��Ȧ��Ap�*<G���Ei���NI��_j�f��~3}�7�Żi�O��
��xU��)\�aC��:�5A�¬�p'q��M���~2��bl��}I�jQ��-�ʥ%'Q�D%��ٖ�D�=��N�%} l�l��
�u���۽׮�`HV���5l�j����PK   ��SZ���  ~  >   org/apache/maven/wrapper/PathAssembler$LocalDistribution.class�R]OA=w��B]�]P�/D)��&�4&�1i�D�o�v���6�-�>}�_@bc�?�E�3m�E���:�������� ^by
�_���{h�#�>�����{�C����,~��jX�Q���-�]yA�T3݌EG�[2n���ߴ�t��?����ە�Z"5���*U����A�F��]���5$a��R��׮I�U0�V��Hv�V&&]#�P��~�V�^���|HS����ܲ5���F�;æ��Nم�*k׷Y�>޳�8���t]�p���(�V� K�0�Ǥ�����Uʚ��D���Sm_�sB�bֺ:�L,���G=�FP*��»�m������{.Z_p�g}��>�3�;��3L�!O:b�1fq�g�e>��� �V�zF�a���C֘o�5�D��Ƴ��vt0h�&��v��� vp���VH\y�o�?PK   ��S�E:P  �  ,   org/apache/maven/wrapper/PathAssembler.class�V�W=c�Y'�b;����"K�Ei!���DŲSo�c KcyiF�y�B)4e��ZhY�݅V
5iX��7?Λ�eY��K������w��.3���ox��(V�Í ��)b1Œ�qS[bc�p�bU�������BƦ8��X>.�� �A|R<�� >%�� >���\���|VH���y��� ��b���/��J _�_��B��|C�����%��|G���� �����r ?�����M�)5;�ێ�/�4$(	�ЬѬjۚ-�3yi~|�������+S���3�Ӊ��B��ϪF&>��F悄�QӰ�p��lA�p����c㣳�[�9uM3�lͺb愂gE7��Y�����\��韗�5�T;8��d!��Y��RV��y��ž|�sVtb�L�V&���Ԋw��-5�׬�U�Y���rԷ��Pd/ ��`Fs�rr�,>��3�e=S�Tq�B�="8��Sն$��ӹ���jk�� 8��qOl�L��Y�N�+K������ۓzߑ�)�`e����� �M��z��u�սߚ�l[�hczF�	�<%[K,�ٌ'�S�ii��۰8"Ab�UV�7RZ�L��v]�Ì��n$ռ[Il2�����5m|���M��p��Ȕ� ��:���-chN|n:���9+[)�mϳ0d���h�	t�ӻ?G�M�����`�4q��ShCↂa\Tp�����q�D�u<�`�+�&��Ֆ��(а,�H-����Mk���	���$%��U��/�JH��+���� ,�F�o\��L�);~�im��2����Ҧ�w�=�Fr쬌-��
�������v�J���#z&a8ZF`/	�a���$�p�*�н{:]0=�U=�5�t�0��
�:�����jH�~��P�Ɵ��[
�
^�w���b�V����T����'�PZ�d�M��E:��ַ���a�jX���a�{�)7��}�9MD�k+�p��q��=R�j�E��+\i¹��P�A1�s'����^�м�d�y����p��_��T�H�j�ܲi�%��Np��E]�<���I	��bX�O⾣3 ��7=}�~1?��|Zuh�)�8"�������w�I���>�=�]��u1o]�Z��A�imcjY����$6ۅ����I��+3�rAi7j֮��C𵽭�i;Z�#�e2���>@�q��nG��؈.����r׀��W�������/��ߗ��o�� ��~�k�����%J�����_+x��B7(Dco�a��������NO�lIH� 1N[�MI�'��nEcE4��KFJh���J��mC^�%4o#�PBwJ��\�|\�8XB����C{tC{t]i`����]M]�ڷ*���;��f�z��!�1�e O���*B�⁯�x�yƚ��H�no��1J��a��w��R���h�IJ~j�mX&z�O|�?%��":J�i���������mtmդp��sQE��T�]�+	|�a�E� ^te���9꾍�$�gr`��c�8��#�w�nqb+�����I���]��	r�K{O7���3�����z��.���=��������Q�'�"��
�!<�_�쇴$�5+�WyS_{,t��3�=/�)�k�)"�����r#{��Z��E��Kػ[�֎��dW��T��o���N|���>˛�f7y�O��:s��l�=UDt�{'#����}��,�JU��+��R���>�f뀋�����?�H8�R*�y�fqc�35�"��Ѱ��6���m����D��-z�!&Z㡝�x�n���q���q�U�=V>�L%Q�r���W�"��^�L�f���?PK   ��S��+  |
  6   org/apache/maven/wrapper/SystemPropertiesHandler.class�V�SW�]Hrò�CCi�X5<c��%�EDZcE,�]�5YHv�f#P�ڧ}۷���_��;�F)3�{����a��@^Dk�p��s~�}�$����o v㺂6�sL(�����8���d�T��������gl��S�<+ɋ�L+Pq΋���W��V�D�1!�y�lZJ�
b�%�S0��'�a��Hr\`��n1T��O3�����&�b"���)m&N�����5K�ϫL��S�!ӊ����@B�(����%��
��R�H��Lz�u�:��qa6E�]*e���i��n�ql�>�m=ג��Ս�m	-��+ɴ��Qx9���ňHںi��r^,Ɍi\3�RӍ(�xB�)+g��l��X$��HƠY�tBv���3s"b�|c2�����Y1T�"�()Y��,�dAQ��b�h��m�(퉬((ՋZ��\k__����Y�"�¶�'��ő�i�A氝�Ms\d�
�QC���yxcٷ6�VDd����ꑪ*��)����#Z*F�(ZXd�\��M+iqIū���5i{S��bh�~2m�zB�J�N��Y9p�F,˴Zb�h���,�Z�S�z�b٧�u�!�eo�-����\�{�=�� ��]��
��*>���aQ���DE/>帪�3��_p|��+|��\�����1����6�S�F��5�A-��Z�S1�\Ȏg�F�^��d�8�m�[�����&;K}/8��d]��E�KC"ܑ��"��A�n��9l_�Zmb������f�E��_$DG�Be
���#f"�T�!���Z�aa��,ꟃ�깲7���!�SLKM�EB��(�/�,wz0�Yaq!-��(n~�����:��ƹ����Qk���-km)�JFԎ94F4*S����QI�İ����I��A�U���Et;=�dt�;n���w�8�6�$�f��*t��P����^������ۨud����[+p�3�>E��]�Tѿr�K^|��7�:�uj���&�Z2Q�A}�ml�[��&�2h\FÀ��Z���8$o>b��}��3xl���d�r�}W�p���h���.��J�e�Vb���;��P�$�C	�`�s�ЏTSZ�g�Ht'��G�]�.BH���{������ُA�|A�Lb��p W0��8�k�����gs
;M�lCY��X�h!k�]C3��4�X�B^{���l���>j��|���ŏ�K>�?�� ���P$����j벨�t{�8}���:��ɝ�c��9��8F��K��-��c��ȟ�Gfǜ�8JF�9�пPK   ��S+k%��  x	  3   org/apache/maven/wrapper/WrapperConfiguration.class��]s�F�_�,�e'��$mS��iڤ�S'�!�c������X)H�$�IS/ڙz��E@T'g%�A^.z��ݳ�=��]���� <F#������8^@�c�70�|n_��!�W|�'�u�|Z��J|(˨HHkņ��ڬ�*��~�P�K�߲s�v��V��m��-	s����t���%��|�Q*���/UX炽sjf��~� KH���uav,vJ1��CYO��a���f�Z;ܣ�R��;��C�
s�$ȿ=��|_��a��:�Dv�S�OS/��'�}�N::�@��:uf|8#��HP���V��j���za�^O�Նo�?���8�5-�t>}y����N${��͠R�a������X�R��p��l<(���͇R�u[�o��#
���+J�7"����)�xе�3��w�0gtQ��vKi�-�:�s)���6�W�$,h�B��8�*��as�-��Q�!�2��PWpIXJ�@�"�?����8z��M��ժ��U���`�M���G��s��,(X��>�]����O��-w�U}�z���_7ω[�e�%I_�v,��3*��c����s���ד���T�y,�i5�iZ�Y����{����'y�j�ٕ��vͳI�A���{�� �D���_�r�������%���<��r��%fs��K$�yқ����~B�*���P�y��9�_Gx�M|J��>�}�Ed�,ߛ����oäQ��hD<3�#��)z�G��
)�y��橗�d�3^7~��$��<�D� /H�M ��lR������ *���q�t�5i�'���~�/ �a���1��̆A�HS� ��]u�n�$y#y"I�A~"Ms�J �T���� ߈A�a�3�@V�o� �0HW�$�I�L Y@�<ͳPK   ��SS�n	  �  .   org/apache/maven/wrapper/WrapperExecutor.class�W�g�N���,�i�r��9V�IhiI��M��"Lv'��fg;;�Q�Hkk�zT��K�XkmPH��œj������~����dw�,G��z���<�;���^~�������x8�G�(�{U<FG�PpL��O�c!�_��� >F%c���psp����G���>&�?.�O�'CxJ�O��g���>)�O���!�	1|&�ϊ�sbxN��>/l>/d�F/��(V/�՗BxIx<��������*�f���L�Tq6�[�U���0��0^��!�SP��3����6���ӽ{��kwo_OoG_���H�^}�K��Xܱ���:U�V:��ig���
�Pж!��Ӱpgg��xO_G1e�X��-�Ŋ(�me�1����9�L�z���qv�k�����]Nӊ����n�PO��䜼*�L�H'�!�X����戂X�e���5bc�~#;`�d�c;ܹ]r�l�1�4E��-�n�5�F��hه�6�����UW��q�H䨒��V�A��2�FwnlȰ��q�VBOm�mS�C�瓂E��S�[�YU�����O��v3m:��Q2��[�D\�(TV�#wL��3j�f�W�[�,`_g��*3���mc��e����T0�a�k5m8���Nq�Y+g'
	2MaU��cY�  ��'�Vk�NQ&e��^_>��*`!3͂2��<��L3�c:�MV��o�ZG��ɌdS����S���!1d�f�=����u��J�ex�,ˡ�zf�.b�m��"�n�����V��j�+�?T��e���c
*%�k�p�"�ޅ�`oh���U��׼�s�[Zn+!w���ư�KM���~1��6���m��63�%k��p\&�[��j�E�P�p�5E�yLf��]��k)�Z��͗J{A;/���| 
q��Ҏ9f��MA��Q}Ay�0]�_�"��>iq���z� 뢅Q��3$z���=�.~_A�*[q����а	�5lA���j؍=~��d�W�mz���#�X��x@�O����C�
��	�v���j��� �b���� �J�K4L�n�RI	��F�J�f[c��Ư5� ~#����{�����$g�̔�����FG��B���0�G��4��gx�?j[�C�����4�������*��������V�����3Z��8�^{6c$�a�H֛钁N'H�t�>
��C�J;�A��%:�����;��l,���>]���b�����۝������D��wJ7�Kw��R����d��y3�;�U]�̈�$�%MUgK1�)|1�{&�N3�
����K�ز�M��5�\2�J����E+���i��g�/��aM�=�Y����c�d��)%�o���O��&R���JO&��L�Y�'R��W~�K�&����Ά7��_���c�גae	���E8�z�+��]���X�ݝܕ����|�E�o����ͷ��ݷ_��h�\GD��3[����9k�مm����OA�B�`4R>������h��:.��p��Њ^�\)�U�+a����n��j�N �M�r0��Y����Yh��:'�F�̕Ks�9�`���!�6{���k6.��:N|M]���yr":�ٴ1�6���h�D��gPm>�����Inl:���i�'�`�2�HL����	,q��ܳk�ٵ��u�Y�<��=[�-�g�O��5 !����Q@P���s���
<�G9���a.�Np��n�|�]-��Z����G�������b��a;�wQ��p;q�ϲ �&"pI�A]Ă�A	�		�"W"c��J�Y.�E���ة���T��x�"�����^r@�.'l]�r�k���t�����@�xc�n#ҙ$�3���L۔�~�{N��:���AyKU$(�+�-��ɐ<��r$�<���7�S�yo���q�Z�C)v$K'r�წ�C��U�9��b����q-++ITI�5���M۔�Ʀ	��tw7�G׷��]���Z"q�IR�IKk�6�]8�$�5�HkEsm�dU�Im�9d7�#$��s��jo^K���ɭܯ�:�wc[̊���$�0��^<$c�'_%c3�W¾+_V�dF��oE����`�ʻb�8l���W� �Y�/Ps�K���7�?s�>���@;�������FBލ(����c�|P�?���c޺Y�"�ID�\뭼�FqK�N�5���i��3��g�%�g��"L"GZ�0��K@#8��*�\�i���O��t~Gz�#��W��
�Eq�}����x���B���G��,U����͔
6�3��M�Q�B���S�$��<���Ƌ��K�`�U�7��3(V�⪌���z�aT���Q�� IG���z�@��}���7b�(���/⺼u�
sX�?�PK   ��S���  T  ?   org/apache/maven/wrapper/cli/AbstractCommandLineConverter.class�UmSQ~�,/n�f�����+��Y)��X�8C挌3}�n�,̲h��~�}�������νK�@
~���g�9�s�������� ��W�"��bi��oIx�Ĳ,��A��"����e[n��O�1(�}�a�`��v�Z2�"/U(2U����K<���{`5���S�y��^�G��;�^7ݨX�z��:�p7j�*��E덚}d:��d��w>������ms�b6O���a������n��-J�DW�C��4\*R�S�]E�`u�4L�!s1�.Z;��jq�u�v]ǲ˒���a�]�f7�x�0�k�m�6&5t����6~1U�o���`].�p��ё%㵁_���@��>��3;�Od����=N�l�x�n��6�D���q/�S����>����mu��ts���h�5�0�3�G;�a�b-�,ra��\q$���a����0٫���B\F��f�)7���v������VY��%Ǵ��]�7������eo�ij"���*����,Zo��:Y&���7r|��5 ����5�%�&���:��et��N�;!�#;�c��{�%[P��b���2-��˂��J�@A�ڇ����ߘ �&�eE:Y��u�|��}< o%��6���N���-�N{6����j��J�c��߶�6r/޼�[h�}%�������RB��"y�SB�]fH�%�B�j;,�m%���	-DyB�d�)�hmk��?��^�OEL2E�g�~������?PK   ��SuΧ��    I   org/apache/maven/wrapper/cli/AbstractPropertiesCommandLineConverter.class�VYSG�FZ�Ҳ�Xl���%@F��6`��#��v���"�]ewő;?#U~�k�"����s�O��ճ:@G��"UM����|�MO����?���$��=�%�"Λ�FB�,�xw�-�xGB �$�����x��Xj��X��#?K�����+��!o�r'��U.U)C۸n��-o��A�2S��L�6�Ϯj�Ce5C�P�T�̢b�_R
κn3�$L+Sr���ŲʖfĶ-%�Ӭ���c���c)��`��rt͞2�Y�H�E�Lc���5�Lke��������HbC�Rb�Hǒ��i2��3��E�h)��c�j�%��4��tޢ �D^� �Ų	%'�-�~3\>�l�k�`4?��m7���a;���`����gb�J�,I=m(��h��x=���[�ET��°p?nX�X�j �C��LJ����v�L^���Y�m�����X$�>��z<R��w<�k�tW'�n���W[d�X�Q�M����Fg�P��Z1
i�g���&ᴚ��n~uCSR/���������JH��1�R�<H)i�-U����l�Lq_2N����֯�7pV�9��.c �����8�G���㽯��Y�ɭI~$�e�##�-J�ؑ��;th&d|�O �S|&�s|��/eDq�2����&��P�n��=t��a�I�8�8�����f8���0t��KT�q}�� 7�p����� U��H�v���l:�?Sw�}�:/��GZ�G���Al��.��n�B�Q�a�땜뮚P�E~��sڎ㾂ѻ�p;�n����5�p����2˓��H}Ik���<?;�Ë�>vFz���N��`�"Q��b$�F�7��;����m������ �q^�\y�$�sI6p��4G�^�}?���(��\H�|���f���/���@�Ez�Fh�~�<�"8]�VD�~Eh��]'Y�l�5�|�a���G��C��&��Q�K>�\N�AZ�����h#�2���^���cs�����5f裓�<7�^!�U@�/�{�`���=����78I=o�W��^!��.��}��\t� R;BQ_#<��̿�IL`��o��G�E<L�>���U���
;+4ԍn�ɇ7+�r�i��;�EL����[�7��NC�]@�,�2�5M�ީ˗�k�m�/]���TigF�Y����`�z
x�e�RD��<%HӘq�� PK   ��S%��S  g  ?   org/apache/maven/wrapper/cli/CommandLineArgumentException.class���N1Ƨ��UDQL<�A�`��������ƃ�ei���v��_����2NA�ă=L;_g~�5}�x}�K8,A�M8p��B��s-�H�j���22�~��:gC��sOH��E#�l�R����!���K��NDB��)P3�iĦ\ҙfq�5�CA{*����������q*��p#�$,�3~y"�Z���2�h53n���ϲI��J}�i��	����(Cv\������<f2_]B��Cf倘y]̺��pwZ�9�{���d�V6aO�E�[��@��aX;K�=������s���cӉ�5e+����Sv��=�]�PK   ��S�$5H  �  7   org/apache/maven/wrapper/cli/CommandLineConverter.class���JA�Ϙ�i��?��^�$�+BXA �x?��mdwvG�ٺ�z�haYr�uof�|��w8�}}|@N8r�����b�R���6g4d"��
%��62ŧ�}��޿��(��'*S3��m�N��)�E�v��`�Ym����u���f�k�wW��2�,a�+҈�Q�7ɒ%�CN����G�>��j}���ݗs�k�ӕTt^x`~_�L`��muv:���P]kv�x&}|�v;��z� ��Xth�#m$P�mH�&/�V��J�]&@� ��T$�E�*�WQ����[6�R�(U�lY�m��X�]��A�ܗ�}80��PK   ��S����G    4   org/apache/maven/wrapper/cli/CommandLineOption.class�V[se~�I�i�=K(��4i	�A��Sr�Hm-'�$�B�7*�����N��B[�q/��O8��p��6�4GG��~�}��{��}�f�����g!l�C�l���� g��0�ǲ|\Vq%�����|���!�U�t9K�YFβ�!��DNn�0��-�U�V�1,����~GOV��L	gBAO�ș�S���]�o'�˂n�)�6���Qfh�����,�/1iC]�TA/�2ؼ7���(gl�%� �
� T��3V���YFdE�]�/��Ff���\(�&�p�*��C<�[O������R�a��J1-��Nr�2zaQ���6�����m��e�zI��E���f򮭗J�Nf
Fr�JWbϻ�M�1Qm<���lǼC�{S���=���T��Ed��� �$��p��l�!6�b�=�{���z���o0륫��A�M/���l0�Ƥ�*E�T^��#�c�����Z�#��z�lQ�(ts�I'+F!+�	�T&RRCb�H'
�n�R_l��R{5Kh�Tu!��; Hg�K�͝HY;#N�K�I�$U���������y�U�6�����C��0��t�e�J��s*�Â7+VqW�=ܧ�u��L�=��١Dva����9���!�������a/b4ɕ��ϽOq\���km����-�a##��fm���n:��vkqM��hl�a��)A�m�:k �XtŜ��S��;4Z�JI��Ǔ���~�5V�' %K����'�2� ̜�w��U�-6�o�AǪna'd��-���l�;�G��֯�v�{�q��S���E��W��?�c�'P��е����?�{��S�
fǞ"���rң����?�?��.,=~�����c���P��j�I,�q�G|��\��}\����|�p����m���4�5�՝��|#�^P�O�!�U�	�I����6�x��\��n��;7`�-��<䲨�w{gWA&�7�w�� ��#c��H�ň��ȯ	� 3ֱ��B�m0�vǉq�-�1�SZ��6�9�F�Bȓ^�1F˃�xb�-�gҌ���z�b���'Oט�g�S�g�h�9��W�a�c�9b�U��B���U.%"�;q'������c�ܐUl�T}.�#��.�8�h���m?�Fp�ԯ��X��$z��Ҍ�b7���I�� �O�nUSi��C*��ʊ�i_����Y9�C�vy�;�s�)�T�����1��ok"��,׵s�C<趶�︄<_��� �%dD���:��F�^q���H���y�A�xo���<zjܿ�M-`��:jjͻ�m�i6��m�?�F��PK   ��S�l��     6   org/apache/maven/wrapper/cli/CommandLineParser$1.class��M��@�_�'
f�z�N;xQP<A�)bB�;t�s�Yx�9���ҕU�{||���+�9F	��t��^˪2B�.\Ӱ-֕�� >����j�Beˍ���H�fΗ�[�GQ_Ī_�m+^iS���7a�c����$��]���j�'B��4����t�"~=�c�0�9��F�@6�PK   ��Sd0��_  �  I   org/apache/maven/wrapper/cli/CommandLineParser$AfterFirstSubCommand.class�V[OA��T�

����ԻU�T.J�(J�㰬e��6�E�#���x��5^H�o&�&c<�[���,B��\���9��|���3�Ӹ���zz4"� ��!��Y�s�%��K)�+
B��@AG����֙5J�C"k�yU�6����n���(u[�
�����9�5L}\�%�N��e�4�^�ݯ��]��
�T�$C0c����0�0?�۷�t�(�YK�Iar_&eb��w�4�3�0]6��n���)�RI'���GײJ	i�%�Z��,vZ�#l'Wt�����=��t��l{vN�jA�yu±3���t�ͪ�ET#�,q�u:˕�+�Εi�'OC&O>�{�������������m����z�dH�� LX���c[�d�e��hƮ0"h�c��ø��n5f���i-�k����Xa�A��+��F�qֺ#���:�P�r+C��a�!�p�?{/������ٯ�����M��o��h:O��\h�^*E/$�Ƥ}_�{��8H�XE ���C[%(��t���[I�I@��oւ�m�J�� Mm�ؔmֻŠ�相q��[��Υ�{�Q��5���E"�iU��|@��Ӿ��p,��X��=j^�>�$�=��!��Dk%�c��0�h�țg���9{��;?bG _P;�����Sq����{�/-C��r�M�;����ܹ�,Ci��34��ha/e��pb���p�8���\��U��N ��d���u`��8�6;��+�p��wj�)���_qŉ��∻5��Nt�5�vm��Gs?�m���^���HPA�4�#�$.@~���L�ͽ�_�$2� �4���PK   ��S�r��  0  A   org/apache/maven/wrapper/cli/CommandLineParser$AfterOptions.class�VmOA~�Zz�ZhQA|GE��r�*�QQ�IE��~[ڳ��{��x�/?�o$����Q���YNZ4'!�����<���������+�	L�q�@C�$���㒁X:Fu�1��n��E)��a4�ʲ�k��l[U�jkM�Z͖V��X\����v�C�#�&��P���C|�-qF�W�K�|̗*d9�w��R��Qz`�{�N�!}��g�G5�q�Ra��
��mRo�=�P~Jr0�Fe��Ւ��q�5��C�|�[.�֢'Q�~�㲬RmYd�rEB�8COCn�ҢG-�An���&�SnPM���][�|�U�=̫c����Q)��n��G�@}=��XtWdѾ�^�k�Qo&��j��F'�s�����]mڡ�%�8��JWq�af-�0����pk��H�LԽa��G��#Ѣ޵;��ܼ��e�dH�/��{�xe���+`�>I���%����h�����9�4�S&ۂf�> �I��n���t�M�-2d�k�#���/)XF�!��S4+/-���� �cCkbhd9�c��X��"��ψ?͙�Svl� ��4\��� PI�I�H>�S���fC��>"an�j�}C�}�j4��rV~:��K>�?a��6wd�:�a������)�,������i� ��I������|4��L��y@d��+`�"�_PK   ��S�/2#  �  J   org/apache/maven/wrapper/cli/CommandLineParser$BeforeFirstSubCommand.class�W�SU���¥��hQ���I �($���6%h�j�_�e�Mv3����E�������:T?ޜ�������	-K�_��{���ι�c����+�I�)���!���`��3
2x-�s���y��mQ��;p��u��UЉ+K
�X�x��M�vwͬ�RY�)%����Ɋvǰ��V�NR/��y�RѬլi˚S3�4�͘���0��A?��cZm8��� �۫�AXZ��V,%��u�|]sL��eaCϜq�v�Eө���b]&�zɲg���j�-4`��X�IX�a}�S��d购��9n�ꚶ�q��˟��i�%�k��[�-Y֬R2�:�UJ7SF��դ��4�$��$�"���ɝ��ߠen����`l��jpj��q����%���W��"�C�4��y����^�KwS�3.>��0(y{��)RER�6�[Uq}*zq��Ԧ㶄��T��Ǌ�x�a,�M�x�1\��u۲7��rl�-'pR ����n�)�W�]���X<QW0P���2��)10t�64��I�\񖡻E:V�~����{��zCh��p�I���`}8��c���ƹǭ[T �&K�@��0�U������F�6x&EE`6p��q��f9I%O��]��%�e8�h���6�v�L	<���pP+ﺣ�[��)����v����35BJ��F�jaэ�{x����8K���nO��A���¦��7�C?�,�f!H�_��YZ]�u�F5�R,��D�;ZKx�����m�c��'x�h��G��'��fԅ���"Nץ����hlA.�lmK� �G{�'p	��cZ����O>�-�[P
qZ�cį��Bg!zX�G
���}D6����qb�O~���=�(�88����~�~�9N�/�`_";�2�ڃ��l��!l1���0VC�d��{F1FO��g��7�)���ȉ�uss�+��=������COq�g�V�	�QO1�˞������O�^�q���M���D��,^O��4!DE: ^Oo�����3��ާ�Y�PK   ��Sv��`  C  T   org/apache/maven/wrapper/cli/CommandLineParser$CaseInsensitiveStringComparator.class�S[kA�fs�6nlL/j��K���n[����@����O��tj2f7�w_����K�g��gv�JMU>�3g�s�s������ �����&̒�]�ܳ�l�%U+�M�d�Ő*���u_0L5�ۃ^[�]��R���=���Z�}L��2`X��@4T T Cy,Z���S�{}�y�k�����.A	;M_w\��ޡp{�X(�����Юו.e���7=�p�����E;jj��<����r�qcdm4RnP������t#����s_00�ɷB�x���g؞����F#再�K��^3�z�ư1~.�dKvF��?u:e�����[T*���O�{n�n�$9�ႃU���2~/�`36H���{�p��1̜7�ڸJ2L'�k�ot����a���fn��)�au<2�ͦWK5��aEi���%��f*�`}$�B�֬	Z�q�|'`
E�̈�$kB���+'Hm-|@fah������R� �7�Zo������GU+qfR�x������L�E=8���Tg>��;VxB���Gt�"��T�"�B�	�ÿ���
 �"��Z��|�b�i���"��p3�����������.�<�xa�'PK   ��S�	4��  ?  K   org/apache/maven/wrapper/cli/CommandLineParser$KnownOptionParserState.class�X[Xw�Ͱ0�0I�&�@5[R`�,�6݆��pIK$ҪͰ;�I��uf�x)����5V�U���K���%{�m��}>��/�>������.��͂�����o��������z�e {�'�(���с3��!�+�<�<X<�yx��%8a�22n�L��|.��|�2>���A	����N<"���|\�'�I>��0>�+���g�9>/�Q�~��� c%|QF=Ra<��/���0f������I>�U��k�.�)��v�vm���MZZ�B�>��힔�8�#��~��ii-1��&�)݌M�Z:�۱Dʈ�X�����7L��f;�]���Ae�<m����@w+K�o���\Ɔ�:����E�|��yA@W��Zv�5��2l���3ڔ˸F*�o8.���flS�j�˟�4s<X(���	ék+�F�>|��07.JC��7�l�h�F j걒��>2�����X�V"�VBK�h���`1��>nZӦ��
9Z�:�^�ev��I�t�hX��sͰ��Y�\�&:�8;����ofD5��Ϲ���x�5�<���4g�%��z�����,���M�~(�������$<-������� �D�w۽�ϵ���C{y��a������V�N�w�o�kδ��*�GA/S�
ض�9�m[;�铷����*շ(�܆�
�p��w�p�z5�9h﹄���`�%E��_���=N���tG5-Wu�����j.�Z�,����=Az~�ce���9<O��T�ɴ{>M��5m[SFRO�X�����V	?P�C\Rp
'%\V�#�(�1F$� �H���C��;$� �pU��s���z4W�ż�+
�E<O���'xI�ˌU| �r�	y�:���u��R�+�)[�g��
0�U��ᗸ��W����O���nS89��
^��<�F�Μ8�Q�z��d���B�~��~����������?��++�`�����$;��?	�\Oj�"���\��\��j+6	�Wla�!/��'5�e
T���W' *�JoU�j��S�9�Nx���~��iYK&W�Ή���Z\	"�R}�N���|���G2�^NPE���$`�hˮ�ևM��H�S���FE��u��
@�ߍ��i��'�r��P �b���Ů�Q.s���=�X�44���R���\.^�a#r�+.�B�H���#�4����Ƶ��`%�K=a�=dTR��f�^�Yy9�C�}��Ѣ����a�NG����_O|ɤ�j)؉_�R\u��A�t>�Z�,���*d�4�R�6��4Ù�����-s�
jT��@"��.��R#�}���'A�a�E�TVrs���ע�c4{%�4G�� F�y�D�G�ʢ�s��-sGkBs(��Ъ|���G�.HD�B	Q�����b{�r4�2�3�(e�8���XoѣX��b�C�ڗ�v�
t|�����hO��E(��M���y�$���+�2��W��ؚێ��&��i�D�"F�/���lq$q+i�7�Ո�5�k�T���/�	�M��Ct��]D�d��iZ軇䅳��EK^@��YlZĎQ6��K+��̆UT�7B�<���(|�wVPi��@Z}�P8��\�2^���F7��}�!�-����,ꗩ����!�y~�����ko@��#N��Ι`W�݅AY�*`�y�`�UD�(�U�4�ԒEݳ����f�Ut%^�͋�'m�4fenY4E�}���m�籫�%�,�.�t��ql!S��kt���'�o���L�]�(�1+ށ'�CxF<������{�W�(�.��X%^�q�E��.�F`�8�0�{w�N.�&�K��M�Kx�?Q{��JP@�7 �&�$�,���R�)��py%��?<���sy�Tp?��Q��S�!�`,1	/ĘJB����q��\���v��� �/g�O'�Â*��A��!��7B� PK   ��ST����  �  J   org/apache/maven/wrapper/cli/CommandLineParser$MissingOptionArgState.class���O�Pǿw��*�?AD��DԨ�0Ɖ$L|���Q��.m��|�D!��g���O>�_a<�-s�^*�I{ν�~�϶��|�`�:R��H��&���a\Sk#J2�Mb�A��e�$�����"w\�,y��#)�3S�+\�e۩���+k¬�!�M�7�1+5˜��u.W˖e� r�|޶���e���_fH�ثk�2\X���_����]�e�XJޚE��<�\ג� yߩ��G��-������A��{�3W~�7�Y�j.y�ο`�s���=���i�=��6�6У�SƖ��u��3��2��t���-[L��*�%�_N�:��LJT¨?[�W%ue�`З�u�"�-5y�lFTt!�nt3p}&q��Y�3p�IL1��`2L������ed�����y)��_ݟ�FM���9��_�����H4�{��/5���$i����n���g��v+�#�Ej��A�q:��+t�'h�70�I��K
��:��:B�Bq�7M�F�`�[8Z���4���Ð��S�,�C|��mho��~�������qJ�I��|�!�N`Z�)��~�ϖ�Mh�� .��I_Q�����q�)����a�˂�p)�̒e<(��־`>�d�Z�!��J��+~FW��9�D��S��P��z���%\ }P���PK   ��SoTy�  �  K   org/apache/maven/wrapper/cli/CommandLineParser$OptionAwareParserState.class�U[OA��-�v�؊P/xA-
-����B�+��4���v-��n3��!>�|�AQ#�?�e<�,X�,���9��|s���_��0��$RU���]W�3�byL(��B����"���i7R��ns�Q�l��XqDS�n��z�����!x�c
�hY�
��X�Qf�{k��+���;gٖw����x�!��4�i�X��x��-�T��j\XR�1y0�쳎g9��A��=�k�m�-�&�=
y����T�L����$	oۇah��s����^��e7��/�\4%�}F������; �=�W��/�~����_=��Ԫ���d�jf�LJ
��h8�[�qB�m+���.f�5���BHj�/=S,Y����z`f<H-sS���a����^Q">`X<�v`�=�oQ�a&�h��aIX�N�L��5j�h,����V��G���ǌZ��麹�"]8ӡ/92���Us�z���:�<ŰQ�zI4zc"�3
d2rjIE��} �H��G��L��	�g��Ol"�9�Œ�5��5���!�e�F1�����!�s�gI�^�|�+bw��d�{p�8q���3\�H���>߫���(A��ʾ#��-(�R�b��������~�O+s��yH�nO��n�R��2�DF�(�B.W}�9��5O4R�(��E��\�ɧ��I�H�:EIf�Z$� PK   ��SŃF��  `  E   org/apache/maven/wrapper/cli/CommandLineParser$OptionComparator.class�T[OA�f�eKi�\������rG(r�ѤISLjH�m(��d��l�ȋ��!��Fó?�x���J��ڴ=�˜��|���+�䢈c2�^�׃)�Q�У�Ŝ�yQD����e龢ቆUk]�e��Tz�A�����F��D�Q��+�g���`����CʾRu�:Cb������5�p�vby�N���� ���Tt^���W������Մ��MC��*��eїܩg�j�,�VnJT���v:/O6�:O��&?�04�2x�fT5d���!?�ɭ�^rêd=�$S-Ɲ�CQv��t^�,]���,�r���,�|�X��Q��ې��N�a�?��tdT(Z�NY�0$��ۚ���bH�/�u<�@�}�O��Њ���Ym\�f[�&�_�!C1`9^y�.���G�����x�0�g3��+�F6���2o��� @�&(� �z%���K�[�Un6����C���&��%��c�J:�;C:�n�����_�vM:O�q�izZ��V�H��O�N�O�A�D����J����<�Q&���da��S��C}�����h�L�jM=GD���#�)�'��z"���H*�U��~U��Ɲf'˸K���=�Ql�v�85�M�=�[!�E|r�=��"v�#ƽb	����U������.;c�����&M�&ч4�825J<}�d0Cr��"F PK   ��S��+��  !  F   org/apache/maven/wrapper/cli/CommandLineParser$OptionParserState.class�S]O�@=�[�PVX�O����tQ71�l�d	�͖I�N��,�|2���_�?�t7!_*�ùs{�9��??~x�����`-�:��Nie����1��秒�8PZ�4Gb�rgy��"=F�����3U�
�r}(L)��
ˏZ_�������L�8�M�B�g2�ą��W#�B�(NU�ϳL�S�:Qټ!�#,�Kc���`� ���\��[u��[��f�q&�%v��BD��I4�F�wK��D�Ϣ����O*[�,Rie���ݺ6/zn���]������|lb�I�}���� Z�A3���mw�о��`t.c����GKح�ф�z#�:�=>�Մ� !�U�H�3���}���lE�&��׭	!� >�,U�����^��o;惩�Fo*N��L�z�G���������O1�Xdl3�w���_PK   ��S��ں    A   org/apache/maven/wrapper/cli/CommandLineParser$OptionString.class�T�NQ=�lY�R��(
"H��l(*ȇ��A�b��e�)��n���>�O�_HM| �8�nA��aC�Ν�;sf��������),���Jb\E9a��Pa����BAN�I!�����(x��^�!�����Q�N�X<�)�2����vR�l���2�q���Cl�-Y]+�c��V�,�-ߪX��k���laם�`���5Y0�!��X�r���E��W\�l�7�-���,����Z���b�n�ʝ�(��{�卜E�q�e+xj��
��ʫT�j&�l�����_�lN�C�D���
1l��v[��E>�(
1�0�:
C7M��G��{��oM)R��]ϴ��by�"E��4��-Ĭ�.�h�|��0��}���ڕ��i�ǂ�A0���P��0{�AR���m�Xfp�uUh�pz�2bs�p/����6CO�G$���$���\u>�������I�>D�{"�����q��=�dm���K?FT?DL������<bl�lI��^��i��u@j���(!��V/�K�ӿ#����+~B�<FB���gtA������s���=�	,�L�����>n�_Ad���[t1xڀA���G��O��^�A��H)1��z�Ս	d}<w��������!��(����$Dh#E4��]�5tF�^�l�\g�:���Y���Dh��q*�~��_PK   ��SK�+ة  �  K   org/apache/maven/wrapper/cli/CommandLineParser$OptionStringComparator.class�TMOA~f��º��P-�"�ٖ/cJ��QӤ�I�ކ2i��fw��/*�n^z��&F��&c|g[Q,j�x�y?�y����/����e��֡�ECRÌ�r��aNn�45d4d"+�m���dj�A�;ۂa�h�b�Y��C�U#�P�)��&w-iw��_�<��F÷�他]�;�w��F�����q���Wt܊��\f��
�|��FC�f�f�Y���,����p'Oϛc�ʁE-L'�;|��5nW�62��I(�	�e�,]���y�ī:�O8���A�h���'�y�3���[;���=��
^J�:z6'�Cy�a��=���dUl�7%G+��[5�'�+ݼ�R*��4ݲ�kɱ�]��d�Q��ߢ�%��;�sOlO؞�[���&��!�OA�!��w���;��M$��iL2dz=3�j5aW�j�����z�:��@�"���L��dx��;R��N�9b�m �b�$�Dv�?#D~`-}��z M}5�:����&�����+�ľT�V[�>bG�	iQ�PPx�~LP^`@y���
S�>��kd�7XP���E;I�<.M��"i
5��Q\��	L�2i*i��q�}��ګ[�q�:��$|�dt&�	�,}��k���h����':In�T:���	�����qWi?�k~�9�s$G�ߏ�H��XM�B��PK   ��S4�  2  @   org/apache/maven/wrapper/cli/CommandLineParser$ParserState.class�SMo�@}�8qpR�Z�|�RJ�и�8@*�T��5�=p@�$��U��6n��ąH��(Ĭ����%Ԓ=��o޼�]��������Hc�EkY�w��:(2;�򣗄T�r@�wî$,6|%������D{��R#���оY��v��G�ܾ�#�[��8���Ի1I��i��牡����c��OZ�R{����A T��KX�'��B ��%�t�F~�K�ơ8�@��׊��z��B��@RB���)a!Tl*�b��?�Ȍ��67U��B��������C5y��6	���>��+b}�&<�?���#ݑo|sw��05�w�|�[���j�Pt�Ex�����h�}(;��E��=��I���"b�Sj��٫�Sg`��x�%������c��o������v�Y�1Q�mBR�,�PWK�ﰿ��y�,'��&���*�	�p=&���n����k~�+�8��ʂ��=N|���5�ܜГ>Փ�܍�Vc�=\f���l`�v9c���2�B�/PK   ��S*q���  g  M   org/apache/maven/wrapper/cli/CommandLineParser$UnknownOptionParserState.class�V[OQ�ζۖ��@�*��Ka��\D	�BB�%���MYm�6�-����A"���?�8g�)��`��̜93�\O�?~~�`�5Đ�І�6�F$1%�c�1�T�Ԋ�=+���U�V,wM*�%!,w��+��0����yn�2K|����e�5sE�\tJ%.�˶�j(�`�!����67�\�5ϵE���c_��?��Q�� 2gۛg��>��*�E�̬3��<��)MV��M�}�7�������:wmy�ao˦�����#^�=���a�Մ΂�Fu,��,��j�M%�� �#���V�]oA�i>��ش5GYm2���x�B�u�h�%�f���w�U�1k��QI�$�d�a�u(jǚSus�3[nW�͈썎n�H2��	]H��Сc �Q��ã(�E=�G���E�&]Mt3��ִ�`����<��
2��|����u^�ҹ��+�+�tp�� m��!)GNRR.��i�G��ŤS�Na�;�b dd6���х��T�@U�BS6Щ�C����Ψ�W _��/ɐ�/�dB���kA�,qi��?��D�F�>�^�p��?�4O�8D��	�B��Zw�A��9OW�r.�Ω�A�"����|@�<��	c�����!���cDM�(��!�D�&ҍ� k�:H�E�����j�����Գ��N���}���g)��!\��#ц�N|�4qB����$.S��%XB��$��_PK   ��S�W*\  *  4   org/apache/maven/wrapper/cli/CommandLineParser.class�Y{`Tՙ�}������@�A�ȣ$!!�K�"J��$�00��3�wi�ok}���b�U+*	1��n���v�[��nw���>v���"���sg&3�A�9��9��^��~�;'o{�U s��j���?��C.�G8l�M�1�G3a��q"��<C���W|&��0Q$~C
L��Y(�b���Q���Q��Rbb��6d��3��/c��q��(&�e�_�P#U3I�����R��r�!SLTᨒ<Րi&jp�/���Ϩf�ZQ��
ŠR񝩚*C�M,�Y��2�D��mb��)��2ϐ�&�+�s�2d�!�X�(d�!�L�V����/u�K��R�,S�,WM�)+�A�V��ɹ~Ym�y��F�>�/(���Q�n2d��+��b�'��ʄ+d�!��Y�p��V٠z��e��KO_jJ�\f��kM8�DBv,��c�uŃ�ps<w4D:���D�B0���9k�1'ƃۜl"A��:}ݕ���[Ñ�awr��9��w��/8��g�9���6c1�vg�z���o�;Qw4f�-�G�Fc���V��i���`��)u��iM9�~�u2�	
3��J��`T��bgjd�{�]��j��ł��`G؎wG�os�l��3d�;j\��F�5v�ݶ٩鴷9��Q��ˉִ��5	��Î��⥔Pl�B���N{�L����x�^p����:m��3e�]�I0R��6F�&���T�D�ҕ���r�_]0�/�W\"�4D�e:�j��lu�+B�Zi�C��Ѡ����7���S����LyJ˄�JzQ���ۥ�V�_>���,XKkOO~�m�?�F�sՎ6'��:�<�j�R֟�pK��Y��a�mڐ�"O�ng1L�0@#ɘV;��4	
��l��$4ɷ�1��dLve�r�-�e���$��n��g=63wv%#2�N�HM�j#Ȭm+SW/��Z�!�xfi���Y�F LLsBX"$c�����S~�����R�!fw��t�.���-͊d`ߘH�݉&��e`���Q��MZ�$MQ��`L�ouv2q�١�G�P�R'�*��oi&�N��JP�;�b!��L�v<5�s�ä�a9��	������L� ��e��d�s����ȹ�>[��8]����!�%�!,��lHP�H[X���D�D���4��P�i�"svL��QQ�X�Z����7=Kms�ns�I�0���M��~�"h��Q�6�ʁ���a]�2x�7���v)�S4�tN�\��영=�r��͉Ŧ͟=[0�|�0Q�r"o��A>����R%.R?��j�>]�C��ݒ�l�tG�X	*�;��,���m��­�m���e�K�-��佮;����8v�+�^���;���S�]<�=ώm�ɬr�hHؒ�tYx �f�p"��Τ���*�b�a������hV���f�v���ϒ�r�%�����qk��rC��ڒ�&��0UH/����՗_��ʙ��"7X�y�e�䋖|I�KfbvɬJKn�����!w2����jG���rV%S?�8H����HԒ����"C0Ԯ@Ch��r�%_�{-��r�}�ے��K�;-yH��G���C{wq�q�wD��*��a�U{T���k���H҆ā�괧"��m��NK���%��c���F��4�aa����yUe~���	�W K�*�,��<f��-�!�-y2�M꠴�G��gzlz8#:ݣo�u�<%OS�t���dT����K�Q;76��`ȳ��9�����p�a�XZww�I]	X��.(�1=6�,+�CD���e�,��N�,�ŷԆ=o��2�v8�����e���6׆�#m.M,nG�eۃ��e3�g�Ɔ��c���(ײ����>�4�%'}SX=L�'zl~��~�,��W��C�	<N>����^�f��0FO�>6�� ��eѩ�Α�%�H��h:����Q@g���92���<w��N���pX<x��*)�W�,Pd1�c���b��z����W�/�8Q!8A�t��	�3��2�uw�W���^%C��Lm��G$7_�ʛ�X��#���X�z��ǘ�\���N{g�z��Ɠ'biy���2��rM��e$���I\����5W��ݧ�5�H���59� #T����9�y���	oS#��v�7���~��z�1��vgǺM�V��F����f�k5^����O�Ia[$������gk�T�t��S]g��+LyNCFv8q�w�Ƙnur��BN�#�Y;�Q	7E�ɭ.ҔI3V)��7�1�.�#^��X�ԇB��@L�f�^Y�3��}[�'�ڕN�-L>Mv�G��9R�������٩�~��d��\�U�C���{���S�%�Õ�]wo�w��w���9	|��5M̕������mN�^Y.T�b`%^9K�̈�	��gS���A�Q�$�PL�v'�:��[�J���B x����|����E��6����o���E�՝��G��wo�w��x�FU���|}0��?������������Y.9��W�U��K�������>���҇�g�j�ه!�|KH�c[On�q.��Ǻ<�U�6�O	7��� �\��4UA��CًQϧ���zW��*H�*�C�����+���x��i�;�e!�xP�2��ʗ�ߏAF�aL� J[*��c�f�c�;O�ӏ�=���	��ꀷg�gޒ����E8�E-���#�r��g��R�$�ҋ������Hp	�k�Yoђ^|f�ϥ,%�Ek� y��k˹h5U�EgiZ�7AJ��/E7�T�E)�g�z/
Pō�����֧���1+���x��vx+���ДF����Ԑ�쒳{1G���\��Z��{1oJ���T����M���e�a!��/e׌Z3���`i�X�o�U =�_��2꒗�nb��O��"2�����slvu/V=�#D�ӫ�a��a���Tt2`#8��b�`��3۱;p#�[p-��:���؏�G�p��3�L��������q����2w�$^m�p�T�^9�I3���l��҅G�z<&��qyO����ē�m<%��i������������c�1���G�U<�bj�ãx�������{��xj̠f�;K]\:�Ҧ��SbX��qE�jճ~�-H�*�|�tup��i��侏���e<ɞWeV2�{=̾��[|O1O��/�4��\|&	2��Y���H��a��ox���#�o���y3�A9{G�����P��Xzy��pV�a��M�x%_b� z�5�#
5�J�Ax*��ž�R��Ұ�Ha߭�Y�a��d�FN}8��?Ho�X�ಖ���@T�B�X҇�M�)D�ǲ<l�rv}���+G�z���i8j���lV*6��Fcs��$��drs�p�
\.Q���*�x����?WV�c��`���ġ�ǟ�K�?�(�*�Ul_G��FI#<���ُ�|E?;�WA�:e��Χ�Ikw��%�3J�*���ޞ�?WK.��+��"�~4��Z�U%{^��i<��{��-�J�s)M)%L��\��� o�$8���QՋ����Z���-�͏�OP��1?���A�&4l��x ����S����O��7~�_�w��=�ߋ���K� ��GY�?I>�|$��܍��=���ɛ���.��`%}�ħ�2�����+L�_a���$|Gӭ'�~��G9���R�"�}�k�ɔf�5|��\ ��u|�a��L�9�0S`<��&�L����u5���&o2�]	?���oS<~Do*8؍��Q������h�-">�`�0�c���&:�%��8��p5x���N�f-��H��0��>\��a�W�b���D]��>~���+=Kg~��Ƶ���*�`��D�P띴U<�?��JBW�^�Ҟ�o3~���h�����M��2
UR��2��e,#~V�x��ʿU,��a|y�^����R�|��{��+o���XΨ۝�����U�Q�w9C;�N����0R�
m?cH���q�'��l�zui�O�g�>4W�z��zu��M������%R��|�}pX�(xٔ��Ȟ������ ZT	؇͍UҘ�M�I��N�G��T%q�]}��yv*��tL�X�#m��ĥ�Jj�Efc���<1���lگ����sCU�{S��^f�*7�`�Ρ<��)����	Y�cp��=�R����E~���'K�j/��<�dչ���/�����Lࡋ��܋�'��S����}��r
���.%��P\���x�_D�!��s�@�r���z�,�ގba��J^�:1�d�6��D]�^�o���7Ε��n�D� �9��d�d�W��|)���{=�7x�X�q�o���]$^����� PK   ��SQ�0E    4   org/apache/maven/wrapper/cli/ParsedCommandLine.class�W�wW�F�G�'v�$j����Ŗe�*�)��:uҸqj;%.6n)0�&�F��8Ж�����i�7S�rHB�a���OPNN��ތd���G�̻ﾻ~��;����_ ��(�(�(E@���T����gT�QD�M��mX�9�8�bIŅ(:P���k��QU�l���|A�Q�}1�mxQ�KQt���b�R_�+B�U��Z^GUl����|-���z��[B�*����*;�U�]�vl��'g⬾�g��Y�L��!��f��;U�P0�x:�nz)�qMXv>���삑)�F)s���e��df�1ݮ�cV���rf�8%���O{�6*F�qY��P��"�9>�!�c�v�Z�9ںFm¬K�ױ60�2l�LgD��5�a��c�wFA蘕3D��f�Z�7��ř�؄��3�m���lu�!��S�V�� (�sx2r˳p�[��9f�C5�|SS�j���/�FP��5`�|�o7tqe[�=�4�Sf�����o��`��"7�H\}ıjm�=��{��T-�-�NZ&�"�_E~�-ϲ�q�U�\ut5)����a�0+c�]����&�S�)7
��oߨ[�J�tw$�%z�F���RM�+���Y����ю���0�B}&����|6h��>��d'�R�lgv����	�������� �-z.'-�腪����{�J��|do�6Etڪ�Yc� �$�/"�0���U$N�������Z�Џ��m����/	 5|�q h�..r*hx�h�������V0���5� ?T�#������~��*������t��u&xʧ�ϲ|5Lᔆ���|Ym0�	��2�C��	Ljx�~�wU�J�xRïqI��5c��������;ݜ=*=���$r�f����|~��xW���ԇ����y՘�V%ӱ�V0)ǱYg�Z�&(�#���:��PInǷ���O�j}�t6�t?H�40��P:���p��x3�7��3�]�i��>}򃍬�K̥���k�c�L"Y����~�O��~�����~J~i�7�9�sD��s��B��S6Ώ� b�� �] �g����r������ >J�~@����Rנ�n 0w�+��l��d�d�D���M�d�:4�(�-
�����������輎���pWؓKJ
nlI������ulbvy�_�+����1>���g��}��?�]��G��	����3����e6�e6a��� �B��0�aZ8��A�0C���C��Fq�x#�qu9�:Nz?B+�*�bL�#*���U��8����_"�b�(u80�$�8M��Z"�#�g��)f�^��s!AF�G�,uE��2�����ws=\�(�E#̽)�ϵE���.B�k24�^�`H�)��t���M�ݳ��]r�
��G�W����=�ס?��dGeI"�&6�0Fl!N'��I�&��$��1J�%5�O����Oc��G��8>��W�R3�;����Y�X�DB�'���8�9
q{p���ڙ껊�gք#��:�Q)0C�fe�qW�_'�c��|
Oy(��5ĵ���YS�j��m*��{�Х�/������Y�9�q�����5��S�ŀ�Cq�� z�i|��� �7��ݫe��(�ؾҢ�+�/� ;&����?;���'J�����,��8&3uX�U���R=��]��q�쬀-�&z�<�2e�����_-���VK<�ws2�<�������j�s�	`��u��"K��5ת��Ո���a�g��]���Dդ��J������
�Wٚ�I?)�B��9pI�1��V	P�ܧ���� PK   ��S�.c}�  a  :   org/apache/maven/wrapper/cli/ParsedCommandLineOption.class�S�NQ]���2@.^@(�eT�� �����I��I;8�if�(|
�&����J�D}�����P�����g���Z����� 0��I���1�D�:p3I�-�qhI�p;�;�ǔ��ë9/�{2�˘��fF�;҅-�ʹ��ZAw�9	��^1�۰��і����`fE+��nV��Hl^7uwAB8;�.!�l��pGA7��Fm�ۯئA�`����l]�`ĭ��$_����T�Z�msS{g�z��Z�е��vxy٪՘Y�kuW�L*�pw]ȑН?OPB[�e���Y=��8>Ae��#���^ <���%�ҨqӕГ=�%�����_��U�
��7�E�a��S]���@��@RЃ^	]�l�l���
:�*�	��UW�W�A��|�}�{X��f�w2��f�Ԃ3w2�U��Fd<P0�y	}A:1������g:��tҭJ<¢�%Ah��}sms����������軾��4R�EcV�/���S�Z�|]�ug�Vww0D�+M���'<���v!t#Jkj ��(��0��t� R�����"��˾L�x�@?"�Z)~>�����ǵ k7���!���#�6T� �/�"AB?��q8|�T����ɰW��8Ð1J�Ǩn�~������ �#u
5��S�C��Ȋ
��!1/�5�Dߚ!�c$�"B�"@&���VS������xb5����Ⳁ���.ar�#Y��D��q����$5�PzQ�d="�PK   ��Sz���  5  H   org/apache/maven/wrapper/cli/ProjectPropertiesCommandLineConverter.class���N�@��pQ�qQ7�ЅK/�B\%��ʱi;�0`x+]���|(�)Tc�Q�8����9����� �^RP��V�3����4��N�'�9�x��c�h�2ȷ�������r�miq�Ǖ֡��C1f�jKe����M�O�3��}T�����-MB�8nJ��� أ)�)��Nl��n|-�ǠT��G|�M�{���Jx6E�ߢ-�\88`��ml)v�v�DYx%���4[#� i�0`9A�I}�]�Fh:�ٸ���C4���� Fvèw�Y�;sgS�L�ڠ&����?6�菵�u�H�M	����TWhe�2�d�	�#�� K557˰J5�����uȇp=�����j|A��F_F#�B�XF�"P�����;PK   ��S��n�  &  G   org/apache/maven/wrapper/cli/SystemPropertiesCommandLineConverter.class���N�@��p��"����1`�]�p�%!�^��˘��Lo�+>�e�Bc6��Y�3����93��Ϸw 8��䠦��[l�a'u�3�3yA �h�	d:|����f�P�Ӂ����m���`�:3r�B�Ǥ�Ghzt���$h�0m���i(ѻ\	�a��G�atD��%�8%PqPƦ�m �	�M�N��R�1{R0�Q��/k%e.	�%셶`q�B�����,���֌���A#@���j�"p�C��=�����.G�_��������4�=��ꎱih�����/���RP[.���U_# �=U\Q+Se�r��ȋ����bn&֡�binPyu��A9�[1����P���F���"z��V��"z���o=sm|PK   ��Sr���  �  =   META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.xml�WMs�6��Wl5=$3")ٙNƥ�Q><UjKS��#DBl` В���$%R�j_l,v߾]`���&K�J����A(�D�xrٻ�_��{F����5�(W4-@�(�s�P,��H
W��1��	ތë��K*Ap�	�@H$��lQh4��; ��4�\+ ������O_`�R��L��0���������D?$��	JR`���H�i����V�d�A�9��b9F��«��*�ڀ��V�F�� }��μ�A�ӫ>���j�fd\h(����h��%R��Q��h��}�<��&&6�&�v��������k�X����_g�_������T玧T)��{�$���ɑHDH/%k0z�z�"c�Dmy�wT]�f5�
լ0�& 5"��C��=�8'a�'��fws��ގ��ɗf��i6�<�OfS\]�x���}2����`�ɥ��юƍn���v0�P9�ؒE�O
�PH697ݐS�1eʧ�[��Ϙ�-��N>�㺦�s)h�OW��J�<Q�T��ٍ���Sd��vhS���ŝC����7f�e\i��K�e��"��^̶�:٨�4���7®	2Ӵ����-�� �zs=�m$R�$��:Do-����Q��lI"���B�sK��� �;�kht��zi��{*�	�m��IFG7�%��Y��TE��F�.b�1RA�>��i�3��(�����P���0�Q��9�� e`<���I�)����G��J��i[ey(8�5h+U!eo���{g-��w��i�p{�wI�?�s����"iݜ�Y�\�$ݡw��\3=2-NR�0n���G����GgI���kl��lϼ_^�+;�k�z<�Mw�̄�YxXS�R�T�J)�G��2OIT?<�E�lf,��������=O�]��V������|l��s��J�<��4o5;/q�=�3�gbf?��B�B��^c���]�;g�q���<*|8���~�j�/HZ?�:{"�Ki3�1��6�!
�L�n�]*{[��<d���Pc��1�MstB4L�x5���6�E��z��i������@�f�=#y"p ȳ���yD��̬ʅ�nzF����c����ܴ��ţʯ�����z6�Y|�NIU�VYk/��Y���G���Œ%�$]V�U)�D2y��.м���k�X#~��Tܼ��m/���/��Z�c�X�q`ġ9�GHu0��n�����{�E��Q��%a�H��b�<�ʳ0g��.�����CR�Tyڪ����1>r�PK   ��S��><@   H   D   META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.propertiesK,*�LKL.�L��M,K��-/J,(H-�J/�/- ����%$&g������g�����p PK   ��S��>\�   K             ��    META-INF/MANIFEST.MFPK
    ��S            	          �A�   META-INF/PK
    ��S                      �A�   org/PK
    ��S                      �A!  org/apache/PK
    ��S                      �AJ  org/apache/maven/PK
    ��S                      �Ay  org/apache/maven/wrapper/PK
    ��S                      �A�  org/apache/maven/wrapper/cli/PK
    ��S                      �A�  META-INF/maven/PK
    ��S            (          �A  META-INF/maven/org.apache.maven.wrapper/PK
    ��S            6          �A^  META-INF/maven/org.apache.maven.wrapper/maven-wrapper/PK   ��S�G�q                ���  META-INF/DEPENDENCIESPK   ��S���m  ^,             ��V  META-INF/LICENSEPK   ��S�S ԁ   �              ���  META-INF/NOTICEPK   ��Sޒe�K  �
  3           ���  org/apache/maven/wrapper/BootstrapMainStarter.classPK   ��S�ޗP)  !  2           ��;  org/apache/maven/wrapper/DefaultDownloader$1.classPK   ��S�FG;/  �  S           ���  org/apache/maven/wrapper/DefaultDownloader$SystemPropertiesProxyAuthenticator.classPK   ��S��෉  �  0           ��T  org/apache/maven/wrapper/DefaultDownloader.classPK   ��S]St�   �   )           ��+,  org/apache/maven/wrapper/Downloader.classPK   ��SY��  �$  (           ��"-  org/apache/maven/wrapper/Installer.classPK   ��S���  �  %           ��u?  org/apache/maven/wrapper/Logger.classPK   ��Smo�  ;  /           ���A  org/apache/maven/wrapper/MavenWrapperMain.classPK   ��SZ���  ~  >           ��N  org/apache/maven/wrapper/PathAssembler$LocalDistribution.classPK   ��S�E:P  �  ,           ��5P  org/apache/maven/wrapper/PathAssembler.classPK   ��S��+  |
  6           ���W  org/apache/maven/wrapper/SystemPropertiesHandler.classPK   ��S+k%��  x	  3           ��N]  org/apache/maven/wrapper/WrapperConfiguration.classPK   ��SS�n	  �  .           ��Ha  org/apache/maven/wrapper/WrapperExecutor.classPK   ��S���  T  ?           ��k  org/apache/maven/wrapper/cli/AbstractCommandLineConverter.classPK   ��SuΧ��    I           ��Vn  org/apache/maven/wrapper/cli/AbstractPropertiesCommandLineConverter.classPK   ��S%��S  g  ?           ��~s  org/apache/maven/wrapper/cli/CommandLineArgumentException.classPK   ��S�$5H  �  7           ��.u  org/apache/maven/wrapper/cli/CommandLineConverter.classPK   ��S����G    4           ���v  org/apache/maven/wrapper/cli/CommandLineOption.classPK   ��S�l��     6           ��d|  org/apache/maven/wrapper/cli/CommandLineParser$1.classPK   ��Sd0��_  �  I           ��j}  org/apache/maven/wrapper/cli/CommandLineParser$AfterFirstSubCommand.classPK   ��S�r��  0  A           ��0�  org/apache/maven/wrapper/cli/CommandLineParser$AfterOptions.classPK   ��S�/2#  �  J           ��A�  org/apache/maven/wrapper/cli/CommandLineParser$BeforeFirstSubCommand.classPK   ��Sv��`  C  T           ��̈  org/apache/maven/wrapper/cli/CommandLineParser$CaseInsensitiveStringComparator.classPK   ��S�	4��  ?  K           ����  org/apache/maven/wrapper/cli/CommandLineParser$KnownOptionParserState.classPK   ��ST����  �  J           ��ɓ  org/apache/maven/wrapper/cli/CommandLineParser$MissingOptionArgState.classPK   ��SoTy�  �  K           ���  org/apache/maven/wrapper/cli/CommandLineParser$OptionAwareParserState.classPK   ��SŃF��  `  E           ���  org/apache/maven/wrapper/cli/CommandLineParser$OptionComparator.classPK   ��S��+��  !  F           ��:�  org/apache/maven/wrapper/cli/CommandLineParser$OptionParserState.classPK   ��S��ں    A           ��Q�  org/apache/maven/wrapper/cli/CommandLineParser$OptionString.classPK   ��SK�+ة  �  K           ��j�  org/apache/maven/wrapper/cli/CommandLineParser$OptionStringComparator.classPK   ��S4�  2  @           ��|�  org/apache/maven/wrapper/cli/CommandLineParser$ParserState.classPK   ��S*q���  g  M           ���  org/apache/maven/wrapper/cli/CommandLineParser$UnknownOptionParserState.classPK   ��S�W*\  *  4           ��:�  org/apache/maven/wrapper/cli/CommandLineParser.classPK   ��SQ�0E    4           ���  org/apache/maven/wrapper/cli/ParsedCommandLine.classPK   ��S�.c}�  a  :           ���  org/apache/maven/wrapper/cli/ParsedCommandLineOption.classPK   ��Sz���  5  H           ����  org/apache/maven/wrapper/cli/ProjectPropertiesCommandLineConverter.classPK   ��S��n�  &  G           ����  org/apache/maven/wrapper/cli/SystemPropertiesCommandLineConverter.classPK   ��Sr���  �  =           ����  META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.xmlPK   ��S��><@   H   D           ����  META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.propertiesPK    4 4 �  ��    PK
    �9UnM���   �   %   .mvn/wrapper/maven-wrapper.propertiesdistributionUrl=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.8.6/apache-maven-3.8.6-bin.zip
wrapperUrl=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar
PK
    L�=U�V�  �     .project<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
	<name>p2_API</name>
	<comment></comment>
	<projects>
	</projects>
	<buildSpec>
		<buildCommand>
			<name>org.eclipse.wst.common.project.facet.core.builder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>org.eclipse.jdt.core.javabuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>org.springframework.ide.eclipse.boot.validation.springbootbuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>org.eclipse.wst.validation.validationbuilder</name>
			<arguments>
			</arguments>
		</buildCommand>
		<buildCommand>
			<name>org.eclipse.m2e.core.maven2Builder</name>
			<arguments>
			</arguments>
		</buildCommand>
	</buildSpec>
	<natures>
		<nature>org.eclipse.jem.workbench.JavaEMFNature</nature>
		<nature>org.eclipse.wst.common.modulecore.ModuleCoreNature</nature>
		<nature>org.eclipse.jdt.core.javanature</nature>
		<nature>org.eclipse.m2e.core.maven2Nature</nature>
		<nature>org.eclipse.wst.common.project.facet.core.nature</nature>
	</natures>
	<filteredResources>
		<filter>
			<id>1664477487886</id>
			<name></name>
			<type>30</type>
			<matcher>
				<id>org.eclipse.core.resources.regexFilterMatcher</id>
				<arguments>node_modules|\.git|__CREATED_BY_JAVA_LANGUAGE_SERVER__</arguments>
			</matcher>
		</filter>
	</filteredResources>
</projectDescription>
PK
    9U��Z��   �   *   .settings/org.eclipse.core.resources.prefseclipse.preferences.version=1
encoding//src/main/java=UTF-8
encoding//src/main/resources=UTF-8
encoding//src/test/java=UTF-8
encoding/<project>=UTF-8
PK
    �9U�O�<�   �   (   .settings/org.eclipse.jdt.apt.core.prefseclipse.preferences.version=1
org.eclipse.jdt.apt.aptEnabled=false
org.eclipse.jdt.apt.genSrcDir=target\\generated-sources\\annotations
org.eclipse.jdt.apt.genTestSrcDir=target\\generated-test-sources\\test-annotations
PK
    pv=U������  ��  $   .settings/org.eclipse.jdt.core.prefseclipse.preferences.version=1
enableParallelJavaIndexSearch=true
org.eclipse.jdt.core.builder.annotationPath.allLocations=disabled
org.eclipse.jdt.core.builder.cleanOutputFolder=clean
org.eclipse.jdt.core.builder.duplicateResourceTask=warning
org.eclipse.jdt.core.builder.invalidClasspath=abort
org.eclipse.jdt.core.builder.recreateModifiedClassFileInOutputFolder=ignore
org.eclipse.jdt.core.builder.resourceCopyExclusionFilter=
org.eclipse.jdt.core.circularClasspath=warning
org.eclipse.jdt.core.classpath.exclusionPatterns=enabled
org.eclipse.jdt.core.classpath.mainOnlyProjectHasTestOnlyDependency=error
org.eclipse.jdt.core.classpath.multipleOutputLocations=enabled
org.eclipse.jdt.core.classpath.outputOverlappingAnotherSource=error
org.eclipse.jdt.core.codeComplete.argumentPrefixes=
org.eclipse.jdt.core.codeComplete.argumentSuffixes=
org.eclipse.jdt.core.codeComplete.camelCaseMatch=enabled
org.eclipse.jdt.core.codeComplete.deprecationCheck=disabled
org.eclipse.jdt.core.codeComplete.discouragedReferenceCheck=disabled
org.eclipse.jdt.core.codeComplete.fieldPrefixes=
org.eclipse.jdt.core.codeComplete.fieldSuffixes=
org.eclipse.jdt.core.codeComplete.forbiddenReferenceCheck=enabled
org.eclipse.jdt.core.codeComplete.forceImplicitQualification=disabled
org.eclipse.jdt.core.codeComplete.localPrefixes=
org.eclipse.jdt.core.codeComplete.localSuffixes=
org.eclipse.jdt.core.codeComplete.staticFieldPrefixes=
org.eclipse.jdt.core.codeComplete.staticFieldSuffixes=
org.eclipse.jdt.core.codeComplete.staticFinalFieldPrefixes=
org.eclipse.jdt.core.codeComplete.staticFinalFieldSuffixes=
org.eclipse.jdt.core.codeComplete.subwordMatch=disabled
org.eclipse.jdt.core.codeComplete.suggestStaticImports=enabled
org.eclipse.jdt.core.codeComplete.visibilityCheck=enabled
org.eclipse.jdt.core.compiler.annotation.inheritNullAnnotations=disabled
org.eclipse.jdt.core.compiler.annotation.missingNonNullByDefaultAnnotation=ignore
org.eclipse.jdt.core.compiler.annotation.nonnull=org.springframework.lang.NonNull
org.eclipse.jdt.core.compiler.annotation.nonnull.secondary=
org.eclipse.jdt.core.compiler.annotation.nonnullbydefault=org.eclipse.jdt.annotation.NonNullByDefault
org.eclipse.jdt.core.compiler.annotation.nonnullbydefault.secondary=
org.eclipse.jdt.core.compiler.annotation.nullable=org.springframework.lang.Nullable
org.eclipse.jdt.core.compiler.annotation.nullable.secondary=
org.eclipse.jdt.core.compiler.annotation.nullanalysis=enabled
org.eclipse.jdt.core.compiler.codegen.inlineJsrBytecode=enabled
org.eclipse.jdt.core.compiler.codegen.lambda.genericSignature=do not generate
org.eclipse.jdt.core.compiler.codegen.methodParameters=generate
org.eclipse.jdt.core.compiler.codegen.shareCommonFinallyBlocks=disabled
org.eclipse.jdt.core.compiler.codegen.targetPlatform=1.8
org.eclipse.jdt.core.compiler.codegen.unusedLocal=preserve
org.eclipse.jdt.core.compiler.compliance=1.8
org.eclipse.jdt.core.compiler.debug.lineNumber=generate
org.eclipse.jdt.core.compiler.debug.localVariable=generate
org.eclipse.jdt.core.compiler.debug.sourceFile=generate
org.eclipse.jdt.core.compiler.doc.comment.support=enabled
org.eclipse.jdt.core.compiler.emulateJavacBug8031744=enabled
org.eclipse.jdt.core.compiler.generateClassFiles=enabled
org.eclipse.jdt.core.compiler.maxProblemPerUnit=100
org.eclipse.jdt.core.compiler.problem.APILeak=warning
org.eclipse.jdt.core.compiler.problem.annotatedTypeArgumentToUnannotated=info
org.eclipse.jdt.core.compiler.problem.annotationSuperInterface=warning
org.eclipse.jdt.core.compiler.problem.assertIdentifier=error
org.eclipse.jdt.core.compiler.problem.autoboxing=ignore
org.eclipse.jdt.core.compiler.problem.comparingIdentical=warning
org.eclipse.jdt.core.compiler.problem.deadCode=warning
org.eclipse.jdt.core.compiler.problem.deadCodeInTrivialIfStatement=disabled
org.eclipse.jdt.core.compiler.problem.deprecation=warning
org.eclipse.jdt.core.compiler.problem.deprecationInDeprecatedCode=disabled
org.eclipse.jdt.core.compiler.problem.deprecationWhenOverridingDeprecatedMethod=disabled
org.eclipse.jdt.core.compiler.problem.discouragedReference=warning
org.eclipse.jdt.core.compiler.problem.emptyStatement=ignore
org.eclipse.jdt.core.compiler.problem.enablePreviewFeatures=disabled
org.eclipse.jdt.core.compiler.problem.enumIdentifier=error
org.eclipse.jdt.core.compiler.problem.explicitlyClosedAutoCloseable=ignore
org.eclipse.jdt.core.compiler.problem.fallthroughCase=ignore
org.eclipse.jdt.core.compiler.problem.fatalOptionalError=disabled
org.eclipse.jdt.core.compiler.problem.fieldHiding=ignore
org.eclipse.jdt.core.compiler.problem.finalParameterBound=warning
org.eclipse.jdt.core.compiler.problem.finallyBlockNotCompletingNormally=warning
org.eclipse.jdt.core.compiler.problem.forbiddenReference=warning
org.eclipse.jdt.core.compiler.problem.hiddenCatchBlock=warning
org.eclipse.jdt.core.compiler.problem.includeNullInfoFromAsserts=disabled
org.eclipse.jdt.core.compiler.problem.incompatibleNonInheritedInterfaceMethod=warning
org.eclipse.jdt.core.compiler.problem.incompleteEnumSwitch=warning
org.eclipse.jdt.core.compiler.problem.indirectStaticAccess=ignore
org.eclipse.jdt.core.compiler.problem.invalidJavadoc=ignore
org.eclipse.jdt.core.compiler.problem.invalidJavadocTags=disabled
org.eclipse.jdt.core.compiler.problem.invalidJavadocTagsDeprecatedRef=disabled
org.eclipse.jdt.core.compiler.problem.invalidJavadocTagsNotVisibleRef=disabled
org.eclipse.jdt.core.compiler.problem.invalidJavadocTagsVisibility=public
org.eclipse.jdt.core.compiler.problem.localVariableHiding=ignore
org.eclipse.jdt.core.compiler.problem.methodWithConstructorName=warning
org.eclipse.jdt.core.compiler.problem.missingDefaultCase=ignore
org.eclipse.jdt.core.compiler.problem.missingDeprecatedAnnotation=ignore
org.eclipse.jdt.core.compiler.problem.missingEnumCaseDespiteDefault=disabled
org.eclipse.jdt.core.compiler.problem.missingHashCodeMethod=ignore
org.eclipse.jdt.core.compiler.problem.missingJavadocComments=ignore
org.eclipse.jdt.core.compiler.problem.missingJavadocCommentsOverriding=disabled
org.eclipse.jdt.core.compiler.problem.missingJavadocCommentsVisibility=public
org.eclipse.jdt.core.compiler.problem.missingJavadocTagDescription=return_tag
org.eclipse.jdt.core.compiler.problem.missingJavadocTags=ignore
org.eclipse.jdt.core.compiler.problem.missingJavadocTagsMethodTypeParameters=disabled
org.eclipse.jdt.core.compiler.problem.missingJavadocTagsOverriding=disabled
org.eclipse.jdt.core.compiler.problem.missingJavadocTagsVisibility=public
org.eclipse.jdt.core.compiler.problem.missingOverrideAnnotation=ignore
org.eclipse.jdt.core.compiler.problem.missingOverrideAnnotationForInterfaceMethodImplementation=enabled
org.eclipse.jdt.core.compiler.problem.missingSerialVersion=ignore
org.eclipse.jdt.core.compiler.problem.missingSynchronizedOnInheritedMethod=ignore
org.eclipse.jdt.core.compiler.problem.noEffectAssignment=warning
org.eclipse.jdt.core.compiler.problem.noImplicitStringConversion=warning
org.eclipse.jdt.core.compiler.problem.nonExternalizedStringLiteral=ignore
org.eclipse.jdt.core.compiler.problem.nonnullParameterAnnotationDropped=warning
org.eclipse.jdt.core.compiler.problem.nonnullTypeVariableFromLegacyInvocation=warning
org.eclipse.jdt.core.compiler.problem.nullAnnotationInferenceConflict=warning
org.eclipse.jdt.core.compiler.problem.nullReference=warning
org.eclipse.jdt.core.compiler.problem.nullSpecViolation=warning
org.eclipse.jdt.core.compiler.problem.nullUncheckedConversion=warning
org.eclipse.jdt.core.compiler.problem.overridingMethodWithoutSuperInvocation=ignore
org.eclipse.jdt.core.compiler.problem.overridingPackageDefaultMethod=warning
org.eclipse.jdt.core.compiler.problem.parameterAssignment=ignore
org.eclipse.jdt.core.compiler.problem.pessimisticNullAnalysisForFreeTypeVariables=warning
org.eclipse.jdt.core.compiler.problem.possibleAccidentalBooleanAssignment=ignore
org.eclipse.jdt.core.compiler.problem.potentialNullReference=warning
org.eclipse.jdt.core.compiler.problem.potentiallyUnclosedCloseable=ignore
org.eclipse.jdt.core.compiler.problem.rawTypeReference=warning
org.eclipse.jdt.core.compiler.problem.redundantNullAnnotation=warning
org.eclipse.jdt.core.compiler.problem.redundantNullCheck=ignore
org.eclipse.jdt.core.compiler.problem.redundantSpecificationOfTypeArguments=ignore
org.eclipse.jdt.core.compiler.problem.redundantSuperinterface=warning
org.eclipse.jdt.core.compiler.problem.reportMethodCanBePotentiallyStatic=ignore
org.eclipse.jdt.core.compiler.problem.reportMethodCanBeStatic=ignore
org.eclipse.jdt.core.compiler.problem.reportPreviewFeatures=ignore
org.eclipse.jdt.core.compiler.problem.specialParameterHidingField=disabled
org.eclipse.jdt.core.compiler.problem.staticAccessReceiver=warning
org.eclipse.jdt.core.compiler.problem.suppressOptionalErrors=disabled
org.eclipse.jdt.core.compiler.problem.suppressWarnings=enabled
org.eclipse.jdt.core.compiler.problem.suppressWarningsNotFullyAnalysed=info
org.eclipse.jdt.core.compiler.problem.syntacticNullAnalysisForFields=disabled
org.eclipse.jdt.core.compiler.problem.syntheticAccessEmulation=ignore
org.eclipse.jdt.core.compiler.problem.tasks=warning
org.eclipse.jdt.core.compiler.problem.terminalDeprecation=warning
org.eclipse.jdt.core.compiler.problem.typeParameterHiding=warning
org.eclipse.jdt.core.compiler.problem.unavoidableGenericTypeProblems=enabled
org.eclipse.jdt.core.compiler.problem.uncheckedTypeOperation=warning
org.eclipse.jdt.core.compiler.problem.unclosedCloseable=warning
org.eclipse.jdt.core.compiler.problem.undocumentedEmptyBlock=ignore
org.eclipse.jdt.core.compiler.problem.unhandledWarningToken=ignore
org.eclipse.jdt.core.compiler.problem.uninternedIdentityComparison=disabled
org.eclipse.jdt.core.compiler.problem.unlikelyCollectionMethodArgumentType=warning
org.eclipse.jdt.core.compiler.problem.unlikelyCollectionMethodArgumentTypeStrict=disabled
org.eclipse.jdt.core.compiler.problem.unlikelyEqualsArgumentType=info
org.eclipse.jdt.core.compiler.problem.unnecessaryElse=ignore
org.eclipse.jdt.core.compiler.problem.unnecessaryTypeCheck=ignore
org.eclipse.jdt.core.compiler.problem.unqualifiedFieldAccess=ignore
org.eclipse.jdt.core.compiler.problem.unstableAutoModuleName=warning
org.eclipse.jdt.core.compiler.problem.unusedDeclaredThrownException=ignore
org.eclipse.jdt.core.compiler.problem.unusedDeclaredThrownExceptionExemptExceptionAndThrowable=enabled
org.eclipse.jdt.core.compiler.problem.unusedDeclaredThrownExceptionIncludeDocCommentReference=enabled
org.eclipse.jdt.core.compiler.problem.unusedDeclaredThrownExceptionWhenOverriding=disabled
org.eclipse.jdt.core.compiler.problem.unusedExceptionParameter=ignore
org.eclipse.jdt.core.compiler.problem.unusedImport=warning
org.eclipse.jdt.core.compiler.problem.unusedLabel=warning
org.eclipse.jdt.core.compiler.problem.unusedLocal=warning
org.eclipse.jdt.core.compiler.problem.unusedObjectAllocation=ignore
org.eclipse.jdt.core.compiler.problem.unusedParameter=ignore
org.eclipse.jdt.core.compiler.problem.unusedParameterIncludeDocCommentReference=enabled
org.eclipse.jdt.core.compiler.problem.unusedParameterWhenImplementingAbstract=disabled
org.eclipse.jdt.core.compiler.problem.unusedParameterWhenOverridingConcrete=disabled
org.eclipse.jdt.core.compiler.problem.unusedPrivateMember=warning
org.eclipse.jdt.core.compiler.problem.unusedTypeArgumentsForMethodInvocation=warning
org.eclipse.jdt.core.compiler.problem.unusedTypeParameter=ignore
org.eclipse.jdt.core.compiler.problem.unusedWarningToken=warning
org.eclipse.jdt.core.compiler.problem.varargsArgumentNeedCast=warning
org.eclipse.jdt.core.compiler.processAnnotations=disabled
org.eclipse.jdt.core.compiler.release=disabled
org.eclipse.jdt.core.compiler.source=1.8
org.eclipse.jdt.core.compiler.storeAnnotations=disabled
org.eclipse.jdt.core.compiler.taskCaseSensitive=enabled
org.eclipse.jdt.core.compiler.taskPriorities=NORMAL,HIGH,NORMAL
org.eclipse.jdt.core.compiler.taskTags=TODO,FIXME,XXX
org.eclipse.jdt.core.computeJavaBuildOrder=ignore
org.eclipse.jdt.core.encoding=utf8
org.eclipse.jdt.core.formatter.align_assignment_statements_on_columns=false
org.eclipse.jdt.core.formatter.align_fields_grouping_blank_lines=2147483647
org.eclipse.jdt.core.formatter.align_selector_in_method_invocation_on_expression_first_line=true
org.eclipse.jdt.core.formatter.align_type_members_on_columns=false
org.eclipse.jdt.core.formatter.align_variable_declarations_on_columns=false
org.eclipse.jdt.core.formatter.align_with_spaces=false
org.eclipse.jdt.core.formatter.alignment_for_additive_operator=16
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_enum_constant=49
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_field=49
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_local_variable=49
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_method=49
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_package=49
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_parameter=0
org.eclipse.jdt.core.formatter.alignment_for_annotations_on_type=49
org.eclipse.jdt.core.formatter.alignment_for_arguments_in_allocation_expression=16
org.eclipse.jdt.core.formatter.alignment_for_arguments_in_annotation=0
org.eclipse.jdt.core.formatter.alignment_for_arguments_in_enum_constant=16
org.eclipse.jdt.core.formatter.alignment_for_arguments_in_explicit_constructor_call=16
org.eclipse.jdt.core.formatter.alignment_for_arguments_in_method_invocation=16
org.eclipse.jdt.core.formatter.alignment_for_arguments_in_qualified_allocation_expression=16
org.eclipse.jdt.core.formatter.alignment_for_assertion_message=16
org.eclipse.jdt.core.formatter.alignment_for_assignment=0
org.eclipse.jdt.core.formatter.alignment_for_bitwise_operator=16
org.eclipse.jdt.core.formatter.alignment_for_compact_if=16
org.eclipse.jdt.core.formatter.alignment_for_compact_loops=16
org.eclipse.jdt.core.formatter.alignment_for_conditional_expression=80
org.eclipse.jdt.core.formatter.alignment_for_conditional_expression_chain=0
org.eclipse.jdt.core.formatter.alignment_for_enum_constants=16
org.eclipse.jdt.core.formatter.alignment_for_expressions_in_array_initializer=16
org.eclipse.jdt.core.formatter.alignment_for_expressions_in_for_loop_header=0
org.eclipse.jdt.core.formatter.alignment_for_expressions_in_switch_case_with_arrow=16
org.eclipse.jdt.core.formatter.alignment_for_expressions_in_switch_case_with_colon=16
org.eclipse.jdt.core.formatter.alignment_for_logical_operator=16
org.eclipse.jdt.core.formatter.alignment_for_method_declaration=0
org.eclipse.jdt.core.formatter.alignment_for_module_statements=16
org.eclipse.jdt.core.formatter.alignment_for_multiple_fields=16
org.eclipse.jdt.core.formatter.alignment_for_multiplicative_operator=16
org.eclipse.jdt.core.formatter.alignment_for_parameterized_type_references=0
org.eclipse.jdt.core.formatter.alignment_for_parameters_in_constructor_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_parameters_in_method_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_record_components=16
org.eclipse.jdt.core.formatter.alignment_for_relational_operator=0
org.eclipse.jdt.core.formatter.alignment_for_resources_in_try=80
org.eclipse.jdt.core.formatter.alignment_for_selector_in_method_invocation=16
org.eclipse.jdt.core.formatter.alignment_for_shift_operator=0
org.eclipse.jdt.core.formatter.alignment_for_string_concatenation=16
org.eclipse.jdt.core.formatter.alignment_for_superclass_in_type_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_enum_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_record_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_type_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_switch_case_with_arrow=20
org.eclipse.jdt.core.formatter.alignment_for_throws_clause_in_constructor_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_throws_clause_in_method_declaration=16
org.eclipse.jdt.core.formatter.alignment_for_type_annotations=0
org.eclipse.jdt.core.formatter.alignment_for_type_arguments=0
org.eclipse.jdt.core.formatter.alignment_for_type_parameters=0
org.eclipse.jdt.core.formatter.alignment_for_union_type_in_multicatch=16
org.eclipse.jdt.core.formatter.blank_lines_after_imports=1
org.eclipse.jdt.core.formatter.blank_lines_after_last_class_body_declaration=0
org.eclipse.jdt.core.formatter.blank_lines_after_package=1
org.eclipse.jdt.core.formatter.blank_lines_before_abstract_method=1
org.eclipse.jdt.core.formatter.blank_lines_before_field=0
org.eclipse.jdt.core.formatter.blank_lines_before_first_class_body_declaration=0
org.eclipse.jdt.core.formatter.blank_lines_before_imports=1
org.eclipse.jdt.core.formatter.blank_lines_before_member_type=1
org.eclipse.jdt.core.formatter.blank_lines_before_method=1
org.eclipse.jdt.core.formatter.blank_lines_before_new_chunk=1
org.eclipse.jdt.core.formatter.blank_lines_before_package=0
org.eclipse.jdt.core.formatter.blank_lines_between_import_groups=1
org.eclipse.jdt.core.formatter.blank_lines_between_statement_group_in_switch=0
org.eclipse.jdt.core.formatter.blank_lines_between_type_declarations=1
org.eclipse.jdt.core.formatter.brace_position_for_annotation_type_declaration=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_anonymous_type_declaration=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_array_initializer=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_block=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_block_in_case=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_constructor_declaration=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_enum_constant=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_enum_declaration=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_lambda_body=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_method_declaration=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_record_constructor=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_record_declaration=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_switch=end_of_line
org.eclipse.jdt.core.formatter.brace_position_for_type_declaration=end_of_line
org.eclipse.jdt.core.formatter.comment.align_tags_descriptions_grouped=true
org.eclipse.jdt.core.formatter.comment.align_tags_names_descriptions=false
org.eclipse.jdt.core.formatter.comment.clear_blank_lines_in_block_comment=false
org.eclipse.jdt.core.formatter.comment.clear_blank_lines_in_javadoc_comment=false
org.eclipse.jdt.core.formatter.comment.count_line_length_from_starting_position=true
org.eclipse.jdt.core.formatter.comment.format_block_comments=true
org.eclipse.jdt.core.formatter.comment.format_header=false
org.eclipse.jdt.core.formatter.comment.format_html=true
org.eclipse.jdt.core.formatter.comment.format_javadoc_comments=true
org.eclipse.jdt.core.formatter.comment.format_line_comments=true
org.eclipse.jdt.core.formatter.comment.format_source_code=true
org.eclipse.jdt.core.formatter.comment.indent_parameter_description=false
org.eclipse.jdt.core.formatter.comment.indent_root_tags=false
org.eclipse.jdt.core.formatter.comment.indent_tag_description=false
org.eclipse.jdt.core.formatter.comment.insert_new_line_before_root_tags=insert
org.eclipse.jdt.core.formatter.comment.insert_new_line_between_different_tags=do not insert
org.eclipse.jdt.core.formatter.comment.insert_new_line_for_parameter=do not insert
org.eclipse.jdt.core.formatter.comment.line_length=80
org.eclipse.jdt.core.formatter.comment.new_lines_at_block_boundaries=true
org.eclipse.jdt.core.formatter.comment.new_lines_at_javadoc_boundaries=true
org.eclipse.jdt.core.formatter.comment.preserve_white_space_between_code_and_line_comments=false
org.eclipse.jdt.core.formatter.compact_else_if=true
org.eclipse.jdt.core.formatter.continuation_indentation=2
org.eclipse.jdt.core.formatter.continuation_indentation_for_array_initializer=2
org.eclipse.jdt.core.formatter.disabling_tag=@formatter\:off
org.eclipse.jdt.core.formatter.enabling_tag=@formatter\:on
org.eclipse.jdt.core.formatter.format_guardian_clause_on_one_line=false
org.eclipse.jdt.core.formatter.format_line_comment_starting_on_first_column=false
org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_annotation_declaration_header=true
org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_enum_constant_header=true
org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_enum_declaration_header=true
org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_record_header=true
org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_type_header=true
org.eclipse.jdt.core.formatter.indent_breaks_compare_to_cases=true
org.eclipse.jdt.core.formatter.indent_empty_lines=false
org.eclipse.jdt.core.formatter.indent_statements_compare_to_block=true
org.eclipse.jdt.core.formatter.indent_statements_compare_to_body=true
org.eclipse.jdt.core.formatter.indent_switchstatements_compare_to_cases=true
org.eclipse.jdt.core.formatter.indent_switchstatements_compare_to_switch=true
org.eclipse.jdt.core.formatter.indentation.size=4
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_enum_constant=insert
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_field=insert
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_local_variable=insert
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_method=insert
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_package=insert
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_parameter=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_type=insert
org.eclipse.jdt.core.formatter.insert_new_line_after_label=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_after_opening_brace_in_array_initializer=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_after_type_annotation=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_at_end_of_file_if_missing=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_before_catch_in_try_statement=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_before_closing_brace_in_array_initializer=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_before_else_in_if_statement=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_before_finally_in_try_statement=do not insert
org.eclipse.jdt.core.formatter.insert_new_line_before_while_in_do_statement=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_additive_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_and_in_type_parameter=insert
org.eclipse.jdt.core.formatter.insert_space_after_arrow_in_switch_case=insert
org.eclipse.jdt.core.formatter.insert_space_after_arrow_in_switch_default=insert
org.eclipse.jdt.core.formatter.insert_space_after_assignment_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_at_in_annotation=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_at_in_annotation_type_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_bitwise_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_closing_angle_bracket_in_type_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_closing_angle_bracket_in_type_parameters=insert
org.eclipse.jdt.core.formatter.insert_space_after_closing_brace_in_block=insert
org.eclipse.jdt.core.formatter.insert_space_after_closing_paren_in_cast=insert
org.eclipse.jdt.core.formatter.insert_space_after_colon_in_assert=insert
org.eclipse.jdt.core.formatter.insert_space_after_colon_in_case=insert
org.eclipse.jdt.core.formatter.insert_space_after_colon_in_conditional=insert
org.eclipse.jdt.core.formatter.insert_space_after_colon_in_for=insert
org.eclipse.jdt.core.formatter.insert_space_after_colon_in_labeled_statement=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_allocation_expression=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_annotation=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_array_initializer=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_constructor_declaration_parameters=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_constructor_declaration_throws=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_enum_constant_arguments=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_enum_declarations=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_explicitconstructorcall_arguments=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_for_increments=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_for_inits=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_method_declaration_parameters=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_method_declaration_throws=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_method_invocation_arguments=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_multiple_field_declarations=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_multiple_local_declarations=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_parameterized_type_reference=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_permitted_types=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_record_components=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_superinterfaces=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_switch_case_expressions=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_type_arguments=insert
org.eclipse.jdt.core.formatter.insert_space_after_comma_in_type_parameters=insert
org.eclipse.jdt.core.formatter.insert_space_after_ellipsis=insert
org.eclipse.jdt.core.formatter.insert_space_after_lambda_arrow=insert
org.eclipse.jdt.core.formatter.insert_space_after_logical_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_multiplicative_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_not_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_angle_bracket_in_parameterized_type_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_angle_bracket_in_type_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_angle_bracket_in_type_parameters=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_brace_in_array_initializer=insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_bracket_in_array_allocation_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_bracket_in_array_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_annotation=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_cast=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_catch=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_constructor_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_enum_constant=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_for=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_if=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_method_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_method_invocation=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_parenthesized_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_record_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_switch=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_synchronized=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_try=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_while=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_postfix_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_prefix_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_question_in_conditional=insert
org.eclipse.jdt.core.formatter.insert_space_after_question_in_wildcard=do not insert
org.eclipse.jdt.core.formatter.insert_space_after_relational_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_semicolon_in_for=insert
org.eclipse.jdt.core.formatter.insert_space_after_semicolon_in_try_resources=insert
org.eclipse.jdt.core.formatter.insert_space_after_shift_operator=insert
org.eclipse.jdt.core.formatter.insert_space_after_string_concatenation=insert
org.eclipse.jdt.core.formatter.insert_space_after_unary_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_additive_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_and_in_type_parameter=insert
org.eclipse.jdt.core.formatter.insert_space_before_arrow_in_switch_case=insert
org.eclipse.jdt.core.formatter.insert_space_before_arrow_in_switch_default=insert
org.eclipse.jdt.core.formatter.insert_space_before_assignment_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_at_in_annotation_type_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_bitwise_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_angle_bracket_in_parameterized_type_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_angle_bracket_in_type_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_angle_bracket_in_type_parameters=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_brace_in_array_initializer=insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_bracket_in_array_allocation_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_bracket_in_array_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_annotation=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_cast=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_catch=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_constructor_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_enum_constant=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_for=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_if=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_method_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_method_invocation=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_parenthesized_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_record_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_switch=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_synchronized=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_try=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_while=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_colon_in_assert=insert
org.eclipse.jdt.core.formatter.insert_space_before_colon_in_case=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_colon_in_conditional=insert
org.eclipse.jdt.core.formatter.insert_space_before_colon_in_default=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_colon_in_for=insert
org.eclipse.jdt.core.formatter.insert_space_before_colon_in_labeled_statement=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_allocation_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_annotation=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_array_initializer=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_constructor_declaration_parameters=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_constructor_declaration_throws=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_enum_constant_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_enum_declarations=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_explicitconstructorcall_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_for_increments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_for_inits=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_method_declaration_parameters=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_method_declaration_throws=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_method_invocation_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_multiple_field_declarations=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_multiple_local_declarations=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_parameterized_type_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_permitted_types=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_record_components=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_superinterfaces=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_switch_case_expressions=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_type_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_comma_in_type_parameters=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_ellipsis=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_lambda_arrow=insert
org.eclipse.jdt.core.formatter.insert_space_before_logical_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_multiplicative_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_angle_bracket_in_parameterized_type_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_angle_bracket_in_type_arguments=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_angle_bracket_in_type_parameters=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_annotation_type_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_anonymous_type_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_array_initializer=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_block=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_constructor_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_enum_constant=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_enum_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_method_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_record_constructor=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_record_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_switch=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_type_declaration=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_bracket_in_array_allocation_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_bracket_in_array_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_bracket_in_array_type_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_annotation=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_annotation_type_member_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_catch=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_constructor_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_enum_constant=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_for=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_if=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_method_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_method_invocation=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_parenthesized_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_record_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_switch=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_synchronized=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_try=insert
org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_while=insert
org.eclipse.jdt.core.formatter.insert_space_before_parenthesized_expression_in_return=insert
org.eclipse.jdt.core.formatter.insert_space_before_parenthesized_expression_in_throw=insert
org.eclipse.jdt.core.formatter.insert_space_before_postfix_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_prefix_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_question_in_conditional=insert
org.eclipse.jdt.core.formatter.insert_space_before_question_in_wildcard=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_relational_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_semicolon=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_semicolon_in_for=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_semicolon_in_try_resources=do not insert
org.eclipse.jdt.core.formatter.insert_space_before_shift_operator=insert
org.eclipse.jdt.core.formatter.insert_space_before_string_concatenation=insert
org.eclipse.jdt.core.formatter.insert_space_before_unary_operator=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_brackets_in_array_type_reference=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_braces_in_array_initializer=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_brackets_in_array_allocation_expression=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_annotation_type_member_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_constructor_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_enum_constant=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_method_declaration=do not insert
org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_method_invocation=do not insert
org.eclipse.jdt.core.formatter.join_lines_in_comments=false
org.eclipse.jdt.core.formatter.join_wrapped_lines=false
org.eclipse.jdt.core.formatter.keep_annotation_declaration_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_anonymous_type_declaration_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_code_block_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_else_statement_on_same_line=false
org.eclipse.jdt.core.formatter.keep_empty_array_initializer_on_one_line=false
org.eclipse.jdt.core.formatter.keep_enum_constant_declaration_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_enum_declaration_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_if_then_body_block_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_imple_if_on_one_line=false
org.eclipse.jdt.core.formatter.keep_lambda_body_block_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_loop_body_block_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_method_body_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_record_constructor_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_record_declaration_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_simple_do_while_body_on_same_line=false
org.eclipse.jdt.core.formatter.keep_simple_for_body_on_same_line=false
org.eclipse.jdt.core.formatter.keep_simple_getter_setter_on_one_line=false
org.eclipse.jdt.core.formatter.keep_simple_while_body_on_same_line=false
org.eclipse.jdt.core.formatter.keep_switch_body_block_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_switch_case_with_arrow_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.keep_then_statement_on_same_line=false
org.eclipse.jdt.core.formatter.keep_type_declaration_on_one_line=one_line_never
org.eclipse.jdt.core.formatter.lineSplit=120
org.eclipse.jdt.core.formatter.never_indent_block_comments_on_first_column=false
org.eclipse.jdt.core.formatter.never_indent_line_comments_on_first_column=false
org.eclipse.jdt.core.formatter.number_of_blank_lines_after_code_block=0
org.eclipse.jdt.core.formatter.number_of_blank_lines_at_beginning_of_code_block=0
org.eclipse.jdt.core.formatter.number_of_blank_lines_at_beginning_of_method_body=0
org.eclipse.jdt.core.formatter.number_of_blank_lines_at_end_of_code_block=0
org.eclipse.jdt.core.formatter.number_of_blank_lines_at_end_of_method_body=0
org.eclipse.jdt.core.formatter.number_of_blank_lines_before_code_block=0
org.eclipse.jdt.core.formatter.number_of_empty_lines_to_preserve=1
org.eclipse.jdt.core.formatter.parentheses_positions_in_annotation=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_catch_clause=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_enum_constant_declaration=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_for_statment=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_if_while_statement=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_lambda_declaration=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_method_delcaration=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_method_invocation=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_record_declaration=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_switch_statement=common_lines
org.eclipse.jdt.core.formatter.parentheses_positions_in_try_clause=common_lines
org.eclipse.jdt.core.formatter.put_empty_statement_on_new_line=true
org.eclipse.jdt.core.formatter.tabulation.char=space
org.eclipse.jdt.core.formatter.tabulation.size=2
org.eclipse.jdt.core.formatter.text_block_indentation=0
org.eclipse.jdt.core.formatter.use_on_off_tags=true
org.eclipse.jdt.core.formatter.use_tabs_only_for_leading_indentations=false
org.eclipse.jdt.core.formatter.wrap_before_additive_operator=true
org.eclipse.jdt.core.formatter.wrap_before_assertion_message_operator=true
org.eclipse.jdt.core.formatter.wrap_before_assignment_operator=false
org.eclipse.jdt.core.formatter.wrap_before_bitwise_operator=true
org.eclipse.jdt.core.formatter.wrap_before_conditional_operator=true
org.eclipse.jdt.core.formatter.wrap_before_logical_operator=true
org.eclipse.jdt.core.formatter.wrap_before_multiplicative_operator=true
org.eclipse.jdt.core.formatter.wrap_before_or_operator_multicatch=true
org.eclipse.jdt.core.formatter.wrap_before_relational_operator=true
org.eclipse.jdt.core.formatter.wrap_before_shift_operator=true
org.eclipse.jdt.core.formatter.wrap_before_string_concatenation=true
org.eclipse.jdt.core.formatter.wrap_before_switch_case_arrow_operator=false
org.eclipse.jdt.core.formatter.wrap_outer_expressions_when_nested=true
org.eclipse.jdt.core.incompatibleJDKLevel=ignore
org.eclipse.jdt.core.incompleteClasspath=error
org.eclipse.jdt.core.javaFormatter=org.eclipse.jdt.core.defaultJavaFormatter
org.eclipse.jdt.core.timeoutForParameterNameFromAttachedJavadoc=50
PK
    9UV���Z   Z   $   .settings/org.eclipse.m2e.core.prefsactiveProfiles=
eclipse.preferences.version=1
resolveWorkspaceProjects=true
version=1
PK
    $�=U-�T+�  �  *   .settings/org.eclipse.wst.common.component<?xml version="1.0" encoding="UTF-8"?><project-modules id="moduleCoreId" project-version="1.5.0">
    <wb-module deploy-name="P1API">
        <wb-resource deploy-path="/" source-path="/target/m2e-wtp/web-resources"/>
        <wb-resource deploy-path="/" source-path="/src/main/webapp" tag="defaultRootSource"/>
        <wb-resource deploy-path="/WEB-INF/classes" source-path="/src/main/java"/>
        <wb-resource deploy-path="/WEB-INF/classes" source-path="/src/main/resources"/>
        <wb-resource deploy-path="/WEB-INF/classes" source-path="/target/generated-sources/annotations"/>
        <property name="context-root" value="P1API"/>
        <property name="java-output-path" value="/p2_API/target/classes"/>
    </wb-module>
</project-modules>
PK
    $�=U-Iܨ   �   7   .settings/org.eclipse.wst.common.project.facet.core.xml<?xml version="1.0" encoding="UTF-8"?>
<faceted-project>
  <installed facet="java" version="1.8"/>
  <installed facet="jst.web" version="4.0"/>
</faceted-project>
PK
    $�=U�2   2   *   .settings/org.eclipse.wst.validation.prefsdisabled=06target
eclipse.preferences.version=1
PK
     9Uq��A   A   /   .settings/org.springframework.ide.eclipse.prefsboot.validation.initialized=true
eclipse.preferences.version=1
PK
    �9U�C�      	   README.md# p1_APIPK
    2q9UR�ڛ       bin/.DS_Store   Bud1           	                                                          Ilocblob                                                                                                                                                                                                                                                                                                                                                                                                                                              m v n wIlocblob      A   .������      m v n w . c m dIlocblob      �   .������      p o m . x m lIlocblob        .������     	 R E A D M E . m dIlocblob     �   .������      s r cIlocblob     �   .������      s r cbwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    s r cvSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9UG���  �     bin/.gitignoreHELP.md
target/
!.mvn/wrapper/maven-wrapper.jar
!**/src/main/**/target/
!**/src/test/**/target/

### STS ###
.apt_generated
.classpath
.factorypath
.project
.settings
.springBeans
.sts4-cache

### IntelliJ IDEA ###
.idea
*.iws
*.iml
*.ipr

### NetBeans ###
/nbproject/private/
/nbbuild/
/dist/
/nbdist/
/.nb-gradle/
build/
!**/src/main/**/build/
!**/src/test/**/build/

### VS Code ###
.vscode/
PK
    �9U�� 1g�  g�  "   bin/.mvn/wrapper/maven-wrapper.jarPK   ��S��>\�   K     META-INF/MANIFEST.MF���
�0�þ@�?�M�BAh���l5�nB�*��i�
Z������79�����H�U�S�'�8�7VSC�ч�(�הB�7b89��d辄��e2��*U�j��4.��B��X�Q�����L�r�}�~?�tJK�ɫ�=�*���Г���	Z8��8`-������c��'PK
    ��S            	   META-INF/PK
    ��S               org/PK
    ��S               org/apache/PK
    ��S               org/apache/maven/PK
    ��S               org/apache/maven/wrapper/PK
    ��S               org/apache/maven/wrapper/cli/PK
    ��S               META-INF/maven/PK
    ��S            (   META-INF/maven/org.apache.maven.wrapper/PK
    ��S            6   META-INF/maven/org.apache.maven.wrapper/maven-wrapper/PK   ��S�G�q        META-INF/DEPENDENCIES��A
1E�=E.����N�u���4	i�����v��!?g:�Lʙn�ڤ�*ph�΂F�PJ#[1�!;����V��~^y����ŃU���_߁�����ʦ��k
vGЅ#| PK   ��S���m  ^,     META-INF/LICENSE�Z[s��~���r�Si��4i牱䆭CiD�n&��%� ���. ���=����dw�VM�5I�ٳ�����E/˝�u�:�^<��?�u�t����B�Mv�������<�h7��W����\�6sc���ʽz���~Z���J��Y]-�7��xws'>��qw}{ws��-~]�SW������	�j.�T�;=�rn��k3�'�	��M#Z%;1�Ie['dW��t���bt�V��Tc�_^>[i7X��{!��pKU��A�U�B��֌۝�N�>hxΔc���X/cO+M�z���w�
P	�� �8�������s+��l��v[z��!S@me#�I�c�$핐%I	Z��Y/��^A�o�i
!�
R����cW��Ҵ��$����a�rxùxg,�я�71ɪ���G3/eFGq�B_�R�W� �Y�*�;�w!#J	N����,`E+;�U�<�׍��+V��N������$ٹe��	�\hЄ��v�GI������%������/i;�a�A���:� �d�A�Fu`�R�+'�3=��6�L\�Z���]�^���&�Q�y|x����[�<�'��$�ְ[	)��GZoU�����kM��[���p4IY�������3�ht�qw�3����r�!8���#A^?P����v��;��Q|�l��p�����cl(?jkZ�����	Q�9|R���o��R�yH\1=��qtLH�^cBR�s� g��'��N����P�n�*-�p��c4��	(��KҘp#-����1b����ZY�<H��M�?å���>�dą�n`x8�[
�dV9X[�BA[/��e��ΰ�Ⓥ�W��#$Sc���
W����h7;� ����$�AP|#:��T�p�~��*܊܅����r��8k� �iՃ&Wb�i|�66|��y6yaX唃H!�K��4��Lou�����NՓ�/ı���0���H��V�R��T��)h:F��j��'2��㤓��N� D��%�"��Ѩ'J�u�����"�����9S6�/�'\��Q6�	�p�H�d�6�
~J�"K�Q���M�m7n ;<x�A�E��z>h#��Z�L���j�De��}���5��i��e�^��f^��˰H5��� 腍l(���uD>��[_`�FW�Ph���d!����R�+��K:"�7@)AZV�"r7���5wTXBJ���	v?V>f+�k�F/2�DAfm�p�rtT�iǖ���ȏ�x�4��`��YC<�Q\��ь����B�M�(P.���#�PD�a�F"��l��"����4���u<v���R�܀���Ѧb�l�PFEHJ���$t���mK��r��7K?����H�p۷���Y��������f&K��TI�H ����� 9�S��� �	���T{�\�3�K��Ǘ�z�'s��pxY[�4�S"��Ts��ᆡۂ�c=��	�%8���+B����@�߀�\j}�E޷�4?b1��ϔs�v�3�J���\�2��`�r�"����K��Y3�]a;�������6u�<��j ~�Q��1<Q���`&�M�>
�ʾo��48�����U+����lv8�"	ɭq���uNZM�Y[@���(j_����`�)_���DVOˎ�q��-��$o���b���n.�5�?�B�
c::e�[VAn%�L ���T�"��ƹ�d0<FiF�O�</E#�n��Q[.`��|�G���QM`ŝo���29����S1LŦ�(ShF}��F#�/y�Uqu�E�X�.�
���ҰO�
���;�O��u+	َQpPn3��gX�i#l6�Q!���7�"O�f.�O Y�Z!2H
�V)�rm艸��z�셼䓎i[���~ܪ�Z9���!��TR}8�$��2��d{��&Qi죰硎���Aw'�=�l{���([�-C����e��U$Xxs��Sw .�8n���Kձ��] ,V
yS��	
�!��?� ��s�����g�A�U�-T<&��3��p�INK��h�%�V��o��ճ��������q {c��=�rg��ٕA��L9�,�+ZO	>���)��Y�"(I��fb<�2�A�ŗ�5s��g�J�2%�S���/I�
�6}ԔA�d�d�IT�gu�>�I��y=@	]'����M�T��ũ�e�zٔ��g�Te
� �Y �V/���s�0#�P���wa�_�f��M�[�8�"5��P����"�:Lf�lȪ�[�w�̤ս��$
��G�g�~
�U��jlm�DL ���;�1��`���D�*虘��8��0O�[�5Q�*��Ұ�	���+s
���UƑ�F�:a�g|흹2b1�]���hS����Y<<ъ�ӹ�J$�ΦyI��۪I��g�D�1�&c�ةu�|K͎�	�^5�@7:�����a�Rc�K��8�8��l�����]%��;r��m���Ӛy�Ejf�"��V���ׯ̀���՗���vK��R͍P��_ad.�1��)X1�D[��(�>C�#S��� ��7Ī��|�t�{���?�3]B΁)wv#���jL_�5�lqnN��}����:��C��C��6ժ�F�o���;�	�tr)~���4jV�Q��+bӁ�ړ�lȦ�7_Δ �ԟ��J;j��Ҷ��]1	���7��yc��`��H�K���a>�]R�uš�q��?��ˉs/q��?[��r=?,��u0�����7������bu��^����Z��X�~_����h�~��K'ф+U6&MDsRp� M.��"{
�`��������z�\��[��z����?]߽��\��|����B���~u���^�������N�~���Y_s����o@�6�t�@73�N�<gMo5�s:pх�P�%���<mt87��v��Δ:���������E�i3˱��9|&�E���.ϗXyПn =X|�аt�N;���,�!tj�h`_��,�mw1����g�������!BG�mq�-����v�|~0zN�e��M�� �V�r;�����J@z9��
�ֳ�gH( �|���g�x!��ƙ��j�w�X�c��[��F��9F���ygf��O.��Z���5���&�~��l�^�9����R7��j$�z���"x�M������+��q��x�e�a��4]����� o��r����\,J�	h�����"�,)>O��������B˝1<�I�䲝f���jExPGʮT|��Ǡ�w���Ւ4c�6Awa6��Boy���̗�Z�<�/���Ac���c'ĭd4�3��Go�tMv9���!���4�(�KL'ݢ$DO��,�L{&]3>c�s��m�h�J�Ю�
`�ՙѹ�-!Q �ъ)�Gk�m��&CW��*Q�ӹ����F:�-�l��>�ƌ6F]8��WWXWϽG�/no��?ߠiZ �z�/���o��>�%���.(�k�iB����B>��F�:�Z��r
$;��o)D��_g�h2��!�����Nz..�L����@��A��.u�Ԧ:�	@��;��vv7������"��zV p6/��i?'(N�r�@�!c嶋hf�q�Zݨ��
ݐM.��r4�F�a���|��_PM<���½kϤ!���o�9�e�/��U�Bz��G�����>H��g��O��*.�������("�#\���<�x��6��1FT�8"u�fC�29م@�C�Ͻr���j}�T�%_�П���3���N�p�K������H��&�������h��ێp@	�,t�o��iI����\��PK   ��S�S ԁ   �      META-INF/NOTICE}�=�@��=�"��kpp���d�9�b�\B����+��ӻ<�p��3>�Tٰ'�������=��kq��g��<��1^é<IbZPM�::�<�k����,����w�]Ou]J���*���W �PK   ��Sޒe�K  �
  3   org/apache/maven/wrapper/BootstrapMainStarter.class�V[w�F�˖��L!`�b��R(!N1��Ћ,ob�,����(-��//}�K�zNyqr�)}�����l�1�S�������������� x?*��%pV�9/+�ἂ1\P0��&�0��"��p)�i!�FqYX_Q0��Q�"#�5!��⺌Weh
z���=���b(D��a^F1
SLo(H��!rʴM�!�L�0H�N�3tdL�OVJy�^��Ib�Э�5ź.����1hǝ���n�V����r�r�����=��ig}���;��Ĕ�@r6sC_�5K�絬���pMb:�9���*ݝ�8��3l"�wJh�ڽ�@yAw����>_�G-��2�^�$��6��׮Lg�T5Ǧ��6ED�W�~��E�������s7|��#˞��[*7����T߈�|v��e�tlOF��1gڅ�^�)�n@fO�%K�ĥ9S�L97nN�� ���g��k�s�>ޮ@i�KE/�xt6�?&Ij�F����7U� ྊ
T�C/e,�xo�x�2�C�6����.[|��p~�q�������*��� �T�t�*��}ܑ�q���y;�{���Zjy��JG�@��Jԑ��R
���H|1��*�S��sژ���_��
w��X6�L�]�|�2�V��%�G�+�o��j�FG��UH؎�����<�ybBN4�pz:a�ui�����؟8��J���n?0���IW��&T���+�;W��(;�T�^{$�ꖙu���n�x�Pu�s?�������6<��w��L�.����M��1�Dgi����u�ɛ��+5�]k�֤����6eg�	�6Z4������n�� � j��cU|>���VD����K-{���P��%�m">ê��-��Ͷ�Z��6�f��K=�m�x��^[���ܤ}�9L킮	S�֋D5��:��'S��Lt&u�^�l�Bʒ�ӭ����
y�0�9.�`l��6W�����wD����C������[�G�H�	�	�hTk�C?=0HV��u��L2�o`&�#�����V�"�]�\Et��(q��Mq)�V�y(�2PE�
:�ƶ�G,7۶���(�u���\(�=[Ŏ�H<�Hυ�i��꽀�����^�r;�~���c4��KH� �.t�� ��Y:Ȃ���A	Gi"_S�%v�_��8Ni0Љ�p��N֓S��n�$IN�z�s�+E��s\���
h>51�`$t\�v�����ѡp���;����?!�vWb����}$r�}�+xz��\��CaAn�`��q�
��'�;X����ҥ����K�i�v�Cvg�s0�PK   ��S�ޗP)  !  2   org/apache/maven/wrapper/DefaultDownloader$1.class�S]OA=Ck�,K�U@�q� ���i����P-1<���5ۙf����A1���Q�;��w�s�9gf�~����U<�pg6������4�ٸ��4�l<���$Zp-x����+J�}��͎�|_H�@�^Oh�$�� �J�@����^�����u߽L��`HUK0�U)j��Я�nH�\E5y��:0�I2i28/���~_P�t	ҹ�;��&5(�*���Q��Q�$ì�U��}�K��]W���j�˒A�S�e3T�@��"ꨖ���,2xU\5��qP�t�`�A�tM�C�h�Q�~��^ު�e�,����,���/�J��ు]�׾���qOU�aW�!��8�M%���@�?ϐp�`dc��˶_?�G�KcF�&�>ü[9�i��5�|�w�8�0�b�������v�$������̏�lּyC�e0'o�b���1�?B�C\s�l�j���NW�Ɓ�3h�O;�'X�)2�_�|�����E��G~
�A�l�d�p�V�7��'p#���MZ����TiHipcz�PK   ��S�FG;/  �  S   org/apache/maven/wrapper/DefaultDownloader$SystemPropertiesProxyAuthenticator.class�S]OA=Ӗn�����  n+v���Ԙ���$(��ih�v�v��N)�W�"D��O�{�w�hM؇�w�=��3sg~����*��Hb�D
3f�3q�	,$���{&�p�D������流Q;��+5�p����M��+�;��QĪU�ms��� S��0��k+�ܔAKH�6y����j_�U�ɐ��}!�o�ռ�����6���{�w�����Yy�S�A��^r�l��t]�Mb��6�s�a��U>�=��B9�A%�E{]Œ>���
Ca�:s+�Ȫx��̜���&1�0{�t���R�BK�����P�Cc���W� �\1PL�Vu���0��БЮ�u�H,�sV���~��eH�a������DIׯ�r�C�F �Y�>#*(7�\�������)3dG��)�{�?��1G9�Eѷ �(i吥b"��r"H�?�
�pC ,\'C�A�Eu.��V�V�2���K0?�MQW������!�l��@���>'hb�5e���&��ĭ��v���kd-���*L�q�PK   ��S��෉  �  0   org/apache/maven/wrapper/DefaultDownloader.class�Y	`�y�����-X�%tZ�^6�ց�HT��i���fv��m�����m�#nk�i��I���	I�`'m��L���ֽ��MB��v�ڕbx3�����{o�������5<k��E���'��!�c��U�����⚁�)����:>���>���y9ܐ�/x_0�E���������~���4��������{~���k ��c:����+�*��������%�:�B*�K%m���������2���4���}������?H��o������c�g�b�_�o:�]�H���/��ᒆo����������[���.�	��*��jj!: jtօ�]��0tQ���b�&��H,d}{��fl�O�Y�]Z8��gm�O%-���AǱ������Y���c�'����}��G��k�\'�[�?a�sv��@]���@���������F�+�IK�)���l���C�E�;m93�	�K93GH,a���,�)'��ݺZf5eτ@�ϝ�����c���l�5�VVݤ������Đ?��;�\o���X�Y�{κh;������+��O��Nڵ�m��nN�΅�LγWOy]�*Y�����V&0��(��_��l���~���`�ǔ�=�J�j�5=��Y��rV���)'�Z_.+`�_J��H��%���o{��f��r.��~չ^�qrsc���!�3�d����L��dJ�����A'��ۚ��j7�4WGs~�r�K����#D�-etV�c'����em���{U�h�D�&"�5�Zv�&��:�keSɕ��S1ƫ��h��y����&ֳG���}p��T��B��T�3�_�m�e�7��y��4v��oڊy�W+L��6�z�B2B�v`�뷼tJr�/�*���p��Y�%
�
u��f"�@�(�K[�=ă��"�wδ��(:
��ϻ�)S�R,������Y�C2L�δĭ��$XjZ^ZF7[ �Z7[J<�%g�,�漤-������B�-�bX��&�V�11��	S&�rxXN����LWF�ܱ&6����z(�񝱜��&6�b��LP�9{~<�?6r|����������c'�����i`[�[E������7\D��i�b'����n���L|�j��N�h��)Z��o^�^E�t)pJ�tI:�Gm�hm�~St�.�Z�&�Mq��!��b��g��2Wk���̬��K@7�qP &�Ƈjd:��8�˦8,�x��������,�6v�̙�1�G�r@��m/f9�����<b˘���P�(S�Ne�S9��;���DR*��~b���D�)⢇�&]/�� 7���\*��?\p�G�Q���x���1q�)�ǉ_R����]�
���}��2���X�"�8!�����(J���[�)0U
p�0�Iq��?3�y��E��2�%ѵPO &���.ͥ��R�t�	˷���M�g��֔���Z/So����l�G`j�.���R)ɨ��O66��go��T6�~,��d\�0#m�0�wb�K��}2C��m���b�wf0p��0�[�hn������ȖB�M;��;��֝�#�WS��Q����b�,���4h���!Bk�#��_�ư���kF)u�$�+�^�E�`��d���,����[��u?X�Ȋ����@�A.9����0����ݯŁ��}���UW���r?�G���7.��˗�����)�5��RQ�Y���3"NiV6��)��E��1��9�=�c�Ժ��m�|�k���,�J\/�[�<u+�i=׻�����!rgfd�C)uEY_�F�5�^�g�4*T�d�͒��7��R�}m�l)�P<��Z��������ή���d�B�'o�M�z;_��1�hF@���Ӯ�rvC�eI�[���lCK�5���u;��SK�Η��T�9�Jf��n�-�Zc�R�E�a��
q=W!ԕ��2`����m��C���v�����on��]�$�,_��\o��Wl�B�*l!��6����Bq���T���/�"������}�Y˵i�/p�"?ұ�mUm�ϡ���9�8���J�Ǎs<@����q�*�B3��J���
R�5٠�
�&W�o���Qr˵u�*�����I��*��je�^�<�`-z�� ؙS�b-�;E��@���ykn`K�^=�������I�X�[�<�b;�J�(7��D�����;�h� B���c�ٶ��E�[���+���0�M�C#��̜U���§����_B\:E��%/��B�@n�c�Hg��P[{4�������"�hM�a��5l��s�[ĖxXĵh(��q]�k�v7��Ǎ�CfT�yl�<XW��l6��=j2��u�c���'��q;��&w8jT���c��/G���h�l��y쾌Sq#Z+�����m?iF����z)��T`]��J@W�h��hX��$W8�6�V�jrU�-����sG��x��V*�.�D��@��E�Gڹ�ga�����q��n<�g��'��x/q��S���x������`�����BS΃���)�eY�ƫc�E���lc�0�G����;�Jd]�e��3�1�.�=�?�`��S��@�)j_{�f~l|�*�5�W�q��H����6�#x��2>����},������[dG��KǷ���V(��?��ru�?�bյ�}��^X��ko���jx���kx��wjx��wkx�����+��&:_� �7`��Y�I���&ۿ����7�|)�I��[	 ��7ݚ��S�:���<�mɏ� >�PId���/�c��%�C��=ڕG��#w^EOGd�5�\��ȁ<�u.��yf�.���&$�dLC���z6�݄���Bh+X+�H��#q�0SH�?�V+D�E�7Q�47�d�g_N�O��k��<���#y����S8���#�{��x����Ho��x�Sp�/�x�5\웬n���1@����+�����KFC�w<t�MF�$�_�	�i��h��b>�h/K``�3l�'��e߅2>O��g�}��(c��~���%��r�����|�҂����Yƺ@{+m<�������&���b�S��M�ҋ'�nG�M�P��������ʮI$(*E�Ƈ��	�dR{ԁ6�������y����s�1��~Y7WXa�WV�<y&r��_��<:�BI����a�dń��ϩ���N|�X1u�B���]\�Z������>��P�4O����G"c�HB>j"g�#�-2Ѩ�tS�:1jOL�Dk��h81�E�Ĥޑ�lwr�1Eg��%w(�����ѯф�3_�z^fl���8Vp,�c��Q��:L�C��XMϨ=�������^V��]��/�-L��Y1Sl�*����
P��*�������(���PK   ��S]St�   �   )   org/apache/maven/wrapper/Downloader.classE�M
�@�_���<�7�q.ݪ ������Δ���ͅ�P�T�B�%/y���`�������U�Z���`�ȋ�s�]/&_����)O�;Bcv8�c�N��7�l.������ͨ�$�����dp`q�V�jd������ؤREb�O8�	�r�wt	�
� �P�c�f���M���oPK   ��SY��  �$  (   org/apache/maven/wrapper/Installer.class�X|T�?'3�{���A �����IDE�� 6	�BD�Ir��L�wfH��ڢ�j���m�Z�JU�N��h��~�]w�Zwk]��v>���<23Iw��~��s�����?z�	"Z�/h���v�n�i�S�w�o
��J������jTG�*��Fnz[�����4G5��>�h�iLtTe-�I�Pة�����H�j�fM������<.�^��.��4iJU�.�Ҕ�<�xV�f����n>��O�w������<_��|����H�T>Y�rQ�BÁ�eS�,.�^��K^��jz[�WKs���*4���L��^�r��+d����Ji|���*����ϒ��5q�F��V�u�+l�N�zx�����7j��d�s��F�s��M0-7��I�8��u�fn�lQ�MTتp�F��M��>��Ks��h�S�)�Bp��)��Ȓ�p��]ܭ��=�l��!��L�����m�[.�khݲ�amۖ�M���n��T�x���:��V�F�@�wS�:3��Cѭ�`�P��I�6BA��ʹ�Ѵz��aW�Q���e��,8lX�uI"�.a��61�;���T>���LJl�_�k�Z>fS��c�\��ɹ��6��!�9��iX[�XS�]��V��qr��D�N-�ALL�uY�?j�"Q��>F���v�	��,4`�VU$|0����)��Br 0�����e��(����}�2�1UJ�I7��1�Y�����n�� ��4����ep�?�K�b���d[�w2M�Y�28+�tc�4v6�B�*��`t�1�u�VPT�Ŧm���׀����Nl�� �$qL�V7b�gfG�P8�����X#���ћ�a{�p�LT�bȨ�N�a>�~�������d��^��[�Ͷb��Ξ�0��ܭ�ސ?���)��qugG�h������-���DD)x)��$P���D���,C�z���G�v2�I��N�_��1,�{��ć�p'�q��b�]F$�6&(8�4}"��i��JڐXsۡ����n�י�����eZM���5�k���~#����;i�+P�Q^�h�7#�~a��6���5�Y@�Db]��Cxs��Շ�X<4}�D�U�7L�Xhw ǜ��q���;m�n��B���u���&���cQ�7���Bi3a�!���2BQk(�!�}P�)S/+�+�j�nC�L���嬌��X��ew*�fM�j�D�0�:\k
_������f��2����ӥ�A�=��r�B����B:G9�T1%64�(�pM~1�޴������-��67*�K��y�^���~I���:��+jt{3�{�Ю�e��a�$<xu�͗��Y�L���|9_�������j��|��_䫡Z&�"l�����%zQ�k�E���_�47i�赏��Dkh�e�^��e:� ������0��k�p#_�/������߰IS(.�<7)�MX������:=@�t����^:�,*~�oAt�Ij�>�)LfZC^�~F?�o�$�ò�H�FM,��~�����X(�7�9�t�$<yQ�do�iD�!3��]�o���иХ���p�eԃD����hp�{j\2.|S�Ř���|�η��:=Bq���L�O�FRzbLo�H�c�b�x��Z�H�Y�;�.����=:� �Q:�jܼ�֩�2�P�H�����M��c���:ߋ؀ÿ��}| Ч����V#
S���_ ����q3'q���`KbM�����4�N��%t~H�ѹ(�($.xX�p$EkeK�e�^:?��ԒHܔ0s�74��؊�a�4��#"�r�v����3�|��`:�%h�#��+���:��z�Cf�;�"Y��,p�bF��pe�|�~T�Q~L���	�$n�����IACҟ�)���?�X�����ɑZ�����r=�y%��'��K⤧��:?���u~��gZ��e/ʝԜ$
�w���lcZ�JV�����񉆨\L��N1S�=���6!��\�q�e�a(þ3&���R7xq��>nIyEn����C�����؇[���UD�d8%��Gq��դ�YrL{�k/5j�PdF��B�M�F��W���0�d�aW�ą:�
�����F9O����3/\��H�3�Է��aR�K�ڜ�JQj*�Z9��b�i���?^3�9�cW�i��G��Xmg�ƢF�则�+(�L�h!f[�(M���D�{⤅h����pNX%�ҏ���9?^��bb5�Bw��҉>�<� I�>��@8C�';����\=��Ĵr�8�~,G��Ɯ�i�H`�aC������P�[�b""u��{���9)����]��� �'���哼;��x[���:���� �^LZ�Y7+#�_��']y�Ǘ�￤�ݍ�kr��������+hF��j����!/�ٙlӥ�-\#��S��@��2���%���$���Zӿ�e,���f�9����)�Τ�4V�A��*K�>{ٓ�ُ�b�t�i�AC#������ܿ3��Fu�2YO��<�wW֓�~���`���k%�]V@�@����b+ͧݴ���K��tFy�9*�g����W����Uu�Ɓoq�q��G(���r�7���D[�v��*��t5f��m�%�����{"(�k�:|!�q��G���l*�?DJ󒧩}I��}�2J��J�cJ�S�!*��Sq�J|N��N�Si�����4�#�AhK��x��]#4�	"f�8�ήqU���y|�)�	u~����	iI21ǧ8j�2�>*�(q�����Ҽ�{���?_D.HI;����㴰=�~V��I	��W�q����l/ow֨�|�����
�V����Q�G;L�L{��3�
<��J��Io	ӓ4ϧ��-���G���#T�><�\���Q4������A���Rڤu��Ҳ��ӝ������z�jFhőJ��8Lg�"#�R�}��[���r�3�Dt8�����]C.:�
��f�:��:�p=z멋(@�I�4DM�M�D�P�F�����~E[�%j��h+�O�G��E�Y��y��r��7P'������w��7R�^�O}|�.F��Ͽ$�_�K���Q���rZJ_F
9!e]�97xͧ��%�S1��W�k�s��}�^��o`��|����p}=�U�m���-���S�6�A�Ū
�ߡ[mi3���v�h?���ə;0s'fj��!u)t�Bw��Rn���'1��н
}���H�W辣�*t�}Z�m-��
�����`"M�7�*"`�V#vΔ\����gM�'j��W��̹��K�\���%��ڋ�������J���j��sm�C���a�r@�)@����W�����A�>�>_
Ujm����X$/e�����O�14��!�
=İ��wa��m0C*ʏ	�s�A�p��^�^r�\_\�)��ͣ��#�q��p�ַv8K׷v���ZGh��Q�|.�+N��y�<�L"��3k���F`US��6�Цj��O�s�g�Oe l���Ӟ�Y�tK2��8�!�_�q���Q��6�ۦ�S�0�Ѐ(Z�:�iur�t�^0Ԏ 7�a~�>$�`6������'_�*B-��*�@M�M̝�9Շ�#�B�0?s�_6%�ʜ���0$�t������v�X��ҋ��?�1�i�a�i��;��U�3"�^�1�\�%xa��+y�r�����xmO~�G>J,^Lǡ�y��z���*C/C����k��;�|�hn����P݊����{��~H�)�������<��^���2:�_@ZI\� _��94�X���r:�S����Q��2^@���OO�`�y����{����f��΄���������6� x�Rǀ�����
�D�����D�&.(�B�*�Z��4�ƓY�H
�y�`���?3꟰!��9�թ�����\45�]�d�uf��U�ye>�_���NFy�W�?D�QW���(-��$���]C�>!8���͆ũ3���qa�Ԯ��T�4[����I���P�+�`���&ǚ9UO���6�T�9ȃ���)��q�J� )H��� � Rt��D�"�E%�
���y[��!n�~a�?E�k��́='ѯm��2i�]a�l���C��oy�{`��q��� ���m�z;�P_"��K�2EF�Fg��'�6��Yr�*�p�8� �_��ye&�Il��iudэPd��6^Ns�c*�._�/�QSp3�xT�e(w��%+&�ʁ,�Գ�r@@�
Ǳr���`��$X9���E�X9(l���x+=EG�?zJ�8tqn�kW p�I~��L��k?7b�y����E�.�M~O��2>�W�r���a�)M�/����{��2�Hg����G�S��˫(�����+�����Q̼ބ�W �MH{���M�W�Loq;������/��H-����u)���ع ��?�?#�bH��	�g
�A����^���7B��p
���Ͽ!�%H_���D�?+��Q�V�/c(2�_V0��6��ݾI(=����傌:�$�U<5�D�r�K͒�Ҷ��W��y�n�W#I87�)�;PK   ��S���  �  %   org/apache/maven/wrapper/Logger.class�SQO�P��6֮tc�
��ئR����3#����k)v���F�)�0A�?�e<��uės��������=����
VL�vJ�A��],긧ᾎ�AВ�*j�0h��7/wZ�l�!���n��!Y��R�{�0�p}�=�v�|�;!�F`s�ͥ��L��n����c������C�[���zBZ��q�\�Q��0��>��}�j����5����%�O�!�
����{�E���uۋW7Z�@�╫��#�e�d"�&��x�e��ǘS����.]����Q��.I������>O�TÊ�gx�P�����v:���Z������őn`�&B�B�.y1;�7�S�G�
�P���$w�c�O���?�b���%�me�o`�W&�)Eg�b�*�2�<U�vD��PLG�(����*����ޢi��#��1���K2b�QJ�V&��l9\��HAͲ,�ΟӮƴ���Ze`	�-c2=&ӱp~�J4IB�����	2_�8��_p��͈��/PK   ��Smo�  ;  /   org/apache/maven/wrapper/MavenWrapperMain.class�Y|[���-���s��v�2���vpl��;�1!	/�D�s�''�Nh��-��Ҕ��Hw����Z��ޥ��] ��{Z��4�
���}�ݷ��}w���g|�V�Ӆf�ra3�.�w�杲y���.���{d�^އ���|P�|ȅ�pF~�WB��.<�+�����.�cJ�G���.,��n|L�C.,�:��
κ��<��jI\��˯O��r�)�V�����q�x\~}N6������_r����S�W]����7�M��o��|W��|߅��~�9�c��'N�T�������r�R�N�R
���_;������J�O��wN�%�'�މ?������?)��=����:�7)��N�C��I'�)��0*�v�?N<%0����@Oow��wO��O��?�Mhސ����`d�I��Ո�L-bh��.��ͷ��߿�@gˀ��@������N���JJ�Ё��N����s�k����wgw�ω�TjQ$kWK'I�)ROK_�`wo�#�u�����^�c�ۃ���C���z@��j��20�w�����`H��-4�E�r�$:̱`L��oDG�ڸӽamB�x�F��q=�픣A{Щ#�#�^`I�����LТ�Z>Ǵ�+)�j-���9��wW0�sv�x���c�"�D�lJ���=Կ v<f���
�dˋ���7C�ܲ�b�1=7������L^i��X@7��JV�kјޗ�|W��X~��3.Y�uj�Y0"\�Ә���BAo��V#�"�r�[SB(qa C�6R��Kn�]!��F43e��� _���M�A����p�+��j&$�V��rq�0�D��U�؜!b޴В�ZD7����to�b��Ko�,}�8L�t�����R�f"��
o�E�D�Q=fģ�%F~],N���6�)M�dglQ�kk��s,v4����-�m��s;��.�>K��@�s�A�Wq�U�q��[�J�ds'X�r]���%��X0�X=I����(�	E��!�Q�
E8U܄��D�T܂W�b�PQ����L`m^`���
I�5y���-2ی����Y�9����L,ؐwa�f���bz�;Uq��!Z�u����B39�A$.dҩ�-�Z���hxvy��Eb�*�������X&�3��Ev>����L��N�P�JU��U�a,��P�Z���뉕�:�yYK�?U\$H���3C�U�AlTD�*�E�"jUQ'�Ѡ
��$��<y(�,��x������`3�R[�Ɏ:����b��Z$b��a�3r�@H��ƹ��#�IZ��I�a��xr�b�g�����+����!=`��q��X��ˤ:��ӷ����kW2I��;֩�X���h�g��&.X�Q�N�j!��Գ����Ƞ���0}\4ׁ��FѤ�����8cUW<�1�S��i��u�d�����@p$�{��sb,�*v�0O��!{Ƣ�QY�Uq��<c*˰u�F<4�	�Ԧ'-n��ye�v7ęYcV=-˹���E4�8�}<!��ކ�T�%��hfm�(��2Ǥ9������k�<�L#%cu�D���VeFF�t̴�*V�$���}�UTU�[�ÖP�7̪�K��]h���î�Z3�]Յ^�hsv0�Է�ZO�u!��+�+�泸�m�#Ts���R�ө)?ӌ���!�,8��+����y���1K����G�{���85��QJ(�n�h�p�~w���[���|��"��
;����,!�YR)OI޶���k�Wg��}P�E�1��MyU��
vS�u�)g�;%���F����2V���N������K��J���!M^�1Nl�0��y���Z�j[N�M�;�f��ĵ��#��A�7��)u��尽�/[�jˇ�,��Yʫ�7��%��ς���.������O$��U�s8��";z�C�N&���u�b�H\�r�oI�ב��-�q;.�c;�αf��P��6��}��ި���z�8d����3/���9��}A��L�@Ȑi]*����q>��l���3c[L�zdk�� �X���9*�NT�s�ߕ�!��ϱ�5��`�8��p�X�x$k<��X�8���b"��^�/�����b	�-���a��00ξG%�"���fL��_;��N6��)5:�Q<4	��L����&��MAm,�,��Bi��PVw?Laacqeq�4�C�(r/�tLb�4�Ma�$*&Q9�e�<�3/E)�&8���5c>�@9�D��E+��Ǚ����^����t��rk�m:b0�;8�]-a����4�1'PH��󡹏\^J��p���x!Cu��^���������q+i�*�4V��t��%������u5	\���G��Lک%t3�=X�k������2�c�L��j�/��X���e��rK��4����&�D��Ռ�46Ș�7N�j
�܄$�&����|K�4�:T1
@T[���TtIM��W�/㗍��D̳B.Eܚђ�[jٔ@-u�zwC�Il��g�[��mIqr�ط�7'�%��	\��%�Q��l�v��R������A�$��;B�PaM�vL⊳I[��D�KU�_�e�*HaҢ����Uьf'�oe��
�樜 �����O�^�_)
{��)�(����=��"A�9�r�{�{g��_�J��6��MbM�����)!�^�:���z��?��D���FGͣXY�(���4܍E��E	\s��T:�t����6��)��J_��+L},{��}s�O���_�?���!P{Hӭ���̈́�~������3If�|��P���	�:�m"�	�f��^�������-�p�㡤;��\�w1_��z�M�[���d�G0�iT(x��{��oRp��Ȧ��Ap�*<G���Ei���NI��_j�f��~3}�7�Żi�O��
��xU��)\�aC��:�5A�¬�p'q��M���~2��bl��}I�jQ��-�ʥ%'Q�D%��ٖ�D�=��N�%} l�l��
�u���۽׮�`HV���5l�j����PK   ��SZ���  ~  >   org/apache/maven/wrapper/PathAssembler$LocalDistribution.class�R]OA=w��B]�]P�/D)��&�4&�1i�D�o�v���6�-�>}�_@bc�?�E�3m�E���:�������� ^by
�_���{h�#�>�����{�C����,~��jX�Q���-�]yA�T3݌EG�[2n���ߴ�t��?����ە�Z"5���*U����A�F��]���5$a��R��׮I�U0�V��Hv�V&&]#�P��~�V�^���|HS����ܲ5���F�;æ��Nم�*k׷Y�>޳�8���t]�p���(�V� K�0�Ǥ�����Uʚ��D���Sm_�sB�bֺ:�L,���G=�FP*��»�m������{.Z_p�g}��>�3�;��3L�!O:b�1fq�g�e>��� �V�zF�a���C֘o�5�D��Ƴ��vt0h�&��v��� vp���VH\y�o�?PK   ��S�E:P  �  ,   org/apache/maven/wrapper/PathAssembler.class�V�W=c�Y'�b;����"K�Ei!���DŲSo�c KcyiF�y�B)4e��ZhY�݅V
5iX��7?Λ�eY��K������w��.3���ox��(V�Í ��)b1Œ�qS[bc�p�bU�������BƦ8��X>.�� �A|R<�� >%�� >���\���|VH���y��� ��b���/��J _�_��B��|C�����%��|G���� �����r ?�����M�)5;�ێ�/�4$(	�ЬѬjۚ-�3yi~|�������+S���3�Ӊ��B��ϪF&>��F悄�QӰ�p��lA�p����c㣳�[�9uM3�lͺb愂gE7��Y�����\��韗�5�T;8��d!��Y��RV��y��ž|�sVtb�L�V&���Ԋw��-5�׬�U�Y���rԷ��Pd/ ��`Fs�rr�,>��3�e=S�Tq�B�="8��Sն$��ӹ���jk�� 8��qOl�L��Y�N�+K������ۓzߑ�)�`e����� �M��z��u�սߚ�l[�hczF�	�<%[K,�ٌ'�S�ii��۰8"Ab�UV�7RZ�L��v]�Ì��n$ռ[Il2�����5m|���M��p��Ȕ� ��:���-chN|n:���9+[)�mϳ0d���h�	t�ӻ?G�M�����`�4q��ShCↂa\Tp�����q�D�u<�`�+�&��Ֆ��(а,�H-����Mk���	���$%��U��/�JH��+���� ,�F�o\��L�);~�im��2����Ҧ�w�=�Fr쬌-��
�������v�J���#z&a8ZF`/	�a���$�p�*�н{:]0=�U=�5�t�0��
�:�����jH�~��P�Ɵ��[
�
^�w���b�V����T����'�PZ�d�M��E:��ַ���a�jX���a�{�)7��}�9MD�k+�p��q��=R�j�E��+\i¹��P�A1�s'����^�м�d�y����p��_��T�H�j�ܲi�%��Np��E]�<���I	��bX�O⾣3 ��7=}�~1?��|Zuh�)�8"�������w�I���>�=�]��u1o]�Z��A�imcjY����$6ۅ����I��+3�rAi7j֮��C𵽭�i;Z�#�e2���>@�q��nG��؈.����r׀��W�������/��ߗ��o�� ��~�k�����%J�����_+x��B7(Dco�a��������NO�lIH� 1N[�MI�'��nEcE4��KFJh���J��mC^�%4o#�PBwJ��\�|\�8XB����C{tC{t]i`����]M]�ڷ*���;��f�z��!�1�e O���*B�⁯�x�yƚ��H�no��1J��a��w��R���h�IJ~j�mX&z�O|�?%��":J�i���������mtmդp��sQE��T�]�+	|�a�E� ^te���9꾍�$�gr`��c�8��#�w�nqb+�����I���]��	r�K{O7���3�����z��.���=��������Q�'�"��
�!<�_�쇴$�5+�WyS_{,t��3�=/�)�k�)"�����r#{��Z��E��Kػ[�֎��dW��T��o���N|���>˛�f7y�O��:s��l�=UDt�{'#����}��,�JU��+��R���>�f뀋�����?�H8�R*�y�fqc�35�"��Ѱ��6���m����D��-z�!&Z㡝�x�n���q���q�U�=V>�L%Q�r���W�"��^�L�f���?PK   ��S��+  |
  6   org/apache/maven/wrapper/SystemPropertiesHandler.class�V�SW�]Hrò�CCi�X5<c��%�EDZcE,�]�5YHv�f#P�ڧ}۷���_��;�F)3�{����a��@^Dk�p��s~�}�$����o v㺂6�sL(�����8���d�T��������gl��S�<+ɋ�L+Pq΋���W��V�D�1!�y�lZJ�
b�%�S0��'�a��Hr\`��n1T��O3�����&�b"���)m&N�����5K�ϫL��S�!ӊ����@B�(����%��
��R�H��Lz�u�:��qa6E�]*e���i��n�ql�>�m=ג��Ս�m	-��+ɴ��Qx9���ňHںi��r^,Ɍi\3�RӍ(�xB�)+g��l��X$��HƠY�tBv���3s"b�|c2�����Y1T�"�()Y��,�dAQ��b�h��m�(퉬((ՋZ��\k__����Y�"�¶�'��ő�i�A氝�Ms\d�
�QC���yxcٷ6�VDd����ꑪ*��)����#Z*F�(ZXd�\��M+iqIū���5i{S��bh�~2m�zB�J�N��Y9p�F,˴Zb�h���,�Z�S�z�b٧�u�!�eo�-����\�{�=�� ��]��
��*>���aQ���DE/>帪�3��_p|��+|��\�����1����6�S�F��5�A-��Z�S1�\Ȏg�F�^��d�8�m�[�����&;K}/8��d]��E�KC"ܑ��"��A�n��9l_�Zmb������f�E��_$DG�Be
���#f"�T�!���Z�aa��,ꟃ�깲7���!�SLKM�EB��(�/�,wz0�Yaq!-��(n~�����:��ƹ����Qk���-km)�JFԎ94F4*S����QI�İ����I��A�U���Et;=�dt�;n���w�8�6�$�f��*t��P����^������ۨud����[+p�3�>E��]�Tѿr�K^|��7�:�uj���&�Z2Q�A}�ml�[��&�2h\FÀ��Z���8$o>b��}��3xl���d�r�}W�p���h���.��J�e�Vb���;��P�$�C	�`�s�ЏTSZ�g�Ht'��G�]�.BH���{������ُA�|A�Lb��p W0��8�k�����gs
;M�lCY��X�h!k�]C3��4�X�B^{���l���>j��|���ŏ�K>�?�� ���P$����j벨�t{�8}���:��ɝ�c��9��8F��K��-��c��ȟ�Gfǜ�8JF�9�пPK   ��S+k%��  x	  3   org/apache/maven/wrapper/WrapperConfiguration.class��]s�F�_�,�e'��$mS��iڤ�S'�!�c������X)H�$�IS/ڙz��E@T'g%�A^.z��ݳ�=��]���� <F#������8^@�c�70�|n_��!�W|�'�u�|Z��J|(˨HHkņ��ڬ�*��~�P�K�߲s�v��V��m��-	s����t���%��|�Q*���/UX炽sjf��~� KH���uav,vJ1��CYO��a���f�Z;ܣ�R��;��C�
s�$ȿ=��|_��a��:�Dv�S�OS/��'�}�N::�@��:uf|8#��HP���V��j���za�^O�Նo�?���8�5-�t>}y����N${��͠R�a������X�R��p��l<(���͇R�u[�o��#
���+J�7"����)�xе�3��w�0gtQ��vKi�-�:�s)���6�W�$,h�B��8�*��as�-��Q�!�2��PWpIXJ�@�"�?����8z��M��ժ��U���`�M���G��s��,(X��>�]����O��-w�U}�z���_7ω[�e�%I_�v,��3*��c����s���ד���T�y,�i5�iZ�Y����{����'y�j�ٕ��vͳI�A���{�� �D���_�r�������%���<��r��%fs��K$�yқ����~B�*���P�y��9�_Gx�M|J��>�}�Ed�,ߛ����oäQ��hD<3�#��)z�G��
)�y��橗�d�3^7~��$��<�D� /H�M ��lR������ *���q�t�5i�'���~�/ �a���1��̆A�HS� ��]u�n�$y#y"I�A~"Ms�J �T���� ߈A�a�3�@V�o� �0HW�$�I�L Y@�<ͳPK   ��SS�n	  �  .   org/apache/maven/wrapper/WrapperExecutor.class�W�g�N���,�i�r��9V�IhiI��M��"Lv'��fg;;�Q�Hkk�zT��K�XkmPH��œj������~����dw�,G��z���<�;���^~�������x8�G�(�{U<FG�PpL��O�c!�_��� >F%c���psp����G���>&�?.�O�'CxJ�O��g���>)�O���!�	1|&�ϊ�sbxN��>/l>/d�F/��(V/�՗BxIx<��������*�f���L�Tq6�[�U���0��0^��!�SP��3����6���ӽ{��kwo_OoG_���H�^}�K��Xܱ���:U�V:��ig���
�Pж!��Ӱpgg��xO_G1e�X��-�Ŋ(�me�1����9�L�z���qv�k�����]Nӊ����n�PO��䜼*�L�H'�!�X����戂X�e���5bc�~#;`�d�c;ܹ]r�l�1�4E��-�n�5�F��hه�6�����UW��q�H䨒��V�A��2�FwnlȰ��q�VBOm�mS�C�瓂E��S�[�YU�����O��v3m:��Q2��[�D\�(TV�#wL��3j�f�W�[�,`_g��*3���mc��e����T0�a�k5m8���Nq�Y+g'
	2MaU��cY�  ��'�Vk�NQ&e��^_>��*`!3͂2��<��L3�c:�MV��o�ZG��ɌdS����S���!1d�f�=����u��J�ex�,ˡ�zf�.b�m��"�n�����V��j�+�?T��e���c
*%�k�p�"�ޅ�`oh���U��׼�s�[Zn+!w���ư�KM���~1��6���m��63�%k��p\&�[��j�E�P�p�5E�yLf��]��k)�Z��͗J{A;/���| 
q��Ҏ9f��MA��Q}Ay�0]�_�"��>iq���z� 뢅Q��3$z���=�.~_A�*[q����а	�5lA���j؍=~��d�W�mz���#�X��x@�O����C�
��	�v���j��� �b���� �J�K4L�n�RI	��F�J�f[c��Ư5� ~#����{�����$g�̔�����FG��B���0�G��4��gx�?j[�C�����4�������*��������V�����3Z��8�^{6c$�a�H֛钁N'H�t�>
��C�J;�A��%:�����;��l,���>]���b�����۝������D��wJ7�Kw��R����d��y3�;�U]�̈�$�%MUgK1�)|1�{&�N3�
����K�ز�M��5�\2�J����E+���i��g�/��aM�=�Y����c�d��)%�o���O��&R���JO&��L�Y�'R��W~�K�&����Ά7��_���c�גae	���E8�z�+��]���X�ݝܕ����|�E�o����ͷ��ݷ_��h�\GD��3[����9k�مm����OA�B�`4R>������h��:.��p��Њ^�\)�U�+a����n��j�N �M�r0��Y����Yh��:'�F�̕Ks�9�`���!�6{���k6.��:N|M]���yr":�ٴ1�6���h�D��gPm>�����Inl:���i�'�`�2�HL����	,q��ܳk�ٵ��u�Y�<��=[�-�g�O��5 !����Q@P���s���
<�G9���a.�Np��n�|�]-��Z����G�������b��a;�wQ��p;q�ϲ �&"pI�A]Ă�A	�		�"W"c��J�Y.�E���ة���T��x�"�����^r@�.'l]�r�k���t�����@�xc�n#ҙ$�3���L۔�~�{N��:���AyKU$(�+�-��ɐ<��r$�<���7�S�yo���q�Z�C)v$K'r�წ�C��U�9��b����q-++ITI�5���M۔�Ʀ	��tw7�G׷��]���Z"q�IR�IKk�6�]8�$�5�HkEsm�dU�Im�9d7�#$��s��jo^K���ɭܯ�:�wc[̊���$�0��^<$c�'_%c3�W¾+_V�dF��oE����`�ʻb�8l���W� �Y�/Ps�K���7�?s�>���@;�������FBލ(����c�|P�?���c޺Y�"�ID�\뭼�FqK�N�5���i��3��g�%�g��"L"GZ�0��K@#8��*�\�i���O��t~Gz�#��W��
�Eq�}����x���B���G��,U����͔
6�3��M�Q�B���S�$��<���Ƌ��K�`�U�7��3(V�⪌���z�aT���Q�� IG���z�@��}���7b�(���/⺼u�
sX�?�PK   ��S���  T  ?   org/apache/maven/wrapper/cli/AbstractCommandLineConverter.class�UmSQ~�,/n�f�����+��Y)��X�8C挌3}�n�,̲h��~�}�������νK�@
~���g�9�s�������� ��W�"��bi��oIx�Ĳ,��A��"����e[n��O�1(�}�a�`��v�Z2�"/U(2U����K<���{`5���S�y��^�G��;�^7ݨX�z��:�p7j�*��E덚}d:��d��w>������ms�b6O���a������n��-J�DW�C��4\*R�S�]E�`u�4L�!s1�.Z;��jq�u�v]ǲ˒���a�]�f7�x�0�k�m�6&5t����6~1U�o���`].�p��ё%㵁_���@��>��3;�Od����=N�l�x�n��6�D���q/�S����>����mu��ts���h�5�0�3�G;�a�b-�,ra��\q$���a����0٫���B\F��f�)7���v������VY��%Ǵ��]�7������eo�ij"���*����,Zo��:Y&���7r|��5 ����5�%�&���:��et��N�;!�#;�c��{�%[P��b���2-��˂��J�@A�ڇ����ߘ �&�eE:Y��u�|��}< o%��6���N���-�N{6����j��J�c��߶�6r/޼�[h�}%�������RB��"y�SB�]fH�%�B�j;,�m%���	-DyB�d�)�hmk��?��^�OEL2E�g�~������?PK   ��SuΧ��    I   org/apache/maven/wrapper/cli/AbstractPropertiesCommandLineConverter.class�VYSG�FZ�Ҳ�Xl���%@F��6`��#��v���"�]ewő;?#U~�k�"����s�O��ճ:@G��"UM����|�MO����?���$��=�%�"Λ�FB�,�xw�-�xGB �$�����x��Xj��X��#?K�����+��!o�r'��U.U)C۸n��-o��A�2S��L�6�Ϯj�Ce5C�P�T�̢b�_R
κn3�$L+Sr���ŲʖfĶ-%�Ӭ���c���c)��`��rt͞2�Y�H�E�Lc���5�Lke��������HbC�Rb�Hǒ��i2��3��E�h)��c�j�%��4��tޢ �D^� �Ų	%'�-�~3\>�l�k�`4?��m7���a;���`����gb�J�,I=m(��h��x=���[�ET��°p?nX�X�j �C��LJ����v�L^���Y�m�����X$�>��z<R��w<�k�tW'�n���W[d�X�Q�M����Fg�P��Z1
i�g���&ᴚ��n~uCSR/���������JH��1�R�<H)i�-U����l�Lq_2N����֯�7pV�9��.c �����8�G���㽯��Y�ɭI~$�e�##�-J�ؑ��;th&d|�O �S|&�s|��/eDq�2����&��P�n��=t��a�I�8�8�����f8���0t��KT�q}�� 7�p����� U��H�v���l:�?Sw�}�:/��GZ�G���Al��.��n�B�Q�a�땜뮚P�E~��sڎ㾂ѻ�p;�n����5�p����2˓��H}Ik���<?;�Ë�>vFz���N��`�"Q��b$�F�7��;����m������ �q^�\y�$�sI6p��4G�^�}?���(��\H�|���f���/���@�Ez�Fh�~�<�"8]�VD�~Eh��]'Y�l�5�|�a���G��C��&��Q�K>�\N�AZ�����h#�2���^���cs�����5f裓�<7�^!�U@�/�{�`���=����78I=o�W��^!��.��}��\t� R;BQ_#<��̿�IL`��o��G�E<L�>���U���
;+4ԍn�ɇ7+�r�i��;�EL����[�7��NC�]@�,�2�5M�ީ˗�k�m�/]���TigF�Y����`�z
x�e�RD��<%HӘq�� PK   ��S%��S  g  ?   org/apache/maven/wrapper/cli/CommandLineArgumentException.class���N1Ƨ��UDQL<�A�`��������ƃ�ei���v��_����2NA�ă=L;_g~�5}�x}�K8,A�M8p��B��s-�H�j���22�~��:gC��sOH��E#�l�R����!���K��NDB��)P3�iĦ\ҙfq�5�CA{*����������q*��p#�$,�3~y"�Z���2�h53n���ϲI��J}�i��	����(Cv\������<f2_]B��Cf倘y]̺��pwZ�9�{���d�V6aO�E�[��@��aX;K�=������s���cӉ�5e+����Sv��=�]�PK   ��S�$5H  �  7   org/apache/maven/wrapper/cli/CommandLineConverter.class���JA�Ϙ�i��?��^�$�+BXA �x?��mdwvG�ٺ�z�haYr�uof�|��w8�}}|@N8r�����b�R���6g4d"��
%��62ŧ�}��޿��(��'*S3��m�N��)�E�v��`�Ym����u���f�k�wW��2�,a�+҈�Q�7ɒ%�CN����G�>��j}���ݗs�k�ӕTt^x`~_�L`��muv:���P]kv�x&}|�v;��z� ��Xth�#m$P�mH�&/�V��J�]&@� ��T$�E�*�WQ����[6�R�(U�lY�m��X�]��A�ܗ�}80��PK   ��S����G    4   org/apache/maven/wrapper/cli/CommandLineOption.class�V[se~�I�i�=K(��4i	�A��Sr�Hm-'�$�B�7*�����N��B[�q/��O8��p��6�4GG��~�}��{��}�f�����g!l�C�l���� g��0�ǲ|\Vq%�����|���!�U�t9K�YFβ�!��DNn�0��-�U�V�1,����~GOV��L	gBAO�ș�S���]�o'�˂n�)�6���Qfh�����,�/1iC]�TA/�2ؼ7���(gl�%� �
� T��3V���YFdE�]�/��Ff���\(�&�p�*��C<�[O������R�a��J1-��Nr�2zaQ���6�����m��e�zI��E���f򮭗J�Nf
Fr�JWbϻ�M�1Qm<���lǼC�{S���=���T��Ed��� �$��p��l�!6�b�=�{���z���o0륫��A�M/���l0�Ƥ�*E�T^��#�c�����Z�#��z�lQ�(ts�I'+F!+�	�T&RRCb�H'
�n�R_l��R{5Kh�Tu!��; Hg�K�͝HY;#N�K�I�$U���������y�U�6�����C��0��t�e�J��s*�Â7+VqW�=ܧ�u��L�=��١Dva����9���!�������a/b4ɕ��ϽOq\���km����-�a##��fm���n:��vkqM��hl�a��)A�m�:k �XtŜ��S��;4Z�JI��Ǔ���~�5V�' %K����'�2� ̜�w��U�-6�o�AǪna'd��-���l�;�G��֯�v�{�q��S���E��W��?�c�'P��е����?�{��S�
fǞ"���rң����?�?��.,=~�����c���P��j�I,�q�G|��\��}\����|�p����m���4�5�՝��|#�^P�O�!�U�	�I����6�x��\��n��;7`�-��<䲨�w{gWA&�7�w�� ��#c��H�ň��ȯ	� 3ֱ��B�m0�vǉq�-�1�SZ��6�9�F�Bȓ^�1F˃�xb�-�gҌ���z�b���'Oט�g�S�g�h�9��W�a�c�9b�U��B���U.%"�;q'������c�ܐUl�T}.�#��.�8�h���m?�Fp�ԯ��X��$z��Ҍ�b7���I�� �O�nUSi��C*��ʊ�i_����Y9�C�vy�;�s�)�T�����1��ok"��,׵s�C<趶�︄<_��� �%dD���:��F�^q���H���y�A�xo���<zjܿ�M-`��:jjͻ�m�i6��m�?�F��PK   ��S�l��     6   org/apache/maven/wrapper/cli/CommandLineParser$1.class��M��@�_�'
f�z�N;xQP<A�)bB�;t�s�Yx�9���ҕU�{||���+�9F	��t��^˪2B�.\Ӱ-֕�� >����j�Beˍ���H�fΗ�[�GQ_Ī_�m+^iS���7a�c����$��]���j�'B��4����t�"~=�c�0�9��F�@6�PK   ��Sd0��_  �  I   org/apache/maven/wrapper/cli/CommandLineParser$AfterFirstSubCommand.class�V[OA��T�

����ԻU�T.J�(J�㰬e��6�E�#���x��5^H�o&�&c<�[���,B��\���9��|���3�Ӹ���zz4"� ��!��Y�s�%��K)�+
B��@AG����֙5J�C"k�yU�6����n���(u[�
�����9�5L}\�%�N��e�4�^�ݯ��]��
�T�$C0c����0�0?�۷�t�(�YK�Iar_&eb��w�4�3�0]6��n���)�RI'���GײJ	i�%�Z��,vZ�#l'Wt�����=��t��l{vN�jA�yu±3���t�ͪ�ET#�,q�u:˕�+�Εi�'OC&O>�{�������������m����z�dH�� LX���c[�d�e��hƮ0"h�c��ø��n5f���i-�k����Xa�A��+��F�qֺ#���:�P�r+C��a�!�p�?{/������ٯ�����M��o��h:O��\h�^*E/$�Ƥ}_�{��8H�XE ���C[%(��t���[I�I@��oւ�m�J�� Mm�ؔmֻŠ�相q��[��Υ�{�Q��5���E"�iU��|@��Ӿ��p,��X��=j^�>�$�=��!��Dk%�c��0�h�țg���9{��;?bG _P;�����Sq����{�/-C��r�M�;����ܹ�,Ci��34��ha/e��pb���p�8���\��U��N ��d���u`��8�6;��+�p��wj�)���_qŉ��∻5��Nt�5�vm��Gs?�m���^���HPA�4�#�$.@~���L�ͽ�_�$2� �4���PK   ��S�r��  0  A   org/apache/maven/wrapper/cli/CommandLineParser$AfterOptions.class�VmOA~�Zz�ZhQA|GE��r�*�QQ�IE��~[ڳ��{��x�/?�o$����Q���YNZ4'!�����<���������+�	L�q�@C�$���㒁X:Fu�1��n��E)��a4�ʲ�k��l[U�jkM�Z͖V��X\����v�C�#�&��P���C|�-qF�W�K�|̗*d9�w��R��Qz`�{�N�!}��g�G5�q�Ra��
��mRo�=�P~Jr0�Fe��Ւ��q�5��C�|�[.�֢'Q�~�㲬RmYd�rEB�8COCn�ҢG-�An���&�SnPM���][�|�U�=̫c����Q)��n��G�@}=��XtWdѾ�^�k�Qo&��j��F'�s�����]mڡ�%�8��JWq�af-�0����pk��H�LԽa��G��#Ѣ޵;��ܼ��e�dH�/��{�xe���+`�>I���%����h�����9�4�S&ۂf�> �I��n���t�M�-2d�k�#���/)XF�!��S4+/-���� �cCkbhd9�c��X��"��ψ?͙�Svl� ��4\��� PI�I�H>�S���fC��>"an�j�}C�}�j4��rV~:��K>�?a��6wd�:�a������)�,������i� ��I������|4��L��y@d��+`�"�_PK   ��S�/2#  �  J   org/apache/maven/wrapper/cli/CommandLineParser$BeforeFirstSubCommand.class�W�SU���¥��hQ���I �($���6%h�j�_�e�Mv3����E�������:T?ޜ�������	-K�_��{���ι�c����+�I�)���!���`��3
2x-�s���y��mQ��;p��u��UЉ+K
�X�x��M�vwͬ�RY�)%����Ɋvǰ��V�NR/��y�RѬլi˚S3�4�͘���0��A?��cZm8��� �۫�AXZ��V,%��u�|]sL��eaCϜq�v�Eө���b]&�zɲg���j�-4`��X�IX�a}�S��d购��9n�ꚶ�q��˟��i�%�k��[�-Y֬R2�:�UJ7SF��դ��4�$��$�"���ɝ��ߠen����`l��jpj��q����%���W��"�C�4��y����^�KwS�3.>��0(y{��)RER�6�[Uq}*zq��Ԧ㶄��T��Ǌ�x�a,�M�x�1\��u۲7��rl�-'pR ����n�)�W�]���X<QW0P���2��)10t�64��I�\񖡻E:V�~����{��zCh��p�I���`}8��c���ƹǭ[T �&K�@��0�U������F�6x&EE`6p��q��f9I%O��]��%�e8�h���6�v�L	<���pP+ﺣ�[��)����v����35BJ��F�jaэ�{x����8K���nO��A���¦��7�C?�,�f!H�_��YZ]�u�F5�R,��D�;ZKx�����m�c��'x�h��G��'��fԅ���"Nץ����hlA.�lmK� �G{�'p	��cZ����O>�-�[P
qZ�cį��Bg!zX�G
���}D6����qb�O~���=�(�88����~�~�9N�/�`_";�2�ڃ��l��!l1���0VC�d��{F1FO��g��7�)���ȉ�uss�+��=������COq�g�V�	�QO1�˞������O�^�q���M���D��,^O��4!DE: ^Oo�����3��ާ�Y�PK   ��Sv��`  C  T   org/apache/maven/wrapper/cli/CommandLineParser$CaseInsensitiveStringComparator.class�S[kA�fs�6nlL/j��K���n[����@����O��tj2f7�w_����K�g��gv�JMU>�3g�s�s������ �����&̒�]�ܳ�l�%U+�M�d�Ő*���u_0L5�ۃ^[�]��R���=���Z�}L��2`X��@4T T Cy,Z���S�{}�y�k�����.A	;M_w\��ޡp{�X(�����Юו.e���7=�p�����E;jj��<����r�qcdm4RnP������t#����s_00�ɷB�x���g؞����F#再�K��^3�z�ư1~.�dKvF��?u:e�����[T*���O�{n�n�$9�ႃU���2~/�`36H���{�p��1̜7�ڸJ2L'�k�ot����a���fn��)�au<2�ͦWK5��aEi���%��f*�`}$�B�֬	Z�q�|'`
E�̈�$kB���+'Hm-|@fah������R� �7�Zo������GU+qfR�x������L�E=8���Tg>��;VxB���Gt�"��T�"�B�	�ÿ���
 �"��Z��|�b�i���"��p3�����������.�<�xa�'PK   ��S�	4��  ?  K   org/apache/maven/wrapper/cli/CommandLineParser$KnownOptionParserState.class�X[Xw�Ͱ0�0I�&�@5[R`�,�6݆��pIK$ҪͰ;�I��uf�x)����5V�U���K���%{�m��}>��/�>������.��͂�����o��������z�e {�'�(���с3��!�+�<�<X<�yx��%8a�22n�L��|.��|�2>���A	����N<"���|\�'�I>��0>�+���g�9>/�Q�~��� c%|QF=Ra<��/���0f������I>�U��k�.�)��v�vm���MZZ�B�>��힔�8�#��~��ii-1��&�)݌M�Z:�۱Dʈ�X�����7L��f;�]���Ae�<m����@w+K�o���\Ɔ�:����E�|��yA@W��Zv�5��2l���3ڔ˸F*�o8.���flS�j�˟�4s<X(���	ék+�F�>|��07.JC��7�l�h�F j걒��>2�����X�V"�VBK�h���`1��>nZӦ��
9Z�:�^�ev��I�t�hX��sͰ��Y�\�&:�8;����ofD5��Ϲ���x�5�<���4g�%��z�����,���M�~(�������$<-������� �D�w۽�ϵ���C{y��a������V�N�w�o�kδ��*�GA/S�
ض�9�m[;�铷����*շ(�܆�
�p��w�p�z5�9h﹄���`�%E��_���=N���tG5-Wu�����j.�Z�,����=Az~�ce���9<O��T�ɴ{>M��5m[SFRO�X�����V	?P�C\Rp
'%\V�#�(�1F$� �H���C��;$� �pU��s���z4W�ż�+
�E<O���'xI�ˌU| �r�	y�:���u��R�+�)[�g��
0�U��ᗸ��W����O���nS89��
^��<�F�Μ8�Q�z��d���B�~��~����������?��++�`�����$;��?	�\Oj�"���\��\��j+6	�Wla�!/��'5�e
T���W' *�JoU�j��S�9�Nx���~��iYK&W�Ή���Z\	"�R}�N���|���G2�^NPE���$`�hˮ�ևM��H�S���FE��u��
@�ߍ��i��'�r��P �b���Ů�Q.s���=�X�44���R���\.^�a#r�+.�B�H���#�4����Ƶ��`%�K=a�=dTR��f�^�Yy9�C�}��Ѣ����a�NG����_O|ɤ�j)؉_�R\u��A�t>�Z�,���*d�4�R�6��4Ù�����-s�
jT��@"��.��R#�}���'A�a�E�TVrs���ע�c4{%�4G�� F�y�D�G�ʢ�s��-sGkBs(��Ъ|���G�.HD�B	Q�����b{�r4�2�3�(e�8���XoѣX��b�C�ڗ�v�
t|�����hO��E(��M���y�$���+�2��W��ؚێ��&��i�D�"F�/���lq$q+i�7�Ո�5�k�T���/�	�M��Ct��]D�d��iZ軇䅳��EK^@��YlZĎQ6��K+��̆UT�7B�<���(|�wVPi��@Z}�P8��\�2^���F7��}�!�-����,ꗩ����!�y~�����ko@��#N��Ι`W�݅AY�*`�y�`�UD�(�U�4�ԒEݳ����f�Ut%^�͋�'m�4fenY4E�}���m�籫�%�,�.�t��ql!S��kt���'�o���L�]�(�1+ށ'�CxF<������{�W�(�.��X%^�q�E��.�F`�8�0�{w�N.�&�K��M�Kx�?Q{��JP@�7 �&�$�,���R�)��py%��?<���sy�Tp?��Q��S�!�`,1	/ĘJB����q��\���v��� �/g�O'�Â*��A��!��7B� PK   ��ST����  �  J   org/apache/maven/wrapper/cli/CommandLineParser$MissingOptionArgState.class���O�Pǿw��*�?AD��DԨ�0Ɖ$L|���Q��.m��|�D!��g���O>�_a<�-s�^*�I{ν�~�϶��|�`�:R��H��&���a\Sk#J2�Mb�A��e�$�����"w\�,y��#)�3S�+\�e۩���+k¬�!�M�7�1+5˜��u.W˖e� r�|޶���e���_fH�ثk�2\X���_����]�e�XJޚE��<�\ג� yߩ��G��-������A��{�3W~�7�Y�j.y�ο`�s���=���i�=��6�6У�SƖ��u��3��2��t���-[L��*�%�_N�:��LJT¨?[�W%ue�`З�u�"�-5y�lFTt!�nt3p}&q��Y�3p�IL1��`2L������ed�����y)��_ݟ�FM���9��_�����H4�{��/5���$i����n���g��v+�#�Ej��A�q:��+t�'h�70�I��K
��:��:B�Bq�7M�F�`�[8Z���4���Ð��S�,�C|��mho��~�������qJ�I��|�!�N`Z�)��~�ϖ�Mh�� .��I_Q�����q�)����a�˂�p)�̒e<(��־`>�d�Z�!��J��+~FW��9�D��S��P��z���%\ }P���PK   ��SoTy�  �  K   org/apache/maven/wrapper/cli/CommandLineParser$OptionAwareParserState.class�U[OA��-�v�؊P/xA-
-����B�+��4���v-��n3��!>�|�AQ#�?�e<�,X�,���9��|s���_��0��$RU���]W�3�byL(��B����"���i7R��ns�Q�l��XqDS�n��z�����!x�c
�hY�
��X�Qf�{k��+���;gٖw����x�!��4�i�X��x��-�T��j\XR�1y0�쳎g9��A��=�k�m�-�&�=
y����T�L����$	oۇah��s����^��e7��/�\4%�}F������; �=�W��/�~����_=��Ԫ���d�jf�LJ
��h8�[�qB�m+���.f�5���BHj�/=S,Y����z`f<H-sS���a����^Q">`X<�v`�=�oQ�a&�h��aIX�N�L��5j�h,����V��G���ǌZ��麹�"]8ӡ/92���Us�z���:�<ŰQ�zI4zc"�3
d2rjIE��} �H��G��L��	�g��Ol"�9�Œ�5��5���!�e�F1�����!�s�gI�^�|�+bw��d�{p�8q���3\�H���>߫���(A��ʾ#��-(�R�b��������~�O+s��yH�nO��n�R��2�DF�(�B.W}�9��5O4R�(��E��\�ɧ��I�H�:EIf�Z$� PK   ��SŃF��  `  E   org/apache/maven/wrapper/cli/CommandLineParser$OptionComparator.class�T[OA�f�eKi�\������rG(r�ѤISLjH�m(��d��l�ȋ��!��Fó?�x���J��ڴ=�˜��|���+�䢈c2�^�׃)�Q�У�Ŝ�yQD����e龢ቆUk]�e��Tz�A�����F��D�Q��+�g���`����CʾRu�:Cb������5�p�vby�N���� ���Tt^���W������Մ��MC��*��eїܩg�j�,�VnJT���v:/O6�:O��&?�04�2x�fT5d���!?�ɭ�^rêd=�$S-Ɲ�CQv��t^�,]���,�r���,�|�X��Q��ې��N�a�?��tdT(Z�NY�0$��ۚ���bH�/�u<�@�}�O��Њ���Ym\�f[�&�_�!C1`9^y�.���G�����x�0�g3��+�F6���2o��� @�&(� �z%���K�[�Un6����C���&��%��c�J:�;C:�n�����_�vM:O�q�izZ��V�H��O�N�O�A�D����J����<�Q&���da��S��C}�����h�L�jM=GD���#�)�'��z"���H*�U��~U��Ɲf'˸K���=�Ql�v�85�M�=�[!�E|r�=��"v�#ƽb	����U������.;c�����&M�&ч4�825J<}�d0Cr��"F PK   ��S��+��  !  F   org/apache/maven/wrapper/cli/CommandLineParser$OptionParserState.class�S]O�@=�[�PVX�O����tQ71�l�d	�͖I�N��,�|2���_�?�t7!_*�ùs{�9��??~x�����`-�:��Nie����1��秒�8PZ�4Gb�rgy��"=F�����3U�
�r}(L)��
ˏZ_�������L�8�M�B�g2�ą��W#�B�(NU�ϳL�S�:Qټ!�#,�Kc���`� ���\��[u��[��f�q&�%v��BD��I4�F�wK��D�Ϣ����O*[�,Rie���ݺ6/zn���]������|lb�I�}���� Z�A3���mw�о��`t.c����GKح�ф�z#�:�=>�Մ� !�U�H�3���}���lE�&��׭	!� >�,U�����^��o;惩�Fo*N��L�z�G���������O1�Xdl3�w���_PK   ��S��ں    A   org/apache/maven/wrapper/cli/CommandLineParser$OptionString.class�T�NQ=�lY�R��(
"H��l(*ȇ��A�b��e�)��n���>�O�_HM| �8�nA��aC�Ν�;sf��������),���Jb\E9a��Pa����BAN�I!�����(x��^�!�����Q�N�X<�)�2����vR�l���2�q���Cl�-Y]+�c��V�,�-ߪX��k���laם�`���5Y0�!��X�r���E��W\�l�7�-���,����Z���b�n�ʝ�(��{�卜E�q�e+xj��
��ʫT�j&�l�����_�lN�C�D���
1l��v[��E>�(
1�0�:
C7M��G��{��oM)R��]ϴ��by�"E��4��-Ĭ�.�h�|��0��}���ڕ��i�ǂ�A0���P��0{�AR���m�Xfp�uUh�pz�2bs�p/����6CO�G$���$���\u>�������I�>D�{"�����q��=�dm���K?FT?DL������<bl�lI��^��i��u@j���(!��V/�K�ӿ#����+~B�<FB���gtA������s���=�	,�L�����>n�_Ad���[t1xڀA���G��O��^�A��H)1��z�Ս	d}<w��������!��(����$Dh#E4��]�5tF�^�l�\g�:���Y���Dh��q*�~��_PK   ��SK�+ة  �  K   org/apache/maven/wrapper/cli/CommandLineParser$OptionStringComparator.class�TMOA~f��º��P-�"�ٖ/cJ��QӤ�I�ކ2i��fw��/*�n^z��&F��&c|g[Q,j�x�y?�y����/����e��֡�ECRÌ�r��aNn�45d4d"+�m���dj�A�;ۂa�h�b�Y��C�U#�P�)��&w-iw��_�<��F÷�他]�;�w��F�����q���Wt܊��\f��
�|��FC�f�f�Y���,����p'Oϛc�ʁE-L'�;|��5nW�62��I(�	�e�,]���y�ī:�O8���A�h���'�y�3���[;���=��
^J�:z6'�Cy�a��=���dUl�7%G+��[5�'�+ݼ�R*��4ݲ�kɱ�]��d�Q��ߢ�%��;�sOlO؞�[���&��!�OA�!��w���;��M$��iL2dz=3�j5aW�j�����z�:��@�"���L��dx��;R��N�9b�m �b�$�Dv�?#D~`-}��z M}5�:����&�����+�ľT�V[�>bG�	iQ�PPx�~LP^`@y���
S�>��kd�7XP���E;I�<.M��"i
5��Q\��	L�2i*i��q�}��ګ[�q�:��$|�dt&�	�,}��k���h����':In�T:���	�����qWi?�k~�9�s$G�ߏ�H��XM�B��PK   ��S4�  2  @   org/apache/maven/wrapper/cli/CommandLineParser$ParserState.class�SMo�@}�8qpR�Z�|�RJ�и�8@*�T��5�=p@�$��U��6n��ąH��(Ĭ����%Ԓ=��o޼�]��������Hc�EkY�w��:(2;�򣗄T�r@�wî$,6|%������D{��R#���оY��v��G�ܾ�#�[��8���Ի1I��i��牡����c��OZ�R{����A T��KX�'��B ��%�t�F~�K�ơ8�@��׊��z��B��@RB���)a!Tl*�b��?�Ȍ��67U��B��������C5y��6	���>��+b}�&<�?���#ݑo|sw��05�w�|�[���j�Pt�Ex�����h�}(;��E��=��I���"b�Sj��٫�Sg`��x�%������c��o������v�Y�1Q�mBR�,�PWK�ﰿ��y�,'��&���*�	�p=&���n����k~�+�8��ʂ��=N|���5�ܜГ>Փ�܍�Vc�=\f���l`�v9c���2�B�/PK   ��S*q���  g  M   org/apache/maven/wrapper/cli/CommandLineParser$UnknownOptionParserState.class�V[OQ�ζۖ��@�*��Ka��\D	�BB�%���MYm�6�-����A"���?�8g�)��`��̜93�\O�?~~�`�5Đ�І�6�F$1%�c�1�T�Ԋ�=+���U�V,wM*�%!,w��+��0����yn�2K|����e�5sE�\tJ%.�˶�j(�`�!����67�\�5ϵE���c_��?��Q�� 2gۛg��>��*�E�̬3��<��)MV��M�}�7�������:wmy�ao˦�����#^�=���a�Մ΂�Fu,��,��j�M%�� �#���V�]oA�i>��ش5GYm2���x�B�u�h�%�f���w�U�1k��QI�$�d�a�u(jǚSus�3[nW�͈썎n�H2��	]H��Сc �Q��ã(�E=�G���E�&]Mt3��ִ�`����<��
2��|����u^�ҹ��+�+�tp�� m��!)GNRR.��i�G��ŤS�Na�;�b dd6���х��T�@U�BS6Щ�C����Ψ�W _��/ɐ�/�dB���kA�,qi��?��D�F�>�^�p��?�4O�8D��	�B��Zw�A��9OW�r.�Ω�A�"����|@�<��	c�����!���cDM�(��!�D�&ҍ� k�:H�E�����j�����Գ��N���}���g)��!\��#ц�N|�4qB����$.S��%XB��$��_PK   ��S�W*\  *  4   org/apache/maven/wrapper/cli/CommandLineParser.class�Y{`Tՙ�}������@�A�ȣ$!!�K�"J��$�00��3�wi�ok}���b�U+*	1��n���v�[��nw���>v���"���sg&3�A�9��9��^��~�;'o{�U s��j���?��C.�G8l�M�1�G3a��q"��<C���W|&��0Q$~C
L��Y(�b���Q���Q��Rbb��6d��3��/c��q��(&�e�_�P#U3I�����R��r�!SLTᨒ<Րi&jp�/���Ϩf�ZQ��
ŠR񝩚*C�M,�Y��2�D��mb��)��2ϐ�&�+�s�2d�!�X�(d�!�L�V����/u�K��R�,S�,WM�)+�A�V��ɹ~Ym�y��F�>�/(���Q�n2d��+��b�'��ʄ+d�!��Y�p��V٠z��e��KO_jJ�\f��kM8�DBv,��c�uŃ�ps<w4D:���D�B0���9k�1'ƃۜl"A��:}ݕ���[Ñ�awr��9��w��/8��g�9���6c1�vg�z���o�;Qw4f�-�G�Fc���V��i���`��)u��iM9�~�u2�	
3��J��`T��bgjd�{�]��j��ł��`G؎wG�os�l��3d�;j\��F�5v�ݶ٩鴷9��Q��ˉִ��5	��Î��⥔Pl�B���N{�L����x�^p����:m��3e�]�I0R��6F�&���T�D�ҕ���r�_]0�/�W\"�4D�e:�j��lu�+B�Zi�C��Ѡ����7���S����LyJ˄�JzQ���ۥ�V�_>���,XKkOO~�m�?�F�sՎ6'��:�<�j�R֟�pK��Y��a�mڐ�"O�ng1L�0@#ɘV;��4	
��l��$4ɷ�1��dLve�r�-�e���$��n��g=63wv%#2�N�HM�j#Ȭm+SW/��Z�!�xfi���Y�F LLsBX"$c�����S~�����R�!fw��t�.���-͊d`ߘH�݉&��e`���Q��MZ�$MQ��`L�ouv2q�١�G�P�R'�*��oi&�N��JP�;�b!��L�v<5�s�ä�a9��	������L� ��e��d�s����ȹ�>[��8]����!�%�!,��lHP�H[X���D�D���4��P�i�"svL��QQ�X�Z����7=Kms�ns�I�0���M��~�"h��Q�6�ʁ���a]�2x�7���v)�S4�tN�\��영=�r��͉Ŧ͟=[0�|�0Q�r"o��A>����R%.R?��j�>]�C��ݒ�l�tG�X	*�;��,���m��­�m���e�K�-��佮;����8v�+�^���;���S�]<�=ώm�ɬr�hHؒ�tYx �f�p"��Τ���*�b�a������hV���f�v���ϒ�r�%�����qk��rC��ڒ�&��0UH/����՗_��ʙ��"7X�y�e�䋖|I�KfbvɬJKn�����!w2����jG���rV%S?�8H����HԒ����"C0Ԯ@Ch��r�%_�{-��r�}�ے��K�;-yH��G���C{wq�q�wD��*��a�U{T���k���H҆ā�괧"��m��NK���%��c���F��4�aa����yUe~���	�W K�*�,��<f��-�!�-y2�M꠴�G��gzlz8#:ݣo�u�<%OS�t���dT����K�Q;76��`ȳ��9�����p�a�XZww�I]	X��.(�1=6�,+�CD���e�,��N�,�ŷԆ=o��2�v8�����e���6׆�#m.M,nG�eۃ��e3�g�Ɔ��c���(ײ����>�4�%'}SX=L�'zl~��~�,��W��C�	<N>����^�f��0FO�>6�� ��eѩ�Α�%�H��h:����Q@g���92���<w��N���pX<x��*)�W�,Pd1�c���b��z����W�/�8Q!8A�t��	�3��2�uw�W���^%C��Lm��G$7_�ʛ�X��#���X�z��ǘ�\���N{g�z��Ɠ'biy���2��rM��e$���I\����5W��ݧ�5�H���59� #T����9�y���	oS#��v�7���~��z�1��vgǺM�V��F����f�k5^����O�Ia[$������gk�T�t��S]g��+LyNCFv8q�w�Ƙnur��BN�#�Y;�Q	7E�ɭ.ҔI3V)��7�1�.�#^��X�ԇB��@L�f�^Y�3��}[�'�ڕN�-L>Mv�G��9R�������٩�~��d��\�U�C���{���S�%�Õ�]wo�w��w���9	|��5M̕������mN�^Y.T�b`%^9K�̈�	��gS���A�Q�$�PL�v'�:��[�J���B x����|����E��6����o���E�՝��G��wo�w��x�FU���|}0��?������������Y.9��W�U��K�������>���҇�g�j�ه!�|KH�c[On�q.��Ǻ<�U�6�O	7��� �\��4UA��CًQϧ���zW��*H�*�C�����+���x��i�;�e!�xP�2��ʗ�ߏAF�aL� J[*��c�f�c�;O�ӏ�=���	��ꀷg�gޒ����E8�E-���#�r��g��R�$�ҋ������Hp	�k�Yoђ^|f�ϥ,%�Ek� y��k˹h5U�EgiZ�7AJ��/E7�T�E)�g�z/
Pō�����֧���1+���x��vx+���ДF����Ԑ�쒳{1G���\��Z��{1oJ���T����M���e�a!��/e׌Z3���`i�X�o�U =�_��2꒗�nb��O��"2�����slvu/V=�#D�ӫ�a��a���Tt2`#8��b�`��3۱;p#�[p-��:���؏�G�p��3�L��������q����2w�$^m�p�T�^9�I3���l��҅G�z<&��qyO����ē�m<%��i������������c�1���G�U<�bj�ãx�������{��xj̠f�;K]\:�Ҧ��SbX��qE�jճ~�-H�*�|�tup��i��侏���e<ɞWeV2�{=̾��[|O1O��/�4��\|&	2��Y���H��a��ox���#�o���y3�A9{G�����P��Xzy��pV�a��M�x%_b� z�5�#
5�J�Ax*��ž�R��Ұ�Ha߭�Y�a��d�FN}8��?Ho�X�ಖ���@T�B�X҇�M�)D�ǲ<l�rv}���+G�z���i8j���lV*6��Fcs��$��drs�p�
\.Q���*�x����?WV�c��`���ġ�ǟ�K�?�(�*�Ul_G��FI#<���ُ�|E?;�WA�:e��Χ�Ikw��%�3J�*���ޞ�?WK.��+��"�~4��Z�U%{^��i<��{��-�J�s)M)%L��\��� o�$8���QՋ����Z���-�͏�OP��1?���A�&4l��x ����S����O��7~�_�w��=�ߋ���K� ��GY�?I>�|$��܍��=���ɛ���.��`%}�ħ�2�����+L�_a���$|Gӭ'�~��G9���R�"�}�k�ɔf�5|��\ ��u|�a��L�9�0S`<��&�L����u5���&o2�]	?���oS<~Do*8؍��Q������h�-">�`�0�c���&:�%��8��p5x���N�f-��H��0��>\��a�W�b���D]��>~���+=Kg~��Ƶ���*�`��D�P띴U<�?��JBW�^�Ҟ�o3~���h�����M��2
UR��2��e,#~V�x��ʿU,��a|y�^����R�|��{��+o���XΨ۝�����U�Q�w9C;�N����0R�
m?cH���q�'��l�zui�O�g�>4W�z��zu��M������%R��|�}pX�(xٔ��Ȟ������ ZT	؇͍UҘ�M�I��N�G��T%q�]}��yv*��tL�X�#m��ĥ�Jj�Efc���<1���lگ����sCU�{S��^f�*7�`�Ρ<��)����	Y�cp��=�R����E~���'K�j/��<�dչ���/�����Lࡋ��܋�'��S����}��r
���.%��P\���x�_D�!��s�@�r���z�,�ގba��J^�:1�d�6��D]�^�o���7Ε��n�D� �9��d�d�W��|)���{=�7x�X�q�o���]$^����� PK   ��SQ�0E    4   org/apache/maven/wrapper/cli/ParsedCommandLine.class�W�wW�F�G�'v�$j����Ŗe�*�)��:uҸqj;%.6n)0�&�F��8Ж�����i�7S�rHB�a���OPNN��ތd���G�̻ﾻ~��;����_ ��(�(�(E@���T����gT�QD�M��mX�9�8�bIŅ(:P���k��QU�l���|A�Q�}1�mxQ�KQt���b�R_�+B�U��Z^GUl����|-���z��[B�*����*;�U�]�vl��'g⬾�g��Y�L��!��f��;U�P0�x:�nz)�qMXv>���삑)�F)s���e��df�1ݮ�cV���rf�8%���O{�6*F�qY��P��"�9>�!�c�v�Z�9ںFm¬K�ױ60�2l�LgD��5�a��c�wFA蘕3D��f�Z�7��ř�؄��3�m���lu�!��S�V�� (�sx2r˳p�[��9f�C5�|SS�j���/�FP��5`�|�o7tqe[�=�4�Sf�����o��`��"7�H\}ıjm�=��{��T-�-�NZ&�"�_E~�-ϲ�q�U�\ut5)����a�0+c�]����&�S�)7
��oߨ[�J�tw$�%z�F���RM�+���Y����ю���0�B}&����|6h��>��d'�R�lgv����	�������� �-z.'-�腪����{�J��|do�6Etڪ�Yc� �$�/"�0���U$N�������Z�Џ��m����/	 5|�q h�..r*hx�h�������V0���5� ?T�#������~��*������t��u&xʧ�ϲ|5Lᔆ���|Ym0�	��2�C��	Ljx�~�wU�J�xRïqI��5c��������;ݜ=*=���$r�f����|~��xW���ԇ����y՘�V%ӱ�V0)ǱYg�Z�&(�#���:��PInǷ���O�j}�t6�t?H�40��P:���p��x3�7��3�]�i��>}򃍬�K̥���k�c�L"Y����~�O��~�����~J~i�7�9�sD��s��B��S6Ώ� b�� �] �g����r������ >J�~@����Rנ�n 0w�+��l��d�d�D���M�d�:4�(�-
�����������輎���pWؓKJ
nlI������ulbvy�_�+����1>���g��}��?�]��G��	����3����e6�e6a��� �B��0�aZ8��A�0C���C��Fq�x#�qu9�:Nz?B+�*�bL�#*���U��8����_"�b�(u80�$�8M��Z"�#�g��)f�^��s!AF�G�,uE��2�����ws=\�(�E#̽)�ϵE���.B�k24�^�`H�)��t���M�ݳ��]r�
��G�W����=�ס?��dGeI"�&6�0Fl!N'��I�&��$��1J�%5�O����Oc��G��8>��W�R3�;����Y�X�DB�'���8�9
q{p���ڙ껊�gք#��:�Q)0C�fe�qW�_'�c��|
Oy(��5ĵ���YS�j��m*��{�Х�/������Y�9�q�����5��S�ŀ�Cq�� z�i|��� �7��ݫe��(�ؾҢ�+�/� ;&����?;���'J�����,��8&3uX�U���R=��]��q�쬀-�&z�<�2e�����_-���VK<�ws2�<�������j�s�	`��u��"K��5ת��Ո���a�g��]���Dդ��J������
�Wٚ�I?)�B��9pI�1��V	P�ܧ���� PK   ��S�.c}�  a  :   org/apache/maven/wrapper/cli/ParsedCommandLineOption.class�S�NQ]���2@.^@(�eT�� �����I��I;8�if�(|
�&����J�D}�����P�����g���Z����� 0��I���1�D�:p3I�-�qhI�p;�;�ǔ��ë9/�{2�˘��fF�;҅-�ʹ��ZAw�9	��^1�۰��і����`fE+��nV��Hl^7uwAB8;�.!�l��pGA7��Fm�ۯئA�`����l]�`ĭ��$_����T�Z�msS{g�z��Z�е��vxy٪՘Y�kuW�L*�pw]ȑН?OPB[�e���Y=��8>Ae��#���^ <���%�ҨqӕГ=�%�����_��U�
��7�E�a��S]���@��@RЃ^	]�l�l���
:�*�	��UW�W�A��|�}�{X��f�w2��f�Ԃ3w2�U��Fd<P0�y	}A:1������g:��tҭJ<¢�%Ah��}sms����������軾��4R�EcV�/���S�Z�|]�ug�Vww0D�+M���'<���v!t#Jkj ��(��0��t� R�����"��˾L�x�@?"�Z)~>�����ǵ k7���!���#�6T� �/�"AB?��q8|�T����ɰW��8Ð1J�Ǩn�~������ �#u
5��S�C��Ȋ
��!1/�5�Dߚ!�c$�"B�"@&���VS������xb5����Ⳁ���.ar�#Y��D��q����$5�PzQ�d="�PK   ��Sz���  5  H   org/apache/maven/wrapper/cli/ProjectPropertiesCommandLineConverter.class���N�@��pQ�qQ7�ЅK/�B\%��ʱi;�0`x+]���|(�)Tc�Q�8����9����� �^RP��V�3����4��N�'�9�x��c�h�2ȷ�������r�miq�Ǖ֡��C1f�jKe����M�O�3��}T�����-MB�8nJ��� أ)�)��Nl��n|-�ǠT��G|�M�{���Jx6E�ߢ-�\88`��ml)v�v�DYx%���4[#� i�0`9A�I}�]�Fh:�ٸ���C4���� Fvèw�Y�;sgS�L�ڠ&����?6�菵�u�H�M	����TWhe�2�d�	�#�� K557˰J5�����uȇp=�����j|A��F_F#�B�XF�"P�����;PK   ��S��n�  &  G   org/apache/maven/wrapper/cli/SystemPropertiesCommandLineConverter.class���N�@��p��"����1`�]�p�%!�^��˘��Lo�+>�e�Bc6��Y�3����93��Ϸw 8��䠦��[l�a'u�3�3yA �h�	d:|����f�P�Ӂ����m���`�:3r�B�Ǥ�Ghzt���$h�0m���i(ѻ\	�a��G�atD��%�8%PqPƦ�m �	�M�N��R�1{R0�Q��/k%e.	�%셶`q�B�����,���֌���A#@���j�"p�C��=�����.G�_��������4�=��ꎱih�����/���RP[.���U_# �=U\Q+Se�r��ȋ����bn&֡�binPyu��A9�[1����P���F���"z��V��"z���o=sm|PK   ��Sr���  �  =   META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.xml�WMs�6��Wl5=$3")ٙNƥ�Q><UjKS��#DBl` В���$%R�j_l,v߾]`���&K�J����A(�D�xrٻ�_��{F����5�(W4-@�(�s�P,��H
W��1��	ތë��K*Ap�	�@H$��lQh4��; ��4�\+ ������O_`�R��L��0���������D?$��	JR`���H�i����V�d�A�9��b9F��«��*�ڀ��V�F�� }��μ�A�ӫ>���j�fd\h(����h��%R��Q��h��}�<��&&6�&�v��������k�X����_g�_������T玧T)��{�$���ɑHDH/%k0z�z�"c�Dmy�wT]�f5�
լ0�& 5"��C��=�8'a�'��fws��ގ��ɗf��i6�<�OfS\]�x���}2����`�ɥ��юƍn���v0�P9�ؒE�O
�PH697ݐS�1eʧ�[��Ϙ�-��N>�㺦�s)h�OW��J�<Q�T��ٍ���Sd��vhS���ŝC����7f�e\i��K�e��"��^̶�:٨�4���7®	2Ӵ����-�� �zs=�m$R�$��:Do-����Q��lI"���B�sK��� �;�kht��zi��{*�	�m��IFG7�%��Y��TE��F�.b�1RA�>��i�3��(�����P���0�Q��9�� e`<���I�)����G��J��i[ey(8�5h+U!eo���{g-��w��i�p{�wI�?�s����"iݜ�Y�\�$ݡw��\3=2-NR�0n���G����GgI���kl��lϼ_^�+;�k�z<�Mw�̄�YxXS�R�T�J)�G��2OIT?<�E�lf,��������=O�]��V������|l��s��J�<��4o5;/q�=�3�gbf?��B�B��^c���]�;g�q���<*|8���~�j�/HZ?�:{"�Ki3�1��6�!
�L�n�]*{[��<d���Pc��1�MstB4L�x5���6�E��z��i������@�f�=#y"p ȳ���yD��̬ʅ�nzF����c����ܴ��ţʯ�����z6�Y|�NIU�VYk/��Y���G���Œ%�$]V�U)�D2y��.м���k�X#~��Tܼ��m/���/��Z�c�X�q`ġ9�GHu0��n�����{�E��Q��%a�H��b�<�ʳ0g��.�����CR�Tyڪ����1>r�PK   ��S��><@   H   D   META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.propertiesK,*�LKL.�L��M,K��-/J,(H-�J/�/- ����%$&g������g�����p PK   ��S��>\�   K             ��    META-INF/MANIFEST.MFPK
    ��S            	          �A�   META-INF/PK
    ��S                      �A�   org/PK
    ��S                      �A!  org/apache/PK
    ��S                      �AJ  org/apache/maven/PK
    ��S                      �Ay  org/apache/maven/wrapper/PK
    ��S                      �A�  org/apache/maven/wrapper/cli/PK
    ��S                      �A�  META-INF/maven/PK
    ��S            (          �A  META-INF/maven/org.apache.maven.wrapper/PK
    ��S            6          �A^  META-INF/maven/org.apache.maven.wrapper/maven-wrapper/PK   ��S�G�q                ���  META-INF/DEPENDENCIESPK   ��S���m  ^,             ��V  META-INF/LICENSEPK   ��S�S ԁ   �              ���  META-INF/NOTICEPK   ��Sޒe�K  �
  3           ���  org/apache/maven/wrapper/BootstrapMainStarter.classPK   ��S�ޗP)  !  2           ��;  org/apache/maven/wrapper/DefaultDownloader$1.classPK   ��S�FG;/  �  S           ���  org/apache/maven/wrapper/DefaultDownloader$SystemPropertiesProxyAuthenticator.classPK   ��S��෉  �  0           ��T  org/apache/maven/wrapper/DefaultDownloader.classPK   ��S]St�   �   )           ��+,  org/apache/maven/wrapper/Downloader.classPK   ��SY��  �$  (           ��"-  org/apache/maven/wrapper/Installer.classPK   ��S���  �  %           ��u?  org/apache/maven/wrapper/Logger.classPK   ��Smo�  ;  /           ���A  org/apache/maven/wrapper/MavenWrapperMain.classPK   ��SZ���  ~  >           ��N  org/apache/maven/wrapper/PathAssembler$LocalDistribution.classPK   ��S�E:P  �  ,           ��5P  org/apache/maven/wrapper/PathAssembler.classPK   ��S��+  |
  6           ���W  org/apache/maven/wrapper/SystemPropertiesHandler.classPK   ��S+k%��  x	  3           ��N]  org/apache/maven/wrapper/WrapperConfiguration.classPK   ��SS�n	  �  .           ��Ha  org/apache/maven/wrapper/WrapperExecutor.classPK   ��S���  T  ?           ��k  org/apache/maven/wrapper/cli/AbstractCommandLineConverter.classPK   ��SuΧ��    I           ��Vn  org/apache/maven/wrapper/cli/AbstractPropertiesCommandLineConverter.classPK   ��S%��S  g  ?           ��~s  org/apache/maven/wrapper/cli/CommandLineArgumentException.classPK   ��S�$5H  �  7           ��.u  org/apache/maven/wrapper/cli/CommandLineConverter.classPK   ��S����G    4           ���v  org/apache/maven/wrapper/cli/CommandLineOption.classPK   ��S�l��     6           ��d|  org/apache/maven/wrapper/cli/CommandLineParser$1.classPK   ��Sd0��_  �  I           ��j}  org/apache/maven/wrapper/cli/CommandLineParser$AfterFirstSubCommand.classPK   ��S�r��  0  A           ��0�  org/apache/maven/wrapper/cli/CommandLineParser$AfterOptions.classPK   ��S�/2#  �  J           ��A�  org/apache/maven/wrapper/cli/CommandLineParser$BeforeFirstSubCommand.classPK   ��Sv��`  C  T           ��̈  org/apache/maven/wrapper/cli/CommandLineParser$CaseInsensitiveStringComparator.classPK   ��S�	4��  ?  K           ����  org/apache/maven/wrapper/cli/CommandLineParser$KnownOptionParserState.classPK   ��ST����  �  J           ��ɓ  org/apache/maven/wrapper/cli/CommandLineParser$MissingOptionArgState.classPK   ��SoTy�  �  K           ���  org/apache/maven/wrapper/cli/CommandLineParser$OptionAwareParserState.classPK   ��SŃF��  `  E           ���  org/apache/maven/wrapper/cli/CommandLineParser$OptionComparator.classPK   ��S��+��  !  F           ��:�  org/apache/maven/wrapper/cli/CommandLineParser$OptionParserState.classPK   ��S��ں    A           ��Q�  org/apache/maven/wrapper/cli/CommandLineParser$OptionString.classPK   ��SK�+ة  �  K           ��j�  org/apache/maven/wrapper/cli/CommandLineParser$OptionStringComparator.classPK   ��S4�  2  @           ��|�  org/apache/maven/wrapper/cli/CommandLineParser$ParserState.classPK   ��S*q���  g  M           ���  org/apache/maven/wrapper/cli/CommandLineParser$UnknownOptionParserState.classPK   ��S�W*\  *  4           ��:�  org/apache/maven/wrapper/cli/CommandLineParser.classPK   ��SQ�0E    4           ���  org/apache/maven/wrapper/cli/ParsedCommandLine.classPK   ��S�.c}�  a  :           ���  org/apache/maven/wrapper/cli/ParsedCommandLineOption.classPK   ��Sz���  5  H           ����  org/apache/maven/wrapper/cli/ProjectPropertiesCommandLineConverter.classPK   ��S��n�  &  G           ����  org/apache/maven/wrapper/cli/SystemPropertiesCommandLineConverter.classPK   ��Sr���  �  =           ����  META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.xmlPK   ��S��><@   H   D           ����  META-INF/maven/org.apache.maven.wrapper/maven-wrapper/pom.propertiesPK    4 4 �  ��    PK
    �9UnM���   �   )   bin/.mvn/wrapper/maven-wrapper.propertiesdistributionUrl=https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.8.6/apache-maven-3.8.6-bin.zip
wrapperUrl=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar
PK
    �9U�C�         bin/README.md# p1_APIPK
    �9U��J�h)  h)     bin/mvnw#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Maven Start Up Batch script
#
# Required ENV vars:
# ------------------
#   JAVA_HOME - location of a JDK home dir
#
# Optional ENV vars
# -----------------
#   M2_HOME - location of maven2's installed home dir
#   MAVEN_OPTS - parameters passed to the Java VM when running Maven
#     e.g. to debug Maven itself, use
#       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files
# ----------------------------------------------------------------------------

if [ -z "$MAVEN_SKIP_RC" ] ; then

  if [ -f /usr/local/etc/mavenrc ] ; then
    . /usr/local/etc/mavenrc
  fi

  if [ -f /etc/mavenrc ] ; then
    . /etc/mavenrc
  fi

  if [ -f "$HOME/.mavenrc" ] ; then
    . "$HOME/.mavenrc"
  fi

fi

# OS specific support.  $var _must_ be set to either true or false.
cygwin=false;
darwin=false;
mingw=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true;;
  Darwin*) darwin=true
    # Use /usr/libexec/java_home if available, otherwise fall back to /Library/Java/Home
    # See https://developer.apple.com/library/mac/qa/qa1170/_index.html
    if [ -z "$JAVA_HOME" ]; then
      if [ -x "/usr/libexec/java_home" ]; then
        export JAVA_HOME="`/usr/libexec/java_home`"
      else
        export JAVA_HOME="/Library/Java/Home"
      fi
    fi
    ;;
esac

if [ -z "$JAVA_HOME" ] ; then
  if [ -r /etc/gentoo-release ] ; then
    JAVA_HOME=`java-config --jre-home`
  fi
fi

if [ -z "$M2_HOME" ] ; then
  ## resolve links - $0 may be a link to maven's home
  PRG="$0"

  # need this for relative symlinks
  while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
      PRG="$link"
    else
      PRG="`dirname "$PRG"`/$link"
    fi
  done

  saveddir=`pwd`

  M2_HOME=`dirname "$PRG"`/..

  # make it fully qualified
  M2_HOME=`cd "$M2_HOME" && pwd`

  cd "$saveddir"
  # echo Using m2 at $M2_HOME
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
  [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --unix "$M2_HOME"`
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# For Mingw, ensure paths are in UNIX format before anything is touched
if $mingw ; then
  [ -n "$M2_HOME" ] &&
    M2_HOME="`(cd "$M2_HOME"; pwd)`"
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME="`(cd "$JAVA_HOME"; pwd)`"
fi

if [ -z "$JAVA_HOME" ]; then
  javaExecutable="`which javac`"
  if [ -n "$javaExecutable" ] && ! [ "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ]; then
    # readlink(1) is not available as standard on Solaris 10.
    readLink=`which readlink`
    if [ ! `expr "$readLink" : '\([^ ]*\)'` = "no" ]; then
      if $darwin ; then
        javaHome="`dirname \"$javaExecutable\"`"
        javaExecutable="`cd \"$javaHome\" && pwd -P`/javac"
      else
        javaExecutable="`readlink -f \"$javaExecutable\"`"
      fi
      javaHome="`dirname \"$javaExecutable\"`"
      javaHome=`expr "$javaHome" : '\(.*\)/bin'`
      JAVA_HOME="$javaHome"
      export JAVA_HOME
    fi
  fi
fi

if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
      # IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD="`\\unset -f command; \\command -v java`"
  fi
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly." >&2
  echo "  We cannot execute $JAVACMD" >&2
  exit 1
fi

if [ -z "$JAVA_HOME" ] ; then
  echo "Warning: JAVA_HOME environment variable is not set."
fi

CLASSWORLDS_LAUNCHER=org.codehaus.plexus.classworlds.launcher.Launcher

# traverses directory structure from process work directory to filesystem root
# first directory with .mvn subdirectory is considered project base directory
find_maven_basedir() {

  if [ -z "$1" ]
  then
    echo "Path not specified to find_maven_basedir"
    return 1
  fi

  basedir="$1"
  wdir="$1"
  while [ "$wdir" != '/' ] ; do
    if [ -d "$wdir"/.mvn ] ; then
      basedir=$wdir
      break
    fi
    # workaround for JBEAP-8937 (on Solaris 10/Sparc)
    if [ -d "${wdir}" ]; then
      wdir=`cd "$wdir/.."; pwd`
    fi
    # end of workaround
  done
  echo "${basedir}"
}

# concatenates all lines of a file
concat_lines() {
  if [ -f "$1" ]; then
    echo "$(tr -s '\n' ' ' < "$1")"
  fi
}

BASE_DIR=`find_maven_basedir "$(pwd)"`
if [ -z "$BASE_DIR" ]; then
  exit 1;
fi

##########################################################################################
# Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
# This allows using the maven wrapper in projects that prohibit checking in binary data.
##########################################################################################
if [ -r "$BASE_DIR/.mvn/wrapper/maven-wrapper.jar" ]; then
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Found .mvn/wrapper/maven-wrapper.jar"
    fi
else
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Couldn't find .mvn/wrapper/maven-wrapper.jar, downloading it ..."
    fi
    if [ -n "$MVNW_REPOURL" ]; then
      jarUrl="$MVNW_REPOURL/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    else
      jarUrl="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    fi
    while IFS="=" read key value; do
      case "$key" in (wrapperUrl) jarUrl="$value"; break ;;
      esac
    done < "$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Downloading from: $jarUrl"
    fi
    wrapperJarPath="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"
    if $cygwin; then
      wrapperJarPath=`cygpath --path --windows "$wrapperJarPath"`
    fi

    if command -v wget > /dev/null; then
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Found wget ... using wget"
        fi
        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then
            wget "$jarUrl" -O "$wrapperJarPath" || rm -f "$wrapperJarPath"
        else
            wget --http-user=$MVNW_USERNAME --http-password=$MVNW_PASSWORD "$jarUrl" -O "$wrapperJarPath" || rm -f "$wrapperJarPath"
        fi
    elif command -v curl > /dev/null; then
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Found curl ... using curl"
        fi
        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then
            curl -o "$wrapperJarPath" "$jarUrl" -f
        else
            curl --user $MVNW_USERNAME:$MVNW_PASSWORD -o "$wrapperJarPath" "$jarUrl" -f
        fi

    else
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Falling back to using Java to download"
        fi
        javaClass="$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.java"
        # For Cygwin, switch paths to Windows format before running javac
        if $cygwin; then
          javaClass=`cygpath --path --windows "$javaClass"`
        fi
        if [ -e "$javaClass" ]; then
            if [ ! -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                if [ "$MVNW_VERBOSE" = true ]; then
                  echo " - Compiling MavenWrapperDownloader.java ..."
                fi
                # Compiling the Java class
                ("$JAVA_HOME/bin/javac" "$javaClass")
            fi
            if [ -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                # Running the downloader
                if [ "$MVNW_VERBOSE" = true ]; then
                  echo " - Running MavenWrapperDownloader.java ..."
                fi
                ("$JAVA_HOME/bin/java" -cp .mvn/wrapper MavenWrapperDownloader "$MAVEN_PROJECTBASEDIR")
            fi
        fi
    fi
fi
##########################################################################################
# End of extension
##########################################################################################

export MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}
if [ "$MVNW_VERBOSE" = true ]; then
  echo $MAVEN_PROJECTBASEDIR
fi
MAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
  [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --path --windows "$M2_HOME"`
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
  [ -n "$MAVEN_PROJECTBASEDIR" ] &&
    MAVEN_PROJECTBASEDIR=`cygpath --path --windows "$MAVEN_PROJECTBASEDIR"`
fi

# Provide a "standardized" way to retrieve the CLI args that will
# work with both Windows and non-Windows executions.
MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
export MAVEN_CMD_LINE_ARGS

WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

exec "$JAVACMD" \
  $MAVEN_OPTS \
  $MAVEN_DEBUG_OPTS \
  -classpath "$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \
  "-Dmaven.home=${M2_HOME}" \
  "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
  ${WRAPPER_LAUNCHER} $MAVEN_CONFIG "$@"
PK
    �9U��Q>
  
     bin/mvnw.cmd@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM M2_HOME - location of maven2's installed home dir
@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands
@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a keystroke before ending
@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven
@REM     e.g. to debug Maven itself, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files
@REM ----------------------------------------------------------------------------

@REM Begin all REM lines with '@' in case MAVEN_BATCH_ECHO is 'on'
@echo off
@REM set title of command window
title %0
@REM enable echoing by setting MAVEN_BATCH_ECHO to 'on'
@if "%MAVEN_BATCH_ECHO%" == "on"  echo %MAVEN_BATCH_ECHO%

@REM set %HOME% to equivalent of $HOME
if "%HOME%" == "" (set "HOME=%HOMEDRIVE%%HOMEPATH%")

@REM Execute a user defined script before this one
if not "%MAVEN_SKIP_RC%" == "" goto skipRcPre
@REM check for pre script, once with legacy .bat ending and once with .cmd ending
if exist "%USERPROFILE%\mavenrc_pre.bat" call "%USERPROFILE%\mavenrc_pre.bat" %*
if exist "%USERPROFILE%\mavenrc_pre.cmd" call "%USERPROFILE%\mavenrc_pre.cmd" %*
:skipRcPre

@setlocal

set ERROR_CODE=0

@REM To isolate internal variables from possible post scripts, we use another setlocal
@setlocal

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Error: JAVA_HOME not found in your environment. >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init

echo.
echo Error: JAVA_HOME is set to an invalid directory. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

@REM ==== END VALIDATION ====

:init

@REM Find the project base dir, i.e. the directory that contains the folder ".mvn".
@REM Fallback to current working directory if not found.

set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
IF NOT "%MAVEN_PROJECTBASEDIR%"=="" goto endDetectBaseDir

set EXEC_DIR=%CD%
set WDIR=%EXEC_DIR%
:findBaseDir
IF EXIST "%WDIR%"\.mvn goto baseDirFound
cd ..
IF "%WDIR%"=="%CD%" goto baseDirNotFound
set WDIR=%CD%
goto findBaseDir

:baseDirFound
set MAVEN_PROJECTBASEDIR=%WDIR%
cd "%EXEC_DIR%"
goto endDetectBaseDir

:baseDirNotFound
set MAVEN_PROJECTBASEDIR=%EXEC_DIR%
cd "%EXEC_DIR%"

:endDetectBaseDir

IF NOT EXIST "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" goto endReadAdditionalConfig

@setlocal EnableExtensions EnableDelayedExpansion
for /F "usebackq delims=" %%a in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a
@endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%

:endReadAdditionalConfig

SET MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

set DOWNLOAD_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"

FOR /F "usebackq tokens=1,2 delims==" %%A IN ("%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties") DO (
    IF "%%A"=="wrapperUrl" SET DOWNLOAD_URL=%%B
)

@REM Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
@REM This allows using the maven wrapper in projects that prohibit checking in binary data.
if exist %WRAPPER_JAR% (
    if "%MVNW_VERBOSE%" == "true" (
        echo Found %WRAPPER_JAR%
    )
) else (
    if not "%MVNW_REPOURL%" == "" (
        SET DOWNLOAD_URL="%MVNW_REPOURL%/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    )
    if "%MVNW_VERBOSE%" == "true" (
        echo Couldn't find %WRAPPER_JAR%, downloading it ...
        echo Downloading from: %DOWNLOAD_URL%
    )

    powershell -Command "&{"^
		"$webclient = new-object System.Net.WebClient;"^
		"if (-not ([string]::IsNullOrEmpty('%MVNW_USERNAME%') -and [string]::IsNullOrEmpty('%MVNW_PASSWORD%'))) {"^
		"$webclient.Credentials = new-object System.Net.NetworkCredential('%MVNW_USERNAME%', '%MVNW_PASSWORD%');"^
		"}"^
		"[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webclient.DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')"^
		"}"
    if "%MVNW_VERBOSE%" == "true" (
        echo Finished downloading %WRAPPER_JAR%
    )
)
@REM End of extension

@REM Provide a "standardized" way to retrieve the CLI args that will
@REM work with both Windows and non-Windows executions.
set MAVEN_CMD_LINE_ARGS=%*

%MAVEN_JAVA_EXE% ^
  %JVM_CONFIG_MAVEN_PROPS% ^
  %MAVEN_OPTS% ^
  %MAVEN_DEBUG_OPTS% ^
  -classpath %WRAPPER_JAR% ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  %WRAPPER_LAUNCHER% %MAVEN_CONFIG% %*
if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%

if not "%MAVEN_SKIP_RC%"=="" goto skipRcPost
@REM check for post script, once with legacy .bat ending and once with .cmd ending
if exist "%USERPROFILE%\mavenrc_post.bat" call "%USERPROFILE%\mavenrc_post.bat"
if exist "%USERPROFILE%\mavenrc_post.cmd" call "%USERPROFILE%\mavenrc_post.cmd"
:skipRcPost

@REM pause the script if MAVEN_BATCH_PAUSE is set to 'on'
if "%MAVEN_BATCH_PAUSE%"=="on" pause

if "%MAVEN_TERMINATE_CMD%"=="on" exit %ERROR_CODE%

cmd /C exit /B %ERROR_CODE%
PK
    �9U��D=  =     bin/pom.xml<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.7.3</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.revature</groupId>
	<artifactId>P1API</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>P1API</name>
	<description>API for Project 1</description>
	<properties>
		<java.version>1.8</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>com.h2database</groupId>
			<artifactId>h2</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.postgresql</groupId>
			<artifactId>postgresql</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>

	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>
PK
    �9UmJ�Q       bin/src/.DS_Store   Bud1           	                                                          Ilocblob                                                                                                                                                                                                                                                                                                                                                                                                                                              m a i nIlocblob      A   .������      m a i nbwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    m a i nvSrnlong       t e s tIlocblob      �   .������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9Uv)Kr       bin/src/main/.DS_Store   Bud1           	                                                          Ilocblob                                                                                                                                                                                                                                                                                                                                                                                                                                              j a v aIlocblob      A   .������      j a v abwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    j a v avSrnlong      	 r e s o u r c e sIlocblob      �   .������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9U뿨{       bin/src/main/java/.DS_Store   Bud1           	                                                          ocblob                                                                                                                                                                                                                                                                                                                                                                                                                                                c o mIlocblob      A   .������      c o mbwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    c o mvSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9U.�̉       bin/src/main/java/com/.DS_Store   Bud1           	                                                           t u r eIloc                                                                                                                                                                                                                                                                                                                                                                                                                                           r e v a t u r eIlocblob      A   .������      r e v a t u r ebwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    r e v a t u r evSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9U��NH    (   bin/src/main/java/com/revature/.DS_Store   Bud1           	                                                           IIlocblob                                                                                                                                                                                                                                                                                                                                                                                                                                             P 1 A P IIlocblob      A   .������      P 1 A P Ibwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{16, 421}, {920, 436}}	#/;R_klmno�                            �    P 1 A P IvSrnlong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    2q9U�bAF�  �  ;   bin/src/main/java/com/revature/P2API/P2ApiApplication.class����   = (  1src/main/java/com/revature/P2API/P2ApiApplication  java/lang/Object <init> ()V Code 	 java/lang/Error |Unresolved compilation problems: 
	The type java.lang.Object cannot be resolved. It is indirectly referenced from required .class files
	The type java.lang.Class cannot be resolved. It is indirectly referenced from required .class files
	The declared package "com.revature.P2API" does not match the expected package "src.main.java.com.revature.P2API"
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	SpringBootApplication cannot be resolved to a type
	Implicit super constructor Object() is undefined for default constructor. Must define an explicit constructor
	String cannot be resolved to a type
	SpringApplication cannot be resolved
	Bean cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RestTemplateBuilder cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this 3Lsrc/main/java/com/revature/P2API/P2ApiApplication; main ([LString;)V  mUnresolved compilation problems: 
	String cannot be resolved to a type
	SpringApplication cannot be resolved
 restTemplate %(LRestTemplateBuilder;)LRestTemplate; RuntimeInvisibleAnnotations LBean;  �Unresolved compilation problems: 
	Bean cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RestTemplateBuilder cannot be resolved to a type
 RuntimeInvisibleTypeAnnotations 
SourceFile P2ApiApplication.java LSpringBootApplication; " RestTemplate $ RestTemplateBuilder & String MissingTypes !               4     
� Y
� �                   
     	       *     
� Y� �                                 4     
� Y� �                   
                             '     ! # %PK
    2q9U�C���  �  E   bin/src/main/java/com/revature/P2API/controller/AlbumController.class����   = 9  ;src/main/java/com/revature/P2API/controller/AlbumController  java/lang/Object restTemplate LRestTemplate; result Ljava/lang/Object; mapper LObjectMapper; <init> ()V Code  java/lang/Error 
�Unresolved compilation problems: 
	The type java.lang.String cannot be resolved. It is indirectly referenced from required .class files
	The declared package "com.revature.P2API.controller" does not match the expected package "src.main.java.com.revature.P2API.controller"
	The import java.io cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import ch cannot be resolved
	RestController cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	Implicit super constructor Object() is undefined. Must explicitly invoke another constructor
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	IOException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Album cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Album cannot be resolved to a type
	Object cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Album cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Album cannot be resolved to a type
	Object cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this =Lsrc/main/java/com/revature/P2API/controller/AlbumController; getAlbumById &(Ljava/lang/String;)Ljava/lang/Object; 
Exceptions  IOException RuntimeInvisibleAnnotations LRequestMapping; value method LResponseBody; $RuntimeInvisibleParameterAnnotations LPathVariable; &�Unresolved compilation problems: 
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	IOException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Album cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Album cannot be resolved to a type
	Object cannot be resolved to a type
 RuntimeInvisibleTypeAnnotations getAlbumsByArtistId * JsonMappingException , JsonProcessingException .0Unresolved compilation problems: 
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Album cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Album cannot be resolved to a type
	Object cannot be resolved to a type
 
SourceFile AlbumController.java LRestController; 3 ObjectMapper 5 RestTemplate 7 java/lang/String MissingTypes !                   	 
           4     
� Y� �                   
                  
     "   #     $      4     
� Y%� �           "        
     '       $        "    (        ) +    
     "   #     $      4     
� Y-� �           8        
     '       $        "    /    0      1   8      ) + 2 4  6PK
    2q9U��C��  �  F   bin/src/main/java/com/revature/P2API/controller/ArtistController.class����   = 9  <src/main/java/com/revature/P2API/controller/ArtistController  java/lang/Object restTemplate LRestTemplate; result Ljava/lang/Object; mapper LObjectMapper; <init> ()V Code  java/lang/Error 	�Unresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.main.java.com.revature.P2API.controller"
	The import java.io cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	RestController cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	Implicit super constructor Object() is undefined. Must explicitly invoke another constructor
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	IOException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Artist cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Artist cannot be resolved to a type
	Object cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Artist cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Artist cannot be resolved to a type
	Object cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this >Lsrc/main/java/com/revature/P2API/controller/ArtistController; getArtistByName &(Ljava/lang/String;)Ljava/lang/Object; 
Exceptions  IOException RuntimeInvisibleAnnotations LRequestMapping; value method LResponseBody; $RuntimeInvisibleParameterAnnotations LPathVariable; &�Unresolved compilation problems: 
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	IOException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Artist cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Artist cannot be resolved to a type
	Object cannot be resolved to a type
 RuntimeInvisibleTypeAnnotations getArtistById * JsonMappingException , JsonProcessingException .2Unresolved compilation problems: 
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Artist cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Artist cannot be resolved to a type
	Object cannot be resolved to a type
 
SourceFile ArtistController.java LRestController; 3 ObjectMapper 5 RestTemplate 7 java/lang/String MissingTypes !                   	 
           4     
� Y� �                   
                  
     "   #     $      4     
� Y%� �                   
     '       $        "    (        ) +    
     "   #     $      4     
� Y-� �           4        
     '       $        "    /    0      1   8      ) + 2 4  6PK
    2q9U?��	  	  E   bin/src/main/java/com/revature/P2API/controller/LoginController.class����   = *  ;src/main/java/com/revature/P2API/controller/LoginController  java/lang/Object loginService LLoginService; <init> (LLoginService;)V RuntimeInvisibleAnnotations LAutowired; Code  java/lang/Error XUnresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.main.java.com.revature.P2API.controller"
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	RestController cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	CrossOrigin cannot be resolved to a type
	LoginService cannot be resolved to a type
	Autowired cannot be resolved to a type
	Implicit super constructor Object() is undefined. Must explicitly invoke another constructor
	LoginService cannot be resolved to a type
	LoginService cannot be resolved to a type
	PostMapping cannot be resolved to a type
	User cannot be resolved to a type
	RequestBody cannot be resolved to a type
	User cannot be resolved to a type
	System cannot be resolved
	LoginService cannot be resolved to a type
	LoginService cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this =Lsrc/main/java/com/revature/P2API/controller/LoginController; RuntimeInvisibleTypeAnnotations login (LUser;)LUser; LPostMapping; $RuntimeInvisibleParameterAnnotations LRequestBody; -Unresolved compilation problems: 
	PostMapping cannot be resolved to a type
	User cannot be resolved to a type
	RequestBody cannot be resolved to a type
	User cannot be resolved to a type
	System cannot be resolved
	LoginService cannot be resolved to a type
	LoginService cannot be resolved to a type
 
SourceFile LoginController.java LRestController; LRequestMapping; value LCrossOrigin; & LoginService ( User MissingTypes !                	     
      4     
� Y� �                   
           
       	                   4     
� Y� �                   
                          	     !   )     % 'PK
    2q9U���.  .  D   bin/src/main/java/com/revature/P2API/controller/SongController.class����   = 9  :src/main/java/com/revature/P2API/controller/SongController  java/lang/Object restTemplate LRestTemplate; result Ljava/lang/Object; mapper LObjectMapper; <init> ()V Code  java/lang/Error 
%Unresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.main.java.com.revature.P2API.controller"
	The import java.io cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	RestController cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	Implicit super constructor Object() is undefined. Must explicitly invoke another constructor
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	IOException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Song cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Song cannot be resolved to a type
	Object cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Song cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Song cannot be resolved to a type
	Object cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this <Lsrc/main/java/com/revature/P2API/controller/SongController; getSongsByAlbumId &(Ljava/lang/String;)Ljava/lang/Object; 
Exceptions  IOException RuntimeInvisibleAnnotations LRequestMapping; value method LResponseBody; $RuntimeInvisibleParameterAnnotations LPathVariable; &�Unresolved compilation problems: 
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	IOException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Song cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Song cannot be resolved to a type
	Object cannot be resolved to a type
 RuntimeInvisibleTypeAnnotations getSongById * JsonMappingException , JsonProcessingException ..Unresolved compilation problems: 
	RequestMapping cannot be resolved to a type
	RequestMethod cannot be resolved to a variable
	ResponseBody cannot be resolved to a type
	Object cannot be resolved to a type
	PathVariable cannot be resolved to a type
	String cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	String cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	String cannot be resolved to a type
	Object cannot be resolved to a type
	Song cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	TypeReference cannot be resolved to a type
	Song cannot be resolved to a type
	Object cannot be resolved to a type
 
SourceFile SongController.java LRestController; 3 ObjectMapper 5 RestTemplate 7 java/lang/String MissingTypes !                   	 
           4     
� Y� �                   
                  
     "   #     $      4     
� Y%� �                    
     '       $        "    (        ) +    
     "   #     $      4     
� Y-� �           6        
     '       $        "    /    0      1   8      ) + 2 4  6PK
    2q9U��N�  �  D   bin/src/main/java/com/revature/P2API/controller/UserController.class����   = 0  :src/main/java/com/revature/P2API/controller/UserController  java/lang/Object userService LUserService; <init> (LUserService;)V RuntimeInvisibleAnnotations LAutowired; Code  java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.main.java.com.revature.P2API.controller"
	The import java.util cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	RestController cannot be resolved to a type
	RequestMapping cannot be resolved to a type
	UserService cannot be resolved to a type
	Autowired cannot be resolved to a type
	UserService cannot be resolved to a type
	The constructor Object() is undefined
	UserService cannot be resolved to a type
	GetMapping cannot be resolved to a type
	User cannot be resolved to a type
	UserService cannot be resolved to a type
	GetMapping cannot be resolved to a type
	List cannot be resolved to a type
	User cannot be resolved to a type
	UserService cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this <Lsrc/main/java/com/revature/P2API/controller/UserController; RuntimeInvisibleTypeAnnotations createStudent ()LUser; LGetMapping; value  �Unresolved compilation problems: 
	GetMapping cannot be resolved to a type
	User cannot be resolved to a type
	UserService cannot be resolved to a type
 getStudents ()LList; 	Signature ()LList<LUser;>; # �Unresolved compilation problems: 
	GetMapping cannot be resolved to a type
	List cannot be resolved to a type
	User cannot be resolved to a type
	UserService cannot be resolved to a type
 
SourceFile UserController.java LRestController; LRequestMapping; path * List , User . UserService MissingTypes !                	     
      4     
� Y� �                   
           
          4     
� Y� �                   
              !    4     
� Y"� �           (        
      $    % 	   
  &   '   /     ) + -PK
    2q9U)>TǄ  �  7   bin/src/main/java/com/revature/P2API/models/Album.class����   = F  -src/main/java/com/revature/P2API/models/Album  java/lang/Object idAlbum Ljava/lang/String; idArtist strAlbum 	strArtist intYearReleased strStyle strGenre strLabel strReleaseFormat strAlbumThumb strDescriptionEN intScore strMood <init> ()V Code  java/lang/Error 
�Unresolved compilation problems: 
	The declared package "com.revature.P2API.models" does not match the expected package "src.main.java.com.revature.P2API.models"
	The import com cannot be resolved
	JsonIgnoreProperties cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	The constructor Object() is undefined
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this /Lsrc/main/java/com/revature/P2API/models/Album; 
getIdAlbum ()Ljava/lang/String; $ lUnresolved compilation problems: 
	String cannot be resolved to a type
	String cannot be resolved to a type
 
setIdAlbum getIdArtist setIdArtist getStrAlbum setStrAlbum getStrArtist setStrArtist getIntYearReleased setIntYearReleased getStrStyle setStrStyle getStrGenre setStrGenre getStrLabel setStrLabel getStrReleaseFormat setStrReleaseFormat getStrAlbumThumb setStrAlbumThumb getStrDescriptionEN setStrDescriptionEN getIntScore setIntScore 
getStrMood 
setStrMood 
SourceFile 
Album.java RuntimeInvisibleAnnotations LJsonIgnoreProperties; ignoreUnknown D java/lang/String MissingTypes !                      	     
                                                    4     
� Y� �                   
       ! "     4     
� Y#� �           &        
       %      4     
� Y#� �           *        
       & "     4     
� Y#� �           .        
       '      4     
� Y#� �           2        
       ( "     4     
� Y#� �           6        
       )      4     
� Y#� �           :        
       * "     4     
� Y#� �           >        
       +      4     
� Y#� �           B        
       , "     4     
� Y#� �           F        
       -      4     
� Y#� �           J        
       . "     4     
� Y#� �           N        
       /      4     
� Y#� �           R        
       0 "     4     
� Y#� �           V        
       1      4     
� Y#� �           Z        
       2 "     4     
� Y#� �           ^        
       3      4     
� Y#� �           b        
       4 "     4     
� Y#� �           f        
       5      4     
� Y#� �           j        
       6 "     4     
� Y#� �           n        
       7      4     
� Y#� �           r        
       8 "     4     
� Y#� �           v        
       9      4     
� Y#� �           z        
       : "     4     
� Y#� �           ~        
       ;      4     
� Y#� �           �        
       < "     4     
� Y#� �           �        
       =      4     
� Y#� �           �        
       >    ? @     A   E     CPK
    2q9U���p    8   bin/src/main/java/com/revature/P2API/models/Artist.class����   = V  .src/main/java/com/revature/P2API/models/Artist  java/lang/Object idArtist Ljava/lang/String; 	strArtist strLabel intFormedYear strStyle strGenre strMood 
strWebsite strBiographyEN 
intMembers 	LInteger; 
strCountry strCountryCode strArtistThumb strArtistLogo strArtistBanner strLastFMChart <init> ()V Code  java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API.models" does not match the expected package "src.main.java.com.revature.P2API.models"
	The import java.io cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	JsonIgnoreProperties cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	Integer cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	The constructor Object() is undefined
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	Integer cannot be resolved to a type
	Integer cannot be resolved to a type
	Integer cannot be resolved to a type
	Integer cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type

      (Ljava/lang/String;)V LineNumberTable LocalVariableTable this 0Lsrc/main/java/com/revature/P2API/models/Artist; getIdArtist ()Ljava/lang/String; ( lUnresolved compilation problems: 
	String cannot be resolved to a type
	String cannot be resolved to a type
 setIdArtist getStrArtist setStrArtist getStrLabel setStrLabel getIntFormedYear setIntFormedYear getStrStyle setStrStyle getStrGenre setStrGenre 
getStrMood 
setStrMood getStrWebsite setStrWebsite getStrBiographyEN setStrBiographyEN getIntMembers ()LInteger; = nUnresolved compilation problems: 
	Integer cannot be resolved to a type
	Integer cannot be resolved to a type
 setIntMembers (LInteger;)V getStrCountry setStrCountry getStrCountryCode setStrCountryCode getStrArtistThumb setStrArtistThumb getStrArtistLogo setStrArtistLogo getStrArtistBanner setStrArtistBanner getStrLastFMChart setStrLastFMChart 
SourceFile Artist.java RuntimeInvisibleAnnotations LJsonIgnoreProperties; ignoreUnknown R Integer T java/lang/String MissingTypes !                      	     
                                                           !        4     
� Y� �    !        "       
 # $    % &     4     
� Y'� �    !       / "       
 # $    )       4     
� Y'� �    !       3 "       
 # $    * &     4     
� Y'� �    !       7 "       
 # $    +       4     
� Y'� �    !       ; "       
 # $    , &     4     
� Y'� �    !       ? "       
 # $    -       4     
� Y'� �    !       C "       
 # $    . &     4     
� Y'� �    !       G "       
 # $    /       4     
� Y'� �    !       K "       
 # $    0 &     4     
� Y'� �    !       O "       
 # $    1       4     
� Y'� �    !       S "       
 # $    2 &     4     
� Y'� �    !       W "       
 # $    3       4     
� Y'� �    !       [ "       
 # $    4 &     4     
� Y'� �    !       _ "       
 # $    5       4     
� Y'� �    !       c "       
 # $    6 &     4     
� Y'� �    !       g "       
 # $    7       4     
� Y'� �    !       k "       
 # $    8 &     4     
� Y'� �    !       o "       
 # $    9       4     
� Y'� �    !       s "       
 # $    : ;     4     
� Y<� �    !       w "       
 # $    > ?     4     
� Y<� �    !       { "       
 # $    @ &     4     
� Y'� �    !        "       
 # $    A       4     
� Y'� �    !       � "       
 # $    B &     4     
� Y'� �    !       � "       
 # $    C       4     
� Y'� �    !       � "       
 # $    D &     4     
� Y'� �    !       � "       
 # $    E       4     
� Y'� �    !       � "       
 # $    F &     4     
� Y'� �    !       � "       
 # $    G       4     
� Y'� �    !       � "       
 # $    H &     4     
� Y'� �    !       � "       
 # $    I       4     
� Y'� �    !       � "       
 # $    J &     4     
� Y'� �    !       � "       
 # $    K       4     
� Y'� �    !       � "       
 # $    L    M N     O   U     Q SPK
    2q9U��vژ  �  6   bin/src/main/java/com/revature/P2API/models/Song.class����   = :  ,src/main/java/com/revature/P2API/models/Song  java/lang/Object idTrack Ljava/lang/String; idAlbum idArtist strTrack strAlbum 	strArtist intDuration strGenre intTrackNumber <init> ()V Code  java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API.models" does not match the expected package "src.main.java.com.revature.P2API.models"
	The import com cannot be resolved
	JsonIgnoreProperties cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	The constructor Object() is undefined
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this .Lsrc/main/java/com/revature/P2API/models/Song; 
getIdTrack ()Ljava/lang/String;   lUnresolved compilation problems: 
	String cannot be resolved to a type
	String cannot be resolved to a type
 
setIdTrack 
getIdAlbum 
setIdAlbum getIdArtist setIdArtist getStrTrack setStrTrack getStrAlbum setStrAlbum getStrArtist setStrArtist getIntDuration setIntDuration getStrGenre setStrGenre getIntTrackNumber setIntTrackNumber 
SourceFile 	Song.java RuntimeInvisibleAnnotations LJsonIgnoreProperties; ignoreUnknown 8 java/lang/String MissingTypes !     	                 	     
                                4     
� Y� �                   
            4     
� Y� �                   
      !      4     
� Y� �           "        
      "      4     
� Y� �           &        
      #      4     
� Y� �           *        
      $      4     
� Y� �           .        
      %      4     
� Y� �           2        
      &      4     
� Y� �           6        
      '      4     
� Y� �           :        
      (      4     
� Y� �           >        
      )      4     
� Y� �           B        
      *      4     
� Y� �           F        
      +      4     
� Y� �           J        
      ,      4     
� Y� �           N        
      -      4     
� Y� �           R        
      .      4     
� Y� �           V        
      /      4     
� Y� �           Z        
      0      4     
� Y� �           ^        
      1      4     
� Y� �           b        
      2    3 4     5   9     7PK
    2q9U��؎q  q  E   bin/src/main/java/com/revature/P2API/repository/LoginRepository.class����   = '  ;src/main/java/com/revature/P2API/repository/LoginRepository  java/lang/Object <clinit> ()V Code 	 java/lang/Error nUnresolved compilation problems: 
	The declared package "com.revature.P2API.repository" does not match the expected package "src.main.java.com.revature.P2API.repository"
	The import java.util cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	Repository cannot be resolved to a type
	JpaRepository cannot be resolved to a type
	User cannot be resolved to a type
	Integer cannot be resolved to a type
	Optional cannot be resolved to a type
	User cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type

     <init> (Ljava/lang/String;)V LineNumberTable LocalVariableTable findByUsernameAndPassword 0(Ljava/lang/String;Ljava/lang/String;)LOptional; 	Signature 8(Ljava/lang/String;Ljava/lang/String;)LOptional<LUser;>; 
SourceFile LoginRepository.java 2Ljava/lang/Object;LJpaRepository<LUser;LInteger;>; RuntimeInvisibleAnnotations LRepository; InconsistentHierarchy  Integer  JpaRepository ! Optional # User % java/lang/String MissingTypes               *      
� Y
� �                                                  &         "  $PK
    2q9U��4C|  |  D   bin/src/main/java/com/revature/P2API/repository/UserRepository.class����   =   :src/main/java/com/revature/P2API/repository/UserRepository  java/lang/Object 
SourceFile UserRepository.java 	Signature /Ljava/lang/Object;LJpaRepository<LUser;LLong;>; RuntimeInvisibleAnnotations LRepository; InconsistentHierarchy  JpaRepository  Long  User MissingTypes                    	     
           
     PK
    2q9UO���!  !  A   bin/src/main/java/com/revature/P2API/repository/models/User.class����   = 8  7src/main/java/com/revature/P2API/repository/models/User  java/lang/Object id J RuntimeInvisibleAnnotations LId; LGeneratedValue; strategy username Ljava/lang/String; password <init> ()V Code  java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API.repository.models" does not match the expected package "src.main.java.com.revature.P2API.repository.models"
	The import javax cannot be resolved
	The import javax cannot be resolved
	The import javax cannot be resolved
	The import javax cannot be resolved
	The import javax cannot be resolved
	Entity cannot be resolved to a type
	Table cannot be resolved to a type
	Id cannot be resolved to a type
	GeneratedValue cannot be resolved to a type
	GenerationType cannot be resolved to a variable
	String cannot be resolved to a type
	String cannot be resolved to a type
	The constructor Object() is undefined
	String cannot be resolved to a type
	String cannot be resolved to a type
	The constructor Object() is undefined
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	The constructor Object() is undefined
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	Override cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this 9Lsrc/main/java/com/revature/P2API/repository/models/User; '(Ljava/lang/String;Ljava/lang/String;)V ((JLjava/lang/String;Ljava/lang/String;)V getId ()J ! !Unresolved compilation problem: 
 setId (J)V getUsername ()Ljava/lang/String; ' lUnresolved compilation problems: 
	String cannot be resolved to a type
	String cannot be resolved to a type
 setUsername getPassword setPassword toString 
LOverride; . �Unresolved compilation problems: 
	Override cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
	String cannot be resolved to a type
 RuntimeInvisibleTypeAnnotations 
SourceFile 	User.java LEntity; LTable; name 6 java/lang/String MissingTypes !             
     	             
        4     
� Y� �                   
            4     
� Y� �                   
            4     
� Y� �                   
            4     
� Y � �           &        
      " #     4     
� Y � �           +        
      $ %     4     
� Y&� �           0        
      (      4     
� Y&� �           5        
      ) %     4     
� Y&� �           :        
      *      4     
� Y&� �           ?        
      + %       ,      4     
� Y-� �           C        
     /      ,    0    1    
  2   3   7     5PK
    2q9U����L  L  ?   bin/src/main/java/com/revature/P2API/service/LoginService.class����   = $  5src/main/java/com/revature/P2API/service/LoginService  java/lang/Object loginRepository LLoginRepository; <init> (LLoginRepository;)V RuntimeInvisibleAnnotations LAutowired; Code  java/lang/Error hUnresolved compilation problems: 
	The declared package "com.revature.P2API.service" does not match the expected package "src.main.java.com.revature.P2API.service"
	The import java.util cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	Service cannot be resolved to a type
	LoginRepository cannot be resolved to a type
	Autowired cannot be resolved to a type
	Implicit super constructor Object() is undefined. Must explicitly invoke another constructor
	LoginRepository cannot be resolved to a type
	LoginRepository cannot be resolved to a type
	User cannot be resolved to a type
	User cannot be resolved to a type
	Optional cannot be resolved to a type
	User cannot be resolved to a type
	LoginRepository cannot be resolved to a type
	System cannot be resolved

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this 7Lsrc/main/java/com/revature/P2API/service/LoginService; RuntimeInvisibleTypeAnnotations login (LUser;)LUser;  �Unresolved compilation problems: 
	User cannot be resolved to a type
	User cannot be resolved to a type
	Optional cannot be resolved to a type
	User cannot be resolved to a type
	LoginRepository cannot be resolved to a type
	System cannot be resolved
 
SourceFile LoginService.java 	LService;   LoginRepository " User MissingTypes !                	     
      4     
� Y� �                   
           
          4     
� Y� �                   
           	        #      !PK
    2q9U����z
  z
  >   bin/src/main/java/com/revature/P2API/service/UserService.class����   = /  4src/main/java/com/revature/P2API/service/UserService  java/lang/Object userRepository LUserRepository; <init> (LUserRepository;)V RuntimeInvisibleAnnotations LAutowired; Code  java/lang/Error gUnresolved compilation problems: 
	The declared package "com.revature.P2API.service" does not match the expected package "src.main.java.com.revature.P2API.service"
	The import java.util cannot be resolved
	The import java.util cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	Service cannot be resolved to a type
	UserRepository cannot be resolved to a type
	Autowired cannot be resolved to a type
	UserRepository cannot be resolved to a type
	The constructor Object() is undefined
	UserRepository cannot be resolved to a type
	User cannot be resolved to a type
	Long cannot be resolved to a type
	Optional cannot be resolved to a type
	User cannot be resolved to a type
	UserRepository cannot be resolved to a type
	User cannot be resolved to a type
	UserRepository cannot be resolved to a type
	User cannot be resolved to a type
	List cannot be resolved to a type
	User cannot be resolved to a type
	List cannot be resolved to a type
	User cannot be resolved to a type
	UserRepository cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this 6Lsrc/main/java/com/revature/P2API/service/UserService; RuntimeInvisibleTypeAnnotations getUser ()LUser;  �Unresolved compilation problems: 
	User cannot be resolved to a type
	Long cannot be resolved to a type
	Optional cannot be resolved to a type
	User cannot be resolved to a type
	UserRepository cannot be resolved to a type
 
createUser  �Unresolved compilation problems: 
	User cannot be resolved to a type
	UserRepository cannot be resolved to a type
	User cannot be resolved to a type
 getUsers ()LList; 	Signature ()LList<LUser;>; $ �Unresolved compilation problems: 
	List cannot be resolved to a type
	User cannot be resolved to a type
	List cannot be resolved to a type
	User cannot be resolved to a type
	UserRepository cannot be resolved to a type
 
SourceFile UserService.java 	LService; ) List + User - UserRepository MissingTypes !                	     
      4     
� Y� �                   
           
          4     
� Y� �                   
            4     
� Y� �                   
          !    "    4     
� Y#� �           !        
      %    & 	     '   .     ( * ,PK
    2q9U] �6  6  -   bin/src/main/resources/application.propertiesspring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://music-market-place.c9u7ywrrjnzu.us-west-1.rds.amazonaws.com:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=music123
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
PK
    2q9U���R  R  !   bin/src/main/resources/index.html<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music</title>
</head>
<body>
    <div id="banner"></div>
    
    <script src="index.js"></script>
</body>
</html>PK
    2q9U�&(�)  �)     bin/src/main/resources/index.jslet banner = document.querySelector("#banner");

window.addEventListener("load", renderLogin)


function derenderPage(){
    document.querySelector("body").innerHTML = "";
}

function renderLogin(){

derenderPage()

document.body.style.width = "100%";
document.body.style.minHeight = "1000px";
document.body.style.margin = "0";
document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";

    //loginContainer Creation
    let loginContainer = document.createElement("div");
    loginContainer.id = "login";
    
    //Black box creation
    let rec = document.createElement("div");
    rec.style.backgroundColor = "black";
    rec.style.width = "200px";
    rec.style.height = "340px";
    loginContainer.appendChild(document.createElement("br"));
    loginContainer.appendChild(document.createElement("br"));
    loginContainer.appendChild(rec);

    rec.appendChild(document.createElement("br"));

    //Top Buttons
    
    let loginButton = document.createElement("input");
    loginButton.type = "button";
    loginButton.value = "Login";
    loginButton.style.color = "cyan";
    loginButton.style.backgroundColor = "black";
    loginButton.style.borderBottomColor = "silver";
    rec.appendChild(loginButton);

    let regButton = document.createElement("input");
    regButton.type = "button";
    regButton.value = "Register";
    regButton.style.color = "cyan";
    regButton.style.backgroundColor = "black";
    regButton.style.borderBottomColor = "cyan";
    regButton.style.marginLeft = "20px";
    regButton.addEventListener("click", renderCreate);
    rec.appendChild(regButton);

    //Fields


    let usernameLabel = document.createElement("p");
    usernameLabel.innerText = "Username";
    rec.appendChild(usernameLabel);
    usernameLabel.style.color = "cyan";

    let usernameInput = document.createElement("input");
    usernameInput.id = "username";
    usernameInput.type = "text";
    usernameInput.placeholder = "username";
    usernameInput.style.backgroundColor = "silver";
    rec.appendChild(usernameInput);
    rec.appendChild(document.createElement("br"));

    
    let passwordLabel = document.createElement("p");
    passwordLabel.innerText = "Password";
    passwordLabel.style.color = "cyan";
    rec.appendChild(passwordLabel);

    let passwordInput = document.createElement("input");
    passwordInput.type = "password";
    passwordInput.id = "password";
    passwordInput.style.backgroundColor = "silver";
    rec.appendChild(passwordInput);
    rec.appendChild(document.createElement("br"));
    rec.appendChild(document.createElement("br"));
    rec.appendChild(document.createElement("br"));

    let submitButton = document.createElement("input");
    submitButton.type = "button";
    submitButton.value = "Login";
    submitButton.style.width = "80px";
    submitButton.style.borderRadius = "7px";
    submitButton.addEventListener("click", asyncLogin);

    rec.appendChild(submitButton);
    
    document.querySelector("body").appendChild(loginContainer);
    //Login Container Styling
    document.getElementById("login").style.fontFamily = "Arial";
    document.getElementById("login").style.width = "200px"
    document.getElementById("login").style.marginLeft = "auto";
    document.getElementById("login").style.marginRight = "auto";
    document.getElementById("login").style.textAlign = "center";
}

async function asyncLogin() {
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = "http://localhost:8080/login";

    let loginObj = {
        username: userInput,
        password: passInput
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
                    'content-type':'application/json'
                }),
                body: JSON.stringify(loginObj)}
        )
        let data = await response.json();
        renderHomePage(data);
        
    }catch(error){
        console.error(`Error is ${error}`);
    }
}

function renderCreate(){
    derenderPage()
    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";
    document.body.style.background = "linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(31,126,131,1) 100%)";
    
        //createContainer Creation
        let createContainer = document.createElement("div");
        createContainer.id = "create";
        
        //Black box creation
        let rec = document.createElement("div");
        rec.style.backgroundColor = "black";
        rec.style.width = "200px";
        rec.style.height = "400px";
        createContainer.appendChild(document.createElement("br"));
        createContainer.appendChild(document.createElement("br"));
        createContainer.appendChild(rec);
    
        rec.appendChild(document.createElement("br"));
    
        //Top Buttons
        
        let loginButton = document.createElement("input");
        loginButton.type = "button";
        loginButton.value = "Login";
        loginButton.style.color = "cyan";
        loginButton.style.backgroundColor = "black";
        loginButton.style.borderBottomColor = "cyan";
        loginButton.addEventListener("click", renderLogin);
        rec.appendChild(loginButton);
    
        let regButton = document.createElement("input");
        regButton.type = "button";
        regButton.value = "Register";
        regButton.style.color = "cyan";
        regButton.style.backgroundColor = "black";
        regButton.style.borderBottomColor = "silver";
        regButton.style.marginLeft = "20px";
        rec.appendChild(regButton);
    
        //Fields
    
        let emailLabel = document.createElement("p");
        emailLabel.innerText = "Email";
        rec.appendChild(emailLabel);
        emailLabel.style.color = "cyan";

        let emailInput = document.createElement("input");
        emailInput.id = "email";
        emailInput.type = "text";
        emailInput.placeholder = "email";
        emailInput.style.backgroundColor = "silver";
        rec.appendChild(emailInput);
        rec.appendChild(document.createElement("br"));
    
        let usernameLabel = document.createElement("p");
        usernameLabel.innerText = "Username";
        rec.appendChild(usernameLabel);
        usernameLabel.style.color = "cyan";
    
        let usernameInput = document.createElement("input");
        usernameInput.id = "username";
        usernameInput.type = "text";
        usernameInput.placeholder = "username";
        usernameInput.style.backgroundColor = "silver";
        rec.appendChild(usernameInput);
        rec.appendChild(document.createElement("br"));
    
        
        let passwordLabel = document.createElement("p");
        passwordLabel.innerText = "Password";
        passwordLabel.style.color = "cyan";
        rec.appendChild(passwordLabel);
    
        let passwordInput = document.createElement("input");
        passwordInput.type = "password";
        passwordInput.id = "password";
        passwordInput.style.backgroundColor = "silver";
        rec.appendChild(passwordInput);
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
        rec.appendChild(document.createElement("br"));
    
        let submitButton = document.createElement("input");
        submitButton.type = "button";
        submitButton.value = "Login";
        submitButton.style.width = "80px";
        submitButton.style.borderRadius = "7px";
        submitButton.addEventListener("click", asyncCreate);
    
        rec.appendChild(submitButton);
        
        document.querySelector("body").appendChild(createContainer);
        //Login Container Styling
        document.getElementById("create").style.fontFamily = "Arial";
        document.getElementById("create").style.width = "200px"
        document.getElementById("create").style.marginLeft = "auto";
        document.getElementById("create").style.marginRight = "auto";
        document.getElementById("create").style.textAlign = "center";
}

async function asyncCreate() {
    let emailInput = document.querySelector("#email").value;
    let userInput = document.querySelector("#username").value;
    let passInput = document.querySelector("#password").value;

    const url = `localhost:8080/login`;

    let createObj = {
        email: emailInput,
        username: userInput,
        password: passInput
    };

    try{
        let response = await fetch(
            url,
            {
                method: "POST",
                headers: new Headers({
                    'content-type':'application/json'
                }),
                body: JSON.stringify(createObj)}
        )

        let data = await response.json();
        
    }catch(error){
        console.error(`Error is ${error}`);
    }
}


function renderHomePage(data){
    derenderPage()
    document.body.style.width = "100%";
    document.body.style.minHeight = "1000px";
    document.body.style.margin = "0";

    let gridContainer = document.createElement("div");
    gridContainer.style.display = "grid";
    gridContainer.style.gridTemplateColumns = "100px auto";
    gridContainer.style.backgroundColor = "blue";
    

    let hello = document.createElement("div");
    hello.style.gridColumnStart = "2";
    hello.style.gridColumnEnd = "2";
    hello.style.backgroundColor = "purple";
    hello.style.textAlign = "right";
    hello.appendChild(document.createElement("br"));

    let userinfoButton = document.createElement("input");
    userinfoButton.type = "button";
    userinfoButton.value = `${data.username}`;
    userinfoButton.style.width = "80px";
    userinfoButton.style.textAlign = "center";
    userinfoButton.style.backgroundColor = "purple";
    userinfoButton.style.borderColor = "purple";
    userinfoButton.style.borderBottomColor = "black";
    userinfoButton.style.marginRight = "100px";
    userinfoButton.addEventListener("click", loadUserInfo(data));
    

    hello.appendChild(userinfoButton);

    gridContainer.appendChild(hello);
    

   

    document.querySelector("body").appendChild(gridContainer);
}

function loadUserInfo(data){
    derenderPage()
    console.log(`${data.id} ${data.username} ${data.password}`)
}PK
    2q9U�h�      @   bin/src/test/java/com/revature/P2API/P1ApiApplicationTests.class����   =   6src/test/java/com/revature/P2API/P1ApiApplicationTests  java/lang/Object <init> ()V Code 	 java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API" does not match the expected package "src.test.java.com.revature.P2API"
	The import org cannot be resolved
	The import org cannot be resolved
	SpringBootTest cannot be resolved to a type
	Implicit super constructor Object() is undefined for default constructor. Must define an explicit constructor
	Test cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this 8Lsrc/test/java/com/revature/P2API/P1ApiApplicationTests; contextLoads RuntimeInvisibleAnnotations LTest;  DUnresolved compilation problem: 
	Test cannot be resolved to a type
 
SourceFile P1ApiApplicationTests.java LSpringBootTest;                  4     
� Y
� �                   
                     4     
� Y� �           	        
                  PK
    2q9U~[d�`  `  I   bin/src/test/java/com/revature/P2API/controller/TestAlbumController.class����   = G  ?src/test/java/com/revature/P2API/controller/TestAlbumController  java/lang/Object restTemplate LRestTemplate; alCon LAlbumController; RuntimeInvisibleAnnotations LMock; testRestTemplate LTestRestTemplate; mapper LObjectMapper; <init> ()V Code  java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.test.java.com.revature.P2API.controller"
	The import org cannot be resolved
	The import java.io cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	Implicit super constructor Object() is undefined for default constructor. Must define an explicit constructor
	RestTemplate cannot be resolved to a type
	Mock cannot be resolved to a type
	AlbumController cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	BeforeEach cannot be resolved to a type
	AlbumController cannot be resolved to a type
	AlbumController cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	Test cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	AlbumController cannot be resolved to a type
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	AlbumController cannot be resolved to a type
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this ALsrc/test/java/com/revature/P2API/controller/TestAlbumController; setup LBeforeEach;  Unresolved compilation problems: 
	BeforeEach cannot be resolved to a type
	AlbumController cannot be resolved to a type
	AlbumController cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
 contextLoads LTest; $ �Unresolved compilation problems: 
	Test cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
 getAlbumByIdIncorrect 
Exceptions ( IOException * �Unresolved compilation problems: 
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	AlbumController cannot be resolved to a type
 getAlbumByIdStatusOK - JsonMappingException / JsonProcessingException 1�Unresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
 getAlbumByIdMediaJson 4�Unresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
 getAlbumByIdJsonContent 7TUnresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
 getAlbumsByArtistIncorrect getAlbumsByArtistStatusOK getAlbumsByArtistMediaJson getAlbumsByArtistJsonContent 
SourceFile TestAlbumController.java ? AlbumController A ObjectMapper C RestTemplate E TestRestTemplate MissingTypes !               	     
                     4     
� Y� �                   
          	           4     
� Y� �                   
      !   	     "      4     
� Y#� �           %        
       %   &     ' 	     "      4     
� Y)� �           -        
       +   &     , . 	     "      4     
� Y0� �           5        
       2   &     , . 	     "      4     
� Y3� �           >        
       5   &     , . 	     "      4     
� Y6� �           G        
       8   &     ' 	     "      4     
� Y)� �           P        
       9   &     , . 	     "      4     
� Y0� �           X        
       :   &     , . 	     "      4     
� Y3� �           a        
       ;   &     , . 	     "      4     
� Y6� �           k        
      <    = F     > ' , . @ B DPK
    2q9Uv0���  �  J   bin/src/test/java/com/revature/P2API/controller/TestArtistController.class����   = D  @src/test/java/com/revature/P2API/controller/TestArtistController  java/lang/Object restTemplate LRestTemplate; aCon LArtistController; RuntimeInvisibleAnnotations LMock; testRestTemplate LTestRestTemplate; mapper LObjectMapper; <init> ()V Code  java/lang/Error Unresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.test.java.com.revature.P2API.controller"
	The import org cannot be resolved
	The import org cannot be resolved
	The import java.io cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	Implicit super constructor Object() is undefined for default constructor. Must define an explicit constructor
	RestTemplate cannot be resolved to a type
	Mock cannot be resolved to a type
	ArtistController cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	BeforeEach cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	ArtistController cannot be resolved to a type
	ArtistController cannot be resolved to a type
	Test cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	ArtistController cannot be resolved to a type
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	ArtistController cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this BLsrc/test/java/com/revature/P2API/controller/TestArtistController; setup LBeforeEach;  ]Unresolved compilation problems: 
	BeforeEach cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	ArtistController cannot be resolved to a type
	ArtistController cannot be resolved to a type
 contextLoads LTest; $ �Unresolved compilation problems: 
	Test cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
 getArtistByNameIncorrect 
Exceptions ( IOException * �Unresolved compilation problems: 
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	ArtistController cannot be resolved to a type
 getArtistByNameStatusOK - JsonMappingException / JsonProcessingException 1�Unresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
 getArtistByNameMediaJson 4�Unresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
 getArtistByNameJsonContent 7TUnresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
 getArtistByIdIncorrect 
SourceFile TestArtistController.java < ArtistController > ObjectMapper @ RestTemplate B TestRestTemplate MissingTypes !               	     
                     4     
� Y� �                   
          	           4     
� Y� �           '        
      !   	     "      4     
� Y#� �           /        
       %   &     ' 	     "      4     
� Y)� �           7        
       +   &     , . 	     "      4     
� Y0� �           ?        
       2   &     , . 	     "      4     
� Y3� �           H        
       5   &     , . 	     "      4     
� Y6� �           Q        
       8   &     ' 	     "      4     
� Y)� �           Z        
      9    : C     ; ' , . = ? APK
    2q9U����  �  H   bin/src/test/java/com/revature/P2API/controller/TestSongController.class����   = G  >src/test/java/com/revature/P2API/controller/TestSongController  java/lang/Object restTemplate LRestTemplate; sCon LSongController; RuntimeInvisibleAnnotations LMock; testRestTemplate LTestRestTemplate; mapper LObjectMapper; <init> ()V Code  java/lang/Error �Unresolved compilation problems: 
	The declared package "com.revature.P2API.controller" does not match the expected package "src.test.java.com.revature.P2API.controller"
	The import org cannot be resolved
	The import java.io cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import org cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	The import com cannot be resolved
	Implicit super constructor Object() is undefined for default constructor. Must define an explicit constructor
	RestTemplate cannot be resolved to a type
	Mock cannot be resolved to a type
	SongController cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	BeforeEach cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	SongController cannot be resolved to a type
	SongController cannot be resolved to a type
	Test cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	SongController cannot be resolved to a type
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	SongController cannot be resolved to a type
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type

     (Ljava/lang/String;)V LineNumberTable LocalVariableTable this @Lsrc/test/java/com/revature/P2API/controller/TestSongController; setup LBeforeEach;  YUnresolved compilation problems: 
	BeforeEach cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	SongController cannot be resolved to a type
	SongController cannot be resolved to a type
 contextLoads LTest; $ �Unresolved compilation problems: 
	Test cannot be resolved to a type
	RestTemplate cannot be resolved to a type
	Object cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
	ObjectMapper cannot be resolved to a type
 getSongByIdIncorrect 
Exceptions ( IOException * �Unresolved compilation problems: 
	Test cannot be resolved to a type
	IOException cannot be resolved to a type
	Object cannot be resolved to a type
	SongController cannot be resolved to a type
 getSongByIdStatusOK - JsonMappingException / JsonProcessingException 1�Unresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	HttpStatus cannot be resolved to a variable
 getSongByIdMediaJson 4�Unresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
	MediaType cannot be resolved to a variable
 getSongByIdJsonContent 7TUnresolved compilation problems: 
	Test cannot be resolved to a type
	JsonMappingException cannot be resolved to a type
	JsonProcessingException cannot be resolved to a type
	ResponseEntity cannot be resolved to a type
	String cannot be resolved to a type
	TestRestTemplate cannot be resolved to a type
	String cannot be resolved to a type
 getSongsByAlbumIdIncorrect getSongsByAlbumIdStatusOK getSongsByAlbumIdMediaJson getSongsByAlbumIdJsonContent 
SourceFile TestSongController.java ? ObjectMapper A RestTemplate C SongController E TestRestTemplate MissingTypes !               	     
                     4     
� Y� �                   
          	           4     
� Y� �                   
      !   	     "      4     
� Y#� �           '        
       %   &     ' 	     "      4     
� Y)� �           /        
       +   &     , . 	     "      4     
� Y0� �           7        
       2   &     , . 	     "      4     
� Y3� �           @        
       5   &     , . 	     "      4     
� Y6� �           I        
       8   &     ' 	     "      4     
� Y)� �           R        
       9   &     , . 	     "      4     
� Y0� �           Z        
       :   &     , . 	     "      4     
� Y3� �           c        
       ;   &     , . 	     "      4     
� Y6� �           l        
      <    = F     ' , . > @ B DPK
    �9U��J�h)  h)     mvnw#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Maven Start Up Batch script
#
# Required ENV vars:
# ------------------
#   JAVA_HOME - location of a JDK home dir
#
# Optional ENV vars
# -----------------
#   M2_HOME - location of maven2's installed home dir
#   MAVEN_OPTS - parameters passed to the Java VM when running Maven
#     e.g. to debug Maven itself, use
#       set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files
# ----------------------------------------------------------------------------

if [ -z "$MAVEN_SKIP_RC" ] ; then

  if [ -f /usr/local/etc/mavenrc ] ; then
    . /usr/local/etc/mavenrc
  fi

  if [ -f /etc/mavenrc ] ; then
    . /etc/mavenrc
  fi

  if [ -f "$HOME/.mavenrc" ] ; then
    . "$HOME/.mavenrc"
  fi

fi

# OS specific support.  $var _must_ be set to either true or false.
cygwin=false;
darwin=false;
mingw=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true;;
  Darwin*) darwin=true
    # Use /usr/libexec/java_home if available, otherwise fall back to /Library/Java/Home
    # See https://developer.apple.com/library/mac/qa/qa1170/_index.html
    if [ -z "$JAVA_HOME" ]; then
      if [ -x "/usr/libexec/java_home" ]; then
        export JAVA_HOME="`/usr/libexec/java_home`"
      else
        export JAVA_HOME="/Library/Java/Home"
      fi
    fi
    ;;
esac

if [ -z "$JAVA_HOME" ] ; then
  if [ -r /etc/gentoo-release ] ; then
    JAVA_HOME=`java-config --jre-home`
  fi
fi

if [ -z "$M2_HOME" ] ; then
  ## resolve links - $0 may be a link to maven's home
  PRG="$0"

  # need this for relative symlinks
  while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
      PRG="$link"
    else
      PRG="`dirname "$PRG"`/$link"
    fi
  done

  saveddir=`pwd`

  M2_HOME=`dirname "$PRG"`/..

  # make it fully qualified
  M2_HOME=`cd "$M2_HOME" && pwd`

  cd "$saveddir"
  # echo Using m2 at $M2_HOME
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
  [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --unix "$M2_HOME"`
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# For Mingw, ensure paths are in UNIX format before anything is touched
if $mingw ; then
  [ -n "$M2_HOME" ] &&
    M2_HOME="`(cd "$M2_HOME"; pwd)`"
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME="`(cd "$JAVA_HOME"; pwd)`"
fi

if [ -z "$JAVA_HOME" ]; then
  javaExecutable="`which javac`"
  if [ -n "$javaExecutable" ] && ! [ "`expr \"$javaExecutable\" : '\([^ ]*\)'`" = "no" ]; then
    # readlink(1) is not available as standard on Solaris 10.
    readLink=`which readlink`
    if [ ! `expr "$readLink" : '\([^ ]*\)'` = "no" ]; then
      if $darwin ; then
        javaHome="`dirname \"$javaExecutable\"`"
        javaExecutable="`cd \"$javaHome\" && pwd -P`/javac"
      else
        javaExecutable="`readlink -f \"$javaExecutable\"`"
      fi
      javaHome="`dirname \"$javaExecutable\"`"
      javaHome=`expr "$javaHome" : '\(.*\)/bin'`
      JAVA_HOME="$javaHome"
      export JAVA_HOME
    fi
  fi
fi

if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
      # IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD="`\\unset -f command; \\command -v java`"
  fi
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly." >&2
  echo "  We cannot execute $JAVACMD" >&2
  exit 1
fi

if [ -z "$JAVA_HOME" ] ; then
  echo "Warning: JAVA_HOME environment variable is not set."
fi

CLASSWORLDS_LAUNCHER=org.codehaus.plexus.classworlds.launcher.Launcher

# traverses directory structure from process work directory to filesystem root
# first directory with .mvn subdirectory is considered project base directory
find_maven_basedir() {

  if [ -z "$1" ]
  then
    echo "Path not specified to find_maven_basedir"
    return 1
  fi

  basedir="$1"
  wdir="$1"
  while [ "$wdir" != '/' ] ; do
    if [ -d "$wdir"/.mvn ] ; then
      basedir=$wdir
      break
    fi
    # workaround for JBEAP-8937 (on Solaris 10/Sparc)
    if [ -d "${wdir}" ]; then
      wdir=`cd "$wdir/.."; pwd`
    fi
    # end of workaround
  done
  echo "${basedir}"
}

# concatenates all lines of a file
concat_lines() {
  if [ -f "$1" ]; then
    echo "$(tr -s '\n' ' ' < "$1")"
  fi
}

BASE_DIR=`find_maven_basedir "$(pwd)"`
if [ -z "$BASE_DIR" ]; then
  exit 1;
fi

##########################################################################################
# Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
# This allows using the maven wrapper in projects that prohibit checking in binary data.
##########################################################################################
if [ -r "$BASE_DIR/.mvn/wrapper/maven-wrapper.jar" ]; then
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Found .mvn/wrapper/maven-wrapper.jar"
    fi
else
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Couldn't find .mvn/wrapper/maven-wrapper.jar, downloading it ..."
    fi
    if [ -n "$MVNW_REPOURL" ]; then
      jarUrl="$MVNW_REPOURL/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    else
      jarUrl="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    fi
    while IFS="=" read key value; do
      case "$key" in (wrapperUrl) jarUrl="$value"; break ;;
      esac
    done < "$BASE_DIR/.mvn/wrapper/maven-wrapper.properties"
    if [ "$MVNW_VERBOSE" = true ]; then
      echo "Downloading from: $jarUrl"
    fi
    wrapperJarPath="$BASE_DIR/.mvn/wrapper/maven-wrapper.jar"
    if $cygwin; then
      wrapperJarPath=`cygpath --path --windows "$wrapperJarPath"`
    fi

    if command -v wget > /dev/null; then
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Found wget ... using wget"
        fi
        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then
            wget "$jarUrl" -O "$wrapperJarPath" || rm -f "$wrapperJarPath"
        else
            wget --http-user=$MVNW_USERNAME --http-password=$MVNW_PASSWORD "$jarUrl" -O "$wrapperJarPath" || rm -f "$wrapperJarPath"
        fi
    elif command -v curl > /dev/null; then
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Found curl ... using curl"
        fi
        if [ -z "$MVNW_USERNAME" ] || [ -z "$MVNW_PASSWORD" ]; then
            curl -o "$wrapperJarPath" "$jarUrl" -f
        else
            curl --user $MVNW_USERNAME:$MVNW_PASSWORD -o "$wrapperJarPath" "$jarUrl" -f
        fi

    else
        if [ "$MVNW_VERBOSE" = true ]; then
          echo "Falling back to using Java to download"
        fi
        javaClass="$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.java"
        # For Cygwin, switch paths to Windows format before running javac
        if $cygwin; then
          javaClass=`cygpath --path --windows "$javaClass"`
        fi
        if [ -e "$javaClass" ]; then
            if [ ! -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                if [ "$MVNW_VERBOSE" = true ]; then
                  echo " - Compiling MavenWrapperDownloader.java ..."
                fi
                # Compiling the Java class
                ("$JAVA_HOME/bin/javac" "$javaClass")
            fi
            if [ -e "$BASE_DIR/.mvn/wrapper/MavenWrapperDownloader.class" ]; then
                # Running the downloader
                if [ "$MVNW_VERBOSE" = true ]; then
                  echo " - Running MavenWrapperDownloader.java ..."
                fi
                ("$JAVA_HOME/bin/java" -cp .mvn/wrapper MavenWrapperDownloader "$MAVEN_PROJECTBASEDIR")
            fi
        fi
    fi
fi
##########################################################################################
# End of extension
##########################################################################################

export MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}
if [ "$MVNW_VERBOSE" = true ]; then
  echo $MAVEN_PROJECTBASEDIR
fi
MAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
  [ -n "$M2_HOME" ] &&
    M2_HOME=`cygpath --path --windows "$M2_HOME"`
  [ -n "$JAVA_HOME" ] &&
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
  [ -n "$MAVEN_PROJECTBASEDIR" ] &&
    MAVEN_PROJECTBASEDIR=`cygpath --path --windows "$MAVEN_PROJECTBASEDIR"`
fi

# Provide a "standardized" way to retrieve the CLI args that will
# work with both Windows and non-Windows executions.
MAVEN_CMD_LINE_ARGS="$MAVEN_CONFIG $@"
export MAVEN_CMD_LINE_ARGS

WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

exec "$JAVACMD" \
  $MAVEN_OPTS \
  $MAVEN_DEBUG_OPTS \
  -classpath "$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar" \
  "-Dmaven.home=${M2_HOME}" \
  "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
  ${WRAPPER_LAUNCHER} $MAVEN_CONFIG "$@"
PK
    �9U��Q>
  
     mvnw.cmd@REM ----------------------------------------------------------------------------
@REM Licensed to the Apache Software Foundation (ASF) under one
@REM or more contributor license agreements.  See the NOTICE file
@REM distributed with this work for additional information
@REM regarding copyright ownership.  The ASF licenses this file
@REM to you under the Apache License, Version 2.0 (the
@REM "License"); you may not use this file except in compliance
@REM with the License.  You may obtain a copy of the License at
@REM
@REM    https://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM ----------------------------------------------------------------------------

@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM M2_HOME - location of maven2's installed home dir
@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands
@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a keystroke before ending
@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven
@REM     e.g. to debug Maven itself, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files
@REM ----------------------------------------------------------------------------

@REM Begin all REM lines with '@' in case MAVEN_BATCH_ECHO is 'on'
@echo off
@REM set title of command window
title %0
@REM enable echoing by setting MAVEN_BATCH_ECHO to 'on'
@if "%MAVEN_BATCH_ECHO%" == "on"  echo %MAVEN_BATCH_ECHO%

@REM set %HOME% to equivalent of $HOME
if "%HOME%" == "" (set "HOME=%HOMEDRIVE%%HOMEPATH%")

@REM Execute a user defined script before this one
if not "%MAVEN_SKIP_RC%" == "" goto skipRcPre
@REM check for pre script, once with legacy .bat ending and once with .cmd ending
if exist "%USERPROFILE%\mavenrc_pre.bat" call "%USERPROFILE%\mavenrc_pre.bat" %*
if exist "%USERPROFILE%\mavenrc_pre.cmd" call "%USERPROFILE%\mavenrc_pre.cmd" %*
:skipRcPre

@setlocal

set ERROR_CODE=0

@REM To isolate internal variables from possible post scripts, we use another setlocal
@setlocal

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Error: JAVA_HOME not found in your environment. >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init

echo.
echo Error: JAVA_HOME is set to an invalid directory. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

@REM ==== END VALIDATION ====

:init

@REM Find the project base dir, i.e. the directory that contains the folder ".mvn".
@REM Fallback to current working directory if not found.

set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
IF NOT "%MAVEN_PROJECTBASEDIR%"=="" goto endDetectBaseDir

set EXEC_DIR=%CD%
set WDIR=%EXEC_DIR%
:findBaseDir
IF EXIST "%WDIR%"\.mvn goto baseDirFound
cd ..
IF "%WDIR%"=="%CD%" goto baseDirNotFound
set WDIR=%CD%
goto findBaseDir

:baseDirFound
set MAVEN_PROJECTBASEDIR=%WDIR%
cd "%EXEC_DIR%"
goto endDetectBaseDir

:baseDirNotFound
set MAVEN_PROJECTBASEDIR=%EXEC_DIR%
cd "%EXEC_DIR%"

:endDetectBaseDir

IF NOT EXIST "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" goto endReadAdditionalConfig

@setlocal EnableExtensions EnableDelayedExpansion
for /F "usebackq delims=" %%a in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a
@endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%

:endReadAdditionalConfig

SET MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

set DOWNLOAD_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"

FOR /F "usebackq tokens=1,2 delims==" %%A IN ("%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties") DO (
    IF "%%A"=="wrapperUrl" SET DOWNLOAD_URL=%%B
)

@REM Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
@REM This allows using the maven wrapper in projects that prohibit checking in binary data.
if exist %WRAPPER_JAR% (
    if "%MVNW_VERBOSE%" == "true" (
        echo Found %WRAPPER_JAR%
    )
) else (
    if not "%MVNW_REPOURL%" == "" (
        SET DOWNLOAD_URL="%MVNW_REPOURL%/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"
    )
    if "%MVNW_VERBOSE%" == "true" (
        echo Couldn't find %WRAPPER_JAR%, downloading it ...
        echo Downloading from: %DOWNLOAD_URL%
    )

    powershell -Command "&{"^
		"$webclient = new-object System.Net.WebClient;"^
		"if (-not ([string]::IsNullOrEmpty('%MVNW_USERNAME%') -and [string]::IsNullOrEmpty('%MVNW_PASSWORD%'))) {"^
		"$webclient.Credentials = new-object System.Net.NetworkCredential('%MVNW_USERNAME%', '%MVNW_PASSWORD%');"^
		"}"^
		"[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webclient.DownloadFile('%DOWNLOAD_URL%', '%WRAPPER_JAR%')"^
		"}"
    if "%MVNW_VERBOSE%" == "true" (
        echo Finished downloading %WRAPPER_JAR%
    )
)
@REM End of extension

@REM Provide a "standardized" way to retrieve the CLI args that will
@REM work with both Windows and non-Windows executions.
set MAVEN_CMD_LINE_ARGS=%*

%MAVEN_JAVA_EXE% ^
  %JVM_CONFIG_MAVEN_PROPS% ^
  %MAVEN_OPTS% ^
  %MAVEN_DEBUG_OPTS% ^
  -classpath %WRAPPER_JAR% ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  %WRAPPER_LAUNCHER% %MAVEN_CONFIG% %*
if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%

if not "%MAVEN_SKIP_RC%"=="" goto skipRcPost
@REM check for post script, once with legacy .bat ending and once with .cmd ending
if exist "%USERPROFILE%\mavenrc_post.bat" call "%USERPROFILE%\mavenrc_post.bat"
if exist "%USERPROFILE%\mavenrc_post.cmd" call "%USERPROFILE%\mavenrc_post.cmd"
:skipRcPost

@REM pause the script if MAVEN_BATCH_PAUSE is set to 'on'
if "%MAVEN_BATCH_PAUSE%"=="on" pause

if "%MAVEN_TERMINATE_CMD%"=="on" exit %ERROR_CODE%

cmd /C exit /B %ERROR_CODE%
PK
    z~=U�v:�  �  	   p2key.pem-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA5VG1HyMp7T3CFh0xjNtpk3GxP6VeGL7garpHtp0WijY2tavp
L+bFHr0w4JzV/V4JWL3JYgHifTskHvXaAL1w9+KEiTrSRsZGC6FvjkjaxHUcHabi
FRGYxdfkiR0py7Dsbq1M9TIDIITC7VVo0IzD9T5tD464hNNxg1CRANrPd/tnz36K
fUy+sNFMbqD5qadjueG3i8lXLJipio5Y4YY+M1HFo8upK9FSXhgN19QuZVkzk23p
syYJfny94vSDPF7ZiIb78uYuPm9U1Kv9m2xr6A/MeOARsDTgeIXdXsZpNYeOcRoB
PNG9Mmz4/ZcTJplCOTxLCjU+TAddzLc8/F9PywIDAQABAoIBAQDLyxtNerCN965+
fJ9GcM+YixdcWpgPIcLK1pVYwq3/UkK4nPh0638O3E+NrZO2wVVJGhDYGpivdlmZ
ch+1PKYihZoHYtDwuNATEfrT1gclRHYiG+cbljHQ0RZ2jAZS0P6tNTIJTdLdmV6q
EJc/j3mufzXo94sf79EXRAg5XDu4gXOJ7/ftBdnz/CGPfqBWCVPiy7+MhjkCQgNZ
82VqwhAQRW0zFb0c7QmUihpmBwQ+ckm9RXHNdE1aPEqUDk1Yk4At7avT+WAFerBy
yjwmApkdDD5Dp3AQHL74CowjA17hgKEtViHYuavBF9V0T3qHWG06QTOGx+hiZhhf
e1+buwyRAoGBAPSzjpMggMeA70TITjqOCfKvjtwleNNRBm28Pk4ODTql1LVAPxXS
AnwyKBVhln4HwdYRhrB8QP5TmajP84/xRLbePqAPG2BDN8tCytnXCx/8cycx/bJ6
LmVqhNxFwZTElcqwtQvPOsdjpARoLgd/Q1MbzmlPIgWWXxd8ki3zqY/tAoGBAO/o
U/+joEU+AnGm8BG/juAYZkZN//dOe0GC6Oa/XITZDrJOa6Kb4TdW4eImZU7wNmRX
BBaOhaHioJoWgeXkZOqU6aETaEIxf2dC32Cd32NtxdxDtAlKaqp4KkAc5delYmHJ
K7UFqmvQQ3+MtkdbnYrRBoutOR0vFYHP0POKPbeXAoGAMvGe4SqHJQHGzn8VKkOf
9pJuH479lKDtwbLLFdz/DBKyMfnqKFTMh6a5iZoDhsF+rV6AuAVmUox9FRQWFQWZ
1Kh4SUJb5LKZzwtcx/VpL4OTRbm2o42kUyDWADXVk29J8CTRzF+cUR6Baxl1W8I2
9fp4Apyi7J7dtToOBNsRlhECgYEAnHDz1Y/twzlcfqBNjEVN9fPzPYU/lRUoat/i
4BWJT1f7rWpV5gOgKWYOhlpjVcZusZ/Mmqj1m0sdT1299xuocxAICXGOWxvL6JpC
784DDeNXUvsTO7u7Ms6JPqWZe7XtIbb9OV4oc4WrflFTy9SCNzN3AT5EMDOz4qKR
rz5GYKECgYAfLpECRtg5xl7ccy9rTeJgRxRjZybd2mwlILecTlx3PtntDHF8Jt2O
z1ZyUFn/S8Tz9VPZMASDeoRxR61OzTpA9ym71KpQ87WFY+zh9eM4GoZTkaodDmIf
lnV2xC57IH4yt8P2zKtkcgTH0tes9oE1W+/y6nozj9xf2NuTu+Nd7A==
-----END RSA PRIVATE KEY-----PK
    -�=U��`~�  �     pom.xml<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.7.3</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>

	<groupId>com.revature</groupId>
	<artifactId>P1API</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<name>P1API</name>
	<description>API for Project 1</description>
	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
		<java.version>1.8</java.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>com.h2database</groupId>
			<artifactId>h2</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.postgresql</groupId>
			<artifactId>postgresql</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
		<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-thymeleaf</artifactId>
		</dependency>
		  <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
         <dependency>
            <groupId>com.auth0</groupId>
            <artifactId>java-jwt</artifactId>
            <version>3.18.1</version>
        </dependency>
			<dependency>
		    <groupId>io.jsonwebtoken</groupId>
		    <artifactId>jjwt-api</artifactId>
		    <version>0.11.5</version>
		</dependency>
		<dependency>
		    <groupId>io.jsonwebtoken</groupId>
		    <artifactId>jjwt-impl</artifactId>
		    <version>0.11.5</version>
		    <scope>runtime</scope>
		</dependency>
		<dependency>
		    <groupId>io.jsonwebtoken</groupId>
		    <artifactId>jjwt-jackson</artifactId> <!-- or jjwt-gson if Gson is preferred -->
		    <version>0.11.5</version>
		    <scope>runtime</scope>
		</dependency>
		<dependency>
		   <groupId>org.springframework.boot</groupId>
		   <artifactId>spring-boot-starter-tomcat</artifactId>
		   <scope>provided</scope>
		</dependency>
	</dependencies>

	<build>
		<finalName>${artifactId}</finalName>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>PK
    �9UmJ�Q       src/.DS_Store   Bud1           	                                                          Ilocblob                                                                                                                                                                                                                                                                                                                                                                                                                                              m a i nIlocblob      A   .������      m a i nbwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    m a i nvSrnlong       t e s tIlocblob      �   .������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    �9Uv)Kr       src/main/.DS_Store   Bud1           	                                                          Ilocblob                                                                                                                                                                                                                                                                                                                                                                                                                                              j a v aIlocblob      A   .������      j a v abwspblob   �bplist00�]ShowStatusBar[ShowToolbar[ShowTabView_ContainerShowSidebar\WindowBounds[ShowSidebar		_{{260, 341}, {920, 436}}	#/;R_klmno�                            �    j a v avSrnlong      	 r e s o u r c e sIlocblob      �   .������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  @      �                                        @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   E  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       DSDB                                 `          �                                         @      �                                          @      �                                          @                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              PK
    L�=U/�z    B   target/test-classes/com/revature/P2API/P1ApiApplicationTests.class����   4   (com/revature/P2API/P1ApiApplicationTests  java/lang/Object <init> ()V Code
  	   LineNumberTable LocalVariableTable this *Lcom/revature/P2API/P1ApiApplicationTests; contextLoads RuntimeVisibleAnnotations Lorg/junit/jupiter/api/Test; 
SourceFile P1ApiApplicationTests.java 6Lorg/springframework/boot/test/context/SpringBootTest;                  /     *� �    
                                    +      �    
                                 PK
    L�=Uv�    K   target/test-classes/com/revature/P2API/controller/TestAlbumController.class����   4 �  1com/revature/P2API/controller/TestAlbumController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; alCon /Lcom/revature/P2API/controller/AlbumController; RuntimeVisibleAnnotations Lorg/mockito/Mock; testRestTemplate ;Lorg/springframework/boot/test/web/client/TestRestTemplate; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
     LineNumberTable LocalVariableTable this 3Lcom/revature/P2API/controller/TestAlbumController; setup "Lorg/junit/jupiter/api/BeforeEach;  -com/revature/P2API/controller/AlbumController
  	       9org/springframework/boot/test/web/client/TestRestTemplate " Jorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption
  $  % P([Lorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption;)V	  '   contextLoads Lorg/junit/jupiter/api/Test; + +com/fasterxml/jackson/databind/ObjectMapper
 *  result Ljava/lang/Object; getAlbumByIdIncorrect 
Exceptions 2 java/io/IOException 4 1
  6 7 8 getAlbumById &(Ljava/lang/String;)Ljava/lang/Object; : {"album":null}
 < > =  org/junit/jupiter/api/Assertions ? @ assertEquals '(Ljava/lang/Object;Ljava/lang/Object;)V album getAlbumByIdStatusOK D 3com/fasterxml/jackson/databind/JsonMappingException F 2com/fasterxml/jackson/core/JsonProcessingException H 6https://www.theaudiodb.com/api/v1/json/2/album.php?m=1 J java/lang/String
  L M N getForEntity a(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;
 P R Q 'org/springframework/http/ResponseEntity S T getStatusCode '()Lorg/springframework/http/HttpStatus;	 V X W #org/springframework/http/HttpStatus Y Z OK %Lorg/springframework/http/HttpStatus; response )Lorg/springframework/http/ResponseEntity; LocalVariableTypeTable =Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>; getAlbumByIdMediaJson
 P a b c 
getHeaders (()Lorg/springframework/http/HttpHeaders;
 e g f $org/springframework/http/HttpHeaders h i getContentType &()Lorg/springframework/http/MediaType;	 k m l "org/springframework/http/MediaType n o APPLICATION_JSON $Lorg/springframework/http/MediaType; getAlbumByIdJsonContent
 P r s t getBody ()Ljava/lang/Object; getAlbumsByArtistIncorrect
  w x 8 getAlbumsByArtistId getAlbumsByArtistStatusOK { 6https://www.theaudiodb.com/api/v1/json/2/album.php?i=1 getAlbumsByArtistMediaJson getAlbumsByArtistJsonContent 
SourceFile TestAlbumController.java InnerClasses HttpClientOption !               	     
                     /     *� �                             	           M     *� Y� � *� Y� !� #� &�           "  #  $              (   	     )      Q     M� *Y� ,N�           )  * 
 ,               	 - .  
       /   0     1 	     )      M     *� 3� 5L+9� ;�           1 
 3  4             
  A .    B   0     C E 	     )      q     *� &GI� � KL+� O� U� ;�           9  :  9  <  =               [ \  ]       [ ^    _   0     C E 	     )      t     *� &GI� � KL+� `� d� j� ;�           B  C  B  E  F               [ \  ]       [ ^    p   0     C E 	     )      p     *� &GI� � KL+� q9� ;�           K  L  K  N  O              
 [ \  ]      
 [ ^    u   0     1 	     )      M     *� 3� vL+9� ;�           T 
 V  W             
  A .    y   0     C E 	     )      i     *� &zI� � KL+� O� U� ;�           ]  _  `               [ \  ]       [ ^    |   0     C E 	     )      l     *� &zI� � KL+� `� d� j� ;�           f  i  j               [ \  ]       [ ^    }   0     C E 	     )      h     *� &zI� � KL+� q9� ;�           p  s  t              
 [ \  ]      
 [ ^   ~     �   
  !  �@PK
    L�=UOl�    L   target/test-classes/com/revature/P2API/controller/TestArtistController.class����   4 �  2com/revature/P2API/controller/TestArtistController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; aCon 0Lcom/revature/P2API/controller/ArtistController; RuntimeVisibleAnnotations Lorg/mockito/Mock; testRestTemplate ;Lorg/springframework/boot/test/web/client/TestRestTemplate; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
     LineNumberTable LocalVariableTable this 4Lcom/revature/P2API/controller/TestArtistController; setup "Lorg/junit/jupiter/api/BeforeEach;  +org/springframework/web/client/RestTemplate
  	       9org/springframework/boot/test/web/client/TestRestTemplate " Jorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption
  $  % P([Lorg/springframework/boot/test/web/client/TestRestTemplate$HttpClientOption;)V	  '   ) .com/revature/P2API/controller/ArtistController
 ( 	  ,   contextLoads Lorg/junit/jupiter/api/Test; 0 +com/fasterxml/jackson/databind/ObjectMapper
 /  result Ljava/lang/Object; getArtistByNameIncorrect 
Exceptions 7 java/io/IOException 9 0
 ( ; < = getArtistByName &(Ljava/lang/String;)Ljava/lang/Object; ? {"artists":null}
 A C B  org/junit/jupiter/api/Assertions D E assertEquals '(Ljava/lang/Object;Ljava/lang/Object;)V artist getArtistByNameStatusOK I 3com/fasterxml/jackson/databind/JsonMappingException K 2com/fasterxml/jackson/core/JsonProcessingException M 7https://www.theaudiodb.com/api/v1/json/2/search.php?s=@ O java/lang/String
  Q R S getForEntity a(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;
 U W V 'org/springframework/http/ResponseEntity X Y getStatusCode '()Lorg/springframework/http/HttpStatus;	 [ ] \ #org/springframework/http/HttpStatus ^ _ OK %Lorg/springframework/http/HttpStatus; response )Lorg/springframework/http/ResponseEntity; LocalVariableTypeTable =Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>; getArtistByNameMediaJson
 U f g h 
getHeaders (()Lorg/springframework/http/HttpHeaders;
 j l k $org/springframework/http/HttpHeaders m n getContentType &()Lorg/springframework/http/MediaType;	 p r q "org/springframework/http/MediaType s t APPLICATION_JSON $Lorg/springframework/http/MediaType; getArtistByNameJsonContent
 U w x y getBody ()Ljava/lang/Object; getArtistByIdIncorrect | 1
 ( ~  = getArtistById 
SourceFile TestArtistController.java InnerClasses HttpClientOption !               	     
                     /     *� �                             	           \     &*� Y� � *� Y� !� #� &*� (Y� *� +�           )  *  + % -        &      -   	     .      Q     M� /Y� 1N�           2  3 
 5               	 2 3  
       4   5     6 	     .      M     *� +8� :L+>� @�           : 
 <  =             
  F 3    G   5     H J 	     .      q     *� &LN� � PL+� T� Z� @�           B  C  B  E  F               ` a  b       ` c    d   5     H J    t     *� &LN� � PL+� e� i� o� @�           K  L  K  N  O               ` a  b       ` c    u   5     H J    p     *� &LN� � PL+� v>� @�           T  U  T  W  X              
 ` a  b      
 ` c    z   5     6 	     .      M     *� +{� }L+>� @�           ] 
 _  `             
  F 3   �    � �   
  !  �@PK
    L�=U�K��    O   target/test-classes/com/revature/P2API/controller/TestMusicListController.class����   4   5com/revature/P2API/controller/TestMusicListController  java/lang/Object mCon 3Lcom/revature/P2API/controller/MusicListController; <init> ()V Code
      1com/revature/P2API/controller/MusicListController
     �(Lcom/revature/P2API/service/MusicListService;Lcom/revature/P2API/service/SongService;Lcom/revature/P2API/service/UserService;)V	     LineNumberTable LocalVariableTable this 7Lcom/revature/P2API/controller/TestMusicListController; addSongsToList RuntimeVisibleAnnotations Lorg/junit/jupiter/api/Test; 
SourceFile TestMusicListController.java !                	   E     *� 
*� Y� � �             	                            	   +      �                             PK
    L�=UP��MU  U  J   target/test-classes/com/revature/P2API/controller/TestSongController.class����   4 �  0com/revature/P2API/controller/TestSongController  java/lang/Object restTemplate -Lorg/springframework/web/client/RestTemplate; sCon .Lcom/revature/P2API/controller/SongController; RuntimeVisibleAnnotations Lorg/mockito/Mock; testRestTemplate ;Lorg/springframework/boot/test/web/client/TestRestTemplate; mapper -Lcom/fasterxml/jackson/databind/ObjectMapper; <init> ()V Code
     LineNumberTable LocalVariableTable this 2Lcom/revature/P2API/controller/TestSongController; contextLoads  +com/fasterxml/jackson/databind/ObjectMapper
   result Ljava/lang/Object; getSongByIdIncorrect 
Exceptions ! java/lang/Exception	  #   % 1
 ' ) ( ,com/revature/P2API/controller/SongController * + getSongById &(Ljava/lang/String;)Ljava/lang/Object; - {"track":null}
 / 1 0  org/junit/jupiter/api/Assertions 2 3 assertEquals '(Ljava/lang/Object;Ljava/lang/Object;)V song getSongByIdStatusOK 7 3com/fasterxml/jackson/databind/JsonMappingException 9 2com/fasterxml/jackson/core/JsonProcessingException	  ;   = 6https://www.theaudiodb.com/api/v1/json/2/track.php?h=1 ? java/lang/String
 A C B 9org/springframework/boot/test/web/client/TestRestTemplate D E getForEntity a(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Object;)Lorg/springframework/http/ResponseEntity;
 G I H 'org/springframework/http/ResponseEntity J K getStatusCode '()Lorg/springframework/http/HttpStatus;	 M O N #org/springframework/http/HttpStatus P Q OK %Lorg/springframework/http/HttpStatus; response )Lorg/springframework/http/ResponseEntity; LocalVariableTypeTable =Lorg/springframework/http/ResponseEntity<Ljava/lang/String;>; getSongByIdMediaJson
 G X Y Z 
getHeaders (()Lorg/springframework/http/HttpHeaders;
 \ ^ ] $org/springframework/http/HttpHeaders _ ` getContentType &()Lorg/springframework/http/MediaType;	 b d c "org/springframework/http/MediaType e f APPLICATION_JSON $Lorg/springframework/http/MediaType; getSongByIdJsonContent
 G i j k getBody ()Ljava/lang/Object; getSongsByAlbumIdIncorrect n java/io/IOException
 ' p q + getSongsByAlbumId getSongsByAlbumIdStatusOK t 6https://www.theaudiodb.com/api/v1/json/2/track.php?m=1 getSongsByAlbumIdMediaJson getSongsByAlbumIdJsonContent #getMusicVideosByArtistIdJsonContent y 5https://www.theaudiodb.com/api/v1/json/2/mvid.php?i=1
 M { | } resolve ((I)Lorg/springframework/http/HttpStatus; 
SourceFile TestSongController.java !               	     
                     /     *� �                               Q     M� Y� N�           *  + 
 -               	    
                    M     *� "$� &L+,� .�           2 
 4  5             
  4     5        6 8    q     *� :<>� � @L+� F� L� .�           :  ;  :  =  >               R S  T       R U    V        6 8    t     *� :<>� � @L+� W� [� a� .�           C  D  C  F  G               R S  T       R U    g        6 8    p     *� :<>� � @L+� h,� .�           L  M  L  O  P              
 R S  T      
 R U    l        m    M     *� "$� oL+,� .�           U 
 W  X             
  4     r        6 8    q     *� :s>� � @L+� F� L� .�           ]  ^  ]  `  a               R S  T       R U    u        6 8    t     *� :s>� � @L+� W� [� a� .�           f  g  f  i  j               R S  T       R U    v        6 8    p     *� :s>� � @L+� h,� .�           o  p  o  r  s              
 R S  T      
 R U    w        6 8    t     *� :x>� � @L+� F�� z� .�           x  y  x  {  |               R S  T       R U   ~    PK   ��=U��                      META-INF/MANIFEST.MF��  PK
 
    �9U.�̉                 a   com/.DS_StorePK
 
    �9U��NH                 �  com/revature/.DS_StorePK
 
    L�=U�ƍV�  �  )             �0  com/revature/P2API/P2ApiApplication.classPK
 
    ٕ=U���  �  (             �6  com/revature/P2API/P2ApiApplication.javaPK
 
    L�=U9!�7�  �  3             ;  com/revature/P2API/controller/LoginController.classPK
 
    * <U{#��  �  2             �@  com/revature/P2API/controller/LoginController.javaPK
 
    L�=U�ϴ�    2             �D  com/revature/P2API/controller/UserController.classPK
 
    �<U�E)    1             3W  com/revature/P2API/controller/UserController.javaPK
 
    L�=U�j��.  .  6             �c  com/revature/P2API/controller/ArtistController$1.classPK
 
    L�=U�=��,  ,  6             g  com/revature/P2API/controller/ArtistController$2.classPK
 
    L�=U�L��  �  4             �j  com/revature/P2API/controller/ArtistController.classPK
 
    6=UN��I�  �  3             �v  com/revature/P2API/controller/ArtistController.javaPK
 
    L�=UU#��E  E  1             �  com/revature/P2API/controller/SPAController.classPK
 
    r�:UM���P  P  0             ��  com/revature/P2API/controller/SPAController.javaPK
 
    L�=U	Ȑ�#  #  2             )�  com/revature/P2API/controller/AuthController.classPK
 
    �<U/��    1             ��  com/revature/P2API/controller/AuthController.javaPK
 
    L�=Uɗ�$  $  5             	�  com/revature/P2API/controller/AlbumController$1.classPK
 
    L�=U���,  ,  5             ��  com/revature/P2API/controller/AlbumController$2.classPK
 
    L�=U�XS��  �  3             ��  com/revature/P2API/controller/AlbumController.classPK
 
    6=Ux��G	  G	  2             ��  com/revature/P2API/controller/AlbumController.javaPK
 
    L�=U[O/]�  �  7             ��  com/revature/P2API/controller/MusicListController.classPK
 
    h=Uu��  �  6             {�  com/revature/P2API/controller/MusicListController.javaPK
 
    L�=U<���#  #  4             y�  com/revature/P2API/controller/SongController$1.classPK
 
    L�=U�L��    4             ��  com/revature/P2API/controller/SongController$2.classPK
 
    L�=U��U�1  1  4             \�  com/revature/P2API/controller/SongController$3.classPK
 
    L�=U6+�X,  ,  4             ��  com/revature/P2API/controller/SongController$4.classPK
 
    L�=U� �UX   X   2             ]�  com/revature/P2API/controller/SongController.classPK
 
    Tl=U5����  �  1              com/revature/P2API/controller/SongController.javaPK
 
    L�=U�k��    *             A/ com/revature/P2API/models/JwtRequest.classPK
 
    +<U��=&�  �  )             �3 com/revature/P2API/models/JwtRequest.javaPK
 
    L�=U�%��  �  $             �6 com/revature/P2API/models/Song.classPK
 
    @(=U3���  �  #             �R com/revature/P2API/models/Song.javaPK
 
    L�=U3�    %             �k com/revature/P2API/models/Album.classPK
 
    @[=U+Jۭ�  �  $             $z com/revature/P2API/models/Album.javaPK
 
    L�=U5�E|�  �  )             B� com/revature/P2API/models/MusicList.classPK
 
     <UJ���    (             H� com/revature/P2API/models/MusicList.javaPK
 
    L�=U�d��X	  X	  $             �� com/revature/P2API/models/User.classPK
 
    &Y=U��.}  }  #             :� com/revature/P2API/models/User.javaPK
 
    L�=Umz�    &             �� com/revature/P2API/models/Artist.classPK
 
    <U����Z  Z  %             =� com/revature/P2API/models/Artist.javaPK
 
    L�=U���wT  T  +             �� com/revature/P2API/models/JwtResponse.classPK
 
    +<U+c8  8  *             w� com/revature/P2API/models/JwtResponse.javaPK
 
    L�=Um��g)  )  2             �� com/revature/P2API/repository/UserRepository.classPK
 
    +<UƸ�I  I  1             p� com/revature/P2API/repository/UserRepository.javaPK
 
    L�=UFp�*~  ~  7             � com/revature/P2API/repository/MusicListRepository.classPK
 
    �<U��a�~  ~  6             �� com/revature/P2API/repository/MusicListRepository.javaPK
 
    L�=UКBk  k  2             �� com/revature/P2API/repository/SongRepository.classPK
 
    a=U�b�    1             h� com/revature/P2API/repository/SongRepository.javaPK
 
    L�=Uq�$,Y  Y  3             �� com/revature/P2API/repository/LoginRepository.classPK
 
    +<U
�b��  �  2             v� com/revature/P2API/repository/LoginRepository.javaPK
 
    L�=U����o  o  9             �� com/revature/P2API/security/JwtAuthenticationFilter.classPK
 
    �<U���,C	  C	  8             T� com/revature/P2API/security/JwtAuthenticationFilter.javaPK
 
    L�=UŶ���  �  0             �� com/revature/P2API/security/SecurityConfig.classPK
 
    6=U�i�  �  /             7 com/revature/P2API/security/SecurityConfig.javaPK
 
    L�=Ur6RV�  �  .             N com/revature/P2API/security/JwtTokenUtil.classPK
 
    6=U�$i�  �  -             U( com/revature/P2API/security/JwtTokenUtil.javaPK
 
    L�=U��o��  �  -             20 com/revature/P2API/service/LoginService.classPK
 
    6=UI#ж4  4  ,             n6 com/revature/P2API/service/LoginService.javaPK
 
    L�=U���f  f  ,             �9 com/revature/P2API/service/UserService.classPK
 
    6=U����I  I  +             �N com/revature/P2API/service/UserService.javaPK
 
    L�=U���    /             .\ com/revature/P2API/service/AlbumService$1.classPK
 
    L�=U.a�ݒ
  �
  -             �_ com/revature/P2API/service/AlbumService.classPK
 
    8[=U����  �  ,             rj com/revature/P2API/service/AlbumService.javaPK
 
    L�=U��a    .             �q com/revature/P2API/service/SongService$1.classPK
 
    L�=UR��    .             �t com/revature/P2API/service/SongService$2.classPK
 
    L�=U>Se�t  t  ,             Mx com/revature/P2API/service/SongService.classPK
 
    �h=US؅C�  �  +             � com/revature/P2API/service/SongService.javaPK
 
    L�=U�l�hN
  N
  1             � com/revature/P2API/service/MusicListService.classPK
 
    6=U�����  �  0             �� com/revature/P2API/service/MusicListService.javaPK
 
    L�=U���    0             �� com/revature/P2API/service/ArtistService$1.classPK
 
    L�=U��`D  D  .             g� com/revature/P2API/service/ArtistService.classPK
 
    6=U��dU  U  -             �� com/revature/P2API/service/ArtistService.javaPK
 
    �9U뿨{    	             �� .DS_StorePK
 
    (=U�4��� �� !             �� resources/Infinity-1.6s-197px.gifPK
 
    Z:U��/�]  ]  $             �� resources/application-dev.propertiesPK
 
    Z:U��M�W  W  %             �� resources/application-prod.propertiesPK
 
    �!<UK�	��  �                &� resources/application.propertiesPK
 
    �9U���R  R               � resources/index.htmlPK
 
    $h=U�#Uȷ�  ��               t� resources/index.jsPK
 
    r�:UF���?  �?               [� resources/static/index.jsPK
 
    r�:U���R  R               � resources/templates/index.htmlPK
 
    L�=U/�z    .             �� com/revature/P2API/P1ApiApplicationTests.classPK
 
    �9Un����   �   -             � com/revature/P2API/P1ApiApplicationTests.javaPK
 
    L�=UP��MU  U  6             1� com/revature/P2API/controller/TestSongController.classPK
 
    3r=U�ъ��  �  5             �� com/revature/P2API/controller/TestSongController.javaPK
 
    L�=U�K��    ;             � com/revature/P2API/controller/TestMusicListController.classPK
 
    +<UAw$�    :             �� com/revature/P2API/controller/TestMusicListController.javaPK
 
    L�=Uv�    7             �� com/revature/P2API/controller/TestAlbumController.classPK
 
    J;U�_�  �  6             ?� com/revature/P2API/controller/TestAlbumController.javaPK
 
    L�=UOl�    8             
 com/revature/P2API/controller/TestArtistController.classPK
 
    Sr=U�L�|  |  7             � com/revature/P2API/controller/TestArtistController.javaPK
 
    L�=U+^��  �  
             Q$ .classpathPK
 
    v9UZx�                 Z, .factorypathPK
 
    �9UG���  �  
             �G .gitignorePK
 
    �9U�� 1g�  g�               oI .mvn/wrapper/maven-wrapper.jarPK
 
    �9UnM���   �   %             / .mvn/wrapper/maven-wrapper.propertiesPK
 
    L�=U�V�  �               @0 .projectPK
 
    9U��Z��   �   *             56 .settings/org.eclipse.core.resources.prefsPK
 
    �9U�O�<�   �   (             7 .settings/org.eclipse.jdt.apt.core.prefsPK
 
    pv=U������  ��  $             =8 .settings/org.eclipse.jdt.core.prefsPK
 
    9UV���Z   Z   $             �� .settings/org.eclipse.m2e.core.prefsPK
 
    $�=U-�T+�  �  *             �� .settings/org.eclipse.wst.common.componentPK
 
    $�=U-Iܨ   �   7             �� .settings/org.eclipse.wst.common.project.facet.core.xmlPK
 
    $�=U�2   2   *             �� .settings/org.eclipse.wst.validation.prefsPK
 
     9Uq��A   A   /             V� .settings/org.springframework.ide.eclipse.prefsPK
 
    �9U�C�      	             �� README.mdPK
 
    2q9UR�ڛ                 � bin/.DS_StorePK
 
    �9UG���  �               B bin/.gitignorePK
 
    �9U�� 1g�  g�  "             	 bin/.mvn/wrapper/maven-wrapper.jarPK
 
    �9UnM���   �   )             �� bin/.mvn/wrapper/maven-wrapper.propertiesPK
 
    �9U�C�                   �� bin/README.mdPK
 
    �9U��J�h)  h)               &� bin/mvnwPK
 
    �9U��Q>
  
               �	 bin/mvnw.cmdPK
 
    �9U��D=  =               �4	 bin/pom.xmlPK
 
    �9UmJ�Q                 N<	 bin/src/.DS_StorePK
 
    �9Uv)Kr                 �T	 bin/src/main/.DS_StorePK
 
    �9U뿨{                 �l	 bin/src/main/java/.DS_StorePK
 
    �9U.�̉                 ��	 bin/src/main/java/com/.DS_StorePK
 
    �9U��NH    (             7�	 bin/src/main/java/com/revature/.DS_StorePK
 
    2q9U�bAF�  �  ;             ��	 bin/src/main/java/com/revature/P2API/P2ApiApplication.classPK
 
    2q9U�C���  �  E             ��	 bin/src/main/java/com/revature/P2API/controller/AlbumController.classPK
 
    2q9U��C��  �  F             ��	 bin/src/main/java/com/revature/P2API/controller/ArtistController.classPK
 
    2q9U?��	  	  E             )�	 bin/src/main/java/com/revature/P2API/controller/LoginController.classPK
 
    2q9U���.  .  D             ��	 bin/src/main/java/com/revature/P2API/controller/SongController.classPK
 
    2q9U��N�  �  D             4
 bin/src/main/java/com/revature/P2API/controller/UserController.classPK
 
    2q9U)>TǄ  �  7             {
 bin/src/main/java/com/revature/P2API/models/Album.classPK
 
    2q9U���p    8             T(
 bin/src/main/java/com/revature/P2API/models/Artist.classPK
 
    2q9U��vژ  �  6             �D
 bin/src/main/java/com/revature/P2API/models/Song.classPK
 
    2q9U��؎q  q  E             �U
 bin/src/main/java/com/revature/P2API/repository/LoginRepository.classPK
 
    2q9U��4C|  |  D             l[
 bin/src/main/java/com/revature/P2API/repository/UserRepository.classPK
 
    2q9UO���!  !  A             J]
 bin/src/main/java/com/revature/P2API/repository/models/User.classPK
 
    2q9U����L  L  ?             �j
 bin/src/main/java/com/revature/P2API/service/LoginService.classPK
 
    2q9U����z
  z
  >             sr
 bin/src/main/java/com/revature/P2API/service/UserService.classPK
 
    2q9U] �6  6  -             I}
 bin/src/main/resources/application.propertiesPK
 
    2q9U���R  R  !             �~
 bin/src/main/resources/index.htmlPK
 
    2q9U�&(�)  �)               [�
 bin/src/main/resources/index.jsPK
 
    2q9U�h�      @             q�
 bin/src/test/java/com/revature/P2API/P1ApiApplicationTests.classPK
 
    2q9U~[d�`  `  I             �
 bin/src/test/java/com/revature/P2API/controller/TestAlbumController.classPK
 
    2q9Uv0���  �  J             ��
 bin/src/test/java/com/revature/P2API/controller/TestArtistController.classPK
 
    2q9U����  �  H             �
 bin/src/test/java/com/revature/P2API/controller/TestSongController.classPK
 
    �9U��J�h)  h)               a mvnwPK
 
    �9U��Q>
  
               �. mvnw.cmdPK
 
    z~=U�v:�  �  	             J p2key.pemPK
 
    -�=U��`~�  �               �P pom.xmlPK
 
    �9UmJ�Q                 �] src/.DS_StorePK
 
    �9Uv)Kr                 �u src/main/.DS_StorePK
 
    L�=U/�z    B             � target/test-classes/com/revature/P2API/P1ApiApplicationTests.classPK
 
    L�=Uv�    K             �� target/test-classes/com/revature/P2API/controller/TestAlbumController.classPK
 
    L�=UOl�    L             � target/test-classes/com/revature/P2API/controller/TestArtistController.classPK
 
    L�=U�K��    O             j� target/test-classes/com/revature/P2API/controller/TestMusicListController.classPK
 
    L�=UP��MU  U  J             � target/test-classes/com/revature/P2API/controller/TestSongController.classPK    � � �4  ��   