package com.websystique.springmvc.converter;

import org.springframework.core.convert.converter.Converter;
import com.websystique.springmvc.model.User;
import com.websystique.springmvc.service.security.UserDetailsImpl;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.ArrayList;

/**
 * Created by colorado on 9/03/17.
 */
@Component
public class UserToUserDetails implements Converter<User, UserDetailsImpl> {
    @Override
    public UserDetailsImpl convert(User user) {
        if(user == null) return null;

        UserDetailsImpl userDetails = new UserDetailsImpl();
        userDetails.setUsername(user.getEmail());
        userDetails.setEnabled(user.isEnabled());

        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();

//        user.getRoleList().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER"));
//        });

        userDetails.setAuthorities(authorities);
        return userDetails;
    }
}
