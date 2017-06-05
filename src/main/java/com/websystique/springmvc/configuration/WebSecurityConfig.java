package com.websystique.springmvc.configuration;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.DefaultOAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.filter.OAuth2ClientContextFilter;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.AccessTokenRequest;
import org.springframework.security.oauth2.client.token.grant.code.AuthorizationCodeResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;
import org.springframework.security.web.access.ExceptionTranslationFilter;

import com.websystique.springmvc.filter.GoogleOAuth2Filter;
import com.websystique.springmvc.filter.GoogleOauth2AuthProvider;

@Configuration
@EnableGlobalAuthentication
@EnableOAuth2Client
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
@PropertySource(value = {"classpath:oauth.properties"})
@ComponentScan(basePackages = "com.websystique.springmvc")
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
/*    @Resource
    @Qualifier("accessTokenRequest")
    private AccessTokenRequest accessTokenRequest;*/

    @Autowired
    private OAuth2ClientContextFilter oAuth2ClientContextFilter;
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
        auth.authenticationProvider(googleOauth2AuthProvider());
    }
    @Override
    public void configure(WebSecurity web) throws Exception {
      web.ignoring().antMatchers("/resources/**");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
	            .authorizeRequests()
	            .antMatchers("/register").permitAll()
	            .antMatchers("/google_oauth2_login").anonymous()
	            .antMatchers("/").hasRole("MEMBER")
	            .antMatchers("/admin").hasRole("SUBADMIN")
	            .antMatchers("/admin/user_list").hasRole("ADMIN")
                .and()
            .formLogin()
                .loginPage("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                .defaultSuccessUrl("/")
                .failureUrl("/login?error")
                .and()
                .logout()
                .logoutSuccessUrl("/")
                .logoutUrl("/logout")
                .deleteCookies("remember-me")
                .and()
            .exceptionHandling()
                .accessDeniedPage("/403")
                .and()
                .addFilterAfter(oAuth2ClientContextFilter,ExceptionTranslationFilter.class)
                .addFilterAfter(googleOAuth2Filter(),OAuth2ClientContextFilter.class)
                .userDetailsService(userDetailsService);
    }
    @Bean
    @ConfigurationProperties("google.client")
    public OAuth2ProtectedResourceDetails auth2ProtectedResourceDetails() {
        return new AuthorizationCodeResourceDetails();
    }

    @Bean
    public OAuth2RestTemplate oauth2RestTemplate() {
        return new OAuth2RestTemplate(auth2ProtectedResourceDetails());
    }


    @Bean
    public GoogleOAuth2Filter googleOAuth2Filter() {
        return new GoogleOAuth2Filter("/google_oauth2_login");
    }

    /*
    *  Building our custom Google Provider
    * */
    @Bean
    public GoogleOauth2AuthProvider googleOauth2AuthProvider() {
        return new GoogleOauth2AuthProvider();
    }


     @Bean
     public TokenStore tokenStore() {
         return new InMemoryTokenStore();
     }


}
