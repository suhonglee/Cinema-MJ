package com.kcontents.cinemadream.common.util;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUtil {
	public static final boolean checkRole(String role)
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails)
		{
			Iterator<GrantedAuthority> auths = (Iterator<GrantedAuthority>) ((UserDetails)principal).getAuthorities().iterator();
			while(auths.hasNext())
			{
				String auth = auths.next().getAuthority();
				if(role.equals(auth))
				{
					return true;
				}
			}
		}
		return false;
	}
}
